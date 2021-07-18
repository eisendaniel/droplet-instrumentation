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

void process_command(char *input)
{
    char *end_token;
    char *motor;
    char *command;

    if (strchr(input, ' '))
    {
        command = strtok_r(input, " ", &end_token);
        if (!strcmp(command, "ADJ")) //adjust a motor in steps
        {
            motor = strtok_r(NULL, " ", &end_token);
            int steps = atoi(strtok_r(0, " ", &end_token));
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
            float rots = atof(strtok_r(NULL, " ", &end_token));
            r_stage.moveRelativeInSteps(long(REV_STEPS * rots));
            Serial.printf("Rotated %.4f revolutions\n", rots);
        }
        else if (!strcmp(command, "Z"))
        {
            float mm = atof(strtok_r(NULL, " ", &end_token)); //
            z_stage.moveRelativeInSteps(long(REV_STEPS * -2.0 * mm));
            Serial.printf("Moved Z %.4f mm\n", mm);
        }
        else if (!strcmp(command, "DEL"))
        {
            int ms = atoi(strtok_r(NULL, " ", &end_token));
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
        process_command(input);
    }
    else //read and send sequence
    {
        //read
        Serial.println("Start sequence sequence on commands");
        char buffer[512] = "";
        while (1)
        {
            if (!strncmp(input, "END", 3))
            {
                break;
            }
            while (!Serial.available())
                ;
            byte size = Serial.readBytes(input, INPUT_SIZE);
            input[size] = 0;
            strcat(buffer, input);
            Serial.println("Input next command in sequence");
        }

        //process
        char *end_str;
        char *token = strtok_r(buffer, ";", &end_str);
        while (token != NULL)
        {
            if (!strncmp(token, "END", 3))
            {
                break;
            }
            process_command(token);
            token = strtok_r(NULL, ";", &end_str);
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