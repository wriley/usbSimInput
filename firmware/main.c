/* Name: main.c
 * Project: usbSimInput - 128 button HID joystick
 * Author: William Riley
 * Creation Date: 2012-01-23
 * Tabsize: 4
 * Copyright: (c) 2012 by William Riley
 * License: GNU GPL v2 (see License.txt)
 */

#include <avr/io.h>
#include <avr/wdt.h>
#include <avr/interrupt.h>
#include <util/delay.h>

#include <avr/pgmspace.h>
#include "usbdrv.h"
#include "oddebug.h"

/* ------------------------------------------------------------------------- */
/* ----------------------------- USB interface ----------------------------- */
/* ------------------------------------------------------------------------- */

PROGMEM char usbHidReportDescriptor[28] = { /* USB report descriptor, size must match usbconfig.h */
    0x05, 0x01,                    // USAGE_PAGE (Generic Desktop)
    0x09, 0x04,                    // USAGE (Joystick)
    0xa1, 0x01,                    // COLLECTION (Application)
    0x09, 0x04,                    //   USAGE (Joystick)
    0xa1, 0x00,                    //   COLLECTION (Physical)
    0x05, 0x09,                    //     USAGE_PAGE (Button)
    0x19, 0x01,                    //     USAGE_MINIMUM (Button 1)
    0x29, 0x80,                    //     USAGE_MAXIMUM (Button 128)
    0x15, 0x00,                    //     LOGICAL_MINIMUM (0)
    0x25, 0x01,                    //     LOGICAL_MAXIMUM (1)
    0x95, 0x08,                    //     REPORT_COUNT (8)
    0x75, 0x10,                    //     REPORT_SIZE (16)
    0x81, 0x02,                    //     INPUT (Data,Var,Abs)
    0xc0,                          //   END_COLLECTION
    0xc0                           // END_COLLECTION
};

int  buttonData[16];
char newDataFound;

// USB report buffer
static uchar usbReport[16];

//
// Build the USB report data
//
static uchar *usbBuildReport(void)
{
    // rebuild the report only if new data was captured
    if (newDataFound)
    {
		int  *dp = &buttonData[0];     // button data pointer
        uchar *rp = &usbReport[0];      // report buffer pointer
        int data;
        char i;

        for (i = 0; i < 16; i++)
        {
            // ensure the atomic operation
            cli();
            data = *dp++;
            sei();

            // storing data
            *rp++ = (uchar)data;
		}
		
        // reset new data flag
        newDataFound = 0;
    }

    // return the address of buffer
    return &usbReport[0];
}

//-----------------------------------------------------------------------------

//
// USB setup request processing
//
uchar usbFunctionSetup(uchar data[8])
{
    usbRequest_t *rq = (void *)data;

    if ((rq->bmRequestType & USBRQ_TYPE_MASK) == USBRQ_TYPE_CLASS)
    {
        // Return the report if host requests it without USB interrupt
        if (rq->bRequest == USBRQ_HID_GET_REPORT)
        {
            // wValue: ReportType (highbyte), ReportID (lowbyte)
            // we only have one report type, so don't look at wValue
            usbMsgPtr = usbBuildReport();
            return sizeof(usbReport);
        }
    }
    return 0;
}

//-----------------------------------------------------------------------------

//
// Check if the USB Interrupt In point buffer is empty and return
// the data buffer for the following host request via USB interrupt
//
void outSendData(void)
{
    if (usbInterruptIsReady())
    {
        // fill in the report buffer and return the
        // data pointer (Report ID is not used)
        usbSetInterrupt(usbBuildReport(), sizeof(usbReport));
    }
}

/* ------------------------------------------------------------------------- */

void inButtonInit(void)
{
	// configure PORTB and PORTC as inputs and enable pullups
	DDRB = 0x00;
	PORTB = 0xff;
	DDRC = 0x00;
	PORTC = 0xff;
	
	// configure PORTA as tristate
	DDRA = 0x00;
	PORTA = 0x00;
}

void inButtonPoll(void)
{
	for(char i = 0; i < 8; i++)
	{
		DDRA |= BIT(i);				// set to output and enable
		PORTA |= BIT(i);
		buttonData[i*2] = PINB;		// read 8 bits from PORTB
		buttonData[(i*2)+1] = PINC;	// read 8 bits from PORTC
		PORTA &= ~(BIT(i));			// disable and set to tristate
		DDRA &= ~(BIT(i));
	}
	
	newDataFound = 1;
}

void wdInit(void)
{
#if defined(__IOM16_H) || defined(__IOM32_H)
    WDTCR = (7 << WDP0) | (1 << WDE);
#else
    WDTCR = (1 << WDCE) | (1 << WDE);
#endif
    WDTCR = (7 << WDP0) | (1 << WDE);
}

void wdReset(void)
{
    wdt_reset();
}

int main(void)
{
    wdInit();                       // initialize watchdog timer
    usbInit();                      // initialize USB driver
    inButtonInit();                 // initialize inputs
    usbDeviceConnect();             // connect USB device to USB bus
    sei();                          // required by USB driver and some interfaces

    while (1)
    {
        wdReset();                  // reset watchdog timer
        inButtonPoll();             // poll for input data
        outSendData();              // prepare data for USB Interrupt In endpoint
        usbPoll();                  // process USB requests
	}
}

/* ------------------------------------------------------------------------- */
