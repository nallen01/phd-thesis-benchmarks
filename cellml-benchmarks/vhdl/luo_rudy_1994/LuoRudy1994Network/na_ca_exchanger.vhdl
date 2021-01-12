library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity NaCaExchanger is
    generic(
        k_naca : signed(31 downto 0) := CREATE_FP(20.0);
        k_mna : signed(31 downto 0) := CREATE_FP(87.5);
        k_mca : signed(31 downto 0) := CREATE_FP(1.38);
        k_sat : signed(31 downto 0) := CREATE_FP(0.1);
        eta : signed(31 downto 0) := CREATE_FP(0.35)
    );

    port (
        clk : in std_logic;
        
        -- Declare Inputs
        time_in : in signed(31 downto 0);
        v_in : in signed(31 downto 0);
        r_in : in signed(31 downto 0);
        t_in : in signed(31 downto 0);
        f_in : in signed(31 downto 0);
        nai_in : in signed(31 downto 0);
        nao_in : in signed(31 downto 0);
        cai_in : in signed(31 downto 0);
        cao_in : in signed(31 downto 0);
        
        -- Declare Outputs
        i_naca_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of NaCaExchanger is
    
    -- Declare Outputs
    signal i_naca : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable i_naca_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Update Operations
            i_naca_update := FP_MULT(FP_MULT(FP_MULT(FP_MULT(k_naca, (FP_DIV(CREATE_FP(1.0), (FP_POWER(k_mna, CREATE_FP(3.0)) + FP_POWER(nao_in, CREATE_FP(3.0)))))), (FP_DIV(CREATE_FP(1.0), (k_mca + cao_in)))), (FP_DIV(CREATE_FP(1.0), (CREATE_FP(1.0) + FP_MULT(k_sat, FP_EXP(FP_MULT(FP_MULT((eta - CREATE_FP(1.0)), v_in), (FP_DIV(f_in, (FP_MULT(r_in, t_in))))))))))), (FP_MULT(FP_MULT(FP_EXP(FP_MULT(FP_MULT(eta, v_in), (FP_DIV(f_in, (FP_MULT(r_in, t_in)))))), (FP_POWER(nai_in, CREATE_FP(3.0)))), cao_in) - FP_MULT(FP_MULT(FP_EXP(FP_MULT(FP_MULT((eta - CREATE_FP(1.0)), v_in), (FP_DIV(f_in, (FP_MULT(r_in, t_in)))))), (FP_POWER(nao_in, CREATE_FP(3.0)))), cai_in)));
            
            
            -- Map Outputs
            i_naca_out <= i_naca_update;
            i_naca <= i_naca_update;

        end if;
    end process;
end architecture;