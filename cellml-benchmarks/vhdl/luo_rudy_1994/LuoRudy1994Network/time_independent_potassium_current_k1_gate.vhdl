library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity TimeIndependentPotassiumCurrentK1Gate is
    port (
        clk : in std_logic;
        
        -- Declare Inputs
        v_in : in signed(31 downto 0);
        time_in : in signed(31 downto 0);
        e_k1_in : in signed(31 downto 0);
        
        -- Declare Outputs
        k1_infinity_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of TimeIndependentPotassiumCurrentK1Gate is
    
    -- Declare Outputs
    signal k1_infinity : signed(31 downto 0) := CREATE_FP(0.0);
    
    -- Declare Internal Variables
    signal alpha_k1 : signed(31 downto 0) := CREATE_FP(0.0);
    signal beta_k1 : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable k1_infinity_update : signed(31 downto 0) := CREATE_FP(0.0);
        
        -- Internal Variables
        variable alpha_k1_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable beta_k1_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Update Operations
            alpha_k1_update := FP_DIV(CREATE_FP(1.02), (CREATE_FP(1.0) + FP_EXP(FP_MULT(CREATE_FP(0.2385), ((v_in - e_k1_in) - CREATE_FP(59.215))))));
            beta_k1_update := FP_DIV((FP_MULT(CREATE_FP(0.49124), FP_EXP(FP_MULT(CREATE_FP(0.08032), ((v_in + CREATE_FP(5.476)) - e_k1_in)))) + FP_MULT(CREATE_FP(1.0), FP_EXP(FP_MULT(CREATE_FP(0.06175), (v_in - (e_k1_in + CREATE_FP(594.31))))))), (CREATE_FP(1.0) + FP_EXP(FP_MULT(CREATE_FP(-0.5143), ((v_in - e_k1_in) + CREATE_FP(4.753))))));
            k1_infinity_update := FP_DIV(alpha_k1, (alpha_k1 + beta_k1));
            
            
            -- Map Outputs
            k1_infinity_out <= k1_infinity_update;
            k1_infinity <= k1_infinity_update;
            
            -- Map Internal Variables
            alpha_k1 <= alpha_k1_update;
            beta_k1 <= beta_k1_update;

        end if;
    end process;
end architecture;