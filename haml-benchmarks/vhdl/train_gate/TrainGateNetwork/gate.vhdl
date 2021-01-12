library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity Gate is
    port (
        clk : in std_logic;
        
        -- Declare Inputs
        gate_request_up_in : in boolean;
        gate_request_down_in : in boolean;
        
        -- Declare Outputs
        position_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of Gate is
    -- States
    type GATE_STATE is (
        GATE_G1,
        GATE_G2
    );

    -- Declare State
    signal state : GATE_STATE := GATE_G1;
    
    -- Declare Outputs
    signal position : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        -- State Variable
        variable state_update : GATE_STATE := GATE_G1;
        
        -- Outputs
        variable position_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Run the state machine for transition logic
            if  state = GATE_G1 then -- Logic for state g1
                if gate_request_up_in then
                    -- Next state is g2
                    state_update := GATE_G2;
                
                elsif not gate_request_up_in then
                    -- Perform Flow Operations
                    position_update := position + FP_MULT((FP_DIV((CREATE_FP(0.0) - position), CREATE_FP(2.0))), step_size);
                    
                end if;
            
            elsif  state = GATE_G2 then -- Logic for state g2
                if gate_request_down_in then
                    -- Next state is g1
                    state_update := GATE_G1;
                
                elsif not gate_request_down_in then
                    -- Perform Flow Operations
                    position_update := position + FP_MULT((FP_DIV((CREATE_FP(11.0) - position), CREATE_FP(2.0))), step_size);
                    
                end if;

            end if;

            -- Map State
            state <= state_update;
            
            -- Map Outputs
            position_out <= position_update;
            position <= position_update;

        end if;
    end process;
end architecture;