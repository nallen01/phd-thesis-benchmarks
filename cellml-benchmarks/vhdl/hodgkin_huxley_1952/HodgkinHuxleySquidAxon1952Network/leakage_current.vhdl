library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity LeakageCurrent is
    generic(
        g_l : signed(31 downto 0) := CREATE_FP(0.3)
    );

    port (
        clk : in std_logic;
        
        -- Declare Inputs
        time_in : in signed(31 downto 0);
        v_in : in signed(31 downto 0);
        e_r_in : in signed(31 downto 0);
        
        -- Declare Outputs
        i_l_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of LeakageCurrent is
    
    -- Declare Outputs
    signal i_l : signed(31 downto 0) := CREATE_FP(0.0);
    
    -- Declare Internal Variables
    signal e_l : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable i_l_update : signed(31 downto 0) := CREATE_FP(0.0);
        
        -- Internal Variables
        variable e_l_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Update Operations
            e_l_update := e_r_in + CREATE_FP(10.613);
            i_l_update := FP_MULT(g_l, (v_in - e_l));
            
            
            -- Map Outputs
            i_l_out <= i_l_update;
            i_l <= i_l_update;
            
            -- Map Internal Variables
            e_l <= e_l_update;

        end if;
    end process;
end architecture;