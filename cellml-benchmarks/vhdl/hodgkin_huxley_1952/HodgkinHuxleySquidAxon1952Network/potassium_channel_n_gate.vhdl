library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity PotassiumChannelNGate is
    port (
        clk : in std_logic;
        
        -- Declare Inputs
        v_in : in signed(31 downto 0);
        time_in : in signed(31 downto 0);
        
        -- Declare Outputs
        n_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of PotassiumChannelNGate is
    
    -- Declare Outputs
    signal n : signed(31 downto 0) := CREATE_FP(0.325);
    
    -- Declare Internal Variables
    signal alpha_n : signed(31 downto 0) := CREATE_FP(0.0);
    signal beta_n : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable n_update : signed(31 downto 0) := CREATE_FP(0.325);
        
        -- Internal Variables
        variable alpha_n_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable beta_n_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Flow Operations
            n_update := n + FP_MULT((FP_MULT(alpha_n, (CREATE_FP(1.0) - n)) - FP_MULT(beta_n, n)), step_size);
            
            -- Perform Update Operations
            alpha_n_update := FP_DIV((FP_MULT(CREATE_FP(-0.01), (v_in + CREATE_FP(65.0)))), (FP_EXP((FP_DIV(-(v_in + CREATE_FP(65.0)), CREATE_FP(10.0)))) - CREATE_FP(1.0)));
            beta_n_update := FP_MULT(CREATE_FP(0.125), FP_EXP((FP_DIV((v_in + CREATE_FP(75.0)), CREATE_FP(80.0)))));
            
            
            -- Map Outputs
            n_out <= n_update;
            n <= n_update;
            
            -- Map Internal Variables
            alpha_n <= alpha_n_update;
            beta_n <= beta_n_update;

        end if;
    end process;
end architecture;