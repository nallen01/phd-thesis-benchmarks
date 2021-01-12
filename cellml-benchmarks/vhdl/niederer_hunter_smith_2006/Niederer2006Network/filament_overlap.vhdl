library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity FilamentOverlap is
    port (
        clk : in std_logic;
        
        -- Declare Inputs
        lambda_in : in signed(31 downto 0);
        
        -- Declare Outputs
        overlap_out : out signed(31 downto 0);
        beta_0_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of FilamentOverlap is
    
    -- Declare Outputs
    signal overlap : signed(31 downto 0) := CREATE_FP(0.0);
    signal beta_0 : signed(31 downto 0) := CREATE_FP(4.9);
begin
    process(clk)
        
        -- Outputs
        variable overlap_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable beta_0_update : signed(31 downto 0) := CREATE_FP(4.9);


    begin
        if clk'event and clk = '1' then
            -- Perform Update Operations
            overlap_update := CREATE_FP(1.0) + FP_MULT(beta_0, (lambda_in - CREATE_FP(1.0)));
            
            
            -- Map Outputs
            overlap_out <= overlap_update;
            overlap <= overlap_update;
            beta_0_out <= beta_0_update;
            beta_0 <= beta_0_update;

        end if;
    end process;
end architecture;