library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity RapidTimeDependentPotassiumCurrent is
    generic(
        g_kr : signed(31 downto 0) := CREATE_FP(0.096)
    );

    port (
        clk : in std_logic;
        
        -- Declare Inputs
        e_k_in : in signed(31 downto 0);
        k_o_in : in signed(31 downto 0);
        time_in : in signed(31 downto 0);
        v_in : in signed(31 downto 0);
        xr1_private_in : in signed(31 downto 0);
        xr2_private_in : in signed(31 downto 0);
        
        -- Declare Outputs
        i_kr_out : out signed(31 downto 0);
        time_private_out : out signed(31 downto 0);
        v_private_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of RapidTimeDependentPotassiumCurrent is
    
    -- Declare Outputs
    signal i_kr : signed(31 downto 0) := CREATE_FP(0.0);
    signal time_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal v_private : signed(31 downto 0) := CREATE_FP(0.0);
    
    -- Declare Internal Variables
    signal xr1 : signed(31 downto 0) := CREATE_FP(0.0);
    signal xr2 : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable i_kr_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable time_private_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable v_private_update : signed(31 downto 0) := CREATE_FP(0.0);
        
        -- Internal Variables
        variable xr1_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable xr2_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Update Operations
            i_kr_update := FP_MULT(FP_MULT(FP_MULT(FP_MULT(FP_MULT(g_kr, FP_SQRT((FP_DIV(k_o_in, CREATE_FP(5.4))))), xr1), xr2), (v_in - e_k_in)), CREATE_FP(1.0000000000000002));
            time_private_update := time_in;
            v_private_update := v_in;
            xr1_update := xr1_private_in;
            xr2_update := xr2_private_in;
            
            
            -- Map Outputs
            i_kr_out <= i_kr_update;
            i_kr <= i_kr_update;
            time_private_out <= time_private_update;
            time_private <= time_private_update;
            v_private_out <= v_private_update;
            v_private <= v_private_update;
            
            -- Map Internal Variables
            xr1 <= xr1_update;
            xr2 <= xr2_update;

        end if;
    end process;
end architecture;