library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity SodiumChannelMGate is
    port (
        clk : in std_logic;
        
        -- Declare Inputs
        v_in : in signed(31 downto 0);
        time_in : in signed(31 downto 0);
        
        -- Declare Outputs
        m_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of SodiumChannelMGate is
    
    -- Declare Outputs
    signal m : signed(31 downto 0) := CREATE_FP(0.05);
    
    -- Declare Internal Variables
    signal alpha_m : signed(31 downto 0) := CREATE_FP(0.0);
    signal beta_m : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable m_update : signed(31 downto 0) := CREATE_FP(0.05);
        
        -- Internal Variables
        variable alpha_m_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable beta_m_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Flow Operations
            m_update := m + FP_MULT((FP_MULT(alpha_m, (CREATE_FP(1.0) - m)) - FP_MULT(beta_m, m)), step_size);
            
            -- Perform Update Operations
            alpha_m_update := FP_DIV((FP_MULT(CREATE_FP(-0.1), (v_in + CREATE_FP(50.0)))), (FP_EXP((FP_DIV(-(v_in + CREATE_FP(50.0)), CREATE_FP(10.0)))) - CREATE_FP(1.0)));
            beta_m_update := FP_MULT(CREATE_FP(4.0), FP_EXP((FP_DIV(-(v_in + CREATE_FP(75.0)), CREATE_FP(18.0)))));
            
            
            -- Map Outputs
            m_out <= m_update;
            m <= m_update;
            
            -- Map Internal Variables
            alpha_m <= alpha_m_update;
            beta_m <= beta_m_update;

        end if;
    end process;
end architecture;