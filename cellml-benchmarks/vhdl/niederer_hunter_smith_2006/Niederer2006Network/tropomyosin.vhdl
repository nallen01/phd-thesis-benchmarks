library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity Tropomyosin is
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

    port (
        clk : in std_logic;
        
        -- Declare Inputs
        time_in : in signed(31 downto 0);
        k_on_in : in signed(31 downto 0);
        k_ref_off_in : in signed(31 downto 0);
        gamma_trpn_in : in signed(31 downto 0);
        ca_trpn_max_in : in signed(31 downto 0);
        beta_0_in : in signed(31 downto 0);
        ca_b_in : in signed(31 downto 0);
        lambda_in : in signed(31 downto 0);
        
        -- Declare Outputs
        z_out : out signed(31 downto 0);
        z_max_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of Tropomyosin is
    
    -- Declare Outputs
    signal z : signed(31 downto 0) := CREATE_FP(0.014417937837);
    signal z_max : signed(31 downto 0) := CREATE_FP(0.0);
    
    -- Declare Internal Variables
    signal ca_50 : signed(31 downto 0) := CREATE_FP(0.0);
    signal ca_trpn_50 : signed(31 downto 0) := CREATE_FP(0.0);
    signal k_2 : signed(31 downto 0) := CREATE_FP(0.0);
    signal k_1 : signed(31 downto 0) := CREATE_FP(0.0);
    signal alpha_tm : signed(31 downto 0) := CREATE_FP(0.0);
    signal beta_tm : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable z_update : signed(31 downto 0) := CREATE_FP(0.014417937837);
        variable z_max_update : signed(31 downto 0) := CREATE_FP(0.0);
        
        -- Internal Variables
        variable ca_50_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable ca_trpn_50_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable k_2_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable k_1_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable alpha_tm_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable beta_tm_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Flow Operations
            z_update := z + FP_MULT((FP_MULT(alpha_tm, (CREATE_FP(1.0) - z)) - FP_MULT(beta_tm, z)), step_size);
            
            -- Perform Update Operations
            k_2_update := FP_MULT((FP_DIV((FP_MULT(alpha_r2, (FP_POWER(z_p, n_rel)))), (FP_POWER(z_p, n_rel) + FP_POWER(k_z, n_rel)))), (CREATE_FP(1.0) - FP_DIV((FP_MULT(n_rel, (FP_POWER(k_z, n_rel)))), (FP_POWER(z_p, n_rel) + FP_POWER(k_z, n_rel)))));
            k_1_update := FP_DIV((FP_MULT(FP_MULT(FP_MULT(alpha_r2, (FP_POWER(z_p, (n_rel - CREATE_FP(1.0))))), n_rel), (FP_POWER(k_z, n_rel)))), (FP_POWER((FP_POWER(z_p, n_rel) + FP_POWER(k_z, n_rel)), CREATE_FP(2.0))));
            z_max_update := FP_DIV((FP_DIV(alpha_0, (FP_POWER((FP_DIV(ca_trpn_50, ca_trpn_max_in)), n_hill))) - k_2), (alpha_r1 + k_1 + FP_DIV(alpha_0, (FP_POWER((FP_DIV(ca_trpn_50, ca_trpn_max_in)), n_hill)))));
            ca_50_update := FP_MULT(ca_50ref, (CREATE_FP(1.0) + FP_MULT(beta_1, (lambda_in - CREATE_FP(1.0)))));
            ca_trpn_50_update := FP_DIV((FP_MULT(ca_50, ca_trpn_max_in)), (ca_50 + FP_MULT((FP_DIV(k_ref_off_in, k_on_in)), (CREATE_FP(1.0) - FP_DIV((FP_MULT((CREATE_FP(1.0) + FP_MULT(beta_0_in, (lambda_in - CREATE_FP(1.0)))), CREATE_FP(0.5))), gamma_trpn_in)))));
            alpha_tm_update := FP_MULT(alpha_0, (FP_POWER((FP_DIV(ca_b_in, ca_trpn_50)), n_hill)));
            beta_tm_update := alpha_r1 + FP_DIV((FP_MULT(alpha_r2, (FP_POWER(z_update, (n_rel - CREATE_FP(1.0)))))), (FP_POWER(z_update, n_rel) + FP_POWER(k_z, n_rel)));
            
            
            -- Map Outputs
            z_out <= z_update;
            z <= z_update;
            z_max_out <= z_max_update;
            z_max <= z_max_update;
            
            -- Map Internal Variables
            ca_50 <= ca_50_update;
            ca_trpn_50 <= ca_trpn_50_update;
            k_2 <= k_2_update;
            k_1 <= k_1_update;
            alpha_tm <= alpha_tm_update;
            beta_tm <= beta_tm_update;

        end if;
    end process;
end architecture;