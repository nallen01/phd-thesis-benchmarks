library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity ReversalPotentials is
    generic(
        p_kna : signed(31 downto 0) := CREATE_FP(0.03)
    );

    port (
        clk : in std_logic;
        
        -- Declare Inputs
        k_o_in : in signed(31 downto 0);
        na_o_in : in signed(31 downto 0);
        k_i_in : in signed(31 downto 0);
        na_i_in : in signed(31 downto 0);
        ca_o_in : in signed(31 downto 0);
        ca_i_in : in signed(31 downto 0);
        r_in : in signed(31 downto 0);
        f_in : in signed(31 downto 0);
        t_in : in signed(31 downto 0);
        time_in : in signed(31 downto 0);
        
        -- Declare Outputs
        e_na_out : out signed(31 downto 0);
        e_k_out : out signed(31 downto 0);
        e_ks_out : out signed(31 downto 0);
        e_ca_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of ReversalPotentials is
    
    -- Declare Outputs
    signal e_na : signed(31 downto 0) := CREATE_FP(0.0);
    signal e_k : signed(31 downto 0) := CREATE_FP(0.0);
    signal e_ks : signed(31 downto 0) := CREATE_FP(0.0);
    signal e_ca : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable e_na_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable e_k_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable e_ks_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable e_ca_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Update Operations
            e_na_update := FP_MULT((FP_DIV((FP_MULT(r_in, t_in)), f_in)), FP_LOG((FP_DIV(na_o_in, na_i_in))));
            e_k_update := FP_MULT((FP_DIV((FP_MULT(r_in, t_in)), f_in)), FP_LOG((FP_DIV(k_o_in, k_i_in))));
            e_ks_update := FP_MULT((FP_DIV((FP_MULT(r_in, t_in)), f_in)), FP_LOG((FP_DIV((k_o_in + FP_MULT(p_kna, na_o_in)), (k_i_in + FP_MULT(p_kna, na_i_in))))));
            e_ca_update := FP_MULT((FP_DIV((FP_MULT(FP_MULT(CREATE_FP(0.5), r_in), t_in)), f_in)), FP_LOG((FP_DIV(ca_o_in, ca_i_in))));
            
            
            -- Map Outputs
            e_na_out <= e_na_update;
            e_na <= e_na_update;
            e_k_out <= e_k_update;
            e_k <= e_k_update;
            e_ks_out <= e_ks_update;
            e_ks <= e_ks_update;
            e_ca_out <= e_ca_update;
            e_ca <= e_ca_update;

        end if;
    end process;
end architecture;