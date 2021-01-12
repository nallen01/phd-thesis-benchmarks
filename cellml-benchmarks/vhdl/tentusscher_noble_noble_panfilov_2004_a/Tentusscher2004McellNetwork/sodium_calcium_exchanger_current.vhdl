library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity SodiumCalciumExchangerCurrent is
    generic(
        k_naca : signed(31 downto 0) := CREATE_FP(1000.0);
        k_sat : signed(31 downto 0) := CREATE_FP(0.1);
        alpha : signed(31 downto 0) := CREATE_FP(2.5);
        gamma : signed(31 downto 0) := CREATE_FP(0.35);
        km_ca : signed(31 downto 0) := CREATE_FP(1.38);
        km_nai : signed(31 downto 0) := CREATE_FP(87.5)
    );

    port (
        clk : in std_logic;
        
        -- Declare Inputs
        na_i_in : in signed(31 downto 0);
        na_o_in : in signed(31 downto 0);
        ca_i_in : in signed(31 downto 0);
        ca_o_in : in signed(31 downto 0);
        r_in : in signed(31 downto 0);
        f_in : in signed(31 downto 0);
        t_in : in signed(31 downto 0);
        v_in : in signed(31 downto 0);
        time_in : in signed(31 downto 0);
        
        -- Declare Outputs
        i_naca_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of SodiumCalciumExchangerCurrent is
    
    -- Declare Outputs
    signal i_naca : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable i_naca_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Update Operations
            i_naca_update := FP_DIV((FP_MULT(k_naca, (FP_MULT(FP_MULT(FP_EXP((FP_DIV((FP_MULT(FP_MULT(gamma, v_in), f_in)), (FP_MULT(r_in, t_in))))), (FP_POWER(na_i_in, CREATE_FP(3.0)))), ca_o_in) - FP_MULT(FP_MULT(FP_MULT(FP_EXP((FP_DIV((FP_MULT(FP_MULT((gamma - CREATE_FP(1.0)), v_in), f_in)), (FP_MULT(r_in, t_in))))), (FP_POWER(na_o_in, CREATE_FP(3.0)))), ca_i_in), alpha)))), (FP_MULT(FP_MULT((FP_POWER(km_nai, CREATE_FP(3.0)) + FP_POWER(na_o_in, CREATE_FP(3.0))), (km_ca + ca_o_in)), (CREATE_FP(1.0) + FP_MULT(k_sat, FP_EXP((FP_DIV((FP_MULT(FP_MULT((gamma - CREATE_FP(1.0)), v_in), f_in)), (FP_MULT(r_in, t_in))))))))));
            
            
            -- Map Outputs
            i_naca_out <= i_naca_update;
            i_naca <= i_naca_update;

        end if;
    end process;
end architecture;