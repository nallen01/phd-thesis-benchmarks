library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity FastSodiumCurrentMGate is
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
architecture behavior of FastSodiumCurrentMGate is
    
    -- Declare Outputs
    signal m : signed(31 downto 0) := CREATE_FP(0.0);
    
    -- Declare Internal Variables
    signal m_inf : signed(31 downto 0) := CREATE_FP(0.0);
    signal alpha_m : signed(31 downto 0) := CREATE_FP(0.0);
    signal beta_m : signed(31 downto 0) := CREATE_FP(0.0);
    signal tau_m : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable m_update : signed(31 downto 0) := CREATE_FP(0.0);
        
        -- Internal Variables
        variable m_inf_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable alpha_m_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable beta_m_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable tau_m_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Flow Operations
            m_update := m + FP_MULT((FP_DIV((m_inf - m), tau_m)), step_size);
            
            -- Perform Update Operations
            m_inf_update := FP_DIV(CREATE_FP(1.0), (FP_POWER((CREATE_FP(1.0) + FP_EXP((FP_DIV((CREATE_FP(-56.86) - v_in), CREATE_FP(9.03))))), CREATE_FP(2.0))));
            alpha_m_update := FP_DIV(CREATE_FP(1.0), (CREATE_FP(1.0) + FP_EXP((FP_DIV((CREATE_FP(-60.0) - v_in), CREATE_FP(5.0))))));
            beta_m_update := FP_DIV(CREATE_FP(0.1), (CREATE_FP(1.0) + FP_EXP((FP_DIV((v_in + CREATE_FP(35.0)), CREATE_FP(5.0)))))) + FP_DIV(CREATE_FP(0.1), (CREATE_FP(1.0) + FP_EXP((FP_DIV((v_in - CREATE_FP(50.0)), CREATE_FP(200.0))))));
            tau_m_update := FP_MULT(FP_MULT(CREATE_FP(1.0), alpha_m), beta_m);
            
            
            -- Map Outputs
            m_out <= m_update;
            m <= m_update;
            
            -- Map Internal Variables
            m_inf <= m_inf_update;
            alpha_m <= alpha_m_update;
            beta_m <= beta_m_update;
            tau_m <= tau_m_update;

        end if;
    end process;
end architecture;