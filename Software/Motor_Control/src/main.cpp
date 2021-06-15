
#include <ESP_FlexyStepper.h>

#define INPUT_SIZE 30

// IO pin assignments
const int R_MOTOR_STEP_PIN = 19;
const int R_MOTOR_DIRECTION_PIN = 18;
const int Z_MOTOR_STEP_PIN = 5;
const int Z_MOTOR_DIRECTION_PIN = 17;

//motor config
const int STEP_DIV = 32;
const int REV_STEPS = 200 * STEP_DIV;

// create the stepper motor object
ESP_FlexyStepper r_stage;
ESP_FlexyStepper z_stage;

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

  Serial.println("Adjust Start point...");

  // Calculate based on max input size expected for one command

  // Get next command from Serial (add 1 for final 0)
  char input[INPUT_SIZE + 1];
  byte size = Serial.readBytes(input, INPUT_SIZE);
  // Add the final 0 to end the C string
  input[size] = 0;

  // Read each command pair
  char *command = strtok(input, "&");
  while (command != 0)  
  {
    // Split the command in two values
    char *separator = strchr(command, ':');
    if (separator != 0)
    {
      // Actually split the string in 2: replace ':' with 0
      *separator = 0;
      int servoId = atoi(command);
      ++separator;
      int position = atoi(separator);

      // Do something with servoId and position
    }
    // Find the next command in input string
    command = strtok(0, "&");
  }
}

void loop()
{
  r_stage.moveRelativeInSteps(REV_STEPS / 4);
  r_stage.moveRelativeInSteps(0);
  delay(1000);

  r_stage.moveRelativeInSteps(-(REV_STEPS / 4));
  r_stage.moveRelativeInSteps(0);
  delay(1000);
}