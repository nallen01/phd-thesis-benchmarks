library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity CalciumPumpCurrent is
    generic(
        g_pca : signed(31 downto 0) := CREATE_FP(0.825);
        k_pca : signed(31 downto 0) := CREATE_FP(5.0E-4)
    );

    port (
        clk : in std_logic;
        
        -- Declare Inputs
        ca_i_in : in signed(31 downto 0);
        
        -- Declare Outputs
        i_p_ca_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of CalciumPumpCurrent is
    
    -- Declare Outputs
    signal i_p_ca : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable i_p_ca_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Update Operations
            i_p_ca_update := FP_DIV((FP_MULT(g_pca, ca_i_in)), (ca_i_in + k_pca));
            
            
            -- Map Outputs
            i_p_ca_out <= i_p_ca_update;
            i_p_ca <= i_p_ca_update;

        end if;
    end process;
end architecture;