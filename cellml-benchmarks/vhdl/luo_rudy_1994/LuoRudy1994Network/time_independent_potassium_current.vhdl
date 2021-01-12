library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity TimeIndependentPotassiumCurrent is
    generic(
        g_k1_max : signed(31 downto 0) := CREATE_FP(0.0075)
    );

    port (
        clk : in std_logic;
        
        -- Declare Inputs
        time_in : in signed(31 downto 0);
        v_in : in signed(31 downto 0);
        ko_in : in signed(31 downto 0);
        ki_in : in signed(31 downto 0);
        r_in : in signed(31 downto 0);
        t_in : in signed(31 downto 0);
        f_in : in signed(31 downto 0);
        k1_infinity_private_in : in signed(31 downto 0);
        
        -- Declare Outputs
        i_k1_out : out signed(31 downto 0);
        e_k1_out : out signed(31 downto 0);
        time_private_out : out signed(31 downto 0);
        v_private_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of TimeIndependentPotassiumCurrent is
    
    -- Declare Outputs
    signal i_k1 : signed(31 downto 0) := CREATE_FP(0.0);
    signal e_k1 : signed(31 downto 0) := CREATE_FP(0.0);
    signal time_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal v_private : signed(31 downto 0) := CREATE_FP(0.0);
    
    -- Declare Internal Variables
    signal g_k1 : signed(31 downto 0) := CREATE_FP(0.0);
    signal k1_infinity : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable i_k1_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable e_k1_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable time_private_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable v_private_update : signed(31 downto 0) := CREATE_FP(0.0);
        
        -- Internal Variables
        variable g_k1_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable k1_infinity_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Update Operations
            g_k1_update := FP_MULT(g_k1_max, FP_SQRT((FP_DIV(ko_in, CREATE_FP(5.4)))));
            e_k1_update := FP_MULT(FP_MULT((FP_DIV((FP_MULT(r_in, t_in)), f_in)), FP_LOG((FP_DIV(ko_in, ki_in)))), CREATE_FP(0.9999999999999998));
            i_k1_update := FP_MULT(FP_MULT(g_k1, k1_infinity), (v_in - e_k1));
            time_private_update := time_in;
            v_private_update := v_in;
            k1_infinity_update := k1_infinity_private_in;
            
            
            -- Map Outputs
            i_k1_out <= i_k1_update;
            i_k1 <= i_k1_update;
            e_k1_out <= e_k1_update;
            e_k1 <= e_k1_update;
            time_private_out <= time_private_update;
            time_private <= time_private_update;
            v_private_out <= v_private_update;
            v_private <= v_private_update;
            
            -- Map Internal Variables
            g_k1 <= g_k1_update;
            k1_infinity <= k1_infinity_update;

        end if;
    end process;
end architecture;