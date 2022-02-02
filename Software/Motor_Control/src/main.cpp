#include "DropletController.h" //configuration, setup, and command processing

void setup()
{
    Serial.begin(115200); //any will work

    pinMode(DROP_TRIG, OUTPUT);    //Pipette Droplet Trigger
    digitalWrite(DROP_TRIG, HIGH); //trigger e-pipette to wake up

    init_steppers();
    init_triggers();
}

void loop()
{
    Serial.println("\nInput next instruction");
    while (!Serial.available()) //blocking read
    {
        advance_triggers(esp_timer_get_time());
    }
    command_loop(); //Begin input command read, process, execute loop
}
