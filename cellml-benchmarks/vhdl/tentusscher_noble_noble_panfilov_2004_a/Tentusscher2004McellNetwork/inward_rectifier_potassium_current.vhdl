library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity InwardRectifierPotassiumCurrent is
    generic(
        g_k1 : signed(31 downto 0) := CREATE_FP(5.405)
    );

    port (
        clk : in std_logic;
        
        -- Declare Inputs
        v_in : in signed(31 downto 0);
        k_o_in : in signed(31 downto 0);
        e_k_in : in signed(31 downto 0);
        time_in : in signed(31 downto 0);
        
        -- Declare Outputs
        i_k1_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of InwardRectifierPotassiumCurrent is
    
    -- Declare Outputs
    signal i_k1 : signed(31 downto 0) := CREATE_FP(0.0);
    
    -- Declare Internal Variables
    signal xk1_inf : signed(31 downto 0) := CREATE_FP(0.0);
    signal alpha_k1 : signed(31 downto 0) := CREATE_FP(0.0);
    signal beta_k1 : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable i_k1_update : signed(31 downto 0) := CREATE_FP(0.0);
        
        -- Internal Variables
        variable xk1_inf_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable alpha_k1_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable beta_k1_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Update Operations
            alpha_k1_update := FP_DIV(CREATE_FP(0.1), (CREATE_FP(1.0) + FP_EXP(FP_MULT(CREATE_FP(0.06), ((v_in - e_k_in) - CREATE_FP(200.0))))));
            beta_k1_update := FP_DIV((FP_MULT(CREATE_FP(3.0), FP_EXP(FP_MULT(CREATE_FP(2.0E-4), ((v_in - e_k_in) + CREATE_FP(100.0))))) + FP_EXP(FP_MULT(CREATE_FP(0.1), ((v_in - e_k_in) - CREATE_FP(10.0))))), (CREATE_FP(1.0) + FP_EXP(FP_MULT(CREATE_FP(-0.5), (v_in - e_k_in)))));
            xk1_inf_update := FP_DIV(alpha_k1, (alpha_k1 + beta_k1));
            i_k1_update := FP_MULT(FP_MULT(FP_MULT(FP_MULT(g_k1, xk1_inf), FP_SQRT((FP_DIV(k_o_in, CREATE_FP(5.4))))), (v_in - e_k_in)), CREATE_FP(1.0000000000000002));
            
            
            -- Map Outputs
            i_k1_out <= i_k1_update;
            i_k1 <= i_k1_update;
            
            -- Map Internal Variables
            xk1_inf <= xk1_inf_update;
            alpha_k1 <= alpha_k1_update;
            beta_k1 <= beta_k1_update;

        end if;
    end process;
end architecture;