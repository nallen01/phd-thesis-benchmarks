library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity PlateauPotassiumCurrent is
    generic(
        g_kp : signed(31 downto 0) := CREATE_FP(1.83E-4)
    );

    port (
        clk : in std_logic;
        
        -- Declare Inputs
        time_in : in signed(31 downto 0);
        v_in : in signed(31 downto 0);
        e_k1_in : in signed(31 downto 0);
        
        -- Declare Outputs
        i_kp_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of PlateauPotassiumCurrent is
    
    -- Declare Outputs
    signal i_kp : signed(31 downto 0) := CREATE_FP(0.0);
    
    -- Declare Internal Variables
    signal e_kp : signed(31 downto 0) := CREATE_FP(0.0);
    signal kp : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable i_kp_update : signed(31 downto 0) := CREATE_FP(0.0);
        
        -- Internal Variables
        variable e_kp_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable kp_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Update Operations
            e_kp_update := e_k1_in;
            kp_update := FP_DIV(CREATE_FP(1.0), (CREATE_FP(1.0) + FP_EXP((FP_DIV((CREATE_FP(7.488) - v_in), CREATE_FP(5.98))))));
            i_kp_update := FP_MULT(FP_MULT(g_kp, kp), (v_in - e_kp));
            
            
            -- Map Outputs
            i_kp_out <= i_kp_update;
            i_kp <= i_kp_update;
            
            -- Map Internal Variables
            e_kp <= e_kp_update;
            kp <= kp_update;

        end if;
    end process;
end architecture;