library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity TransientOutwardCurrent is
    generic(
        g_to : signed(31 downto 0) := CREATE_FP(0.294)
    );

    port (
        clk : in std_logic;
        
        -- Declare Inputs
        e_k_in : in signed(31 downto 0);
        v_in : in signed(31 downto 0);
        time_in : in signed(31 downto 0);
        s_private_in : in signed(31 downto 0);
        r_private_in : in signed(31 downto 0);
        
        -- Declare Outputs
        i_to_out : out signed(31 downto 0);
        v_private_out : out signed(31 downto 0);
        time_private_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of TransientOutwardCurrent is
    
    -- Declare Outputs
    signal i_to : signed(31 downto 0) := CREATE_FP(0.0);
    signal v_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal time_private : signed(31 downto 0) := CREATE_FP(0.0);
    
    -- Declare Internal Variables
    signal s : signed(31 downto 0) := CREATE_FP(0.0);
    signal r : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable i_to_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable v_private_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable time_private_update : signed(31 downto 0) := CREATE_FP(0.0);
        
        -- Internal Variables
        variable s_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable r_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Update Operations
            i_to_update := FP_MULT(FP_MULT(FP_MULT(FP_MULT(g_to, r), s), (v_in - e_k_in)), CREATE_FP(1.0000000000000002));
            v_private_update := v_in;
            time_private_update := time_in;
            s_update := s_private_in;
            r_update := r_private_in;
            
            
            -- Map Outputs
            i_to_out <= i_to_update;
            i_to <= i_to_update;
            v_private_out <= v_private_update;
            v_private <= v_private_update;
            time_private_out <= time_private_update;
            time_private <= time_private_update;
            
            -- Map Internal Variables
            s <= s_update;
            r <= r_update;

        end if;
    end process;
end architecture;