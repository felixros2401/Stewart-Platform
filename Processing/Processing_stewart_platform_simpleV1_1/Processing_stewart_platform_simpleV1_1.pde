/*
 * ----------------------------------------------------------------------------
 * Control interface for Stewart Platform
 * It sends servo data to the arduino that controls the servo's.
 * This program is ment to get you started to control a hexapod.
 
 * I'm a designer not a programmer, so if you see ways to improve this software
 * please let me know. I would be happy to update this software and keep on 
 * improving it in the future.
 
 * "THE BEER-WARE LICENSE" (Revision 42):
 * Felix Ros wrote this file.  As long as you retain this notice you
 * can do whatever you want with this stuff. If we meet some day, and you think
 * this stuff is worth it, you can buy me a beer in return.   
 * cheers, Felix
 
 * Eindhoven The Netherlands  2015
 * www.felixros.com
 * ----------------------------------------------------------------------------
 */
import controlP5.*;  //sliders and buttons
ControlP5 cp5;
int myColor = color(0, 0, 0);  //color

int sliderValue;

Slider Yaw;
Slider Z;
Slider2D XY;
Slider2D RollPitch;

float n = 90.0; //neatral float for setting value


void setup() {
  size(500, 500, OPENGL);
  frame.setTitle("control panel");
  fill(0);
  noStroke();

  // display serial port list for debugging/clarity
  //println(Serial.list());

  // get the first available port (use EITHER this OR the specific port code below)
  String portName = Serial.list()[5];

  // get a specific serial port (use EITHER this OR the first-available code above)
  //String portName = "/dev/tty.wchusbserial1410";

  // open the serial port
  port = new Serial(this, portName, 115200);

  
  //sliders
  cp5 = new ControlP5(this);

  Yaw = cp5.addSlider("Yaw")
    .setPosition(270, 350)
      .setRange(0, 180)
        .setSize(180, 20)
          .setValue(n)
            ;
  Z = cp5.addSlider("Z axis")
    .setPosition(270, 50)
      .setRange(0, 180)
        .setSize(20, 180)
          .setValue(n)
            ;
  XY = cp5.addSlider2D("XY axis")
    .setPosition(50, 50)
      .setSize(180, 180)
        .setMaxX (180)
          .setMaxY (180)
            .setMinX (0)
              .setMinY (0)
              .setArrayValue(new float[] {
                n, n
              }
  )

    //.disableCrosshair()
    ;
  RollPitch = cp5.addSlider2D("Roll Pitch")
    .setPosition(50, 270)
      .setSize(180, 180)
        .setMaxX (180)
          .setMaxY (180)
            .setMinX (0)
              .setMinY (0)
              .setArrayValue(new float[] {
                n, n
              }
  )

    .setSize(180, 180)
      //.disableCrosshair()
      ;
}

void draw() {
  background(myColor);
  fill(sliderValue);

  //calculate servo position
  calcServo();
}



