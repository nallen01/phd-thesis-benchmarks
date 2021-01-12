library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity SodiumChannel is
    generic(
        g_na : signed(31 downto 0) := CREATE_FP(120.0)
    );

    port (
        clk : in std_logic;
        
        -- Declare Inputs
        time_in : in signed(31 downto 0);
        v_in : in signed(31 downto 0);
        e_r_in : in signed(31 downto 0);
        m_private_in : in signed(31 downto 0);
        h_private_in : in signed(31 downto 0);
        
        -- Declare Outputs
        i_na_out : out signed(31 downto 0);
        time_private_out : out signed(31 downto 0);
        v_private_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of SodiumChannel is
    
    -- Declare Outputs
    signal i_na : signed(31 downto 0) := CREATE_FP(0.0);
    signal time_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal v_private : signed(31 downto 0) := CREATE_FP(0.0);
    
    -- Declare Internal Variables
    signal e_na : signed(31 downto 0) := CREATE_FP(0.0);
    signal m : signed(31 downto 0) := CREATE_FP(0.0);
    signal h : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable i_na_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable time_private_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable v_private_update : signed(31 downto 0) := CREATE_FP(0.0);
        
        -- Internal Variables
        variable e_na_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable m_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable h_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Update Operations
            e_na_update := e_r_in + CREATE_FP(115.0);
            i_na_update := FP_MULT(FP_MULT(FP_MULT(g_na, (FP_POWER(m, CREATE_FP(3.0)))), h), (v_in - e_na));
            time_private_update := time_in;
            v_private_update := v_in;
            m_update := m_private_in;
            h_update := h_private_in;
            
            
            -- Map Outputs
            i_na_out <= i_na_update;
            i_na <= i_na_update;
            time_private_out <= time_private_update;
            time_private <= time_private_update;
            v_private_out <= v_private_update;
            v_private <= v_private_update;
            
            -- Map Internal Variables
            e_na <= e_na_update;
            m <= m_update;
            h <= h_update;

        end if;
    end process;
end architecture;