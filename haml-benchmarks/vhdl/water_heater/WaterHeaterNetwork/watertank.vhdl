library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity Watertank is
    generic(
        air_temp : signed(31 downto 0) := CREATE_FP(20.0);
        boil_temp : signed(31 downto 0) := CREATE_FP(100.0);
        k : signed(31 downto 0) := CREATE_FP(0.075);
        heater_temp : signed(31 downto 0) := CREATE_FP(150.0)
    );

    port (
        clk : in std_logic;
        
        -- Declare Inputs
        burner_on_in : in boolean;
        burner_off_in : in boolean;
        
        -- Declare Outputs
        temperature_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of Watertank is
    -- States
    type WATERTANK_STATE is (
        WATERTANK_T1,
        WATERTANK_T2,
        WATERTANK_T3,
        WATERTANK_T4
    );

    -- Declare State
    signal state : WATERTANK_STATE := WATERTANK_T1;
    
    -- Declare Outputs
    signal temperature : signed(31 downto 0) := air_temp;
begin
    process(clk)
        -- State Variable
        variable state_update : WATERTANK_STATE := WATERTANK_T1;
        
        -- Outputs
        variable temperature_update : signed(31 downto 0) := air_temp;


    begin
        if clk'event and clk = '1' then
            -- Run the state machine for transition logic
            if  state = WATERTANK_T1 then -- Logic for state t1
                if temperature = boil_temp and not burner_off_in then
                    -- Next state is t2
                    state_update := WATERTANK_T2;
                
                elsif burner_off_in then
                    -- Next state is t3
                    state_update := WATERTANK_T3;
                
                elsif temperature >= air_temp and temperature < boil_temp and not burner_off_in then
                    -- Perform Flow Operations
                    temperature_update := temperature + FP_MULT(FP_MULT(k, (heater_temp - temperature)), step_size);
                    
                    -- Perform Saturation
                    if (temperature_update > boil_temp and temperature < boil_temp) or (temperature_update < boil_temp and temperature > boil_temp) then
                        -- Need to saturate temperature to boil_temp
                        temperature_update := boil_temp;

                    end if;
                    
                end if;
            
            elsif  state = WATERTANK_T2 then -- Logic for state t2
                if burner_off_in then
                    -- Next state is t3
                    state_update := WATERTANK_T3;
                
                elsif not burner_off_in then
                end if;
            
            elsif  state = WATERTANK_T3 then -- Logic for state t3
                if temperature = air_temp and not burner_on_in then
                    -- Next state is t4
                    state_update := WATERTANK_T4;
                
                elsif burner_on_in then
                    -- Next state is t1
                    state_update := WATERTANK_T1;
                
                elsif temperature > air_temp and temperature <= boil_temp and not burner_on_in then
                    -- Perform Flow Operations
                    temperature_update := temperature + FP_MULT(FP_MULT(-k, temperature), step_size);
                    
                    -- Perform Saturation
                    if (temperature_update > air_temp and temperature < air_temp) or (temperature_update < air_temp and temperature > air_temp) then
                        -- Need to saturate temperature to air_temp
                        temperature_update := air_temp;

                    end if;
                    
                end if;
            
            elsif  state = WATERTANK_T4 then -- Logic for state t4
                if burner_on_in then
                    -- Next state is t1
                    state_update := WATERTANK_T1;
                
                elsif not burner_on_in then
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