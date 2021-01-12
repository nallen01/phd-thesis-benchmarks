library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity LTypeCaChannelFCaGate is
    generic(
        km_ca : signed(31 downto 0) := CREATE_FP(6.0E-4)
    );

    port (
        clk : in std_logic;
        
        -- Declare Inputs
        v_in : in signed(31 downto 0);
        time_in : in signed(31 downto 0);
        cai_in : in signed(31 downto 0);
        
        -- Declare Outputs
        f_ca_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of LTypeCaChannelFCaGate is
    
    -- Declare Outputs
    signal f_ca : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable f_ca_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Update Operations
            f_ca_update := FP_DIV(CREATE_FP(1.0), (CREATE_FP(1.0) + FP_POWER((FP_DIV(cai_in, km_ca)), CREATE_FP(2.0))));
            
            
            -- Map Outputs
            f_ca_out <= f_ca_update;
            f_ca <= f_ca_update;

        end if;
    end process;
end architecture;