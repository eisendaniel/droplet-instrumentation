
#include <ESP_FlexyStepper.h>

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

  r_stage.setSpeedInStepsPerSecond(10 * REV_STEPS);
  z_stage.setSpeedInStepsPerSecond(10 * REV_STEPS);

  r_stage.setAccelerationInStepsPerSecondPerSecond(100 * REV_STEPS);
  r_stage.setDecelerationInStepsPerSecondPerSecond(100 * REV_STEPS);
s
  z_stage.setAccelerationInStepsPerSecondPerSecond(100 * REV_STEPS);
  z_stage.setDecelerationInStepsPerSecondPerSecond(100 * REV_STEPS);
}

void loop()
{
  r_stage.moveRelativeInSteps(REV_STEPS / 4);
  z_stage.moveRelativeInSteps(REV_STEPS);
  delay(1000);

  r_stage.moveRelativeInSteps(-(REV_STEPS / 4));
  z_stage.moveRelativeInSteps(REV_STEPS);
  delay(1000);
}