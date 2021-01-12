library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.lib.all;

-- Entity
entity system is
    port (
        clk : in std_logic;
        
        -- Declare Outputs
        environment_time_out : out signed(31 downto 0);
        intracellular_ion_concentrations_ca_i_out : out signed(31 downto 0);
        intracellular_ion_concentrations_ca_b_out : out signed(31 downto 0);
        intracellular_ion_concentrations_trpn_out : out signed(31 downto 0);
        tropomyosin_z_out : out signed(31 downto 0);
        tropomyosin_z_max_out : out signed(31 downto 0);
        troponin_j_trpn_out : out signed(31 downto 0);
        troponin_ca_trpn_max_out : out signed(31 downto 0);
        troponin_k_on_out : out signed(31 downto 0);
        troponin_k_ref_off_out : out signed(31 downto 0);
        troponin_gamma_trpn_out : out signed(31 downto 0);
        myofilaments_lambda_out : out signed(31 downto 0);
        myofilaments_extensionratio_out : out signed(31 downto 0);
        myofilaments_dextensionratiodt_out : out signed(31 downto 0);
        myofilaments_lambda_prev_out : out signed(31 downto 0);
        filament_overlap_overlap_out : out signed(31 downto 0);
        filament_overlap_beta_0_out : out signed(31 downto 0);
        length_independent_tension_t_ref_out : out signed(31 downto 0);
        length_independent_tension_t_base_out : out signed(31 downto 0);
        isometric_tension_t_0_out : out signed(31 downto 0);
        cross_bridges_tension_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of system is
    -- Declare all internal signals
    signal niederer_2006_environment_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal niederer_2006_intracellular_ion_concentrations_ca_i : signed(31 downto 0) := CREATE_FP(0.0);
    signal niederer_2006_intracellular_ion_concentrations_ca_b : signed(31 downto 0) := CREATE_FP(0.0);
    signal niederer_2006_intracellular_ion_concentrations_trpn : signed(31 downto 0) := CREATE_FP(0.0);
    signal niederer_2006_tropomyosin_z : signed(31 downto 0) := CREATE_FP(0.0);
    signal niederer_2006_tropomyosin_z_max : signed(31 downto 0) := CREATE_FP(0.0);
    signal niederer_2006_troponin_j_trpn : signed(31 downto 0) := CREATE_FP(0.0);
    signal niederer_2006_troponin_ca_trpn_max : signed(31 downto 0) := CREATE_FP(0.0);
    signal niederer_2006_troponin_k_on : signed(31 downto 0) := CREATE_FP(0.0);
    signal niederer_2006_troponin_k_ref_off : signed(31 downto 0) := CREATE_FP(0.0);
    signal niederer_2006_troponin_gamma_trpn : signed(31 downto 0) := CREATE_FP(0.0);
    signal niederer_2006_myofilaments_lambda : signed(31 downto 0) := CREATE_FP(0.0);
    signal niederer_2006_myofilaments_extensionratio : signed(31 downto 0) := CREATE_FP(0.0);
    signal niederer_2006_myofilaments_dextensionratiodt : signed(31 downto 0) := CREATE_FP(0.0);
    signal niederer_2006_myofilaments_lambda_prev : signed(31 downto 0) := CREATE_FP(0.0);
    signal niederer_2006_filament_overlap_overlap : signed(31 downto 0) := CREATE_FP(0.0);
    signal niederer_2006_filament_overlap_beta_0 : signed(31 downto 0) := CREATE_FP(0.0);
    signal niederer_2006_length_independent_tension_t_ref : signed(31 downto 0) := CREATE_FP(0.0);
    signal niederer_2006_length_independent_tension_t_base : signed(31 downto 0) := CREATE_FP(0.0);
    signal niederer_2006_isometric_tension_t_0 : signed(31 downto 0) := CREATE_FP(0.0);
    signal niederer_2006_cross_bridges_tension : signed(31 downto 0) := CREATE_FP(0.0);


    -- Declare base component
    component Niederer2006 is
        port(
            clk : in std_logic;
            environment_time_out : out signed(31 downto 0);
            intracellular_ion_concentrations_ca_i_out : out signed(31 downto 0);
            intracellular_ion_concentrations_ca_b_out : out signed(31 downto 0);
            intracellular_ion_concentrations_trpn_out : out signed(31 downto 0);
            tropomyosin_z_out : out signed(31 downto 0);
            tropomyosin_z_max_out : out signed(31 downto 0);
            troponin_j_trpn_out : out signed(31 downto 0);
            troponin_ca_trpn_max_out : out signed(31 downto 0);
            troponin_k_on_out : out signed(31 downto 0);
            troponin_k_ref_off_out : out signed(31 downto 0);
            troponin_gamma_trpn_out : out signed(31 downto 0);
            myofilaments_lambda_out : out signed(31 downto 0);
            myofilaments_extensionratio_out : out signed(31 downto 0);
            myofilaments_dextensionratiodt_out : out signed(31 downto 0);
            myofilaments_lambda_prev_out : out signed(31 downto 0);
            filament_overlap_overlap_out : out signed(31 downto 0);
            filament_overlap_beta_0_out : out signed(31 downto 0);
            length_independent_tension_t_ref_out : out signed(31 downto 0);
            length_independent_tension_t_base_out : out signed(31 downto 0);
            isometric_tension_t_0_out : out signed(31 downto 0);
            cross_bridges_tension_out : out signed(31 downto 0)
        );
    end component Niederer2006;
begin
    -- Create base instance
    niederer_2006_inst : component Niederer2006
        port map(
            clk => clk,
            environment_time_out => niederer_2006_environment_time,
            intracellular_ion_concentrations_ca_i_out => niederer_2006_intracellular_ion_concentrations_ca_i,
            intracellular_ion_concentrations_ca_b_out => niederer_2006_intracellular_ion_concentrations_ca_b,
            intracellular_ion_concentrations_trpn_out => niederer_2006_intracellular_ion_concentrations_trpn,
            tropomyosin_z_out => niederer_2006_tropomyosin_z,
            tropomyosin_z_max_out => niederer_2006_tropomyosin_z_max,
            troponin_j_trpn_out => niederer_2006_troponin_j_trpn,
            troponin_ca_trpn_max_out => niederer_2006_troponin_ca_trpn_max,
            troponin_k_on_out => niederer_2006_troponin_k_on,
            troponin_k_ref_off_out => niederer_2006_troponin_k_ref_off,
            troponin_gamma_trpn_out => niederer_2006_troponin_gamma_trpn,
            myofilaments_lambda_out => niederer_2006_myofilaments_lambda,
            myofilaments_extensionratio_out => niederer_2006_myofilaments_extensionratio,
            myofilaments_dextensionratiodt_out => niederer_2006_myofilaments_dextensionratiodt,
            myofilaments_lambda_prev_out => niederer_2006_myofilaments_lambda_prev,
            filament_overlap_overlap_out => niederer_2006_filament_overlap_overlap,
            filament_overlap_beta_0_out => niederer_2006_filament_overlap_beta_0,
            length_independent_tension_t_ref_out => niederer_2006_length_independent_tension_t_ref,
            length_independent_tension_t_base_out => niederer_2006_length_independent_tension_t_base,
            isometric_tension_t_0_out => niederer_2006_isometric_tension_t_0,
            cross_bridges_tension_out => niederer_2006_cross_bridges_tension
        );

    -- Perform Mapping
    environment_time_out <= niederer_2006_environment_time;
    intracellular_ion_concentrations_ca_i_out <= niederer_2006_intracellular_ion_concentrations_ca_i;
    intracellular_ion_concentrations_ca_b_out <= niederer_2006_intracellular_ion_concentrations_ca_b;
    intracellular_ion_concentrations_trpn_out <= niederer_2006_intracellular_ion_concentrations_trpn;
    tropomyosin_z_out <= niederer_2006_tropomyosin_z;
    tropomyosin_z_max_out <= niederer_2006_tropomyosin_z_max;
    troponin_j_trpn_out <= niederer_2006_troponin_j_trpn;
    troponin_ca_trpn_max_out <= niederer_2006_troponin_ca_trpn_max;
    troponin_k_on_out <= niederer_2006_troponin_k_on;
    troponin_k_ref_off_out <= niederer_2006_troponin_k_ref_off;
    troponin_gamma_trpn_out <= niederer_2006_troponin_gamma_trpn;
    myofilaments_lambda_out <= niederer_2006_myofilaments_lambda;
    myofilaments_extensionratio_out <= niederer_2006_myofilaments_extensionratio;
    myofilaments_dextensionratiodt_out <= niederer_2006_myofilaments_dextensionratiodt;
    myofilaments_lambda_prev_out <= niederer_2006_myofilaments_lambda_prev;
    filament_overlap_overlap_out <= niederer_2006_filament_overlap_overlap;
    filament_overlap_beta_0_out <= niederer_2006_filament_overlap_beta_0;
    length_independent_tension_t_ref_out <= niederer_2006_length_independent_tension_t_ref;
    length_independent_tension_t_base_out <= niederer_2006_length_independent_tension_t_base;
    isometric_tension_t_0_out <= niederer_2006_isometric_tension_t_0;
    cross_bridges_tension_out <= niederer_2006_cross_bridges_tension;
end architecture;