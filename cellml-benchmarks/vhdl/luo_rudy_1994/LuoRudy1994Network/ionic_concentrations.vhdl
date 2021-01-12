library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity IonicConcentrations is
    generic(
        am : signed(31 downto 0) := CREATE_FP(200.0);
        v_myo : signed(31 downto 0) := CREATE_FP(0.68);
        v_jsr : signed(31 downto 0) := CREATE_FP(0.0048);
        v_nsr : signed(31 downto 0) := CREATE_FP(0.0552)
    );

    port (
        clk : in std_logic;
        
        -- Declare Inputs
        time_in : in signed(31 downto 0);
        f_in : in signed(31 downto 0);
        i_na_in : in signed(31 downto 0);
        i_cana_in : in signed(31 downto 0);
        i_na_b_in : in signed(31 downto 0);
        i_ns_na_in : in signed(31 downto 0);
        i_naca_in : in signed(31 downto 0);
        i_nak_in : in signed(31 downto 0);
        i_caca_in : in signed(31 downto 0);
        i_cak_in : in signed(31 downto 0);
        i_p_ca_in : in signed(31 downto 0);
        i_ca_b_in : in signed(31 downto 0);
        i_k_in : in signed(31 downto 0);
        i_k1_in : in signed(31 downto 0);
        i_kp_in : in signed(31 downto 0);
        i_ns_k_in : in signed(31 downto 0);
        i_tr_in : in signed(31 downto 0);
        i_rel_in : in signed(31 downto 0);
        i_leak_in : in signed(31 downto 0);
        i_up_in : in signed(31 downto 0);
        
        -- Declare Outputs
        nai_out : out signed(31 downto 0);
        nao_out : out signed(31 downto 0);
        cai_out : out signed(31 downto 0);
        cao_out : out signed(31 downto 0);
        ki_out : out signed(31 downto 0);
        ko_out : out signed(31 downto 0);
        ca_jsr_out : out signed(31 downto 0);
        ca_nsr_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of IonicConcentrations is
    
    -- Declare Outputs
    signal nai : signed(31 downto 0) := CREATE_FP(10.0);
    signal nao : signed(31 downto 0) := CREATE_FP(140.0);
    signal cai : signed(31 downto 0) := CREATE_FP(1.2E-4);
    signal cao : signed(31 downto 0) := CREATE_FP(1.8);
    signal ki : signed(31 downto 0) := CREATE_FP(145.0);
    signal ko : signed(31 downto 0) := CREATE_FP(5.4);
    signal ca_jsr : signed(31 downto 0) := CREATE_FP(1.8);
    signal ca_nsr : signed(31 downto 0) := CREATE_FP(1.8);
begin
    process(clk)
        
        -- Outputs
        variable nai_update : signed(31 downto 0) := CREATE_FP(10.0);
        variable nao_update : signed(31 downto 0) := CREATE_FP(140.0);
        variable cai_update : signed(31 downto 0) := CREATE_FP(1.2E-4);
        variable cao_update : signed(31 downto 0) := CREATE_FP(1.8);
        variable ki_update : signed(31 downto 0) := CREATE_FP(145.0);
        variable ko_update : signed(31 downto 0) := CREATE_FP(5.4);
        variable ca_jsr_update : signed(31 downto 0) := CREATE_FP(1.8);
        variable ca_nsr_update : signed(31 downto 0) := CREATE_FP(1.8);


    begin
        if clk'event and clk = '1' then
            -- Perform Flow Operations
            nai_update := nai + FP_MULT(FP_MULT(FP_MULT(-(i_na_in + i_cana_in + i_na_b_in + i_ns_na_in + FP_MULT(i_naca_in, CREATE_FP(3.0)) + FP_MULT(i_nak_in, CREATE_FP(3.0))), (FP_DIV(am, (FP_MULT(v_myo, f_in))))), CREATE_FP(1.0000000000000002)), step_size);
            cai_update := cai + FP_MULT(FP_MULT((FP_MULT(-((i_caca_in + i_p_ca_in + i_ca_b_in) - i_naca_in), (FP_DIV(am, (FP_MULT(FP_MULT(CREATE_FP(2.0), v_myo), f_in))))) + FP_MULT(FP_MULT(i_rel_in, (FP_DIV(v_jsr, v_myo))), CREATE_FP(0.9999999999999999)) + FP_MULT(FP_MULT((i_leak_in - i_up_in), (FP_DIV(v_nsr, v_myo))), CREATE_FP(0.9999999999999999))), CREATE_FP(1.0000000000000002)), step_size);
            ki_update := ki + FP_MULT(FP_MULT(FP_MULT(-(i_cak_in + i_k_in + i_k1_in + i_kp_in + i_ns_k_in + -(FP_MULT(i_nak_in, CREATE_FP(2.0)))), (FP_DIV(am, (FP_MULT(v_myo, f_in))))), CREATE_FP(1.0000000000000002)), step_size);
            ca_jsr_update := ca_jsr + FP_MULT(-(i_rel_in - FP_MULT(i_tr_in, (FP_DIV(v_nsr, v_jsr)))), step_size);
            ca_nsr_update := ca_nsr + FP_MULT(-((i_leak_in + i_tr_in) - i_up_in), step_size);
            
            
            -- Map Outputs
            nai_out <= nai_update;
            nai <= nai_update;
            nao_out <= nao_update;
            nao <= nao_update;
            cai_out <= cai_update;
            cai <= cai_update;
            cao_out <= cao_update;
            cao <= cao_update;
            ki_out <= ki_update;
            ki <= ki_update;
            ko_out <= ko_update;
            ko <= ko_update;
            ca_jsr_out <= ca_jsr_update;
            ca_jsr <= ca_jsr_update;
            ca_nsr_out <= ca_nsr_update;
            ca_nsr <= ca_nsr_update;

        end if;
    end process;
end architecture;