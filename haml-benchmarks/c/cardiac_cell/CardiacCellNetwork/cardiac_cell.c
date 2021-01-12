#include "cardiac_cell.h"

// cardiac_cell Initialisation function
void CardiacCellInit(CardiacCell* me) {
    // Initialise Sub-objects
    CellInit(&me->cell_data);

    // Initialise Outputs
    me->cell_v = me->cell_data.v;
}

// cardiac_cell Execution function
void CardiacCellRun(CardiacCell* me) {

    // Run Automata
    CellRun(&me->cell_data);

    // Output Mapping
    me->cell_v = me->cell_data.v;
}