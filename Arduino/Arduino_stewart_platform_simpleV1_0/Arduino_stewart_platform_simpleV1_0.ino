/* =========================================================================
 Stewart Platform
 Read incomming data from processing 
 * ========================================================================= */

//libraries
#include <Servo.h>

//servo stuff
//MIN and MAX PWM pulse sizes, they can be found in servo documentation
#define MAX 2300
#define MIN 700

Servo servo[6];  // create servo object to control a servo 

int zeroAll = 90; // variable to store the servo position 


void setup() {  

  // initialize serial communication
  // The rate is up to you depending on your project)
  Serial.begin(115200);
  while (!Serial); // wait for Leonardo enumeration, others continue immediately

  //servo stuff
  //attachment of servos to PWM digital pins of arduino
  servo[0].attach(3, MIN, 2200);   //change MIN & MAX to calibrate servo
  servo[1].attach(5, MIN, 2100);  
  servo[2].attach(6, MIN, 1900);
  servo[3].attach(9, MIN, MAX);
  servo[4].attach(10, MIN, 2000);
  servo[5].attach(11, MIN, 2100);
} 

void loop() 
{ 
  //read and write to servos
  servoControl(); 
}




