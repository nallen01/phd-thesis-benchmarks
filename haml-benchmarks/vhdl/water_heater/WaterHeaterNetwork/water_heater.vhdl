library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.lib.all;

-- Entity
entity WaterHeater is
    port (
        clk : in std_logic;
        
        -- Declare Outputs
        temperature_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of WaterHeater is
    -- Declare all internal signals
    signal tank_burner_on : boolean := false;
    signal tank_burner_off : boolean := false;
    signal tank_temperature : signed(31 downto 0) := CREATE_FP(0.0);
    signal burner_burner_on : boolean := false;
    signal burner_burner_off : boolean := false;

    -- Declare child components
    component Watertank is
        generic(
            air_temp : signed(31 downto 0) := CREATE_FP(20.0);
            boil_temp : signed(31 downto 0) := CREATE_FP(100.0);
            k : signed(31 downto 0) := CREATE_FP(0.075);
            heater_temp : signed(31 downto 0) := CREATE_FP(150.0)
        );
        port(
            clk : in std_logic;
            burner_on_in : in boolean;
            burner_off_in : in boolean;
            temperature_out : out signed(31 downto 0)
        );
    end component Watertank;

    component Burner is
        generic(
            cycle_time : signed(31 downto 0) := CREATE_FP(20.0)
        );
        port(
            clk : in std_logic;
            burner_on_out : out boolean;
            burner_off_out : out boolean
        );
    end component Burner;

begin
    -- Create child instances
    tank_inst : component Watertank
        generic map(
            k => CREATE_FP(0.075)
        )
        port map(
            clk => clk,
            burner_on_in => tank_burner_on,
            burner_off_in => tank_burner_off,
            temperature_out => tank_temperature
        );

    burner_inst : component Burner
        port map(
            clk => clk,
            burner_on_out => burner_burner_on,
            burner_off_out => burner_burner_off
        );

    -- Perform Mapping
    temperature_out <= tank_temperature;
    tank_burner_on <= burner_burner_on;
    tank_burner_off <= burner_burner_off;
end architecture;