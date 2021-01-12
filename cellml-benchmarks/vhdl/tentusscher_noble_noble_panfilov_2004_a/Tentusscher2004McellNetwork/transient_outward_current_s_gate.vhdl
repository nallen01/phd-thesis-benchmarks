library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity TransientOutwardCurrentSGate is
    port (
        clk : in std_logic;
        
        -- Declare Inputs
        v_in : in signed(31 downto 0);
        time_in : in signed(31 downto 0);
        
        -- Declare Outputs
        s_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of TransientOutwardCurrentSGate is
    
    -- Declare Outputs
    signal s : signed(31 downto 0) := CREATE_FP(1.0);
    
    -- Declare Internal Variables
    signal s_inf : signed(31 downto 0) := CREATE_FP(0.0);
    signal tau_s : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable s_update : signed(31 downto 0) := CREATE_FP(1.0);
        
        -- Internal Variables
        variable s_inf_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable tau_s_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Flow Operations
            s_update := s + FP_MULT((FP_DIV((s_inf - s), tau_s)), step_size);
            
            -- Perform Update Operations
            s_inf_update := FP_DIV(CREATE_FP(1.0), (CREATE_FP(1.0) + FP_EXP((FP_DIV((v_in + CREATE_FP(20.0)), CREATE_FP(5.0))))));
            tau_s_update := FP_MULT(CREATE_FP(85.0), FP_EXP((FP_DIV(-(FP_POWER((v_in + CREATE_FP(45.0)), CREATE_FP(2.0))), CREATE_FP(320.0))))) + FP_DIV(CREATE_FP(5.0), (CREATE_FP(1.0) + FP_EXP((FP_DIV((v_in - CREATE_FP(20.0)), CREATE_FP(5.0)))))) + CREATE_FP(3.0);
            
            
            -- Map Outputs
            s_out <= s_update;
            s <= s_update;
            
            -- Map Internal Variables
            s_inf <= s_inf_update;
            tau_s <= tau_s_update;

        end if;
    end process;
end architecture;