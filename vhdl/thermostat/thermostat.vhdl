library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity Thermostat is
    port (
        clk : in std_logic;
        
        -- Declare Outputs
        temperature_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of Thermostat is
    -- States
    type THERMOSTAT_STATE is (
        THERMOSTAT_T1,
        THERMOSTAT_T2
    );

    -- Declare State
    signal state : THERMOSTAT_STATE := THERMOSTAT_T1;
    
    -- Declare Outputs
    signal temperature : signed(31 downto 0) := CREATE_FP(20.0);
begin
    process(clk)
        -- State Variable
        variable state_update : THERMOSTAT_STATE := THERMOSTAT_T1;
        
        -- Outputs
        variable temperature_update : signed(31 downto 0) := CREATE_FP(20.0);


    begin
        if clk'event and clk = '1' then
            -- Run the state machine for transition logic
            if  state = THERMOSTAT_T1 then -- Logic for state t1
                if temperature <= CREATE_FP(22.78) then
                    -- Next state is t2
                    state_update := THERMOSTAT_T2;
            
                elsif temperature > CREATE_FP(22.78) then
                    -- Perform Flow Operations
                    temperature_update := temperature + FP_MULT((CREATE_FP(10.0) - temperature), step_size);
                    
            
                end if;
            elsif  state = THERMOSTAT_T2 then -- Logic for state t2
                if temperature >= CREATE_FP(25.0) then
                    -- Next state is t1
                    state_update := THERMOSTAT_T1;
            
                elsif temperature < CREATE_FP(25.0) then
                    -- Perform Flow Operations
                    temperature_update := temperature + FP_MULT((CREATE_FP(37.78) - temperature), step_size);
                    
            
                end if;
            end if;

            -- Map State
            state <= state_update;
            
            -- Map Outputs
            temperature_out <= temperature_update;
            temperature <= temperature_update;

        end if;
    end process;
end architecture;