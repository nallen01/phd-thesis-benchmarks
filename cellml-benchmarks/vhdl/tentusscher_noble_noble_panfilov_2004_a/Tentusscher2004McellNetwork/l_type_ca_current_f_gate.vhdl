library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity LTypeCaCurrentFGate is
    port (
        clk : in std_logic;
        
        -- Declare Inputs
        v_in : in signed(31 downto 0);
        time_in : in signed(31 downto 0);
        
        -- Declare Outputs
        f_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of LTypeCaCurrentFGate is
    
    -- Declare Outputs
    signal f : signed(31 downto 0) := CREATE_FP(1.0);
    
    -- Declare Internal Variables
    signal f_inf : signed(31 downto 0) := CREATE_FP(0.0);
    signal tau_f : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable f_update : signed(31 downto 0) := CREATE_FP(1.0);
        
        -- Internal Variables
        variable f_inf_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable tau_f_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Flow Operations
            f_update := f + FP_MULT((FP_DIV((f_inf - f), tau_f)), step_size);
            
            -- Perform Update Operations
            f_inf_update := FP_DIV(CREATE_FP(1.0), (CREATE_FP(1.0) + FP_EXP((FP_DIV((v_in + CREATE_FP(20.0)), CREATE_FP(7.0))))));
            tau_f_update := FP_MULT(CREATE_FP(1125.0), FP_EXP((FP_DIV(-(FP_POWER((v_in + CREATE_FP(27.0)), CREATE_FP(2.0))), CREATE_FP(240.0))))) + CREATE_FP(80.0) + FP_DIV(CREATE_FP(165.0), (CREATE_FP(1.0) + FP_EXP((FP_DIV((CREATE_FP(25.0) - v_in), CREATE_FP(10.0))))));
            
            
            -- Map Outputs
            f_out <= f_update;
            f <= f_update;
            
            -- Map Internal Variables
            f_inf <= f_inf_update;
            tau_f <= tau_f_update;

        end if;
    end process;
end architecture;