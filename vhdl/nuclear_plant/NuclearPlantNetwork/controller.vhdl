library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity Controller is
    port (
        clk : in std_logic;
        
        -- Declare Inputs
        x_in : in signed(31 downto 0);
        
        -- Declare Outputs
        add1_out : out boolean;
        remove1_out : out boolean;
        add2_out : out boolean;
        remove2_out : out boolean

    );
end;

-- Architecture
architecture behavior of Controller is
    -- States
    type CONTROLLER_STATE is (
        CONTROLLER_C1,
        CONTROLLER_C2,
        CONTROLLER_C3
    );

    -- Declare State
    signal state : CONTROLLER_STATE := CONTROLLER_C1;
    
    -- Declare Outputs
    signal add1 : boolean := false;
    signal remove1 : boolean := false;
    signal add2 : boolean := false;
    signal remove2 : boolean := false;
    
    -- Declare Internal Variables
    signal y1 : signed(31 downto 0) := CREATE_FP(0.0);
    signal y2 : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        -- State Variable
        variable state_update : CONTROLLER_STATE := CONTROLLER_C1;
        
        -- Outputs
        variable add1_update : boolean := false;
        variable remove1_update : boolean := false;
        variable add2_update : boolean := false;
        variable remove2_update : boolean := false;
        
        -- Internal Variables
        variable y1_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable y2_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Run the state machine for transition logic
            if  state = CONTROLLER_C1 then -- Logic for state c1
                if x_in > CREATE_FP(550.0) and y1 >= CREATE_FP(15.0) and y2 < CREATE_FP(15.0) then
                    -- Perform Update Operations
                    add1_update := true;
                    remove1_update := false;
                    add2_update := false;
                    remove2_update := false;
                    
                    -- Next state is c2
                    state_update := CONTROLLER_C2;
            
                elsif x_in > CREATE_FP(550.0) and y2 >= CREATE_FP(15.0) then
                    -- Perform Update Operations
                    add1_update := false;
                    remove1_update := false;
                    add2_update := true;
                    remove2_update := false;
                    
                    -- Next state is c3
                    state_update := CONTROLLER_C3;
            
                elsif x_in <= CREATE_FP(550.0) or (y1 < CREATE_FP(15.0) and y2 < CREATE_FP(15.0)) then
                    -- Perform Flow Operations
                    y1_update := y1 + FP_MULT(CREATE_FP(1.0), step_size);
                    y2_update := y2 + FP_MULT(CREATE_FP(1.0), step_size);
                    
            
                end if;
            elsif  state = CONTROLLER_C2 then -- Logic for state c2
                if x_in <= CREATE_FP(510.0) then
                    -- Perform Update Operations
                    add1_update := false;
                    remove1_update := true;
                    add2_update := false;
                    remove2_update := false;
                    y1_update := CREATE_FP(0.0);
                    
                    -- Next state is c1
                    state_update := CONTROLLER_C1;
            
                elsif x_in > CREATE_FP(510.0) then
                    -- Perform Flow Operations
                    y1_update := y1 + FP_MULT(CREATE_FP(1.0), step_size);
                    y2_update := y2 + FP_MULT(CREATE_FP(1.0), step_size);
                    
            
                end if;
            elsif  state = CONTROLLER_C3 then -- Logic for state c3
                if x_in <= CREATE_FP(510.0) then
                    -- Perform Update Operations
                    add1_update := false;
                    remove1_update := false;
                    add2_update := false;
                    remove2_update := true;
                    y2_update := CREATE_FP(0.0);
                    
                    -- Next state is c1
                    state_update := CONTROLLER_C1;
            
                elsif x_in > CREATE_FP(510.0) then
                    -- Perform Flow Operations
                    y1_update := y1 + FP_MULT(CREATE_FP(1.0), step_size);
                    y2_update := y2 + FP_MULT(CREATE_FP(1.0), step_size);
                    
            
                end if;
            end if;

            -- Map State
            state <= state_update;
            
            -- Map Outputs
            add1_out <= add1_update;
            add1 <= add1_update;
            remove1_out <= remove1_update;
            remove1 <= remove1_update;
            add2_out <= add2_update;
            add2 <= add2_update;
            remove2_out <= remove2_update;
            remove2 <= remove2_update;
            
            -- Map Internal Variables
            y1 <= y1_update;
            y2 <= y2_update;

        end if;
    end process;
end architecture;