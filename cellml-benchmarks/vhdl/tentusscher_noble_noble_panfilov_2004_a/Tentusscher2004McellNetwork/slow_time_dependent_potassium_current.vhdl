library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity SlowTimeDependentPotassiumCurrent is
    generic(
        g_ks : signed(31 downto 0) := CREATE_FP(0.062)
    );

    port (
        clk : in std_logic;
        
        -- Declare Inputs
        e_ks_in : in signed(31 downto 0);
        time_in : in signed(31 downto 0);
        v_in : in signed(31 downto 0);
        xs_private_in : in signed(31 downto 0);
        
        -- Declare Outputs
        i_ks_out : out signed(31 downto 0);
        time_private_out : out signed(31 downto 0);
        v_private_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of SlowTimeDependentPotassiumCurrent is
    
    -- Declare Outputs
    signal i_ks : signed(31 downto 0) := CREATE_FP(0.0);
    signal time_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal v_private : signed(31 downto 0) := CREATE_FP(0.0);
    
    -- Declare Internal Variables
    signal xs : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable i_ks_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable time_private_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable v_private_update : signed(31 downto 0) := CREATE_FP(0.0);
        
        -- Internal Variables
        variable xs_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Update Operations
            i_ks_update := FP_MULT(FP_MULT(FP_MULT(g_ks, (FP_POWER(xs, CREATE_FP(2.0)))), (v_in - e_ks_in)), CREATE_FP(1.0000000000000002));
            time_private_update := time_in;
            v_private_update := v_in;
            xs_update := xs_private_in;
            
            
            -- Map Outputs
            i_ks_out <= i_ks_update;
            i_ks <= i_ks_update;
            time_private_out <= time_private_update;
            time_private <= time_private_update;
            v_private_out <= v_private_update;
            v_private <= v_private_update;
            
            -- Map Internal Variables
            xs <= xs_update;

        end if;
    end process;
end architecture;