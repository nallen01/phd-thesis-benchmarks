#include "water_heater.h"

// water_heater Initialisation function
void WaterHeaterInit(WaterHeater* me) {
    // Initialise Sub-objects
    TankInit(&me->tank_data);

    BurnerInit(&me->burner_data);

    // Initialise Outputs
    me->temperature = me->tank_data.temperature;
}

// water_heater Execution function
void WaterHeaterRun(WaterHeater* me) {
    // Mappings
    me->tank_data.burner_off = me->burner_data.burner_off;
    me->tank_data.burner_on = me->burner_data.burner_on;

    // Run Automata
    TankRun(&me->tank_data);

    BurnerRun(&me->burner_data);

    // Output Mapping
    me->temperature = me->tank_data.temperature;
}