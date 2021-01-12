library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity Troponin is
    port (
        clk : in std_logic;
        
        -- Declare Inputs
        trpn_in : in signed(31 downto 0);
        ca_i_in : in signed(31 downto 0);
        tension_in : in signed(31 downto 0);
        t_ref_in : in signed(31 downto 0);
        
        -- Declare Outputs
        j_trpn_out : out signed(31 downto 0);
        ca_trpn_max_out : out signed(31 downto 0);
        k_on_out : out signed(31 downto 0);
        k_ref_off_out : out signed(31 downto 0);
        gamma_trpn_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of Troponin is

    -- Declare Custom Functions
    function KOffPw(tension: signed(31 downto 0); gamma_trpn: signed(31 downto 0); t_ref: signed(31 downto 0); k_ref_off: signed(31 downto 0))
            return signed is
    begin
        if CREATE_FP(1.0) - FP_DIV(tension, (FP_MULT(gamma_trpn, t_ref))) > CREATE_FP(0.1) then
            return FP_MULT(k_ref_off, (CREATE_FP(1.0) - FP_DIV(tension, (FP_MULT(gamma_trpn, t_ref)))));
        
        else
            return FP_MULT(k_ref_off, CREATE_FP(0.1));
        
        end if;
    end KOffPw;
    
    -- Declare Outputs
    signal j_trpn : signed(31 downto 0) := CREATE_FP(0.0);
    signal ca_trpn_max : signed(31 downto 0) := CREATE_FP(0.07);
    signal k_on : signed(31 downto 0) := CREATE_FP(100.0);
    signal k_ref_off : signed(31 downto 0) := CREATE_FP(0.2);
    signal gamma_trpn : signed(31 downto 0) := CREATE_FP(2.0);
    
    -- Declare Internal Variables
    signal k_off : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable j_trpn_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable ca_trpn_max_update : signed(31 downto 0) := CREATE_FP(0.07);
        variable k_on_update : signed(31 downto 0) := CREATE_FP(100.0);
        variable k_ref_off_update : signed(31 downto 0) := CREATE_FP(0.2);
        variable gamma_trpn_update : signed(31 downto 0) := CREATE_FP(2.0);
        
        -- Internal Variables
        variable k_off_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Update Operations
            k_off_update := KOffPw(tension_in, gamma_trpn, t_ref_in, k_ref_off);
            j_trpn_update := FP_MULT((ca_trpn_max - trpn_in), k_off) - FP_MULT(FP_MULT(ca_i_in, trpn_in), k_on);
            
            
            -- Map Outputs
            j_trpn_out <= j_trpn_update;
            j_trpn <= j_trpn_update;
            ca_trpn_max_out <= ca_trpn_max_update;
            ca_trpn_max <= ca_trpn_max_update;
            k_on_out <= k_on_update;
            k_on <= k_on_update;
            k_ref_off_out <= k_ref_off_update;
            k_ref_off <= k_ref_off_update;
            gamma_trpn_out <= gamma_trpn_update;
            gamma_trpn <= gamma_trpn_update;
            
            -- Map Internal Variables
            k_off <= k_off_update;

        end if;
    end process;
end architecture;