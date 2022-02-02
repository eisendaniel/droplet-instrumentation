#ifndef CAMERA_TRIGGER
#define CAMERA_TRIGGER

#include <Arduino.h>
#include <stdlib.h>

const uint8_t PWM_CHANNEL = 0;
const uint8_t PWM_RES = 16;
const uint8_t CAMERA_0 = 33;
const uint8_t CAMERA_1 = 32;
const uint32_t PWM_DUTY = 1 << 15;

void config_triggers(char *token_end);
void init_triggers();
void start_triggers();
void advance_triggers(uint64_t current_time);

#endif //CAMERA_TRIGGER