library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity NakPump is
    generic(
        body_temp : signed(31 downto 0) := CREATE_FP(310.0);
        gas_const : signed(31 downto 0) := CREATE_FP(8.314);
        faraday_const : signed(31 downto 0) := CREATE_FP(96485.0);
        k1 : signed(31 downto 0) := CREATE_FP(1050.0);
        minus_k1 : signed(31 downto 0) := CREATE_FP(172.1);
        k2 : signed(31 downto 0) := CREATE_FP(481.0);
        minus_k2 : signed(31 downto 0) := CREATE_FP(40.1);
        k3 : signed(31 downto 0) := CREATE_FP(2000.0);
        minus_k3 : signed(31 downto 0) := CREATE_FP(79287.1);
        k4 : signed(31 downto 0) := CREATE_FP(320.0);
        minus_k4 : signed(31 downto 0) := CREATE_FP(40.1);
        eq_na_base_e : signed(31 downto 0) := CREATE_FP(15.5);
        eq_na_base_i : signed(31 downto 0) := CREATE_FP(2.49);
        eq_k_e : signed(31 downto 0) := CREATE_FP(0.213);
        eq_k_i : signed(31 downto 0) := CREATE_FP(0.5);
        eq_mgatp : signed(31 downto 0) := CREATE_FP(2.51);
        eq_hpi : signed(31 downto 0) := CREATE_FP(1.69E-4);
        eq_kpi : signed(31 downto 0) := CREATE_FP(292.0);
        eq_napi : signed(31 downto 0) := CREATE_FP(224.0);
        cna_e : signed(31 downto 0) := CREATE_FP(150.0);
        ck_e : signed(31 downto 0) := CREATE_FP(5.4);
        ck_i : signed(31 downto 0) := CREATE_FP(140.0);
        c_mg_a_t_p : signed(31 downto 0) := CREATE_FP(9.8);
        cpi_sum : signed(31 downto 0) := CREATE_FP(4.2);
        c_h : signed(31 downto 0) := CREATE_FP(8.1283E-5);
        partition_factor : signed(31 downto 0) := CREATE_FP(-0.031288692380984445)
    );

    port (
        clk : in std_logic;
        
        -- Declare Inputs
        vm_in : in signed(31 downto 0);
        c_mg_a_d_p_in : in signed(31 downto 0);
        cna_i_in : in signed(31 downto 0);
        
        -- Declare Outputs
        body_temp_private_out : out signed(31 downto 0);
        gas_const_private_out : out signed(31 downto 0);
        faraday_const_private_out : out signed(31 downto 0);
        vm_private_out : out signed(31 downto 0);
        cmgadp_private_out : out signed(31 downto 0);
        cna_i_private_out : out signed(31 downto 0);
        v_cyc_out : out signed(31 downto 0);
        net_free_energy_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of NakPump is
    
    -- Declare Outputs
    signal body_temp_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal gas_const_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal faraday_const_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal vm_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal cmgadp_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal cna_i_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal v_cyc : signed(31 downto 0) := CREATE_FP(0.0);
    signal net_free_energy : signed(31 downto 0) := CREATE_FP(0.0);
    
    -- Declare Internal Variables
    signal dimless_na_e : signed(31 downto 0) := CREATE_FP(0.0);
    signal dimless_na_i : signed(31 downto 0) := CREATE_FP(0.0);
    signal dimless_k_e : signed(31 downto 0) := CREATE_FP(0.0);
    signal dimless_k_i : signed(31 downto 0) := CREATE_FP(0.0);
    signal dimless_mgatp : signed(31 downto 0) := CREATE_FP(0.0);
    signal alpha1 : signed(31 downto 0) := CREATE_FP(0.0);
    signal alpha2 : signed(31 downto 0) := CREATE_FP(0.0);
    signal alpha3 : signed(31 downto 0) := CREATE_FP(0.0);
    signal alpha4 : signed(31 downto 0) := CREATE_FP(0.0);
    signal minus_alpha1 : signed(31 downto 0) := CREATE_FP(0.0);
    signal minus_alpha2 : signed(31 downto 0) := CREATE_FP(0.0);
    signal minus_alpha3 : signed(31 downto 0) := CREATE_FP(0.0);
    signal minus_alpha4 : signed(31 downto 0) := CREATE_FP(0.0);
    signal c_pi : signed(31 downto 0) := CREATE_FP(0.0);
    signal dg_na : signed(31 downto 0) := CREATE_FP(0.0);
    signal dg_k : signed(31 downto 0) := CREATE_FP(0.0);
    signal dg_pump : signed(31 downto 0) := CREATE_FP(0.0);
    signal dg_atp : signed(31 downto 0) := CREATE_FP(0.0);
    signal diagram_sum : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable body_temp_private_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable gas_const_private_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable faraday_const_private_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable vm_private_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable cmgadp_private_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable cna_i_private_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable v_cyc_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable net_free_energy_update : signed(31 downto 0) := CREATE_FP(0.0);
        
        -- Internal Variables
        variable dimless_na_e_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable dimless_na_i_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable dimless_k_e_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable dimless_k_i_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable dimless_mgatp_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable alpha1_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable alpha2_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable alpha3_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable alpha4_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable minus_alpha1_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable minus_alpha2_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable minus_alpha3_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable minus_alpha4_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable c_pi_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable dg_na_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable dg_k_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable dg_pump_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable dg_atp_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable diagram_sum_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Update Operations
            c_pi_update := FP_DIV(cpi_sum, (CREATE_FP(1.0) + FP_DIV(ck_i, eq_kpi) + FP_DIV(c_h, eq_hpi) + FP_DIV(cna_i_in, eq_napi)));
            dg_na_update := FP_MULT(FP_MULT(gas_const, body_temp), FP_LOG((FP_DIV(cna_e, cna_i_in)))) - FP_MULT(FP_MULT(FP_MULT(faraday_const, CREATE_FP(0.001)), vm_in), CREATE_FP(0.001));
            dg_k_update := FP_MULT(FP_MULT(gas_const, body_temp), FP_LOG((FP_DIV(ck_i, ck_e)))) + FP_MULT(FP_MULT(FP_MULT(faraday_const, CREATE_FP(0.001)), vm_in), CREATE_FP(0.001));
            dg_pump_update := FP_MULT(CREATE_FP(2.0), dg_k) + FP_MULT(CREATE_FP(3.0), dg_na);
            dg_atp_update := CREATE_FP(-29600.0) - FP_MULT(FP_MULT(gas_const, body_temp), FP_LOG((FP_DIV(c_mg_a_t_p, (FP_MULT(FP_MULT(CREATE_FP(0.001), c_mg_a_d_p_in), c_pi))))));
            net_free_energy_update := dg_atp + dg_pump;
            dimless_na_i_update := FP_DIV(cna_i_in, (FP_MULT(eq_na_base_i, FP_EXP((FP_DIV((FP_MULT(FP_MULT(FP_MULT(partition_factor, faraday_const), CREATE_FP(0.001)), vm_in)), (FP_MULT(FP_MULT(CREATE_FP(3.0), gas_const), body_temp))))))));
            dimless_na_e_update := FP_DIV(cna_e, (FP_MULT(eq_na_base_e, FP_EXP((FP_DIV((FP_MULT(FP_MULT(FP_MULT((CREATE_FP(1.0) + partition_factor), faraday_const), CREATE_FP(0.001)), vm_in)), (FP_MULT(FP_MULT(CREATE_FP(3.0), gas_const), body_temp))))))));
            dimless_k_i_update := FP_DIV(ck_i, eq_k_i);
            dimless_k_e_update := FP_DIV(ck_e, eq_k_e);
            dimless_mgatp_update := FP_DIV(c_mg_a_t_p, eq_mgatp);
            alpha1_update := FP_DIV((FP_MULT(k1, (FP_POWER(dimless_na_i, CREATE_FP(3.0))))), ((FP_POWER((CREATE_FP(1.0) + dimless_na_i), CREATE_FP(3.0)) + FP_POWER((CREATE_FP(1.0) + dimless_k_i), CREATE_FP(2.0))) - CREATE_FP(1.0)));
            alpha2_update := k2;
            alpha3_update := FP_DIV((FP_MULT(k3, (FP_POWER(dimless_k_e, CREATE_FP(2.0))))), ((FP_POWER((CREATE_FP(1.0) + dimless_na_e), CREATE_FP(3.0)) + FP_POWER((CREATE_FP(1.0) + dimless_k_e), CREATE_FP(2.0))) - CREATE_FP(1.0)));
            alpha4_update := FP_DIV((FP_MULT(k4, dimless_mgatp)), (CREATE_FP(1.0) + dimless_mgatp));
            minus_alpha1_update := FP_MULT(minus_k1, c_mg_a_d_p_in);
            minus_alpha2_update := FP_DIV((FP_MULT(minus_k2, (FP_POWER(dimless_na_e, CREATE_FP(3.0))))), ((FP_POWER((CREATE_FP(1.0) + dimless_na_e), CREATE_FP(3.0)) + FP_POWER((CREATE_FP(1.0) + dimless_k_e), CREATE_FP(2.0))) - CREATE_FP(1.0)));
            minus_alpha3_update := FP_MULT((FP_DIV((FP_MULT(FP_MULT(minus_k3, c_pi), c_h)), (CREATE_FP(1.0) + dimless_mgatp))), CREATE_FP(1.0000000000000002));
            minus_alpha4_update := FP_DIV((FP_MULT(minus_k4, (FP_POWER(dimless_k_i, CREATE_FP(2.0))))), ((FP_POWER((CREATE_FP(1.0) + dimless_na_i), CREATE_FP(3.0)) + FP_POWER((CREATE_FP(1.0) + dimless_k_i), CREATE_FP(2.0))) - CREATE_FP(1.0)));
            diagram_sum_update := FP_MULT(FP_MULT(minus_alpha3, minus_alpha2), minus_alpha1) + FP_MULT(FP_MULT(alpha4, minus_alpha2), minus_alpha1) + FP_MULT(FP_MULT(alpha4, alpha2), alpha3) + FP_MULT(FP_MULT(alpha4, minus_alpha1), alpha3) + FP_MULT(FP_MULT(minus_alpha3, minus_alpha2), alpha1) + FP_MULT(FP_MULT(alpha4, minus_alpha2), alpha1) + FP_MULT(FP_MULT(alpha4, alpha1), alpha3) + FP_MULT(FP_MULT(minus_alpha3, alpha1), alpha2) + FP_MULT(FP_MULT(alpha4, alpha1), alpha2) + FP_MULT(FP_MULT(alpha1, alpha2), alpha3) + FP_MULT(FP_MULT(minus_alpha4, minus_alpha3), minus_alpha1) + FP_MULT(FP_MULT(minus_alpha4, minus_alpha3), alpha2) + FP_MULT(FP_MULT(minus_alpha4, minus_alpha3), minus_alpha2) + FP_MULT(FP_MULT(minus_alpha4, minus_alpha1), minus_alpha2) + FP_MULT(FP_MULT(minus_alpha4, alpha2), alpha3) + FP_MULT(FP_MULT(minus_alpha4, minus_alpha1), alpha3);
            v_cyc_update := FP_DIV((FP_MULT(FP_MULT(FP_MULT(alpha1, alpha2), alpha3), alpha4) - FP_MULT(FP_MULT(FP_MULT(minus_alpha1, minus_alpha2), minus_alpha3), minus_alpha4)), diagram_sum);
            body_temp_private_update := body_temp;
            gas_const_private_update := gas_const;
            faraday_const_private_update := faraday_const;
            vm_private_update := vm_in;
            cmgadp_private_update := c_mg_a_d_p_in;
            cna_i_private_update := cna_i_in;
            
            
            -- Map Outputs
            body_temp_private_out <= body_temp_private_update;
            body_temp_private <= body_temp_private_update;
            gas_const_private_out <= gas_const_private_update;
            gas_const_private <= gas_const_private_update;
            faraday_const_private_out <= faraday_const_private_update;
            faraday_const_private <= faraday_const_private_update;
            vm_private_out <= vm_private_update;
            vm_private <= vm_private_update;
            cmgadp_private_out <= cmgadp_private_update;
            cmgadp_private <= cmgadp_private_update;
            cna_i_private_out <= cna_i_private_update;
            cna_i_private <= cna_i_private_update;
            v_cyc_out <= v_cyc_update;
            v_cyc <= v_cyc_update;
            net_free_energy_out <= net_free_energy_update;
            net_free_energy <= net_free_energy_update;
            
            -- Map Internal Variables
            dimless_na_e <= dimless_na_e_update;
            dimless_na_i <= dimless_na_i_update;
            dimless_k_e <= dimless_k_e_update;
            dimless_k_i <= dimless_k_i_update;
            dimless_mgatp <= dimless_mgatp_update;
            alpha1 <= alpha1_update;
            alpha2 <= alpha2_update;
            alpha3 <= alpha3_update;
            alpha4 <= alpha4_update;
            minus_alpha1 <= minus_alpha1_update;
            minus_alpha2 <= minus_alpha2_update;
            minus_alpha3 <= minus_alpha3_update;
            minus_alpha4 <= minus_alpha4_update;
            c_pi <= c_pi_update;
            dg_na <= dg_na_update;
            dg_k <= dg_k_update;
            dg_pump <= dg_pump_update;
            dg_atp <= dg_atp_update;
            diagram_sum <= diagram_sum_update;

        end if;
    end process;
end architecture;