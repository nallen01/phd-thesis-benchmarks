library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.lib.all;

-- Entity
entity Niederer2006 is
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
architecture behavior of Niederer2006 is
    -- Declare all internal signals
    signal environment_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal intracellular_ion_concentrations_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal intracellular_ion_concentrations_ca_trpn_max : signed(31 downto 0) := CREATE_FP(0.0);
    signal intracellular_ion_concentrations_j_trpn : signed(31 downto 0) := CREATE_FP(0.0);
    signal intracellular_ion_concentrations_ca_i : signed(31 downto 0) := CREATE_FP(0.0);
    signal intracellular_ion_concentrations_ca_b : signed(31 downto 0) := CREATE_FP(0.0);
    signal intracellular_ion_concentrations_trpn : signed(31 downto 0) := CREATE_FP(0.0);
    signal tropomyosin_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal tropomyosin_k_on : signed(31 downto 0) := CREATE_FP(0.0);
    signal tropomyosin_k_ref_off : signed(31 downto 0) := CREATE_FP(0.0);
    signal tropomyosin_gamma_trpn : signed(31 downto 0) := CREATE_FP(0.0);
    signal tropomyosin_ca_trpn_max : signed(31 downto 0) := CREATE_FP(0.0);
    signal tropomyosin_beta_0 : signed(31 downto 0) := CREATE_FP(0.0);
    signal tropomyosin_ca_b : signed(31 downto 0) := CREATE_FP(0.0);
    signal tropomyosin_lambda : signed(31 downto 0) := CREATE_FP(0.0);
    signal tropomyosin_z : signed(31 downto 0) := CREATE_FP(0.0);
    signal tropomyosin_z_max : signed(31 downto 0) := CREATE_FP(0.0);
    signal troponin_trpn : signed(31 downto 0) := CREATE_FP(0.0);
    signal troponin_ca_i : signed(31 downto 0) := CREATE_FP(0.0);
    signal troponin_tension : signed(31 downto 0) := CREATE_FP(0.0);
    signal troponin_t_ref : signed(31 downto 0) := CREATE_FP(0.0);
    signal troponin_j_trpn : signed(31 downto 0) := CREATE_FP(0.0);
    signal troponin_ca_trpn_max : signed(31 downto 0) := CREATE_FP(0.0);
    signal troponin_k_on : signed(31 downto 0) := CREATE_FP(0.0);
    signal troponin_k_ref_off : signed(31 downto 0) := CREATE_FP(0.0);
    signal troponin_gamma_trpn : signed(31 downto 0) := CREATE_FP(0.0);
    signal myofilaments_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal myofilaments_lambda : signed(31 downto 0) := CREATE_FP(0.0);
    signal myofilaments_extension_ratio : signed(31 downto 0) := CREATE_FP(0.0);
    signal myofilaments_d_extension_ratiodt : signed(31 downto 0) := CREATE_FP(0.0);
    signal myofilaments_lambda_prev : signed(31 downto 0) := CREATE_FP(0.0);
    signal filament_overlap_lambda : signed(31 downto 0) := CREATE_FP(0.0);
    signal filament_overlap_overlap : signed(31 downto 0) := CREATE_FP(0.0);
    signal filament_overlap_beta_0 : signed(31 downto 0) := CREATE_FP(0.0);
    signal length_independent_tension_z : signed(31 downto 0) := CREATE_FP(0.0);
    signal length_independent_tension_z_max : signed(31 downto 0) := CREATE_FP(0.0);
    signal length_independent_tension_t_ref : signed(31 downto 0) := CREATE_FP(0.0);
    signal length_independent_tension_t_base : signed(31 downto 0) := CREATE_FP(0.0);
    signal isometric_tension_t_base : signed(31 downto 0) := CREATE_FP(0.0);
    signal isometric_tension_overlap : signed(31 downto 0) := CREATE_FP(0.0);
    signal isometric_tension_t_0 : signed(31 downto 0) := CREATE_FP(0.0);
    signal cross_bridges_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal cross_bridges_d_extension_ratiodt : signed(31 downto 0) := CREATE_FP(0.0);
    signal cross_bridges_t_0 : signed(31 downto 0) := CREATE_FP(0.0);
    signal cross_bridges_tension : signed(31 downto 0) := CREATE_FP(0.0);

    -- Declare child components
    component Environment is
        port(
            clk : in std_logic;
            time_out : out signed(31 downto 0)
        );
    end component Environment;

    component IntracellularIonConcentrations is
        port(
            clk : in std_logic;
            time_in : in signed(31 downto 0);
            ca_trpn_max_in : in signed(31 downto 0);
            j_trpn_in : in signed(31 downto 0);
            ca_i_out : out signed(31 downto 0);
            ca_b_out : out signed(31 downto 0);
            trpn_out : out signed(31 downto 0)
        );
    end component IntracellularIonConcentrations;

    component Thinfilaments is
        port(
            clk : in std_logic
        );
    end component Thinfilaments;

    component Tropomyosin is
        generic(
            alpha_0 : signed(31 downto 0) := CREATE_FP(0.008);
            alpha_r1 : signed(31 downto 0) := CREATE_FP(0.002);
            alpha_r2 : signed(31 downto 0) := CREATE_FP(0.00175);
            n_rel : signed(31 downto 0) := CREATE_FP(3.0);
            k_z : signed(31 downto 0) := CREATE_FP(0.15);
            n_hill : signed(31 downto 0) := CREATE_FP(3.0);
            ca_50ref : signed(31 downto 0) := CREATE_FP(0.00105);
            z_p : signed(31 downto 0) := CREATE_FP(0.85);
            beta_1 : signed(31 downto 0) := CREATE_FP(-4.0)
        );
        port(
            clk : in std_logic;
            time_in : in signed(31 downto 0);
            k_on_in : in signed(31 downto 0);
            k_ref_off_in : in signed(31 downto 0);
            gamma_trpn_in : in signed(31 downto 0);
            ca_trpn_max_in : in signed(31 downto 0);
            beta_0_in : in signed(31 downto 0);
            ca_b_in : in signed(31 downto 0);
            lambda_in : in signed(31 downto 0);
            z_out : out signed(31 downto 0);
            z_max_out : out signed(31 downto 0)
        );
    end component Tropomyosin;

    component Troponin is
        port(
            clk : in std_logic;
            trpn_in : in signed(31 downto 0);
            ca_i_in : in signed(31 downto 0);
            tension_in : in signed(31 downto 0);
            t_ref_in : in signed(31 downto 0);
            j_trpn_out : out signed(31 downto 0);
            ca_trpn_max_out : out signed(31 downto 0);
            k_on_out : out signed(31 downto 0);
            k_ref_off_out : out signed(31 downto 0);
            gamma_trpn_out : out signed(31 downto 0)
        );
    end component Troponin;

    component Myofilaments is
        port(
            clk : in std_logic;
            time_in : in signed(31 downto 0);
            lambda_out : out signed(31 downto 0);
            extension_ratio_out : out signed(31 downto 0);
            d_extension_ratiodt_out : out signed(31 downto 0);
            lambda_prev_out : out signed(31 downto 0)
        );
    end component Myofilaments;

    component FilamentOverlap is
        port(
            clk : in std_logic;
            lambda_in : in signed(31 downto 0);
            overlap_out : out signed(31 downto 0);
            beta_0_out : out signed(31 downto 0)
        );
    end component FilamentOverlap;

    component LengthIndependentTension is
        port(
            clk : in std_logic;
            z_in : in signed(31 downto 0);
            z_max_in : in signed(31 downto 0);
            t_ref_out : out signed(31 downto 0);
            t_base_out : out signed(31 downto 0)
        );
    end component LengthIndependentTension;

    component IsometricTension is
        port(
            clk : in std_logic;
            t_base_in : in signed(31 downto 0);
            overlap_in : in signed(31 downto 0);
            t_0_out : out signed(31 downto 0)
        );
    end component IsometricTension;

    component CrossBridges is
        generic(
            a : signed(31 downto 0) := CREATE_FP(0.35);
            a_1 : signed(31 downto 0) := CREATE_FP(-29.0);
            a_2 : signed(31 downto 0) := CREATE_FP(138.0);
            a_3 : signed(31 downto 0) := CREATE_FP(129.0);
            alpha_1 : signed(31 downto 0) := CREATE_FP(0.03);
            alpha_2 : signed(31 downto 0) := CREATE_FP(0.13);
            alpha_3 : signed(31 downto 0) := CREATE_FP(0.625)
        );
        port(
            clk : in std_logic;
            time_in : in signed(31 downto 0);
            d_extension_ratiodt_in : in signed(31 downto 0);
            t_0_in : in signed(31 downto 0);
            tension_out : out signed(31 downto 0)
        );
    end component CrossBridges;

begin
    -- Create child instances
    environment_inst : component Environment
        port map(
            clk => clk,
            time_out => environment_time
        );

    intracellular_ion_concentrations_inst : component IntracellularIonConcentrations
        port map(
            clk => clk,
            time_in => intracellular_ion_concentrations_time,
            ca_trpn_max_in => intracellular_ion_concentrations_ca_trpn_max,
            j_trpn_in => intracellular_ion_concentrations_j_trpn,
            ca_i_out => intracellular_ion_concentrations_ca_i,
            ca_b_out => intracellular_ion_concentrations_ca_b,
            trpn_out => intracellular_ion_concentrations_trpn
        );

    thinfilaments_inst : component Thinfilaments
        port map(
            clk => clk
        );

    tropomyosin_inst : component Tropomyosin
        port map(
            clk => clk,
            time_in => tropomyosin_time,
            k_on_in => tropomyosin_k_on,
            k_ref_off_in => tropomyosin_k_ref_off,
            gamma_trpn_in => tropomyosin_gamma_trpn,
            ca_trpn_max_in => tropomyosin_ca_trpn_max,
            beta_0_in => tropomyosin_beta_0,
            ca_b_in => tropomyosin_ca_b,
            lambda_in => tropomyosin_lambda,
            z_out => tropomyosin_z,
            z_max_out => tropomyosin_z_max
        );

    troponin_inst : component Troponin
        port map(
            clk => clk,
            trpn_in => troponin_trpn,
            ca_i_in => troponin_ca_i,
            tension_in => troponin_tension,
            t_ref_in => troponin_t_ref,
            j_trpn_out => troponin_j_trpn,
            ca_trpn_max_out => troponin_ca_trpn_max,
            k_on_out => troponin_k_on,
            k_ref_off_out => troponin_k_ref_off,
            gamma_trpn_out => troponin_gamma_trpn
        );

    myofilaments_inst : component Myofilaments
        port map(
            clk => clk,
            time_in => myofilaments_time,
            lambda_out => myofilaments_lambda,
            extension_ratio_out => myofilaments_extension_ratio,
            d_extension_ratiodt_out => myofilaments_d_extension_ratiodt,
            lambda_prev_out => myofilaments_lambda_prev
        );

    filament_overlap_inst : component FilamentOverlap
        port map(
            clk => clk,
            lambda_in => filament_overlap_lambda,
            overlap_out => filament_overlap_overlap,
            beta_0_out => filament_overlap_beta_0
        );

    length_independent_tension_inst : component LengthIndependentTension
        port map(
            clk => clk,
            z_in => length_independent_tension_z,
            z_max_in => length_independent_tension_z_max,
            t_ref_out => length_independent_tension_t_ref,
            t_base_out => length_independent_tension_t_base
        );

    isometric_tension_inst : component IsometricTension
        port map(
            clk => clk,
            t_base_in => isometric_tension_t_base,
            overlap_in => isometric_tension_overlap,
            t_0_out => isometric_tension_t_0
        );

    cross_bridges_inst : component CrossBridges
        port map(
            clk => clk,
            time_in => cross_bridges_time,
            d_extension_ratiodt_in => cross_bridges_d_extension_ratiodt,
            t_0_in => cross_bridges_t_0,
            tension_out => cross_bridges_tension
        );

    -- Perform Mapping
    cross_bridges_tension_out <= cross_bridges_tension;
    myofilaments_extensionratio_out <= myofilaments_extension_ratio;
    myofilaments_dextensionratiodt_out <= myofilaments_d_extension_ratiodt;
    myofilaments_lambda_out <= myofilaments_lambda;
    myofilaments_lambda_prev_out <= myofilaments_lambda_prev;
    environment_time_out <= environment_time;
    filament_overlap_beta_0_out <= filament_overlap_beta_0;
    filament_overlap_overlap_out <= filament_overlap_overlap;
    intracellular_ion_concentrations_ca_b_out <= intracellular_ion_concentrations_ca_b;
    intracellular_ion_concentrations_ca_i_out <= intracellular_ion_concentrations_ca_i;
    intracellular_ion_concentrations_trpn_out <= intracellular_ion_concentrations_trpn;
    isometric_tension_t_0_out <= isometric_tension_t_0;
    length_independent_tension_t_base_out <= length_independent_tension_t_base;
    length_independent_tension_t_ref_out <= length_independent_tension_t_ref;
    tropomyosin_z_out <= tropomyosin_z;
    tropomyosin_z_max_out <= tropomyosin_z_max;
    troponin_ca_trpn_max_out <= troponin_ca_trpn_max;
    troponin_j_trpn_out <= troponin_j_trpn;
    troponin_gamma_trpn_out <= troponin_gamma_trpn;
    troponin_k_ref_off_out <= troponin_k_ref_off;
    troponin_k_on_out <= troponin_k_on;
    cross_bridges_t_0 <= isometric_tension_t_0;
    cross_bridges_d_extension_ratiodt <= myofilaments_d_extension_ratiodt;
    cross_bridges_time <= environment_time;
    myofilaments_time <= environment_time;
    filament_overlap_lambda <= myofilaments_lambda;
    intracellular_ion_concentrations_ca_trpn_max <= troponin_ca_trpn_max;
    intracellular_ion_concentrations_j_trpn <= troponin_j_trpn;
    intracellular_ion_concentrations_time <= environment_time;
    isometric_tension_t_base <= length_independent_tension_t_base;
    isometric_tension_overlap <= filament_overlap_overlap;
    length_independent_tension_z <= tropomyosin_z;
    length_independent_tension_z_max <= tropomyosin_z_max;
    tropomyosin_ca_trpn_max <= troponin_ca_trpn_max;
    tropomyosin_ca_b <= intracellular_ion_concentrations_ca_b;
    tropomyosin_beta_0 <= filament_overlap_beta_0;
    tropomyosin_gamma_trpn <= troponin_gamma_trpn;
    tropomyosin_k_ref_off <= troponin_k_ref_off;
    tropomyosin_k_on <= troponin_k_on;
    tropomyosin_lambda <= myofilaments_lambda;
    tropomyosin_time <= environment_time;
    troponin_ca_i <= intracellular_ion_concentrations_ca_i;
    troponin_trpn <= intracellular_ion_concentrations_trpn;
    troponin_t_ref <= length_independent_tension_t_ref;
    troponin_tension <= cross_bridges_tension;
end architecture;