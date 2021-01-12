library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity Cell is
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

    port (
        clk : in std_logic;
        
        -- Declare Inputs
        g_in : in signed(31 downto 0);
        
        -- Declare Outputs
        v_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of Cell is
    -- States
    type CELL_STATE is (
        CELL_RP,
        CELL_ST,
        CELL_UP,
        CELL_ERP,
        CELL_RRP
    );

    -- Declare Custom Functions
    function F(theta: signed(31 downto 0))
            return signed is
        variable relative : signed(31 downto 0) := CREATE_FP(0.0);
    begin
        relative := FP_MULT(c5, theta);
        return c4 - relative;
    end F;

    -- Declare State
    signal state : CELL_STATE := CELL_RP;
    
    -- Declare Outputs
    signal v : signed(31 downto 0) := CREATE_FP(0.0);
    
    -- Declare Internal Variables
    signal theta : signed(31 downto 0) := CREATE_FP(0.0);
    signal t : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        -- State Variable
        variable state_update : CELL_STATE := CELL_RP;
        
        -- Outputs
        variable v_update : signed(31 downto 0) := CREATE_FP(0.0);
        
        -- Internal Variables
        variable theta_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable t_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Run the state machine for transition logic
            if  state = CELL_RP then -- Logic for state RP
                if g_in >= v_t then
                    -- Perform Update Operations
                    theta_update := FP_DIV(c3, t);
                    
                    -- Next state is ST
                    state_update := CELL_ST;
                
                elsif v = CREATE_FP(0.0) and g_in < v_t then
                    -- Perform Flow Operations
                    v_update := v + FP_MULT(CREATE_FP(0.0), step_size);
                    t_update := t + FP_MULT(CREATE_FP(1.0), step_size);
                    
                end if;
            
            elsif  state = CELL_ST then -- Logic for state ST
                if g_in <= CREATE_FP(0.0) and v < v_t then
                    -- Next state is RRP
                    state_update := CELL_RRP;
                
                elsif v >= v_t then
                    -- Next state is UP
                    state_update := CELL_UP;
                
                elsif v < v_t and g_in > CREATE_FP(0.0) then
                    -- Perform Flow Operations
                    v_update := v + FP_MULT(FP_MULT(c6, g_in), step_size);
                    t_update := t + FP_MULT(CREATE_FP(1.0), step_size);
                    
                    -- Perform Saturation
                    if v_update < v_t and v > v_t then
                        -- Need to saturate v to v_t
                        v_update := v_t;

                    end if;
                    
                end if;
            
            elsif  state = CELL_UP then -- Logic for state UP
                if v >= v_omax - FP_MULT(CREATE_FP(80.0), theta) then
                    -- Next state is ERP
                    state_update := CELL_ERP;
                
                elsif v < v_omax - FP_MULT(CREATE_FP(80.0), theta) then
                    -- Perform Flow Operations
                    v_update := v + FP_MULT(c1, step_size);
                    t_update := t + FP_MULT(CREATE_FP(1.0), step_size);
                    
                    -- Perform Saturation
                    if v_update < v_omax - FP_MULT(CREATE_FP(80.0), theta) and v > v_omax - FP_MULT(CREATE_FP(80.0), theta) then
                        -- Need to saturate v to v_omax - FP_MULT(CREATE_FP(80.0), theta)
                        v_update := v_omax - FP_MULT(CREATE_FP(80.0), theta);

                    end if;
                    
                end if;
            
            elsif  state = CELL_ERP then -- Logic for state ERP
                if v <= v_r then
                    -- Perform Update Operations
                    t_update := CREATE_FP(0.0);
                    
                    -- Next state is RRP
                    state_update := CELL_RRP;
                
                elsif v > v_r then
                    -- Perform Flow Operations
                    v_update := v + FP_MULT(F(theta), step_size);
                    t_update := t + FP_MULT(CREATE_FP(1.0), step_size);
                    
                    -- Perform Saturation
                    if v_update > v_r and v < v_r then
                        -- Need to saturate v to v_r
                        v_update := v_r;

                    end if;
                    
                end if;
            
            elsif  state = CELL_RRP then -- Logic for state RRP
                if g_in >= v_t then
                    -- Perform Update Operations
                    theta_update := FP_DIV(c3, t);
                    
                    -- Next state is ST
                    state_update := CELL_ST;
                
                elsif v > CREATE_FP(0.0) and g_in < v_t then
                    -- Perform Flow Operations
                    v_update := v + FP_MULT(c2, step_size);
                    t_update := t + FP_MULT(CREATE_FP(1.0), step_size);
                    
                end if;

            end if;

            -- Map State
            state <= state_update;
            
            -- Map Outputs
            v_out <= v_update;
            v <= v_update;
            
            -- Map Internal Variables
            theta <= theta_update;
            t <= t_update;

        end if;
    end process;
end architecture;