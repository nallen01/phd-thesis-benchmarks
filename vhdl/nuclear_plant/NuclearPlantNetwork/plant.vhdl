library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity Plant is
    port (
        clk : in std_logic;
        
        -- Declare Inputs
        add1_in : in boolean;
        remove1_in : in boolean;
        add2_in : in boolean;
        remove2_in : in boolean;
        
        -- Declare Outputs
        x_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of Plant is
    -- States
    type PLANT_STATE is (
        PLANT_P1,
        PLANT_P2,
        PLANT_P3
    );

    -- Declare State
    signal state : PLANT_STATE := PLANT_P1;
    
    -- Declare Outputs
    signal x : signed(31 downto 0) := CREATE_FP(510.0);
begin
    process(clk)
        -- State Variable
        variable state_update : PLANT_STATE := PLANT_P1;
        
        -- Outputs
        variable x_update : signed(31 downto 0) := CREATE_FP(510.0);


    begin
        if clk'event and clk = '1' then
            -- Run the state machine for transition logic
            if  state = PLANT_P1 then -- Logic for state p1
                if add1_in then
                    -- Perform Update Operations
                    x_update := CREATE_FP(550.0);
                    
                    -- Next state is p2
                    state_update := PLANT_P2;
            
                elsif add2_in then
                    -- Perform Update Operations
                    x_update := CREATE_FP(550.0);
                    
                    -- Next state is p3
                    state_update := PLANT_P3;
            
                elsif not add1_in and not add2_in then
                    -- Perform Flow Operations
                    x_update := x + FP_MULT((FP_MULT(CREATE_FP(0.1), x) - CREATE_FP(50.0)), step_size);
                    
            
                end if;
            elsif  state = PLANT_P2 then -- Logic for state p2
                if remove1_in then
                    -- Perform Update Operations
                    x_update := CREATE_FP(510.0);
                    
                    -- Next state is p1
                    state_update := PLANT_P1;
            
                elsif not remove1_in then
                    -- Perform Flow Operations
                    x_update := x + FP_MULT((FP_MULT(CREATE_FP(0.1), x) - CREATE_FP(56.0)), step_size);
                    
            
                end if;
            elsif  state = PLANT_P3 then -- Logic for state p3
                if remove2_in then
                    -- Perform Update Operations
                    x_update := CREATE_FP(510.0);
                    
                    -- Next state is p1
                    state_update := PLANT_P1;
            
                elsif not remove2_in then
                    -- Perform Flow Operations
                    x_update := x + FP_MULT((FP_MULT(CREATE_FP(0.1), x) - CREATE_FP(60.0)), step_size);
                    
            
                end if;
            end if;

            -- Map State
            state <= state_update;
            
            -- Map Outputs
            x_out <= x_update;
            x <= x_update;

        end if;
    end process;
end architecture;