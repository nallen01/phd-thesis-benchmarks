library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity SodiumBackgroundCurrent is
    generic(
        g_bna : signed(31 downto 0) := CREATE_FP(2.9E-4)
    );

    port (
        clk : in std_logic;
        
        -- Declare Inputs
        e_na_in : in signed(31 downto 0);
        time_in : in signed(31 downto 0);
        v_in : in signed(31 downto 0);
        
        -- Declare Outputs
        i_b_na_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of SodiumBackgroundCurrent is
    
    -- Declare Outputs
    signal i_b_na : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable i_b_na_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Update Operations
            i_b_na_update := FP_MULT(FP_MULT(g_bna, (v_in - e_na_in)), CREATE_FP(1.0000000000000002));
            
            
            -- Map Outputs
            i_b_na_out <= i_b_na_update;
            i_b_na <= i_b_na_update;

        end if;
    end process;
end architecture;