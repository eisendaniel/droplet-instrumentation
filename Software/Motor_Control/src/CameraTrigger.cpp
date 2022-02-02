#include "CameraTrigger.h"

bool active = false;
uint8_t phase_i = 0;
uint64_t phase_time = 0; //us

double freqs[3] = {10.0, 1.0, 0.1}; //Hz
uint64_t phases[3] = {(uint64_t)6e6, (uint64_t)60e6, (uint64_t)5e6};

void config_triggers(char *token_end)
{
    for (size_t i = 0; i < 3; ++i)
    {
        freqs[i] = atof(strtok_r(NULL, " ", &token_end));
        double phasef = atof(strtok_r(NULL, " ", &token_end));
        phases[i] = (uint64_t)(phasef * 1e6);
    }
    init_triggers();
}

void init_triggers()
{
    phase_i = 0;
    active = false;
    ledcSetup(PWM_CHANNEL, freqs[phase_i], PWM_RES);
    ledcAttachPin(CAMERA_0, PWM_CHANNEL);
    ledcAttachPin(CAMERA_1, PWM_CHANNEL);
}

void start_triggers()
{
    if (active)
    {
        init_triggers();
    }
    ledcWrite(PWM_CHANNEL, PWM_DUTY);
    phase_time = esp_timer_get_time();
    active = true;
}

void advance_triggers(uint64_t current_time)
{
    if (!active)
    {
        return;
    }
    if (((current_time - phase_time) > phases[phase_i]))
    {
        phase_time = current_time;

        if (++phase_i > 2)
        {
            // init_triggers();
            phase_i = 2;
            return;
        }

        ledcSetup(PWM_CHANNEL, freqs[phase_i], PWM_RES);
        ledcAttachPin(CAMERA_0, PWM_CHANNEL);
        ledcAttachPin(CAMERA_1, PWM_CHANNEL);
        ledcWrite(PWM_CHANNEL, PWM_DUTY);
    }
}
