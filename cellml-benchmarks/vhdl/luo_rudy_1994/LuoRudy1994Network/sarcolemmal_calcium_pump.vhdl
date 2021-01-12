library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity SarcolemmalCalciumPump is
    generic(
        k_mpca : signed(31 downto 0) := CREATE_FP(5.0E-4);
        i_pca : signed(31 downto 0) := CREATE_FP(0.0115)
    );

    port (
        clk : in std_logic;
        
        -- Declare Inputs
        time_in : in signed(31 downto 0);
        cai_in : in signed(31 downto 0);
        
        -- Declare Outputs
        i_p_ca_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of SarcolemmalCalciumPump is
    
    -- Declare Outputs
    signal i_p_ca : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable i_p_ca_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Update Operations
            i_p_ca_update := FP_MULT(FP_MULT(i_pca, (FP_DIV(cai_in, (k_mpca + cai_in)))), CREATE_FP(0.9999999999999999));
            
            
            -- Map Outputs
            i_p_ca_out <= i_p_ca_update;
            i_p_ca <= i_p_ca_update;

        end if;
    end process;
end architecture;