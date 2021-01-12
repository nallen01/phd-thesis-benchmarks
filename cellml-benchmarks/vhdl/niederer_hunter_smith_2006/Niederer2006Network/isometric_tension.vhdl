library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity IsometricTension is
    port (
        clk : in std_logic;
        
        -- Declare Inputs
        t_base_in : in signed(31 downto 0);
        overlap_in : in signed(31 downto 0);
        
        -- Declare Outputs
        t_0_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of IsometricTension is
    
    -- Declare Outputs
    signal t_0 : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable t_0_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Update Operations
            t_0_update := FP_MULT(t_base_in, overlap_in);
            
            
            -- Map Outputs
            t_0_out <= t_0_update;
            t_0 <= t_0_update;

        end if;
    end process;
end architecture;