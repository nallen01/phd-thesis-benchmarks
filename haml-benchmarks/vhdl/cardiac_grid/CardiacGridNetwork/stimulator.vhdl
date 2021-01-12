library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity Stimulator is
    generic(
        rate : signed(31 downto 0) := CREATE_FP(1.0);
        pulse_width : signed(31 downto 0) := CREATE_FP(0.01);
        amplitude : signed(31 downto 0) := CREATE_FP(131.1)
    );

    port (
        clk : in std_logic;
        
        -- Declare Outputs
        v_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of Stimulator is
    -- States
    type STIMULATOR_STATE is (
        STIMULATOR_COUNT,
        STIMULATOR_STIMULATE
    );

    -- Declare State
    signal state : STIMULATOR_STATE := STIMULATOR_COUNT;
    
    -- Declare Outputs
    signal v : signed(31 downto 0) := CREATE_FP(0.0);
    
    -- Declare Internal Variables
    signal t : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        -- State Variable
        variable state_update : STIMULATOR_STATE := STIMULATOR_COUNT;
        
        -- Outputs
        variable v_update : signed(31 downto 0) := CREATE_FP(0.0);
        
        -- Internal Variables
        variable t_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Run the state machine for transition logic
            if  state = STIMULATOR_COUNT then -- Logic for state count
                if t >= rate then
                    -- Perform Update Operations
                    t_update := CREATE_FP(0.0);
                    v_update := amplitude;
                    
                    -- Next state is stimulate
                    state_update := STIMULATOR_STIMULATE;
            
                elsif t < rate then
                    -- Perform Flow Operations
                    t_update := t + FP_MULT(CREATE_FP(1.0), step_size);
                    
            
                end if;
            elsif  state = STIMULATOR_STIMULATE then -- Logic for state stimulate
                if t >= pulse_width then
                    -- Perform Update Operations
                    t_update := CREATE_FP(0.0);
                    v_update := CREATE_FP(0.0);
                    
                    -- Next state is count
                    state_update := STIMULATOR_COUNT;
            
                elsif t < pulse_width then
                    -- Perform Flow Operations
                    t_update := t + FP_MULT(CREATE_FP(1.0), step_size);
                    
            
                end if;
            end if;

            -- Map State
            state <= state_update;
            
            -- Map Outputs
            v_out <= v_update;
            v <= v_update;
            
            -- Map Internal Variables
            t <= t_update;

        end if;
    end process;
end architecture;