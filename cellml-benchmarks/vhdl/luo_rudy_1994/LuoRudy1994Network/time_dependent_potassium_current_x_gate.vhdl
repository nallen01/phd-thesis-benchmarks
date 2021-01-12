library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity TimeDependentPotassiumCurrentXGate is
    port (
        clk : in std_logic;
        
        -- Declare Inputs
        v_in : in signed(31 downto 0);
        time_in : in signed(31 downto 0);
        
        -- Declare Outputs
        x_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of TimeDependentPotassiumCurrentXGate is
    
    -- Declare Outputs
    signal x : signed(31 downto 0) := CREATE_FP(0.0);
    
    -- Declare Internal Variables
    signal alpha_x : signed(31 downto 0) := CREATE_FP(0.0);
    signal beta_x : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable x_update : signed(31 downto 0) := CREATE_FP(0.0);
        
        -- Internal Variables
        variable alpha_x_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable beta_x_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Flow Operations
            x_update := x + FP_MULT((FP_MULT(alpha_x, (CREATE_FP(1.0) - x)) - FP_MULT(beta_x, x)), step_size);
            
            -- Perform Update Operations
            alpha_x_update := FP_DIV((FP_MULT(CREATE_FP(7.19E-5), (v_in + CREATE_FP(30.0)))), (CREATE_FP(1.0) - FP_EXP(FP_MULT(CREATE_FP(-0.148), (v_in + CREATE_FP(30.0))))));
            beta_x_update := FP_DIV((FP_MULT(CREATE_FP(1.31E-4), (v_in + CREATE_FP(30.0)))), (CREATE_FP(-1.0) + FP_EXP(FP_MULT(CREATE_FP(0.0687), (v_in + CREATE_FP(30.0))))));
            
            
            -- Map Outputs
            x_out <= x_update;
            x <= x_update;
            
            -- Map Internal Variables
            alpha_x <= alpha_x_update;
            beta_x <= beta_x_update;

        end if;
    end process;
end architecture;