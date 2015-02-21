/**
 * ControlP5 Bang
 * A bang triggers an event that can be received by a function named after the bang.
 * By default a bang is triggered when pressed, this can be changed to 'release' 
 * using theBang.setTriggerEvent(Bang.RELEASE).
 *
 * find a list of public methods available for the Bang Controller 
 * at the bottom of this sketch.
 *
 * by Andreas Schlegel, 2012
 * www.sojamo.de/libraries/controlp5
 * 
 */

import controlP5.*;
import processing.serial.*;
Serial myPort;  // Create object from Serial class
ControlP5 cp5;
int i=-1;
int val =-1 ;
String[] buttons= {"Left15Degree","Left10Degree","Left5Degree",
"Straight","Right5Degree","Right10Degree","Right15Degree"
};

void setup() {
  size(600, 150);
  noStroke();
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  cp5 = new ControlP5(this);
  for (int i=0;i<buttons.length;i++) {
    cp5.addBang(buttons[i])
       .setPosition(40+i*80, 90)
       .setSize(40, 40)
       
       ;
  }

 cp5.addBang("Stop")
 .setPosition(260, 10)
      .setSize(80, 40)
        .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER) 
        ;
}

void draw() {
  
  background(125);
    if ( myPort.available() > 0) {  // If data is available,
    i = myPort.read();         // read it and store it in val
  }
  if(i==7);
  else{
    fill(255,0,0);
    rect(50+i*80, 60, 20, 20);
  }}


/*void mousePressed(){
 println(mouseX+" "+mouseY);
 }*/ 
public void Left15Degree(){
  myPort.write('a');
}
public void Left10Degree(){
  myPort.write('b');
}
public void Left5Degree(){
  myPort.write('c');
}
public void Straight(){
  myPort.write('d');
}
public void Right5Degree(){
myPort.write('e');
}
public void Right10Degree(){
myPort.write('f');
}
public void Right15Degree(){
myPort.write('g');
}

public void Stop(){
  myPort.write('h');
}
/*
public void controlEvent(ControlEvent theEvent) {
  /*for (int i=0;i<col.length;i++) {
    if (theEvent.getController().getName().equals("bang"+i)) {
      col[i] = color(random(255));
    }
  }
  
  println(
  "## controlEvent / id:"+theEvent.controller().id()+
    " / name:"+theEvent.controller().name()+
    " / label:"+theEvent.controller().label()+
    " / value:"+theEvent.controller().value()
    );
*/

