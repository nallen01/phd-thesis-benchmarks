library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity LengthIndependentTension is
    port (
        clk : in std_logic;
        
        -- Declare Inputs
        z_in : in signed(31 downto 0);
        z_max_in : in signed(31 downto 0);
        
        -- Declare Outputs
        t_ref_out : out signed(31 downto 0);
        t_base_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of LengthIndependentTension is
    
    -- Declare Outputs
    signal t_ref : signed(31 downto 0) := CREATE_FP(56.2);
    signal t_base : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable t_ref_update : signed(31 downto 0) := CREATE_FP(56.2);
        variable t_base_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Update Operations
            t_base_update := FP_DIV((FP_MULT(t_ref, z_in)), z_max_in);
            
            
            -- Map Outputs
            t_ref_out <= t_ref_update;
            t_ref <= t_ref_update;
            t_base_out <= t_base_update;
            t_base <= t_base_update;

        end if;
    end process;
end architecture;