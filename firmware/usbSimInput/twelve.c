/* Nes/Snes/Genesis/SMS/Atari to USB
 * Copyright (C) 2006-2007 Raphaël Assénat
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 *
 * The author may be contacted at raph@raphnet.net
 */
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include <avr/pgmspace.h>
#include <string.h>
#include "gamepad.h"
#include "twelve.h"


/*********** prototypes *************/
static void twelveInit(void);
static void twelveUpdate(void);
static char twelveChanged(void);
static void twelveBuildReport(unsigned char *reportBuffer);

// report matching the most recent bytes from the controller
static unsigned char last_read_controller_bytes[REPORT_SIZE];
// the most recently reported bytes
static unsigned char last_reported_controller_bytes[REPORT_SIZE];

static void readController(unsigned char bits[REPORT_SIZE])
{
	for(unsigned char i = 0; i < 8; i++)
	{
		DDRA |= _BV(i);                                                 // set to output and set low
		PORTA &= ~(_BV(i));
		cli();
		/* Buttons are active low. Invert values. */
		bits[i*2] = ~PINB;
        bits[(i*2)+1] = ~PINC;
        sei();
        PORTA |= _BV(i);                                                // disable and set to tristate
        DDRA &= ~(_BV(i));
	}               
}

static void twelveInit(void)
{
	unsigned char sreg;
	sreg = SREG;
	cli();
	
	// configure PORTB and PORTC as inputs and enable pullups
    DDRB = 0x00;
    PORTB = 0xff;
    DDRC = 0x00;
    PORTC = 0xff;
        
    // configure PORTA as tristate
    DDRA = 0x00;
	PORTA = 0x00;
	
	// disable ADC
	ADCSRA |= _BV(ADEN);
	
	twelveUpdate();

	SREG = sreg;
}



static void twelveUpdate(void)
{
	unsigned char data[REPORT_SIZE];
	readController(data);
	memcpy(last_read_controller_bytes, data, REPORT_SIZE);
}	

static char twelveChanged(void)
{
	static int first = 1;
	if (first) { first = 0;  return 1; }
	
	return memcmp(last_read_controller_bytes, 
					last_reported_controller_bytes, REPORT_SIZE);
}

static void twelveBuildReport(unsigned char *reportBuffer)
{
	if (reportBuffer != NULL)
	{
		memcpy(reportBuffer, last_read_controller_bytes, REPORT_SIZE);
	}
	memcpy(last_reported_controller_bytes, 
			last_read_controller_bytes, 
			REPORT_SIZE);	
}

#include "snes_descriptor.c"

Gamepad twelveGamepad = {
	report_size: 		REPORT_SIZE,
	reportDescriptorSize:	sizeof(snes_usbHidReportDescriptor),
	init: 			twelveInit,
	update: 		twelveUpdate,
	changed:		twelveChanged,
	buildReport:		twelveBuildReport
};

Gamepad *twelveGetGamepad(void)
{
	twelveGamepad.reportDescriptor = (void*)snes_usbHidReportDescriptor;

	return &twelveGamepad;
}

