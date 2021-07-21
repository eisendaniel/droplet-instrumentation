#include <ESP_FlexyStepper.h>

#define INPUT_SIZE 30

// IO pin assignments
const int R_MOTOR_STEP_PIN = 19;
const int R_MOTOR_DIRECTION_PIN = 18;
const int Z_MOTOR_STEP_PIN = 23;
const int Z_MOTOR_DIRECTION_PIN = 22;

//motor config
const int STEP_DIV = 32;
const int REV_STEPS = 200 * STEP_DIV;

// create the stepper motor object
ESP_FlexyStepper r_stage;
ESP_FlexyStepper z_stage;

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
            {
                r_stage.moveRelativeInSteps(steps);
            }
            else if (!strcmp(motor, "Z"))
            {
                z_stage.moveRelativeInSteps(steps);
            }
            Serial.printf("Adjusted %s by %d steps\n", motor, steps);
        }
        else if (!strcmp(command, "R")) //rotate stage
        {
            float rots = atof(strtok_r(NULL, " ", &end_instr));
            r_stage.moveRelativeInSteps(long(REV_STEPS * rots));
            Serial.printf("Rotated %.4f revolutions\n", rots);
        }
        else if (!strcmp(command, "Z"))
        {
            float mm = atof(strtok_r(NULL, " ", &end_instr)); //
            z_stage.moveRelativeInSteps(long(REV_STEPS * -2.0 * mm));
            Serial.printf("Moved Z %.4f mm\n", mm);
        }
        else if (!strcmp(command, "DEL"))
        {
            int ms = atoi(strtok_r(NULL, " ", &end_instr));
            delay(ms);
            Serial.printf("Delayed %d ms\n", ms);
        }
    }
}

void read_command()
{
    char input[INPUT_SIZE + 1];
    Serial.println("\nInput next instruction");
    while (!Serial.available())
        ;
    byte size = Serial.readBytes(input, INPUT_SIZE);
    input[size] = 0;

    if (strncmp(input, "SEQ", 3))
    { //not sequence
        execute_command(input);
    }
    else //read and send sequence
    {
        //read
        Serial.println("Start sequence sequence on commands");
        char buffer[512] = "";
        while (strncmp(input, "END", 3))
        {
            while (!Serial.available())
                ;
            size = Serial.readBytes(input, INPUT_SIZE);
            input[size] = 0;
            strcat(buffer, input);
            Serial.println("Input next command in sequence");
        }

        //process
        char *end_buf;
        char *instr = strtok_r(buffer, ";", &end_buf);
        while (instr != NULL)
        {
            if (!strncmp(instr, "END", 3))
            {
                break;
            }
            execute_command(instr);
            instr = strtok_r(NULL, ";", &end_buf);
        }
    }
}

void setup()
{
    Serial.begin(115200);
    // connect and configure the stepper motor to its IO pins
    r_stage.connectToPins(R_MOTOR_STEP_PIN, R_MOTOR_DIRECTION_PIN);
    z_stage.connectToPins(Z_MOTOR_STEP_PIN, Z_MOTOR_DIRECTION_PIN);

    r_stage.setSpeedInStepsPerSecond(1 * REV_STEPS);
    z_stage.setSpeedInStepsPerSecond(10 * REV_STEPS);

    r_stage.setAccelerationInStepsPerSecondPerSecond(10 * REV_STEPS);
    r_stage.setDecelerationInStepsPerSecondPerSecond(10 * REV_STEPS);

    z_stage.setAccelerationInStepsPerSecondPerSecond(100 * REV_STEPS);
    z_stage.setDecelerationInStepsPerSecondPerSecond(100 * REV_STEPS);
}

void loop()
{
    read_command();
}