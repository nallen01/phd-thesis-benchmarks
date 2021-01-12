library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity CalciumFluxesInTheSr is
    generic(
        g_rel_max : signed(31 downto 0) := CREATE_FP(60.0);
        tau_on : signed(31 downto 0) := CREATE_FP(2.0);
        tau_off : signed(31 downto 0) := CREATE_FP(2.0);
        t_cicr : signed(31 downto 0) := CREATE_FP(0.0);
        tau_tr : signed(31 downto 0) := CREATE_FP(180.0);
        k_mrel : signed(31 downto 0) := CREATE_FP(8.0E-4);
        k_mup : signed(31 downto 0) := CREATE_FP(9.2E-4);
        i_up1 : signed(31 downto 0) := CREATE_FP(0.005);
        ca_nsr_max : signed(31 downto 0) := CREATE_FP(15.0);
        delta_ca_i2 : signed(31 downto 0) := CREATE_FP(0.0);
        delta_ca_ith : signed(31 downto 0) := CREATE_FP(1.8E-4)
    );

    port (
        clk : in std_logic;
        
        -- Declare Inputs
        time_in : in signed(31 downto 0);
        cai_in : in signed(31 downto 0);
        ca_jsr_in : in signed(31 downto 0);
        ca_nsr_in : in signed(31 downto 0);
        
        -- Declare Outputs
        i_rel_out : out signed(31 downto 0);
        i_up_out : out signed(31 downto 0);
        i_leak_out : out signed(31 downto 0);
        i_tr_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of CalciumFluxesInTheSr is

    -- Declare Custom Functions
    function GRelPeakPw
            return signed is
    begin
        if delta_ca_i2 < delta_ca_ith then
            return CREATE_FP(0.0);
        
        else
            return g_rel_max;
        
        end if;
    end GRelPeakPw;
    
    -- Declare Outputs
    signal i_rel : signed(31 downto 0) := CREATE_FP(0.0);
    signal i_up : signed(31 downto 0) := CREATE_FP(0.0);
    signal i_leak : signed(31 downto 0) := CREATE_FP(0.0);
    signal i_tr : signed(31 downto 0) := CREATE_FP(0.0);
    
    -- Declare Internal Variables
    signal g_rel : signed(31 downto 0) := CREATE_FP(0.0);
    signal g_rel_peak : signed(31 downto 0) := CREATE_FP(0.0);
    signal k_leak : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable i_rel_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable i_up_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable i_leak_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable i_tr_update : signed(31 downto 0) := CREATE_FP(0.0);
        
        -- Internal Variables
        variable g_rel_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable g_rel_peak_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable k_leak_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Update Operations
            i_rel_update := FP_MULT(g_rel, (ca_jsr_in - cai_in));
            g_rel_update := FP_MULT(FP_MULT(FP_MULT(FP_MULT(g_rel_peak, (FP_DIV((delta_ca_i2 - delta_ca_ith), ((k_mrel + delta_ca_i2) - delta_ca_ith)))), (CREATE_FP(1.0) - FP_EXP(-(FP_DIV(t_cicr, tau_on))))), FP_EXP(-(FP_DIV(t_cicr, tau_off)))), CREATE_FP(0.9999999999999999));
            g_rel_peak_update := GRelPeakPw;
            i_up_update := FP_MULT(FP_MULT(i_up1, (FP_DIV(cai_in, (cai_in + k_mup)))), CREATE_FP(0.9999999999999999));
            i_leak_update := FP_MULT(k_leak, ca_nsr_in);
            k_leak_update := FP_MULT((FP_DIV(i_up1, ca_nsr_max)), CREATE_FP(0.9999999999999999));
            i_tr_update := FP_DIV((ca_nsr_in - ca_jsr_in), tau_tr);
            
            
            -- Map Outputs
            i_rel_out <= i_rel_update;
            i_rel <= i_rel_update;
            i_up_out <= i_up_update;
            i_up <= i_up_update;
            i_leak_out <= i_leak_update;
            i_leak <= i_leak_update;
            i_tr_out <= i_tr_update;
            i_tr <= i_tr_update;
            
            -- Map Internal Variables
            g_rel <= g_rel_update;
            g_rel_peak <= g_rel_peak_update;
            k_leak <= k_leak_update;

        end if;
    end process;
end architecture;