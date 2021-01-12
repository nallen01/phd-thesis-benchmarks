library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity LTypeCaChannelFGate is
    port (
        clk : in std_logic;
        
        -- Declare Inputs
        v_in : in signed(31 downto 0);
        time_in : in signed(31 downto 0);
        
        -- Declare Outputs
        f_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of LTypeCaChannelFGate is
    
    -- Declare Outputs
    signal f : signed(31 downto 0) := CREATE_FP(1.0);
    
    -- Declare Internal Variables
    signal alpha_f : signed(31 downto 0) := CREATE_FP(0.0);
    signal beta_f : signed(31 downto 0) := CREATE_FP(0.0);
    signal f_infinity : signed(31 downto 0) := CREATE_FP(0.0);
    signal tau_f : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable f_update : signed(31 downto 0) := CREATE_FP(1.0);
        
        -- Internal Variables
        variable alpha_f_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable beta_f_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable f_infinity_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable tau_f_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Flow Operations
            f_update := f + FP_MULT((FP_MULT(alpha_f, (CREATE_FP(1.0) - f)) - FP_MULT(beta_f, f)), step_size);
            
            -- Perform Update Operations
            alpha_f_update := FP_DIV(f_infinity, tau_f);
            f_infinity_update := FP_DIV(CREATE_FP(1.0), (CREATE_FP(1.0) + FP_EXP((FP_DIV((v_in + CREATE_FP(35.06)), CREATE_FP(8.6)))))) + FP_DIV(CREATE_FP(0.6), (CREATE_FP(1.0) + FP_EXP((FP_DIV((CREATE_FP(50.0) - v_in), CREATE_FP(20.0))))));
            tau_f_update := FP_DIV(CREATE_FP(1.0), (FP_MULT(CREATE_FP(0.0197), FP_EXP(-(FP_POWER((FP_MULT(CREATE_FP(0.0337), (v_in + CREATE_FP(10.0)))), CREATE_FP(2.0))))) + CREATE_FP(0.02)));
            beta_f_update := FP_DIV((CREATE_FP(1.0) - f_infinity), tau_f);
            
            
            -- Map Outputs
            f_out <= f_update;
            f <= f_update;
            
            -- Map Internal Variables
            alpha_f <= alpha_f_update;
            beta_f <= beta_f_update;
            f_infinity <= f_infinity_update;
            tau_f <= tau_f_update;

        end if;
    end process;
end architecture;