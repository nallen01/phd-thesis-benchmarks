library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.lib.all;

-- Entity
entity UoaMyocite is
    port (
        clk : in std_logic;
        
        -- Declare Outputs
        cell_v_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of UoaMyocite is
    -- Declare all internal signals
    signal cell_g : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell_resting : boolean := false;
    signal cell_stimulated : boolean := false;
    signal cell_v : signed(31 downto 0) := CREATE_FP(0.0);
    signal stimulator_v : signed(31 downto 0) := CREATE_FP(0.0);

    -- Declare child components
    component Cell is
        generic(
            c1 : signed(31 downto 0) := CREATE_FP(-8.7);
            c2 : signed(31 downto 0) := CREATE_FP(-190.9);
            c3 : signed(31 downto 0) := CREATE_FP(-190.4);
            c4 : signed(31 downto 0) := CREATE_FP(-23.6);
            c5 : signed(31 downto 0) := CREATE_FP(-45.5);
            c6 : signed(31 downto 0) := CREATE_FP(-12.9);
            c7 : signed(31 downto 0) := CREATE_FP(777200.0);
            c8 : signed(31 downto 0) := CREATE_FP(58900.0);
            c9 : signed(31 downto 0) := CREATE_FP(276600.0);
            c10 : signed(31 downto 0) := CREATE_FP(-6.9);
            c11 : signed(31 downto 0) := CREATE_FP(75.9);
            c12 : signed(31 downto 0) := CREATE_FP(6826.5);
            c13 : signed(31 downto 0) := CREATE_FP(-33.2);
            c14 : signed(31 downto 0) := CREATE_FP(20.0);
            c15 : signed(31 downto 0) := CREATE_FP(2.0);
            v_o : signed(31 downto 0) := CREATE_FP(131.1);
            v_t : signed(31 downto 0) := CREATE_FP(44.5);
            v_r : signed(31 downto 0) := CREATE_FP(30.0);
            v_n_r_max : signed(31 downto 0) := CREATE_FP(0.04);
            autorhythmic_rate : signed(31 downto 0) := CREATE_FP(0.0)
        );
        port(
            clk : in std_logic;
            g_in : in signed(31 downto 0);
            resting_out : out boolean;
            stimulated_out : out boolean;
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
    cell_inst : component Cell
        port map(
            clk => clk,
            g_in => cell_g,
            resting_out => cell_resting,
            stimulated_out => cell_stimulated,
            v_out => cell_v
        );

    stimulator_inst : component Stimulator
        port map(
            clk => clk,
            v_out => stimulator_v
        );

    -- Perform Mapping
    cell_v_out <= cell_v;
    cell_g <= stimulator_v;
end architecture;