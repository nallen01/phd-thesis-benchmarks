#include "cardiac_grid.h"

// cardiac_grid Initialisation function
void CardiacGridInit(CardiacGrid* me) {
    // Initialise Sub-objects
    Cell0Init(&me->cell0_data);

    Cell1Init(&me->cell1_data);

    Cell2Init(&me->cell2_data);

    Cell3Init(&me->cell3_data);

    Cell4Init(&me->cell4_data);

    Cell5Init(&me->cell5_data);

    Cell6Init(&me->cell6_data);

    Cell7Init(&me->cell7_data);

    Cell8Init(&me->cell8_data);

    Cell9Init(&me->cell9_data);

    Cell10Init(&me->cell10_data);

    Cell11Init(&me->cell11_data);

    Cell12Init(&me->cell12_data);

    Cell13Init(&me->cell13_data);

    Cell14Init(&me->cell14_data);

    Cell15Init(&me->cell15_data);

    Cell16Init(&me->cell16_data);

    Cell17Init(&me->cell17_data);

    Cell18Init(&me->cell18_data);

    Cell19Init(&me->cell19_data);

    Cell20Init(&me->cell20_data);

    Cell21Init(&me->cell21_data);

    Cell22Init(&me->cell22_data);

    Cell23Init(&me->cell23_data);

    Cell24Init(&me->cell24_data);

    StimulatorInit(&me->stimulator_data);

    // Initialise Outputs
    me->cell_v = me->cell24_data.v;
}

// cardiac_grid Execution function
void CardiacGridRun(CardiacGrid* me) {
    // Mappings
    me->cell0_data.g = me->stimulator_data.v + 0.9 * (me->cell1_data.v - me->cell0_data.v) + 0.9 * (me->cell5_data.v - me->cell0_data.v) + 0.6 * (me->cell6_data.v - me->cell0_data.v);
    me->cell1_data.g = 0.9 * (me->cell0_data.v - me->cell1_data.v) + 0.9 * (me->cell2_data.v - me->cell1_data.v) + 0.6 * (me->cell5_data.v - me->cell1_data.v) + 0.9 * (me->cell6_data.v - me->cell1_data.v) + 0.6 * (me->cell7_data.v - me->cell1_data.v);
    me->cell10_data.g = 0.9 * (me->cell5_data.v - me->cell10_data.v) + 0.6 * (me->cell6_data.v - me->cell10_data.v) + 0.9 * (me->cell11_data.v - me->cell10_data.v) + 0.9 * (me->cell15_data.v - me->cell10_data.v) + 0.6 * (me->cell16_data.v - me->cell10_data.v);
    me->cell11_data.g = 0.6 * (me->cell5_data.v - me->cell11_data.v) + 0.9 * (me->cell6_data.v - me->cell11_data.v) + 0.6 * (me->cell7_data.v - me->cell11_data.v) + 0.9 * (me->cell10_data.v - me->cell11_data.v) + 0.9 * (me->cell12_data.v - me->cell11_data.v) + 0.6 * (me->cell15_data.v - me->cell11_data.v) + 0.9 * (me->cell16_data.v - me->cell11_data.v) + 0.6 * (me->cell17_data.v - me->cell11_data.v);
    me->cell12_data.g = 0.6 * (me->cell6_data.v - me->cell12_data.v) + 0.9 * (me->cell7_data.v - me->cell12_data.v) + 0.6 * (me->cell8_data.v - me->cell12_data.v) + 0.9 * (me->cell11_data.v - me->cell12_data.v) + 0.9 * (me->cell13_data.v - me->cell12_data.v) + 0.6 * (me->cell16_data.v - me->cell12_data.v) + 0.9 * (me->cell17_data.v - me->cell12_data.v) + 0.6 * (me->cell18_data.v - me->cell12_data.v);
    me->cell13_data.g = 0.6 * (me->cell7_data.v - me->cell13_data.v) + 0.9 * (me->cell8_data.v - me->cell13_data.v) + 0.6 * (me->cell9_data.v - me->cell13_data.v) + 0.9 * (me->cell12_data.v - me->cell13_data.v) + 0.9 * (me->cell14_data.v - me->cell13_data.v) + 0.6 * (me->cell17_data.v - me->cell13_data.v) + 0.9 * (me->cell18_data.v - me->cell13_data.v) + 0.6 * (me->cell19_data.v - me->cell13_data.v);
    me->cell14_data.g = 0.6 * (me->cell8_data.v - me->cell14_data.v) + 0.9 * (me->cell9_data.v - me->cell14_data.v) + 0.9 * (me->cell13_data.v - me->cell14_data.v) + 0.6 * (me->cell18_data.v - me->cell14_data.v) + 0.9 * (me->cell19_data.v - me->cell14_data.v);
    me->cell15_data.g = 0.9 * (me->cell10_data.v - me->cell15_data.v) + 0.6 * (me->cell11_data.v - me->cell15_data.v) + 0.9 * (me->cell16_data.v - me->cell15_data.v) + 0.9 * (me->cell20_data.v - me->cell15_data.v) + 0.6 * (me->cell21_data.v - me->cell15_data.v);
    me->cell16_data.g = 0.6 * (me->cell10_data.v - me->cell16_data.v) + 0.9 * (me->cell11_data.v - me->cell16_data.v) + 0.6 * (me->cell12_data.v - me->cell16_data.v) + 0.9 * (me->cell15_data.v - me->cell16_data.v) + 0.9 * (me->cell17_data.v - me->cell16_data.v) + 0.6 * (me->cell20_data.v - me->cell16_data.v) + 0.9 * (me->cell21_data.v - me->cell16_data.v) + 0.6 * (me->cell22_data.v - me->cell16_data.v);
    me->cell17_data.g = 0.6 * (me->cell11_data.v - me->cell17_data.v) + 0.9 * (me->cell12_data.v - me->cell17_data.v) + 0.6 * (me->cell13_data.v - me->cell17_data.v) + 0.9 * (me->cell16_data.v - me->cell17_data.v) + 0.9 * (me->cell18_data.v - me->cell17_data.v) + 0.6 * (me->cell21_data.v - me->cell17_data.v) + 0.9 * (me->cell22_data.v - me->cell17_data.v) + 0.6 * (me->cell23_data.v - me->cell17_data.v);
    me->cell18_data.g = 0.6 * (me->cell12_data.v - me->cell18_data.v) + 0.9 * (me->cell13_data.v - me->cell18_data.v) + 0.6 * (me->cell14_data.v - me->cell18_data.v) + 0.9 * (me->cell17_data.v - me->cell18_data.v) + 0.9 * (me->cell19_data.v - me->cell18_data.v) + 0.6 * (me->cell22_data.v - me->cell18_data.v) + 0.9 * (me->cell23_data.v - me->cell18_data.v) + 0.6 * (me->cell24_data.v - me->cell18_data.v);
    me->cell19_data.g = 0.6 * (me->cell13_data.v - me->cell19_data.v) + 0.9 * (me->cell14_data.v - me->cell19_data.v) + 0.9 * (me->cell18_data.v - me->cell19_data.v) + 0.6 * (me->cell23_data.v - me->cell19_data.v) + 0.9 * (me->cell24_data.v - me->cell19_data.v);
    me->cell2_data.g = 0.9 * (me->cell1_data.v - me->cell2_data.v) + 0.9 * (me->cell3_data.v - me->cell2_data.v) + 0.6 * (me->cell6_data.v - me->cell2_data.v) + 0.9 * (me->cell7_data.v - me->cell2_data.v) + 0.6 * (me->cell8_data.v - me->cell2_data.v);
    me->cell20_data.g = 0.9 * (me->cell15_data.v - me->cell20_data.v) + 0.6 * (me->cell16_data.v - me->cell20_data.v) + 0.9 * (me->cell21_data.v - me->cell20_data.v);
    me->cell21_data.g = 0.6 * (me->cell15_data.v - me->cell21_data.v) + 0.9 * (me->cell16_data.v - me->cell21_data.v) + 0.6 * (me->cell17_data.v - me->cell21_data.v) + 0.9 * (me->cell20_data.v - me->cell21_data.v) + 0.9 * (me->cell22_data.v - me->cell21_data.v);
    me->cell22_data.g = 0.6 * (me->cell16_data.v - me->cell22_data.v) + 0.9 * (me->cell17_data.v - me->cell22_data.v) + 0.6 * (me->cell18_data.v - me->cell22_data.v) + 0.9 * (me->cell21_data.v - me->cell22_data.v) + 0.9 * (me->cell23_data.v - me->cell22_data.v);
    me->cell23_data.g = 0.6 * (me->cell17_data.v - me->cell23_data.v) + 0.9 * (me->cell18_data.v - me->cell23_data.v) + 0.6 * (me->cell19_data.v - me->cell23_data.v) + 0.9 * (me->cell22_data.v - me->cell23_data.v) + 0.9 * (me->cell24_data.v - me->cell23_data.v);
    me->cell24_data.g = 0.6 * (me->cell18_data.v - me->cell24_data.v) + 0.9 * (me->cell19_data.v - me->cell24_data.v) + 0.9 * (me->cell23_data.v - me->cell24_data.v);
    me->cell3_data.g = 0.9 * (me->cell2_data.v - me->cell3_data.v) + 0.9 * (me->cell4_data.v - me->cell3_data.v) + 0.6 * (me->cell7_data.v - me->cell3_data.v) + 0.9 * (me->cell8_data.v - me->cell3_data.v) + 0.6 * (me->cell9_data.v - me->cell3_data.v);
    me->cell4_data.g = 0.9 * (me->cell3_data.v - me->cell4_data.v) + 0.6 * (me->cell8_data.v - me->cell4_data.v) + 0.9 * (me->cell9_data.v - me->cell4_data.v);
    me->cell5_data.g = 0.9 * (me->cell0_data.v - me->cell5_data.v) + 0.6 * (me->cell1_data.v - me->cell5_data.v) + 0.9 * (me->cell6_data.v - me->cell5_data.v) + 0.9 * (me->cell10_data.v - me->cell5_data.v) + 0.6 * (me->cell11_data.v - me->cell5_data.v);
    me->cell6_data.g = 0.6 * (me->cell0_data.v - me->cell6_data.v) + 0.9 * (me->cell1_data.v - me->cell6_data.v) + 0.6 * (me->cell2_data.v - me->cell6_data.v) + 0.9 * (me->cell5_data.v - me->cell6_data.v) + 0.9 * (me->cell7_data.v - me->cell6_data.v) + 0.6 * (me->cell10_data.v - me->cell6_data.v) + 0.9 * (me->cell11_data.v - me->cell6_data.v) + 0.6 * (me->cell12_data.v - me->cell6_data.v);
    me->cell7_data.g = 0.6 * (me->cell1_data.v - me->cell7_data.v) + 0.9 * (me->cell2_data.v - me->cell7_data.v) + 0.6 * (me->cell3_data.v - me->cell7_data.v) + 0.9 * (me->cell6_data.v - me->cell7_data.v) + 0.9 * (me->cell8_data.v - me->cell7_data.v) + 0.6 * (me->cell11_data.v - me->cell7_data.v) + 0.9 * (me->cell12_data.v - me->cell7_data.v) + 0.6 * (me->cell13_data.v - me->cell7_data.v);
    me->cell8_data.g = 0.6 * (me->cell2_data.v - me->cell8_data.v) + 0.9 * (me->cell3_data.v - me->cell8_data.v) + 0.6 * (me->cell4_data.v - me->cell8_data.v) + 0.9 * (me->cell7_data.v - me->cell8_data.v) + 0.9 * (me->cell9_data.v - me->cell8_data.v) + 0.6 * (me->cell12_data.v - me->cell8_data.v) + 0.9 * (me->cell13_data.v - me->cell8_data.v) + 0.6 * (me->cell14_data.v - me->cell8_data.v);
    me->cell9_data.g = 0.6 * (me->cell3_data.v - me->cell9_data.v) + 0.9 * (me->cell4_data.v - me->cell9_data.v) + 0.9 * (me->cell8_data.v - me->cell9_data.v) + 0.6 * (me->cell13_data.v - me->cell9_data.v) + 0.9 * (me->cell14_data.v - me->cell9_data.v);

    // Run Automata
    Cell0Run(&me->cell0_data);

    Cell1Run(&me->cell1_data);

    Cell2Run(&me->cell2_data);

    Cell3Run(&me->cell3_data);

    Cell4Run(&me->cell4_data);

    Cell5Run(&me->cell5_data);

    Cell6Run(&me->cell6_data);

    Cell7Run(&me->cell7_data);

    Cell8Run(&me->cell8_data);

    Cell9Run(&me->cell9_data);

    Cell10Run(&me->cell10_data);

    Cell11Run(&me->cell11_data);

    Cell12Run(&me->cell12_data);

    Cell13Run(&me->cell13_data);

    Cell14Run(&me->cell14_data);

    Cell15Run(&me->cell15_data);

    Cell16Run(&me->cell16_data);

    Cell17Run(&me->cell17_data);

    Cell18Run(&me->cell18_data);

    Cell19Run(&me->cell19_data);

    Cell20Run(&me->cell20_data);

    Cell21Run(&me->cell21_data);

    Cell22Run(&me->cell22_data);

    Cell23Run(&me->cell23_data);

    Cell24Run(&me->cell24_data);

    StimulatorRun(&me->stimulator_data);

    // Output Mapping
    me->cell_v = me->cell24_data.v;
}