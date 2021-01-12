library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity LTypeCaChannel is
    generic(
        p_ca : signed(31 downto 0) := CREATE_FP(5.4E-6);
        p_na : signed(31 downto 0) := CREATE_FP(6.75E-9);
        p_k : signed(31 downto 0) := CREATE_FP(1.93E-9);
        gamma_cai : signed(31 downto 0) := CREATE_FP(1.0);
        gamma_cao : signed(31 downto 0) := CREATE_FP(0.34)
    );

    port (
        clk : in std_logic;
        
        -- Declare Inputs
        time_in : in signed(31 downto 0);
        v_in : in signed(31 downto 0);
        cai_in : in signed(31 downto 0);
        r_in : in signed(31 downto 0);
        t_in : in signed(31 downto 0);
        f_in : in signed(31 downto 0);
        cao_in : in signed(31 downto 0);
        nao_in : in signed(31 downto 0);
        ko_in : in signed(31 downto 0);
        nai_in : in signed(31 downto 0);
        ki_in : in signed(31 downto 0);
        d_private_in : in signed(31 downto 0);
        f1_private_in : in signed(31 downto 0);
        f_ca_private_in : in signed(31 downto 0);
        
        -- Declare Outputs
        i_ca_l_out : out signed(31 downto 0);
        i_caca_out : out signed(31 downto 0);
        i_cak_out : out signed(31 downto 0);
        i_cana_out : out signed(31 downto 0);
        gamma_nai_out : out signed(31 downto 0);
        gamma_nao_out : out signed(31 downto 0);
        gamma_ki_out : out signed(31 downto 0);
        gamma_ko_out : out signed(31 downto 0);
        time_private_out : out signed(31 downto 0);
        v_private_out : out signed(31 downto 0);
        cai_private_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of LTypeCaChannel is
    
    -- Declare Outputs
    signal i_ca_l : signed(31 downto 0) := CREATE_FP(0.0);
    signal i_caca : signed(31 downto 0) := CREATE_FP(0.0);
    signal i_cak : signed(31 downto 0) := CREATE_FP(0.0);
    signal i_cana : signed(31 downto 0) := CREATE_FP(0.0);
    signal gamma_nai : signed(31 downto 0) := CREATE_FP(0.75);
    signal gamma_nao : signed(31 downto 0) := CREATE_FP(0.75);
    signal gamma_ki : signed(31 downto 0) := CREATE_FP(0.75);
    signal gamma_ko : signed(31 downto 0) := CREATE_FP(0.75);
    signal time_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal v_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal cai_private : signed(31 downto 0) := CREATE_FP(0.0);
    
    -- Declare Internal Variables
    signal i_caca1 : signed(31 downto 0) := CREATE_FP(0.0);
    signal i_cak1 : signed(31 downto 0) := CREATE_FP(0.0);
    signal i_cana1 : signed(31 downto 0) := CREATE_FP(0.0);
    signal d : signed(31 downto 0) := CREATE_FP(0.0);
    signal f1 : signed(31 downto 0) := CREATE_FP(0.0);
    signal f_ca : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable i_ca_l_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable i_caca_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable i_cak_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable i_cana_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable gamma_nai_update : signed(31 downto 0) := CREATE_FP(0.75);
        variable gamma_nao_update : signed(31 downto 0) := CREATE_FP(0.75);
        variable gamma_ki_update : signed(31 downto 0) := CREATE_FP(0.75);
        variable gamma_ko_update : signed(31 downto 0) := CREATE_FP(0.75);
        variable time_private_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable v_private_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable cai_private_update : signed(31 downto 0) := CREATE_FP(0.0);
        
        -- Internal Variables
        variable i_caca1_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable i_cak1_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable i_cana1_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable d_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable f1_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable f_ca_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Update Operations
            i_caca_update := FP_MULT(FP_MULT(FP_MULT(d, f1), f_ca), i_caca1);
            i_cana_update := FP_MULT(FP_MULT(FP_MULT(d, f1), f_ca), i_cana1);
            i_cak_update := FP_MULT(FP_MULT(FP_MULT(d, f1), f_ca), i_cak1);
            i_caca1_update := FP_MULT(FP_MULT(FP_MULT(FP_MULT(p_ca, (FP_POWER(CREATE_FP(2.0), CREATE_FP(2.0)))), (FP_DIV((FP_MULT(v_in, (FP_POWER(f_in, CREATE_FP(2.0))))), (FP_MULT(r_in, t_in))))), (FP_DIV((FP_MULT(FP_MULT(gamma_cai, cai_in), FP_EXP((FP_DIV((FP_MULT(FP_MULT(CREATE_FP(2.0), v_in), f_in)), (FP_MULT(r_in, t_in)))))) - FP_MULT(gamma_cao, cao_in)), (FP_EXP((FP_DIV((FP_MULT(FP_MULT(CREATE_FP(2.0), v_in), f_in)), (FP_MULT(r_in, t_in))))) - CREATE_FP(1.0))))), CREATE_FP(0.9999999999999999));
            i_cana1_update := FP_MULT(FP_MULT(FP_MULT(FP_MULT(p_na, (FP_POWER(CREATE_FP(1.0), CREATE_FP(2.0)))), (FP_DIV((FP_MULT(v_in, (FP_POWER(f_in, CREATE_FP(2.0))))), (FP_MULT(r_in, t_in))))), (FP_DIV((FP_MULT(FP_MULT(gamma_nai, nai_in), FP_EXP((FP_DIV((FP_MULT(FP_MULT(CREATE_FP(1.0), v_in), f_in)), (FP_MULT(r_in, t_in)))))) - FP_MULT(gamma_nao, nao_in)), (FP_EXP((FP_DIV((FP_MULT(FP_MULT(CREATE_FP(1.0), v_in), f_in)), (FP_MULT(r_in, t_in))))) - CREATE_FP(1.0))))), CREATE_FP(0.9999999999999999));
            i_cak1_update := FP_MULT(FP_MULT(FP_MULT(FP_MULT(p_k, (FP_POWER(CREATE_FP(1.0), CREATE_FP(2.0)))), (FP_DIV((FP_MULT(v_in, (FP_POWER(f_in, CREATE_FP(2.0))))), (FP_MULT(r_in, t_in))))), (FP_DIV((FP_MULT(FP_MULT(gamma_ki, ki_in), FP_EXP((FP_DIV((FP_MULT(FP_MULT(CREATE_FP(1.0), v_in), f_in)), (FP_MULT(r_in, t_in)))))) - FP_MULT(gamma_ko, ko_in)), (FP_EXP((FP_DIV((FP_MULT(FP_MULT(CREATE_FP(1.0), v_in), f_in)), (FP_MULT(r_in, t_in))))) - CREATE_FP(1.0))))), CREATE_FP(0.9999999999999999));
            i_ca_l_update := i_caca + i_cak + i_cana;
            time_private_update := time_in;
            v_private_update := v_in;
            cai_private_update := cai_in;
            d_update := d_private_in;
            f1_update := f1_private_in;
            f_ca_update := f_ca_private_in;
            
            
            -- Map Outputs
            i_ca_l_out <= i_ca_l_update;
            i_ca_l <= i_ca_l_update;
            i_caca_out <= i_caca_update;
            i_caca <= i_caca_update;
            i_cak_out <= i_cak_update;
            i_cak <= i_cak_update;
            i_cana_out <= i_cana_update;
            i_cana <= i_cana_update;
            gamma_nai_out <= gamma_nai_update;
            gamma_nai <= gamma_nai_update;
            gamma_nao_out <= gamma_nao_update;
            gamma_nao <= gamma_nao_update;
            gamma_ki_out <= gamma_ki_update;
            gamma_ki <= gamma_ki_update;
            gamma_ko_out <= gamma_ko_update;
            gamma_ko <= gamma_ko_update;
            time_private_out <= time_private_update;
            time_private <= time_private_update;
            v_private_out <= v_private_update;
            v_private <= v_private_update;
            cai_private_out <= cai_private_update;
            cai_private <= cai_private_update;
            
            -- Map Internal Variables
            i_caca1 <= i_caca1_update;
            i_cak1 <= i_cak1_update;
            i_cana1 <= i_cana1_update;
            d <= d_update;
            f1 <= f1_update;
            f_ca <= f_ca_update;

        end if;
    end process;
end architecture;