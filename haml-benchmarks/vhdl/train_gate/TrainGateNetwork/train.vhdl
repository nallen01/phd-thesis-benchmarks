library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity Train is
    generic(
        train_speed : signed(31 downto 0) := CREATE_FP(1.0)
    );

    port (
        clk : in std_logic;
        
        -- Declare Outputs
        gate_request_up_out : out boolean;
        gate_request_down_out : out boolean;
        position_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of Train is
    -- States
    type TRAIN_STATE is (
        TRAIN_T1,
        TRAIN_T2,
        TRAIN_T3
    );

    -- Declare State
    signal state : TRAIN_STATE := TRAIN_T1;
    
    -- Declare Outputs
    signal gate_request_up : boolean := false;
    signal gate_request_down : boolean := false;
    signal position : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        -- State Variable
        variable state_update : TRAIN_STATE := TRAIN_T1;
        
        -- Outputs
        variable gate_request_up_update : boolean := false;
        variable gate_request_down_update : boolean := false;
        variable position_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Run the state machine for transition logic
            if  state = TRAIN_T1 then -- Logic for state t1
                if position = CREATE_FP(5.0) then
                    -- Perform Update Operations
                    gate_request_up_update := true;
                    gate_request_down_update := false;
                    
                    -- Next state is t2
                    state_update := TRAIN_T2;
                
                elsif position < CREATE_FP(5.0) then
                    -- Perform Flow Operations
                    position_update := position + FP_MULT(train_speed, step_size);
                    
                    -- Perform Saturation
                    if (position_update > CREATE_FP(5.0) and position < CREATE_FP(5.0)) or (position_update < CREATE_FP(5.0) and position > CREATE_FP(5.0)) then
                        -- Need to saturate position to CREATE_FP(5.0)
                        position_update := CREATE_FP(5.0);

                    end if;
                    
                end if;
            
            elsif  state = TRAIN_T2 then -- Logic for state t2
                if position = CREATE_FP(15.0) then
                    -- Perform Update Operations
                    gate_request_up_update := false;
                    gate_request_down_update := true;
                    
                    -- Next state is t3
                    state_update := TRAIN_T3;
                
                elsif position >= CREATE_FP(5.0) and position < CREATE_FP(15.0) then
                    -- Perform Flow Operations
                    position_update := position + FP_MULT(train_speed, step_size);
                    
                    -- Perform Saturation
                    if (position_update > CREATE_FP(15.0) and position < CREATE_FP(15.0)) or (position_update < CREATE_FP(15.0) and position > CREATE_FP(15.0)) then
                        -- Need to saturate position to CREATE_FP(15.0)
                        position_update := CREATE_FP(15.0);

                    end if;
                    
                end if;
            
            elsif  state = TRAIN_T3 then -- Logic for state t3
                if position = CREATE_FP(25.0) then
                    -- Perform Update Operations
                    position_update := CREATE_FP(0.0);
                    gate_request_up_update := false;
                    gate_request_down_update := false;
                    
                    -- Next state is t1
                    state_update := TRAIN_T1;
                
                elsif position >= CREATE_FP(15.0) and position < CREATE_FP(25.0) then
                    -- Perform Flow Operations
                    position_update := position + FP_MULT(train_speed, step_size);
                    
                    -- Perform Saturation
                    if (position_update > CREATE_FP(25.0) and position < CREATE_FP(25.0)) or (position_update < CREATE_FP(25.0) and position > CREATE_FP(25.0)) then
                        -- Need to saturate position to CREATE_FP(25.0)
                        position_update := CREATE_FP(25.0);

                    end if;
                    
                end if;

            end if;

            -- Map State
            state <= state_update;
            
            -- Map Outputs
            gate_request_up_out <= gate_request_up_update;
            gate_request_up <= gate_request_up_update;
            gate_request_down_out <= gate_request_down_update;
            gate_request_down <= gate_request_down_update;
            position_out <= position_update;
            position <= position_update;

        end if;
    end process;
end architecture;