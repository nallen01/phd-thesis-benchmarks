library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.lib.all;

-- Entity
entity UoaSemilinear is
    port (
        clk : in std_logic;
        
        -- Declare Outputs
        cell_v_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of UoaSemilinear is
    -- Declare all internal signals
    signal cell_g : signed(31 downto 0) := CREATE_FP(0.0);
    signal cell_v : signed(31 downto 0) := CREATE_FP(0.0);
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
    cell_inst : component Cell
        port map(
            clk => clk,
            g_in => cell_g,
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