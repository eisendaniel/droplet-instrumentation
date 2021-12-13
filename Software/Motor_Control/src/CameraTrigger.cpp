#include "CameraTrigger.h"

bool active = false;
uint8_t phase_i = 0;
uint64_t phase_time = 0; //us

double freqs[3] = {30.0, 20.0, 10.0}; //Hz
uint64_t phases[3] = {(uint64_t)5e6, (uint64_t)5e6, (uint64_t)5e6};

void config_triggers(char *tok_end)
{
    for (size_t i = 0; i < 3; ++i)
    {
        freqs[i] = atof(strtok_r(NULL, " ", &tok_end));
        double phasef = atof(strtok_r(NULL, " ", &tok_end));
        phases[i] = (uint64_t)(phasef * 1e6);
    }
    init_triggers();
}

void init_triggers()
{
    phase_i = 0;
    active = false;
    ledcSetup(PWM_channel, freqs[phase_i], PWM_res);
    ledcAttachPin(PWM_pin, PWM_channel);
}

void start_triggers()
{
    if (active)
    {
        init_triggers();
    }
    ledcWrite(PWM_channel, PWM_duty);
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
            phase_i = 2;
            return;
        }

        ledcSetup(PWM_channel, freqs[phase_i], PWM_res);
        ledcAttachPin(PWM_pin, PWM_channel);
        ledcWrite(PWM_channel, PWM_duty);
    }
}
