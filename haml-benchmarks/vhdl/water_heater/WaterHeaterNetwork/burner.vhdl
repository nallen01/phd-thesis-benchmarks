library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity Burner is
    generic(
        cycle_time : signed(31 downto 0) := CREATE_FP(20.0)
    );

    port (
        clk : in std_logic;
        
        -- Declare Outputs
        burner_on_out : out boolean;
        burner_off_out : out boolean

    );
end;

-- Architecture
architecture behavior of Burner is
    -- States
    type BURNER_STATE is (
        BURNER_B1,
        BURNER_B2
    );

    -- Declare State
    signal state : BURNER_STATE := BURNER_B1;
    
    -- Declare Outputs
    signal burner_on : boolean := false;
    signal burner_off : boolean := false;
    
    -- Declare Internal Variables
    signal y : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        -- State Variable
        variable state_update : BURNER_STATE := BURNER_B1;
        
        -- Outputs
        variable burner_on_update : boolean := false;
        variable burner_off_update : boolean := false;
        
        -- Internal Variables
        variable y_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Run the state machine for transition logic
            if  state = BURNER_B1 then -- Logic for state b1
                if y = cycle_time then
                    -- Perform Update Operations
                    y_update := CREATE_FP(0.0);
                    
                    -- Next state is b2
                    state_update := BURNER_B2;
                
                elsif y < cycle_time then
                    -- Perform Flow Operations
                    y_update := y + FP_MULT(CREATE_FP(1.0), step_size);
                    
                    -- Perform Update Operations
                    burner_on_update := true;
                    burner_off_update := false;
                    
                    -- Perform Saturation
                    if (y_update > cycle_time and y < cycle_time) or (y_update < cycle_time and y > cycle_time) then
                        -- Need to saturate y to cycle_time
                        y_update := cycle_time;

                    end if;
                    
                end if;
            
            elsif  state = BURNER_B2 then -- Logic for state b2
                if y = cycle_time then
                    -- Perform Update Operations
                    y_update := CREATE_FP(0.0);
                    
                    -- Next state is b1
                    state_update := BURNER_B1;
                
                elsif y < cycle_time then
                    -- Perform Flow Operations
                    y_update := y + FP_MULT(CREATE_FP(1.0), step_size);
                    
                    -- Perform Update Operations
                    burner_on_update := false;
                    burner_off_update := true;
                    
                    -- Perform Saturation
                    if (y_update > cycle_time and y < cycle_time) or (y_update < cycle_time and y > cycle_time) then
                        -- Need to saturate y to cycle_time
                        y_update := cycle_time;

                    end if;
                    
                end if;

            end if;

            -- Map State
            state <= state_update;
            
            -- Map Outputs
            burner_on_out <= burner_on_update;
            burner_on <= burner_on_update;
            burner_off_out <= burner_off_update;
            burner_off <= burner_off_update;
            
            -- Map Internal Variables
            y <= y_update;

        end if;
    end process;
end architecture;