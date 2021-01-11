library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.lib.all;

-- Entity
entity system is
    port (
        clk : in std_logic;
        
        -- Declare Outputs
        temperature_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of system is
    -- Declare all internal signals
    signal thermostat_temperature : signed(31 downto 0) := CREATE_FP(0.0);


    -- Declare base component
    component Thermostat is
        port(
            clk : in std_logic;
            temperature_out : out signed(31 downto 0)
        );
    end component Thermostat;
begin
    -- Create base instance
    thermostat_inst : component Thermostat
        port map(
            clk => clk,
            temperature_out => thermostat_temperature
        );

    -- Perform Mapping
    temperature_out <= thermostat_temperature;
end architecture;