/*
* LightController - Control a remote control light switch using a arduino and a 433MHz radio
* using a simple serial protocol
*
* @author Erik Kallen info@erikkallen.nl
* @version 0.1
*/
#include <Messenger.h>

#define rfPin 2
#define ledPin 13

#define byte1 0x2A
#define byte2 0xAA

#define S_A 0x9F // Bij de kast
#define S_B 0xE7 // Bed
#define S_C 0xF9 // Bank
#define S_D 0x7F // Bureau
#define S_E 0x9E

#define S_ON 0xF3
#define S_OFF 0xFC
Messenger command = Messenger(); 

// Create the callback method
void cmdReady() {
	// Loop through all the available elements of the message
	while ( !command.available() );
	char cmd = command.readChar();
	// Strip '=' from stream
	//char eq = command.readChar();
	char stateChar = command.readChar();
	byte stateByte = 0;
	if (stateChar == '1') {
		stateByte = S_ON;
	} else {
		stateByte = S_OFF; 
	}


	switch(cmd) {
		case 'a':
			// Serial.println("AA");
		sendCommand(S_A, stateByte);
		break;
		case 'b':
			//Serial.println("BB");
		sendCommand(S_B, stateByte);
		break;
		case 'c':
			// Serial.println("CC");
		sendCommand(S_C, stateByte);
		break;
		case 'd':
			// Serial.println("DD");
		sendCommand(S_D, stateByte);
		break;
		case 'e':
		Serial.println("EE");
		sendCommand(S_E, stateByte);
		break;
			//default:
			// Serial.println("No match");
	}

}


void setup() {
	pinMode(rfPin,OUTPUT);
	pinMode(ledPin,OUTPUT);
//   pinMode(tePin,OUTPUT);
	digitalWrite(rfPin, LOW);
	digitalWrite(ledPin, HIGH);
// digitalWrite(tePin, HIGH);
	Serial.begin(9600);
	command.attach(cmdReady);
	Serial.println("Arduino booted");
}

void loop() {
	while ( Serial.available() )  command.process(Serial.read());
}

void sendCommand(int sw, int state) {
	switch (sw) {
		case S_A:
		case S_B:
		case S_C:
		sendPacket(sw, state);
		break;
		case S_D:
		sendPacket(0xFF, sw & state);
		break;
		case S_E:
		sendPacket(0xFF, 0x9F & state);
		break;
	}
}

void sendPacket(byte firstByte, byte lastByte) {
	for (int i=0;i<8;i++){
		delay(4);
		// Preamble
		for (int i=0;i<9;i++) {
			sendBit(0); 
		}

		sendByte(byte1 & firstByte);
		sendByte(byte2 & lastByte);
	
		delay(4);
	}
}

void sendByte(byte b) {
	for (int i=0;i<8;i++) {
		if ((b&0x80) == 0x80) {
			sendBit(1); 
		} else {
			sendBit(0);
		}
		b = b << 1;
	}
}

void sendBit(int val) {
	if (val) {
		digitalWrite(ledPin, HIGH);
		digitalWrite(rfPin, HIGH);
		delayMicroseconds(998);
		digitalWrite(rfPin, LOW);
		digitalWrite(ledPin, LOW);
		delayMicroseconds(320);
	} else {
		digitalWrite(ledPin, HIGH);
		digitalWrite(rfPin, HIGH);
		delayMicroseconds(340);
		digitalWrite(rfPin, LOW);
		digitalWrite(ledPin, LOW);
		delayMicroseconds(998);
	}
}