library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity PotassiumPumpCurrent is
    generic(
        g_pk : signed(31 downto 0) := CREATE_FP(0.0146)
    );

    port (
        clk : in std_logic;
        
        -- Declare Inputs
        e_k_in : in signed(31 downto 0);
        v_in : in signed(31 downto 0);
        
        -- Declare Outputs
        i_p_k_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of PotassiumPumpCurrent is
    
    -- Declare Outputs
    signal i_p_k : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable i_p_k_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Update Operations
            i_p_k_update := FP_MULT((FP_DIV((FP_MULT(g_pk, (v_in - e_k_in))), (CREATE_FP(1.0) + FP_EXP((FP_DIV((CREATE_FP(25.0) - v_in), CREATE_FP(5.98))))))), CREATE_FP(1.0000000000000002));
            
            
            -- Map Outputs
            i_p_k_out <= i_p_k_update;
            i_p_k <= i_p_k_update;

        end if;
    end process;
end architecture;