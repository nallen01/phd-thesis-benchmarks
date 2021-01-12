#include "uoa_myocite.h"

// uoa_myocite Initialisation function
void UoaMyociteInit(UoaMyocite* me) {
    // Initialise Sub-objects
    CellInit(&me->cell_data);

    StimulatorInit(&me->stimulator_data);

    // Initialise Outputs
    me->cell_v = me->cell_data.v;
}

// uoa_myocite Execution function
void UoaMyociteRun(UoaMyocite* me) {
    // Mappings
    me->cell_data.g = me->stimulator_data.v;

    // Run Automata
    CellRun(&me->cell_data);

    StimulatorRun(&me->stimulator_data);

    // Output Mapping
    me->cell_v = me->cell_data.v;
}