library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity Environment is
    port (
        clk : in std_logic;
        
        -- Declare Outputs
        time_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of Environment is
    
    -- Declare Outputs
    signal time : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable time_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Flow Operations
            time_update := time + FP_MULT(CREATE_FP(1000.0), step_size);
            
            
            -- Map Outputs
            time_out <= time_update;
            time <= time_update;

        end if;
    end process;
end architecture;