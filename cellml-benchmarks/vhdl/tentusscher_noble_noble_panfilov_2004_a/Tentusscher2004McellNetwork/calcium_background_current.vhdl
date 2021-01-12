library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity CalciumBackgroundCurrent is
    generic(
        g_bca : signed(31 downto 0) := CREATE_FP(5.92E-4)
    );

    port (
        clk : in std_logic;
        
        -- Declare Inputs
        e_ca_in : in signed(31 downto 0);
        time_in : in signed(31 downto 0);
        v_in : in signed(31 downto 0);
        
        -- Declare Outputs
        i_b_ca_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of CalciumBackgroundCurrent is
    
    -- Declare Outputs
    signal i_b_ca : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable i_b_ca_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Update Operations
            i_b_ca_update := FP_MULT(FP_MULT(g_bca, (v_in - e_ca_in)), CREATE_FP(1.0000000000000002));
            
            
            -- Map Outputs
            i_b_ca_out <= i_b_ca_update;
            i_b_ca <= i_b_ca_update;

        end if;
    end process;
end architecture;