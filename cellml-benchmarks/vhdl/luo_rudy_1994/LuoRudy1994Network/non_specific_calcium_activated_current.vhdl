library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity NonSpecificCalciumActivatedCurrent is
    generic(
        p_ns_ca : signed(31 downto 0) := CREATE_FP(1.75E-9);
        k_m_ns_ca : signed(31 downto 0) := CREATE_FP(0.0012)
    );

    port (
        clk : in std_logic;
        
        -- Declare Inputs
        gamma_nai_in : in signed(31 downto 0);
        gamma_nao_in : in signed(31 downto 0);
        gamma_ki_in : in signed(31 downto 0);
        gamma_ko_in : in signed(31 downto 0);
        r_in : in signed(31 downto 0);
        t_in : in signed(31 downto 0);
        f_in : in signed(31 downto 0);
        cao_in : in signed(31 downto 0);
        nao_in : in signed(31 downto 0);
        ko_in : in signed(31 downto 0);
        nai_in : in signed(31 downto 0);
        ki_in : in signed(31 downto 0);
        time_in : in signed(31 downto 0);
        cai_in : in signed(31 downto 0);
        v_in : in signed(31 downto 0);
        
        -- Declare Outputs
        i_ns_ca_out : out signed(31 downto 0);
        i_ns_na_out : out signed(31 downto 0);
        i_ns_k_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of NonSpecificCalciumActivatedCurrent is
    
    -- Declare Outputs
    signal i_ns_ca : signed(31 downto 0) := CREATE_FP(0.0);
    signal i_ns_na : signed(31 downto 0) := CREATE_FP(0.0);
    signal i_ns_k : signed(31 downto 0) := CREATE_FP(0.0);
    
    -- Declare Internal Variables
    signal i_ns_na1 : signed(31 downto 0) := CREATE_FP(0.0);
    signal i_ns_k1 : signed(31 downto 0) := CREATE_FP(0.0);
    signal vns : signed(31 downto 0) := CREATE_FP(0.0);
    signal ens_ca : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable i_ns_ca_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable i_ns_na_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable i_ns_k_update : signed(31 downto 0) := CREATE_FP(0.0);
        
        -- Internal Variables
        variable i_ns_na1_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable i_ns_k1_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable vns_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable ens_ca_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Update Operations
            ens_ca_update := FP_MULT(FP_MULT((FP_DIV((FP_MULT(r_in, t_in)), f_in)), FP_LOG((FP_DIV((ko_in + nao_in), (ki_in + nai_in))))), CREATE_FP(0.9999999999999998));
            vns_update := v_in - ens_ca;
            i_ns_na_update := FP_MULT(i_ns_na1, (FP_DIV(CREATE_FP(1.0), (CREATE_FP(1.0) + FP_POWER((FP_DIV(k_m_ns_ca, cai_in)), CREATE_FP(3.0))))));
            i_ns_k_update := FP_MULT(i_ns_k1, (FP_DIV(CREATE_FP(1.0), (CREATE_FP(1.0) + FP_POWER((FP_DIV(k_m_ns_ca, cai_in)), CREATE_FP(3.0))))));
            i_ns_ca_update := i_ns_na + i_ns_k;
            i_ns_na1_update := FP_MULT(FP_MULT(FP_MULT(FP_MULT(p_ns_ca, (FP_POWER(CREATE_FP(1.0), CREATE_FP(2.0)))), (FP_DIV((FP_MULT(vns, (FP_POWER(f_in, CREATE_FP(2.0))))), (FP_MULT(r_in, t_in))))), (FP_DIV((FP_MULT(FP_MULT(gamma_nai_in, nai_in), FP_EXP((FP_DIV((FP_MULT(FP_MULT(CREATE_FP(1.0), vns), f_in)), (FP_MULT(r_in, t_in)))))) - FP_MULT(gamma_nao_in, nao_in)), (FP_EXP((FP_DIV((FP_MULT(FP_MULT(CREATE_FP(1.0), vns), f_in)), (FP_MULT(r_in, t_in))))) - CREATE_FP(1.0))))), CREATE_FP(0.9999999999999999));
            i_ns_k1_update := FP_MULT(FP_MULT(FP_MULT(FP_MULT(p_ns_ca, (FP_POWER(CREATE_FP(1.0), CREATE_FP(2.0)))), (FP_DIV((FP_MULT(vns, (FP_POWER(f_in, CREATE_FP(2.0))))), (FP_MULT(r_in, t_in))))), (FP_DIV((FP_MULT(FP_MULT(gamma_ki_in, ki_in), FP_EXP((FP_DIV((FP_MULT(FP_MULT(CREATE_FP(1.0), vns), f_in)), (FP_MULT(r_in, t_in)))))) - FP_MULT(gamma_ko_in, ko_in)), (FP_EXP((FP_DIV((FP_MULT(FP_MULT(CREATE_FP(1.0), vns), f_in)), (FP_MULT(r_in, t_in))))) - CREATE_FP(1.0))))), CREATE_FP(0.9999999999999999));
            
            
            -- Map Outputs
            i_ns_ca_out <= i_ns_ca_update;
            i_ns_ca <= i_ns_ca_update;
            i_ns_na_out <= i_ns_na_update;
            i_ns_na <= i_ns_na_update;
            i_ns_k_out <= i_ns_k_update;
            i_ns_k <= i_ns_k_update;
            
            -- Map Internal Variables
            i_ns_na1 <= i_ns_na1_update;
            i_ns_k1 <= i_ns_k1_update;
            vns <= vns_update;
            ens_ca <= ens_ca_update;

        end if;
    end process;
end architecture;