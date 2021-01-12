#include "uoa_semilinear.h"

// uoa_semilinear Initialisation function
void UoaSemilinearInit(UoaSemilinear* me) {
    // Initialise Sub-objects
    CellInit(&me->cell_data);

    StimulatorInit(&me->stimulator_data);

    // Initialise Outputs
    me->cell_v = me->cell_data.v;
}

// uoa_semilinear Execution function
void UoaSemilinearRun(UoaSemilinear* me) {
    // Mappings
    me->cell_data.g = me->stimulator_data.v;

    // Run Automata
    CellRun(&me->cell_data);

    StimulatorRun(&me->stimulator_data);

    // Output Mapping
    me->cell_v = me->cell_data.v;
}