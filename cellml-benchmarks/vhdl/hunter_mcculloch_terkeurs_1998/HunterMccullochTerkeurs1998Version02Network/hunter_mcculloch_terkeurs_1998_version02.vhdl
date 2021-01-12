library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.lib.all;

-- Entity
entity HunterMccullochTerkeurs1998Version02 is
    port (
        clk : in std_logic;
        
        -- Declare Outputs
        environment_time_out : out signed(31 downto 0);
        calcium_transient_ca_i_out : out signed(31 downto 0);
        tnc_ca_binding_kinetics_ca_b_out : out signed(31 downto 0);
        tnc_ca_binding_kinetics_lambda_out : out signed(31 downto 0);
        thin_filament_kinetics_to_out : out signed(31 downto 0);
        crossbridge_kinetics_t_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of HunterMccullochTerkeurs1998Version02 is
    -- Declare all internal signals
    signal environment_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal calcium_transient_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal calcium_transient_ca_i : signed(31 downto 0) := CREATE_FP(0.0);
    signal tnc_ca_binding_kinetics_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal tnc_ca_binding_kinetics_ca_i : signed(31 downto 0) := CREATE_FP(0.0);
    signal tnc_ca_binding_kinetics_to : signed(31 downto 0) := CREATE_FP(0.0);
    signal tnc_ca_binding_kinetics_t : signed(31 downto 0) := CREATE_FP(0.0);
    signal tnc_ca_binding_kinetics_ca_b : signed(31 downto 0) := CREATE_FP(0.0);
    signal tnc_ca_binding_kinetics_lambda : signed(31 downto 0) := CREATE_FP(0.0);
    signal thin_filament_kinetics_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal thin_filament_kinetics_ca_b : signed(31 downto 0) := CREATE_FP(0.0);
    signal thin_filament_kinetics_lambda : signed(31 downto 0) := CREATE_FP(0.0);
    signal thin_filament_kinetics_to : signed(31 downto 0) := CREATE_FP(0.0);
    signal crossbridge_kinetics_time : signed(31 downto 0) := CREATE_FP(0.0);
    signal crossbridge_kinetics_to : signed(31 downto 0) := CREATE_FP(0.0);
    signal crossbridge_kinetics_t : signed(31 downto 0) := CREATE_FP(0.0);

    -- Declare child components
    component Environment is
        port(
            clk : in std_logic;
            time_out : out signed(31 downto 0)
        );
    end component Environment;

    component CalciumTransient is
        generic(
            ca_max : signed(31 downto 0) := CREATE_FP(1.0);
            tau_ca : signed(31 downto 0) := CREATE_FP(0.06);
            ca_o : signed(31 downto 0) := CREATE_FP(0.01)
        );
        port(
            clk : in std_logic;
            time_in : in signed(31 downto 0);
            ca_i_out : out signed(31 downto 0)
        );
    end component CalciumTransient;

    component TncCaBindingKinetics is
        generic(
            ca_b_max : signed(31 downto 0) := CREATE_FP(2.26);
            rho_0 : signed(31 downto 0) := CREATE_FP(100.0);
            rho_1 : signed(31 downto 0) := CREATE_FP(163.0)
        );
        port(
            clk : in std_logic;
            time_in : in signed(31 downto 0);
            ca_i_in : in signed(31 downto 0);
            to_in : in signed(31 downto 0);
            t_in : in signed(31 downto 0);
            ca_b_out : out signed(31 downto 0);
            lambda_out : out signed(31 downto 0)
        );
    end component TncCaBindingKinetics;

    component ThinFilamentKinetics is
        generic(
            c_50 : signed(31 downto 0) := CREATE_FP(1.0);
            pc_50_ref : signed(31 downto 0) := CREATE_FP(6.2);
            n_ref : signed(31 downto 0) := CREATE_FP(6.9);
            alpha_0 : signed(31 downto 0) := CREATE_FP(2.0);
            t_ref : signed(31 downto 0) := CREATE_FP(100.0);
            beta_0 : signed(31 downto 0) := CREATE_FP(1.45);
            beta_1 : signed(31 downto 0) := CREATE_FP(1.95);
            beta_2 : signed(31 downto 0) := CREATE_FP(0.31)
        );
        port(
            clk : in std_logic;
            time_in : in signed(31 downto 0);
            ca_b_in : in signed(31 downto 0);
            lambda_in : in signed(31 downto 0);
            to_out : out signed(31 downto 0)
        );
    end component ThinFilamentKinetics;

    component CrossbridgeKinetics is
        generic(
            a : signed(31 downto 0) := CREATE_FP(0.5);
            a1 : signed(31 downto 0) := CREATE_FP(50.0);
            a2 : signed(31 downto 0) := CREATE_FP(175.0);
            a3 : signed(31 downto 0) := CREATE_FP(175.0);
            alpha_1 : signed(31 downto 0) := CREATE_FP(33.0);
            alpha_2 : signed(31 downto 0) := CREATE_FP(2850.0);
            alpha_3 : signed(31 downto 0) := CREATE_FP(2850.0);
            tau : signed(31 downto 0) := CREATE_FP(0.0)
        );
        port(
            clk : in std_logic;
            time_in : in signed(31 downto 0);
            to_in : in signed(31 downto 0);
            t_out : out signed(31 downto 0)
        );
    end component CrossbridgeKinetics;

begin
    -- Create child instances
    environment_inst : component Environment
        port map(
            clk => clk,
            time_out => environment_time
        );

    calcium_transient_inst : component CalciumTransient
        port map(
            clk => clk,
            time_in => calcium_transient_time,
            ca_i_out => calcium_transient_ca_i
        );

    tnc_ca_binding_kinetics_inst : component TncCaBindingKinetics
        port map(
            clk => clk,
            time_in => tnc_ca_binding_kinetics_time,
            ca_i_in => tnc_ca_binding_kinetics_ca_i,
            to_in => tnc_ca_binding_kinetics_to,
            t_in => tnc_ca_binding_kinetics_t,
            ca_b_out => tnc_ca_binding_kinetics_ca_b,
            lambda_out => tnc_ca_binding_kinetics_lambda
        );

    thin_filament_kinetics_inst : component ThinFilamentKinetics
        port map(
            clk => clk,
            time_in => thin_filament_kinetics_time,
            ca_b_in => thin_filament_kinetics_ca_b,
            lambda_in => thin_filament_kinetics_lambda,
            to_out => thin_filament_kinetics_to
        );

    crossbridge_kinetics_inst : component CrossbridgeKinetics
        port map(
            clk => clk,
            time_in => crossbridge_kinetics_time,
            to_in => crossbridge_kinetics_to,
            t_out => crossbridge_kinetics_t
        );

    -- Perform Mapping
    tnc_ca_binding_kinetics_ca_b_out <= tnc_ca_binding_kinetics_ca_b;
    tnc_ca_binding_kinetics_lambda_out <= tnc_ca_binding_kinetics_lambda;
    calcium_transient_ca_i_out <= calcium_transient_ca_i;
    crossbridge_kinetics_t_out <= crossbridge_kinetics_t;
    environment_time_out <= environment_time;
    thin_filament_kinetics_to_out <= thin_filament_kinetics_to;
    tnc_ca_binding_kinetics_ca_i <= calcium_transient_ca_i;
    tnc_ca_binding_kinetics_t <= crossbridge_kinetics_t;
    tnc_ca_binding_kinetics_to <= thin_filament_kinetics_to;
    tnc_ca_binding_kinetics_time <= environment_time;
    calcium_transient_time <= environment_time;
    crossbridge_kinetics_to <= thin_filament_kinetics_to;
    crossbridge_kinetics_time <= environment_time;
    thin_filament_kinetics_ca_b <= tnc_ca_binding_kinetics_ca_b;
    thin_filament_kinetics_lambda <= tnc_ca_binding_kinetics_lambda;
    thin_filament_kinetics_time <= environment_time;
end architecture;