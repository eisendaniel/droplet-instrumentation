#include "DropletController.h"

// create the stepper motor object
ESP_FlexyStepper R_stage;
ESP_FlexyStepper Z_stage;

bool pipette_down = true;

void init_steppers()
{
    // connect and configure the stepper motor to its IO pins
    R_stage.connectToPins(R_MOTOR_STEP_PIN, R_MOTOR_DIRECTION_PIN);
    Z_stage.connectToPins(Z_MOTOR_STEP_PIN, Z_MOTOR_DIRECTION_PIN);

    R_stage.setSpeedInStepsPerSecond(2.0 * REV_STEPS);
    R_stage.setAccelerationInStepsPerSecondPerSecond(5.0 * REV_STEPS);
    R_stage.setDecelerationInStepsPerSecondPerSecond(5.0 * REV_STEPS);

    Z_stage.setSpeedInStepsPerSecond(6.0 * REV_STEPS);
    Z_stage.setAccelerationInStepsPerSecondPerSecond(100.0 * REV_STEPS);
    Z_stage.setDecelerationInStepsPerSecondPerSecond(100.0 * REV_STEPS);
}

void command_loop()
{
    char input[INPUT_SIZE + 1];
    byte size = Serial.readBytes(input, INPUT_SIZE);
    input[size] = 0;

    if (strncmp(input, "SEQ", 3))
    { //not sequence
        Serial.printf("Executing %s\n", input);
        execute_command(input);
    }
    else //read and send sequence
    {
        //read
        Serial.println("Start sequence of commands");
        char buffer[512] = "";
        while (strncmp(input, "END", 3))
        {
            Serial.println("Input next command in sequence");
            while (!Serial.available())
                ;
            size = Serial.readBytes(input, INPUT_SIZE);
            input[size] = 0;
            strcat(buffer, input);
        }
        printf("Sequence: %s\n", buffer);

        //process
        char *end_buf;
        char *instr = strtok_r(buffer, ";", &end_buf);
        while (instr != NULL)
        {
            if (!strncmp(instr, "END", 3))
                break;

            //execute
            execute_command(instr);
            instr = strtok_r(NULL, ";", &end_buf);
        }
    }
}

void execute_command(char *input)
{
    char *end_instr;
    char *motor;
    char *command;

    if (strchr(input, ' '))
    {
        command = strtok_r(input, " ", &end_instr);
        if (!strcmp(command, "ADJ")) //adjust a motor in steps
        {
            motor = strtok_r(NULL, " ", &end_instr);
            int steps = atoi(strtok_r(0, " ", &end_instr));
            if (!strcmp(motor, "R"))
                R_stage.moveRelativeInSteps(steps);
            else if (!strcmp(motor, "Z"))
                Z_stage.moveRelativeInSteps(steps);
            Serial.printf("Adjusted %s by %d steps\n", motor, steps);
        }
        else if (!strcmp(command, "R")) //rotate stage
        {
            float degs = atof(strtok_r(NULL, " ", &end_instr));
            Z_stage.moveToPositionInSteps(long(REV_STEPS * -2.0 * 10));
            Serial.printf("Moved Z to %.4f mm\n", 10.0f);  
            R_stage.moveToPositionInSteps(long(REV_STEPS * (degs / 360.0)));
            Serial.printf("Rotated to %.4f degrees \n", degs);
        }
        else if (!strcmp(command, "Z")) //raise stage
        {
            float mm = atof(strtok_r(NULL, " ", &end_instr)); //
            Z_stage.moveToPositionInSteps(long(REV_STEPS * -2.0 * mm));
            Serial.printf("Moved Z to %.4f mm\n", mm);
        }
        else if (!strcmp(command, "DEL")) //delay
        {
            int ms = atoi(strtok_r(NULL, " ", &end_instr));
            delay(ms);
            Serial.printf("Delayed %d ms\n", ms);
        }
        else if (!strcmp(command, "PIP")) //trigger droplet
        {
            char *pos = strtok_r(NULL, " ", &end_instr);

            if ((!strncmp(pos, "UP", 2) && pipette_down) || (!strncmp(pos, "DOWN", 4) && !pipette_down))
            {
                digitalWrite(DROP_TRIG, LOW);
                delay(100);
                digitalWrite(DROP_TRIG, HIGH);
                Serial.printf("Triggered Pippette\n");
                pipette_down = !pipette_down;
                delay(200);
            }
        }
        else if (!strcmp(command, "HOME"))
        {
            go_home();
        }
        else if (!strcmp(command, "OVERRIDEHOME"))
        {
            R_stage.setCurrentPositionAsHomeAndStop();
            Z_stage.setCurrentPositionAsHomeAndStop();
        }
        else if (!strcmp(command, "RUNCAM")) 
        {
            start_triggers();
        }
        else if (!strcmp(command, "STOPCAM")) 
        {
            init_triggers();
        }
        else if (!strcmp(command, "SETCAM"))
        {
            config_triggers(end_instr);
        }
    }
}

void go_home()
{
    Serial.println("Homeing Z Stage...");
    if (Z_stage.moveToHomeInSteps(1, (float)REV_STEPS, (long)(REV_STEPS * 2.0 * 12.0), Z_HOME))
    {
        Serial.println("Z stage successfully homed");
        Z_stage.moveToPositionInSteps(long(REV_STEPS * -2.0 * 10.0));
    }
    else
    {
        Serial.println("Z stage failed to Home");
        return;
    }

    Serial.println("Homeing R Stage...");
    if (R_stage.moveToHomeInSteps(-1, (float)(REV_STEPS/4), long(1.25f*REV_STEPS), R_HOME))
        Serial.println("R stage successfully homed");
    else
        Serial.println("R stage failed to Home");
}