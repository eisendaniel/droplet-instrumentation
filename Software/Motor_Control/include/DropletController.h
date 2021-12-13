#ifndef DROP_CONTROLLER
#define DROP_CONTROLLER

#include <ESP_FlexyStepper.h>
#include "CameraTrigger.h"

const uint8_t INPUT_SIZE = 64;

// IO pin assignments
const uint8_t R_MOTOR_STEP_PIN = 18;
const uint8_t R_MOTOR_DIRECTION_PIN = 19;
const uint8_t R_HOME = 17;

const uint8_t Z_MOTOR_STEP_PIN = 22;
const uint8_t Z_MOTOR_DIRECTION_PIN = 23;
const uint8_t Z_HOME = 16;

const uint8_t DROP_TRIG = 4;

//motor config
const uint8_t STEP_DIV = 32;
const uint32_t REV_STEPS = 200 * STEP_DIV;

void go_home(); 
void init_steppers();
void execute_command(char *input);
void command_loop();

#endif //DROP_CONTROLLER