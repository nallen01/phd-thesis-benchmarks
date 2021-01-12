library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity SodiumBackgroundCurrent is
    generic(
        g_nab : signed(31 downto 0) := CREATE_FP(1.41E-5)
    );

    port (
        clk : in std_logic;
        
        -- Declare Inputs
        time_in : in signed(31 downto 0);
        v_in : in signed(31 downto 0);
        e_na_in : in signed(31 downto 0);
        
        -- Declare Outputs
        i_na_b_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of SodiumBackgroundCurrent is
    
    -- Declare Outputs
    signal i_na_b : signed(31 downto 0) := CREATE_FP(0.0);
    
    -- Declare Internal Variables
    signal e_nan : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable i_na_b_update : signed(31 downto 0) := CREATE_FP(0.0);
        
        -- Internal Variables
        variable e_nan_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Update Operations
            e_nan_update := e_na_in;
            i_na_b_update := FP_MULT(g_nab, (v_in - e_nan));
            
            
            -- Map Outputs
            i_na_b_out <= i_na_b_update;
            i_na_b <= i_na_b_update;
            
            -- Map Internal Variables
            e_nan <= e_nan_update;

        end if;
    end process;
end architecture;