library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity TimeDependentPotassiumCurrent is
    generic(
        g_k_max : signed(31 downto 0) := CREATE_FP(0.00282);
        pr_nak : signed(31 downto 0) := CREATE_FP(0.01833)
    );

    port (
        clk : in std_logic;
        
        -- Declare Inputs
        time_in : in signed(31 downto 0);
        v_in : in signed(31 downto 0);
        r_in : in signed(31 downto 0);
        t_in : in signed(31 downto 0);
        f_in : in signed(31 downto 0);
        ko_in : in signed(31 downto 0);
        ki_in : in signed(31 downto 0);
        nao_in : in signed(31 downto 0);
        nai_in : in signed(31 downto 0);
        x_private_in : in signed(31 downto 0);
        xi_private_in : in signed(31 downto 0);
        
        -- Declare Outputs
        i_k_out : out signed(31 downto 0);
        time_private_out : out signed(31 downto 0);
        v_private_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of TimeDependentPotassiumCurrent is
    
    -- Declare Outputs
    signal i_k : signed(31 downto 0) := CREATE_FP(0.0);
    signal time_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal v_private : signed(31 downto 0) := CREATE_FP(0.0);
    
    -- Declare Internal Variables
    signal g_k : signed(31 downto 0) := CREATE_FP(0.0);
    signal e_k : signed(31 downto 0) := CREATE_FP(0.0);
    signal x : signed(31 downto 0) := CREATE_FP(0.0);
    signal xi : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable i_k_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable time_private_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable v_private_update : signed(31 downto 0) := CREATE_FP(0.0);
        
        -- Internal Variables
        variable g_k_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable e_k_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable x_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable xi_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Update Operations
            g_k_update := FP_MULT(g_k_max, FP_SQRT((FP_DIV(ko_in, CREATE_FP(5.4)))));
            e_k_update := FP_MULT(FP_MULT((FP_DIV((FP_MULT(r_in, t_in)), f_in)), FP_LOG((FP_DIV((ko_in + FP_MULT(pr_nak, nao_in)), (ki_in + FP_MULT(pr_nak, nai_in)))))), CREATE_FP(0.9999999999999998));
            i_k_update := FP_MULT(FP_MULT(FP_MULT(g_k, (FP_POWER(x, CREATE_FP(2.0)))), xi), (v_in - e_k));
            time_private_update := time_in;
            v_private_update := v_in;
            x_update := x_private_in;
            xi_update := xi_private_in;
            
            
            -- Map Outputs
            i_k_out <= i_k_update;
            i_k <= i_k_update;
            time_private_out <= time_private_update;
            time_private <= time_private_update;
            v_private_out <= v_private_update;
            v_private <= v_private_update;
            
            -- Map Internal Variables
            g_k <= g_k_update;
            e_k <= e_k_update;
            x <= x_update;
            xi <= xi_update;

        end if;
    end process;
end architecture;