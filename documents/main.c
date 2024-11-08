#include <stdio.h>
#include <delay.h>

int main(){
    DDRA = 0xFF;
    while(1){
    PORTA = 0x00;
    _delay_ms(500);
    PORTA = 0xFF;
    _delay_ms(500);
    }
}
