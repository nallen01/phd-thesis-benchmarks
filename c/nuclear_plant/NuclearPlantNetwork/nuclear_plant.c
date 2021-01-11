#include "nuclear_plant.h"

// nuclear_plant Initialisation function
void NuclearPlantInit(NuclearPlant* me) {
    // Initialise Sub-objects
    PlantInit(&me->plant_data);

    ControllerInit(&me->controller_data);

    // Initialise Outputs
    me->plant_x = me->plant_data.x;
}

// nuclear_plant Execution function
void NuclearPlantRun(NuclearPlant* me) {
    // Mappings
    me->controller_data.x = me->plant_data.x;
    me->plant_data.add1 = me->controller_data.add1;
    me->plant_data.add2 = me->controller_data.add2;
    me->plant_data.remove1 = me->controller_data.remove1;
    me->plant_data.remove2 = me->controller_data.remove2;

    // Run Automata
    PlantRun(&me->plant_data);

    ControllerRun(&me->controller_data);

    // Output Mapping
    me->plant_x = me->plant_data.x;
}