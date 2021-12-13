#ifndef CAMERA_TRIGGER
#define CAMERA_TRIGGER

#include <Arduino.h>
#include <stdlib.h>

const uint8_t PWM_channel = 0;
const uint8_t PWM_res = 16;
const uint8_t PWM_pin = 33;
const uint32_t PWM_duty = 1 << 15;


void config_triggers(char *tok_end);
void init_triggers();
void start_triggers();
void advance_triggers(uint64_t current_time);

#endif //CAMERA_TRIGGER