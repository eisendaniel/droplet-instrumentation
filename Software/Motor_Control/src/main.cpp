#include "Droplet_controller.h" //configuration, setup, and command processing

void setup()
{
    Serial.begin(115200); //any will work

    pinMode(DROP_TRIG, OUTPUT); //Pipette Droplet Trigger 

    digitalWrite(DROP_TRIG, HIGH); //trigger e-pipette to wake up
    init_steppers();
}

void loop()
{
    command_loop(); //Begin input command read, process, execute loop
}
