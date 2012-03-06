/* Name: main.c
 * Project: usbSimInput - 128 button HID joystick
 * Author: William Riley
 * Creation Date: 2012-03-04
 * Tabsize: 4
 * Copyright: (c) 2012 by William Riley
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

PROGMEM char usbHidReportDescriptor[23] = { /* USB report descriptor, size must match usbconfig.h */
    0x05, 0x01,                    // USAGE_PAGE (Generic Desktop)
    0x09, 0x05,                    // USAGE (Game Pad)
    0xa1, 0x01,                    // COLLECTION (Application)
    0x05, 0x09,                    // USAGE_PAGE (Button)
    0x19, 0x01,                    //   USAGE_MINIMUM (Button 1)
    0x29, 0x40,                    //   USAGE_MAXIMUM (Button 64)
    0x15, 0x00,                    //   LOGICAL_MINIMUM (0)
    0x25, 0x01,                    //   LOGICAL_MAXIMUM (1)
    0x75, 0x01,                    // REPORT_SIZE (1)
    0x95, 0x40,                    // REPORT_COUNT (64)
    0x81, 0x02,                    // INPUT (Data,Var,Abs)
    0xc0                           // END_COLLECTION
};

#define REPORT_BYTES 8

uchar  buttonData[16];
char newDataFound = 0;

// USB report buffer
static uchar usbReport[REPORT_BYTES];

//
// Build the USB report data using
//
static uchar *usbBuildReport(void)
{
    // rebuild the report only if new data was captured
    if (newDataFound)
    {
		uchar  *dp = &buttonData[0];     // button data pointer
        uchar *rp = &usbReport[0];      // report buffer pointer
        uchar data;
        uchar i;

        for (i = 0; i < REPORT_BYTES; i++)
        {
            // ensure the atomic operation
            cli();
            data = *dp++;
            sei();

            // storing data
            *rp++ = data;
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
usbMsgLen_t usbFunctionSetup(uchar data[8])
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
	for(uchar i = 0; i < 8; i++)
	{
		DDRA |= _BV(i);							// set to output and set low
		PORTA &= ~(_BV(i));
		cli();
		buttonData[i*2] = ~PINB;
		buttonData[(i*2)+1] = ~PINC;
		sei();
		PORTA |= _BV(i);						// disable and set to tristate
		DDRA &= ~(_BV(i));
	}		
	
	newDataFound = 1;
}

void wdInit(void)
{
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
    inButtonInit();                // initialize input decoder
    usbDeviceConnect();             // connect USB device to USB bus
    sei();                          // required by USB driver and some interfaces

    while (1)
    {
        wdReset();                  // reset watchdog timer
        inButtonPoll();            // poll for input data
        outSendData();              // prepare data for USB Interrupt In endpoint
        usbPoll();                  // process USB requests

	}
}

/* ------------------------------------------------------------------------- */
