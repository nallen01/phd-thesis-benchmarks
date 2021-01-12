library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity PotassiumChannel is
    generic(
        g_k : signed(31 downto 0) := CREATE_FP(36.0)
    );

    port (
        clk : in std_logic;
        
        -- Declare Inputs
        time_in : in signed(31 downto 0);
        v_in : in signed(31 downto 0);
        e_r_in : in signed(31 downto 0);
        n_private_in : in signed(31 downto 0);
        
        -- Declare Outputs
        i_k_out : out signed(31 downto 0);
        time_private_out : out signed(31 downto 0);
        v_private_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of PotassiumChannel is
    
    -- Declare Outputs
    signal i_k : signed(31 downto 0) := CREATE_FP(0.0);
    signal time_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal v_private : signed(31 downto 0) := CREATE_FP(0.0);
    
    -- Declare Internal Variables
    signal e_k : signed(31 downto 0) := CREATE_FP(0.0);
    signal n : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable i_k_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable time_private_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable v_private_update : signed(31 downto 0) := CREATE_FP(0.0);
        
        -- Internal Variables
        variable e_k_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable n_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Update Operations
            e_k_update := e_r_in - CREATE_FP(12.0);
            i_k_update := FP_MULT(FP_MULT(g_k, (FP_POWER(n, CREATE_FP(4.0)))), (v_in - e_k));
            time_private_update := time_in;
            v_private_update := v_in;
            n_update := n_private_in;
            
            
            -- Map Outputs
            i_k_out <= i_k_update;
            i_k <= i_k_update;
            time_private_out <= time_private_update;
            time_private <= time_private_update;
            v_private_out <= v_private_update;
            v_private <= v_private_update;
            
            -- Map Internal Variables
            e_k <= e_k_update;
            n <= n_update;

        end if;
    end process;
end architecture;