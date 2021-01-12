library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity TimeDependentPotassiumCurrentXiGate is
    port (
        clk : in std_logic;
        
        -- Declare Inputs
        v_in : in signed(31 downto 0);
        time_in : in signed(31 downto 0);
        
        -- Declare Outputs
        xi_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of TimeDependentPotassiumCurrentXiGate is
    
    -- Declare Outputs
    signal xi : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable xi_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Update Operations
            xi_update := FP_DIV(CREATE_FP(1.0), (CREATE_FP(1.0) + FP_EXP((FP_DIV((v_in - CREATE_FP(56.26)), CREATE_FP(32.1))))));
            
            
            -- Map Outputs
            xi_out <= xi_update;
            xi <= xi_update;

        end if;
    end process;
end architecture;