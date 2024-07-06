#include <avr/io.h>
#define F_CPU 8000000
#include <util/delay.h>
#include "./header/timerRegister.h"
int main()
{
    DDRD = 0xff;
    PORTD = 0x00;
    while(1)
    {
        PORTD = 0xff;
        _delay_ms(400);
        PORTD = 0x00;
        _delay_ms(500);
    }
}
