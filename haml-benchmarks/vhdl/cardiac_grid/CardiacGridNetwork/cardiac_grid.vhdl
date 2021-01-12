library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.lib.all;

-- Entity
entity CardiacGrid is
    port (
        clk : in std_logic;
        
        -- Declare Outputs
        cell_v_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of CardiacGrid is
    -- Declare all internal signals
    signal cell0_g : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell0_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell1_g : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell1_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell2_g : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell2_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell3_g : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell3_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell4_g : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell4_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell5_g : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell5_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell6_g : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell6_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell7_g : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell7_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell8_g : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell8_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell9_g : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell9_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell10_g : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell10_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell11_g : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell11_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell12_g : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell12_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell13_g : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell13_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell14_g : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell14_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell15_g : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell15_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell16_g : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell16_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell17_g : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell17_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell18_g : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell18_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell19_g : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell19_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell20_g : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell20_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell21_g : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell21_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell22_g : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell22_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell23_g : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell23_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell24_g : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell24_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal stimulator_v : signed(31 downto 0) := CREATE_FP(0.0);

    -- Declare child components
    component Cell is
        generic(
            c1 : signed(31 downto 0) := CREATE_FP(29100.0);
            c2 : signed(31 downto 0) := CREATE_FP(-1600.0);
            c3 : signed(31 downto 0) := CREATE_FP(9.988E-4);
            c4 : signed(31 downto 0) := CREATE_FP(-530.0);
            c5 : signed(31 downto 0) := CREATE_FP(120.0);
            c6 : signed(31 downto 0) := CREATE_FP(1000.0);
            v_t : signed(31 downto 0) := CREATE_FP(44.5);
            v_r : signed(31 downto 0) := CREATE_FP(30.0);
            v_omax : signed(31 downto 0) := CREATE_FP(131.1)
        );
        port(
            clk : in std_logic;
            g_in : in signed(31 downto 0);
            v_out : out signed(31 downto 0)
        );
    end component Cell;

    component Stimulator is
        generic(
            rate : signed(31 downto 0) := CREATE_FP(1.0);
            pulse_width : signed(31 downto 0) := CREATE_FP(0.01);
            amplitude : signed(31 downto 0) := CREATE_FP(131.1)
        );
        port(
            clk : in std_logic;
            v_out : out signed(31 downto 0)
        );
    end component Stimulator;

begin
    -- Create child instances
    cell0_inst : component Cell
        port map(
            clk => clk,
            g_in => cell0_g,
            v_out => cell0_v
        );

    cell1_inst : component Cell
        port map(
            clk => clk,
            g_in => cell1_g,
            v_out => cell1_v
        );

    cell2_inst : component Cell
        port map(
            clk => clk,
            g_in => cell2_g,
            v_out => cell2_v
        );

    cell3_inst : component Cell
        port map(
            clk => clk,
            g_in => cell3_g,
            v_out => cell3_v
        );

    cell4_inst : component Cell
        port map(
            clk => clk,
            g_in => cell4_g,
            v_out => cell4_v
        );

    cell5_inst : component Cell
        port map(
            clk => clk,
            g_in => cell5_g,
            v_out => cell5_v
        );

    cell6_inst : component Cell
        port map(
            clk => clk,
            g_in => cell6_g,
            v_out => cell6_v
        );

    cell7_inst : component Cell
        port map(
            clk => clk,
            g_in => cell7_g,
            v_out => cell7_v
        );

    cell8_inst : component Cell
        port map(
            clk => clk,
            g_in => cell8_g,
            v_out => cell8_v
        );

    cell9_inst : component Cell
        port map(
            clk => clk,
            g_in => cell9_g,
            v_out => cell9_v
        );

    cell10_inst : component Cell
        port map(
            clk => clk,
            g_in => cell10_g,
            v_out => cell10_v
        );

    cell11_inst : component Cell
        port map(
            clk => clk,
            g_in => cell11_g,
            v_out => cell11_v
        );

    cell12_inst : component Cell
        port map(
            clk => clk,
            g_in => cell12_g,
            v_out => cell12_v
        );

    cell13_inst : component Cell
        port map(
            clk => clk,
            g_in => cell13_g,
            v_out => cell13_v
        );

    cell14_inst : component Cell
        port map(
            clk => clk,
            g_in => cell14_g,
            v_out => cell14_v
        );

    cell15_inst : component Cell
        port map(
            clk => clk,
            g_in => cell15_g,
            v_out => cell15_v
        );

    cell16_inst : component Cell
        port map(
            clk => clk,
            g_in => cell16_g,
            v_out => cell16_v
        );

    cell17_inst : component Cell
        port map(
            clk => clk,
            g_in => cell17_g,
            v_out => cell17_v
        );

    cell18_inst : component Cell
        port map(
            clk => clk,
            g_in => cell18_g,
            v_out => cell18_v
        );

    cell19_inst : component Cell
        port map(
            clk => clk,
            g_in => cell19_g,
            v_out => cell19_v
        );

    cell20_inst : component Cell
        port map(
            clk => clk,
            g_in => cell20_g,
            v_out => cell20_v
        );

    cell21_inst : component Cell
        port map(
            clk => clk,
            g_in => cell21_g,
            v_out => cell21_v
        );

    cell22_inst : component Cell
        port map(
            clk => clk,
            g_in => cell22_g,
            v_out => cell22_v
        );

    cell23_inst : component Cell
        port map(
            clk => clk,
            g_in => cell23_g,
            v_out => cell23_v
        );

    cell24_inst : component Cell
        port map(
            clk => clk,
            g_in => cell24_g,
            v_out => cell24_v
        );

    stimulator_inst : component Stimulator
        port map(
            clk => clk,
            v_out => stimulator_v
        );

    -- Perform Mapping
    cell_v_out <= cell24_v;
    cell0_g <= stimulator_v + FP_MULT(CREATE_FP(0.9), (cell1_v - cell0_v)) + FP_MULT(CREATE_FP(0.9), (cell5_v - cell0_v)) + FP_MULT(CREATE_FP(0.6), (cell6_v - cell0_v));
    cell1_g <= FP_MULT(CREATE_FP(0.9), (cell0_v - cell1_v)) + FP_MULT(CREATE_FP(0.9), (cell2_v - cell1_v)) + FP_MULT(CREATE_FP(0.6), (cell5_v - cell1_v)) + FP_MULT(CREATE_FP(0.9), (cell6_v - cell1_v)) + FP_MULT(CREATE_FP(0.6), (cell7_v - cell1_v));
    cell2_g <= FP_MULT(CREATE_FP(0.9), (cell1_v - cell2_v)) + FP_MULT(CREATE_FP(0.9), (cell3_v - cell2_v)) + FP_MULT(CREATE_FP(0.6), (cell6_v - cell2_v)) + FP_MULT(CREATE_FP(0.9), (cell7_v - cell2_v)) + FP_MULT(CREATE_FP(0.6), (cell8_v - cell2_v));
    cell3_g <= FP_MULT(CREATE_FP(0.9), (cell2_v - cell3_v)) + FP_MULT(CREATE_FP(0.9), (cell4_v - cell3_v)) + FP_MULT(CREATE_FP(0.6), (cell7_v - cell3_v)) + FP_MULT(CREATE_FP(0.9), (cell8_v - cell3_v)) + FP_MULT(CREATE_FP(0.6), (cell9_v - cell3_v));
    cell4_g <= FP_MULT(CREATE_FP(0.9), (cell3_v - cell4_v)) + FP_MULT(CREATE_FP(0.6), (cell8_v - cell4_v)) + FP_MULT(CREATE_FP(0.9), (cell9_v - cell4_v));
    cell5_g <= FP_MULT(CREATE_FP(0.9), (cell0_v - cell5_v)) + FP_MULT(CREATE_FP(0.6), (cell1_v - cell5_v)) + FP_MULT(CREATE_FP(0.9), (cell6_v - cell5_v)) + FP_MULT(CREATE_FP(0.9), (cell10_v - cell5_v)) + FP_MULT(CREATE_FP(0.6), (cell11_v - cell5_v));
    cell6_g <= FP_MULT(CREATE_FP(0.6), (cell0_v - cell6_v)) + FP_MULT(CREATE_FP(0.9), (cell1_v - cell6_v)) + FP_MULT(CREATE_FP(0.6), (cell2_v - cell6_v)) + FP_MULT(CREATE_FP(0.9), (cell5_v - cell6_v)) + FP_MULT(CREATE_FP(0.9), (cell7_v - cell6_v)) + FP_MULT(CREATE_FP(0.6), (cell10_v - cell6_v)) + FP_MULT(CREATE_FP(0.9), (cell11_v - cell6_v)) + FP_MULT(CREATE_FP(0.6), (cell12_v - cell6_v));
    cell7_g <= FP_MULT(CREATE_FP(0.6), (cell1_v - cell7_v)) + FP_MULT(CREATE_FP(0.9), (cell2_v - cell7_v)) + FP_MULT(CREATE_FP(0.6), (cell3_v - cell7_v)) + FP_MULT(CREATE_FP(0.9), (cell6_v - cell7_v)) + FP_MULT(CREATE_FP(0.9), (cell8_v - cell7_v)) + FP_MULT(CREATE_FP(0.6), (cell11_v - cell7_v)) + FP_MULT(CREATE_FP(0.9), (cell12_v - cell7_v)) + FP_MULT(CREATE_FP(0.6), (cell13_v - cell7_v));
    cell8_g <= FP_MULT(CREATE_FP(0.6), (cell2_v - cell8_v)) + FP_MULT(CREATE_FP(0.9), (cell3_v - cell8_v)) + FP_MULT(CREATE_FP(0.6), (cell4_v - cell8_v)) + FP_MULT(CREATE_FP(0.9), (cell7_v - cell8_v)) + FP_MULT(CREATE_FP(0.9), (cell9_v - cell8_v)) + FP_MULT(CREATE_FP(0.6), (cell12_v - cell8_v)) + FP_MULT(CREATE_FP(0.9), (cell13_v - cell8_v)) + FP_MULT(CREATE_FP(0.6), (cell14_v - cell8_v));
    cell9_g <= FP_MULT(CREATE_FP(0.6), (cell3_v - cell9_v)) + FP_MULT(CREATE_FP(0.9), (cell4_v - cell9_v)) + FP_MULT(CREATE_FP(0.9), (cell8_v - cell9_v)) + FP_MULT(CREATE_FP(0.6), (cell13_v - cell9_v)) + FP_MULT(CREATE_FP(0.9), (cell14_v - cell9_v));
    cell10_g <= FP_MULT(CREATE_FP(0.9), (cell5_v - cell10_v)) + FP_MULT(CREATE_FP(0.6), (cell6_v - cell10_v)) + FP_MULT(CREATE_FP(0.9), (cell11_v - cell10_v)) + FP_MULT(CREATE_FP(0.9), (cell15_v - cell10_v)) + FP_MULT(CREATE_FP(0.6), (cell16_v - cell10_v));
    cell11_g <= FP_MULT(CREATE_FP(0.6), (cell5_v - cell11_v)) + FP_MULT(CREATE_FP(0.9), (cell6_v - cell11_v)) + FP_MULT(CREATE_FP(0.6), (cell7_v - cell11_v)) + FP_MULT(CREATE_FP(0.9), (cell10_v - cell11_v)) + FP_MULT(CREATE_FP(0.9), (cell12_v - cell11_v)) + FP_MULT(CREATE_FP(0.6), (cell15_v - cell11_v)) + FP_MULT(CREATE_FP(0.9), (cell16_v - cell11_v)) + FP_MULT(CREATE_FP(0.6), (cell17_v - cell11_v));
    cell12_g <= FP_MULT(CREATE_FP(0.6), (cell6_v - cell12_v)) + FP_MULT(CREATE_FP(0.9), (cell7_v - cell12_v)) + FP_MULT(CREATE_FP(0.6), (cell8_v - cell12_v)) + FP_MULT(CREATE_FP(0.9), (cell11_v - cell12_v)) + FP_MULT(CREATE_FP(0.9), (cell13_v - cell12_v)) + FP_MULT(CREATE_FP(0.6), (cell16_v - cell12_v)) + FP_MULT(CREATE_FP(0.9), (cell17_v - cell12_v)) + FP_MULT(CREATE_FP(0.6), (cell18_v - cell12_v));
    cell13_g <= FP_MULT(CREATE_FP(0.6), (cell7_v - cell13_v)) + FP_MULT(CREATE_FP(0.9), (cell8_v - cell13_v)) + FP_MULT(CREATE_FP(0.6), (cell9_v - cell13_v)) + FP_MULT(CREATE_FP(0.9), (cell12_v - cell13_v)) + FP_MULT(CREATE_FP(0.9), (cell14_v - cell13_v)) + FP_MULT(CREATE_FP(0.6), (cell17_v - cell13_v)) + FP_MULT(CREATE_FP(0.9), (cell18_v - cell13_v)) + FP_MULT(CREATE_FP(0.6), (cell19_v - cell13_v));
    cell14_g <= FP_MULT(CREATE_FP(0.6), (cell8_v - cell14_v)) + FP_MULT(CREATE_FP(0.9), (cell9_v - cell14_v)) + FP_MULT(CREATE_FP(0.9), (cell13_v - cell14_v)) + FP_MULT(CREATE_FP(0.6), (cell18_v - cell14_v)) + FP_MULT(CREATE_FP(0.9), (cell19_v - cell14_v));
    cell15_g <= FP_MULT(CREATE_FP(0.9), (cell10_v - cell15_v)) + FP_MULT(CREATE_FP(0.6), (cell11_v - cell15_v)) + FP_MULT(CREATE_FP(0.9), (cell16_v - cell15_v)) + FP_MULT(CREATE_FP(0.9), (cell20_v - cell15_v)) + FP_MULT(CREATE_FP(0.6), (cell21_v - cell15_v));
    cell16_g <= FP_MULT(CREATE_FP(0.6), (cell10_v - cell16_v)) + FP_MULT(CREATE_FP(0.9), (cell11_v - cell16_v)) + FP_MULT(CREATE_FP(0.6), (cell12_v - cell16_v)) + FP_MULT(CREATE_FP(0.9), (cell15_v - cell16_v)) + FP_MULT(CREATE_FP(0.9), (cell17_v - cell16_v)) + FP_MULT(CREATE_FP(0.6), (cell20_v - cell16_v)) + FP_MULT(CREATE_FP(0.9), (cell21_v - cell16_v)) + FP_MULT(CREATE_FP(0.6), (cell22_v - cell16_v));
    cell17_g <= FP_MULT(CREATE_FP(0.6), (cell11_v - cell17_v)) + FP_MULT(CREATE_FP(0.9), (cell12_v - cell17_v)) + FP_MULT(CREATE_FP(0.6), (cell13_v - cell17_v)) + FP_MULT(CREATE_FP(0.9), (cell16_v - cell17_v)) + FP_MULT(CREATE_FP(0.9), (cell18_v - cell17_v)) + FP_MULT(CREATE_FP(0.6), (cell21_v - cell17_v)) + FP_MULT(CREATE_FP(0.9), (cell22_v - cell17_v)) + FP_MULT(CREATE_FP(0.6), (cell23_v - cell17_v));
    cell18_g <= FP_MULT(CREATE_FP(0.6), (cell12_v - cell18_v)) + FP_MULT(CREATE_FP(0.9), (cell13_v - cell18_v)) + FP_MULT(CREATE_FP(0.6), (cell14_v - cell18_v)) + FP_MULT(CREATE_FP(0.9), (cell17_v - cell18_v)) + FP_MULT(CREATE_FP(0.9), (cell19_v - cell18_v)) + FP_MULT(CREATE_FP(0.6), (cell22_v - cell18_v)) + FP_MULT(CREATE_FP(0.9), (cell23_v - cell18_v)) + FP_MULT(CREATE_FP(0.6), (cell24_v - cell18_v));
    cell19_g <= FP_MULT(CREATE_FP(0.6), (cell13_v - cell19_v)) + FP_MULT(CREATE_FP(0.9), (cell14_v - cell19_v)) + FP_MULT(CREATE_FP(0.9), (cell18_v - cell19_v)) + FP_MULT(CREATE_FP(0.6), (cell23_v - cell19_v)) + FP_MULT(CREATE_FP(0.9), (cell24_v - cell19_v));
    cell20_g <= FP_MULT(CREATE_FP(0.9), (cell15_v - cell20_v)) + FP_MULT(CREATE_FP(0.6), (cell16_v - cell20_v)) + FP_MULT(CREATE_FP(0.9), (cell21_v - cell20_v));
    cell21_g <= FP_MULT(CREATE_FP(0.6), (cell15_v - cell21_v)) + FP_MULT(CREATE_FP(0.9), (cell16_v - cell21_v)) + FP_MULT(CREATE_FP(0.6), (cell17_v - cell21_v)) + FP_MULT(CREATE_FP(0.9), (cell20_v - cell21_v)) + FP_MULT(CREATE_FP(0.9), (cell22_v - cell21_v));
    cell22_g <= FP_MULT(CREATE_FP(0.6), (cell16_v - cell22_v)) + FP_MULT(CREATE_FP(0.9), (cell17_v - cell22_v)) + FP_MULT(CREATE_FP(0.6), (cell18_v - cell22_v)) + FP_MULT(CREATE_FP(0.9), (cell21_v - cell22_v)) + FP_MULT(CREATE_FP(0.9), (cell23_v - cell22_v));
    cell23_g <= FP_MULT(CREATE_FP(0.6), (cell17_v - cell23_v)) + FP_MULT(CREATE_FP(0.9), (cell18_v - cell23_v)) + FP_MULT(CREATE_FP(0.6), (cell19_v - cell23_v)) + FP_MULT(CREATE_FP(0.9), (cell22_v - cell23_v)) + FP_MULT(CREATE_FP(0.9), (cell24_v - cell23_v));
    cell24_g <= FP_MULT(CREATE_FP(0.6), (cell18_v - cell24_v)) + FP_MULT(CREATE_FP(0.9), (cell19_v - cell24_v)) + FP_MULT(CREATE_FP(0.9), (cell23_v - cell24_v));
end architecture;