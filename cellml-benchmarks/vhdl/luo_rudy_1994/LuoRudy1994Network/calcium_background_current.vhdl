library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity CalciumBackgroundCurrent is
    generic(
        g_cab : signed(31 downto 0) := CREATE_FP(3.016E-5)
    );

    port (
        clk : in std_logic;
        
        -- Declare Inputs
        time_in : in signed(31 downto 0);
        v_in : in signed(31 downto 0);
        r_in : in signed(31 downto 0);
        t_in : in signed(31 downto 0);
        f_in : in signed(31 downto 0);
        cai_in : in signed(31 downto 0);
        cao_in : in signed(31 downto 0);
        
        -- Declare Outputs
        i_ca_b_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of CalciumBackgroundCurrent is
    
    -- Declare Outputs
    signal i_ca_b : signed(31 downto 0) := CREATE_FP(0.0);
    
    -- Declare Internal Variables
    signal e_can : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable i_ca_b_update : signed(31 downto 0) := CREATE_FP(0.0);
        
        -- Internal Variables
        variable e_can_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Update Operations
            e_can_update := FP_MULT(FP_MULT((FP_DIV((FP_MULT(r_in, t_in)), (FP_MULT(CREATE_FP(2.0), f_in)))), FP_LOG((FP_DIV(cao_in, cai_in)))), CREATE_FP(0.9999999999999998));
            i_ca_b_update := FP_MULT(g_cab, (v_in - e_can));
            
            
            -- Map Outputs
            i_ca_b_out <= i_ca_b_update;
            i_ca_b <= i_ca_b_update;
            
            -- Map Internal Variables
            e_can <= e_can_update;

        end if;
    end process;
end architecture;