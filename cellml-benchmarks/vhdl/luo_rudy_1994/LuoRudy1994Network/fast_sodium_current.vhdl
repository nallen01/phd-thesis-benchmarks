library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity FastSodiumCurrent is
    generic(
        g_na : signed(31 downto 0) := CREATE_FP(0.16)
    );

    port (
        clk : in std_logic;
        
        -- Declare Inputs
        time_in : in signed(31 downto 0);
        v_in : in signed(31 downto 0);
        r_in : in signed(31 downto 0);
        f_in : in signed(31 downto 0);
        t_in : in signed(31 downto 0);
        nai_in : in signed(31 downto 0);
        nao_in : in signed(31 downto 0);
        m_private_in : in signed(31 downto 0);
        h_private_in : in signed(31 downto 0);
        j_private_in : in signed(31 downto 0);
        
        -- Declare Outputs
        i_na_out : out signed(31 downto 0);
        e_na_out : out signed(31 downto 0);
        time_private_out : out signed(31 downto 0);
        v_private_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of FastSodiumCurrent is
    
    -- Declare Outputs
    signal i_na : signed(31 downto 0) := CREATE_FP(0.0);
    signal e_na : signed(31 downto 0) := CREATE_FP(0.0);
    signal time_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal v_private : signed(31 downto 0) := CREATE_FP(0.0);
    
    -- Declare Internal Variables
    signal m : signed(31 downto 0) := CREATE_FP(0.0);
    signal h : signed(31 downto 0) := CREATE_FP(0.0);
    signal j : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable i_na_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable e_na_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable time_private_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable v_private_update : signed(31 downto 0) := CREATE_FP(0.0);
        
        -- Internal Variables
        variable m_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable h_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable j_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Update Operations
            i_na_update := FP_MULT(FP_MULT(FP_MULT(FP_MULT(g_na, (FP_POWER(m, CREATE_FP(3.0)))), h), j), (v_in - e_na));
            e_na_update := FP_MULT(FP_MULT((FP_DIV((FP_MULT(r_in, t_in)), f_in)), FP_LOG((FP_DIV(nao_in, nai_in)))), CREATE_FP(0.9999999999999998));
            time_private_update := time_in;
            v_private_update := v_in;
            m_update := m_private_in;
            h_update := h_private_in;
            j_update := j_private_in;
            
            
            -- Map Outputs
            i_na_out <= i_na_update;
            i_na <= i_na_update;
            e_na_out <= e_na_update;
            e_na <= e_na_update;
            time_private_out <= time_private_update;
            time_private <= time_private_update;
            v_private_out <= v_private_update;
            v_private <= v_private_update;
            
            -- Map Internal Variables
            m <= m_update;
            h <= h_update;
            j <= j_update;

        end if;
    end process;
end architecture;