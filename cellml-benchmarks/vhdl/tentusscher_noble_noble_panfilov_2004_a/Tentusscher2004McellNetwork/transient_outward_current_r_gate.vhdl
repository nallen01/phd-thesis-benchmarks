library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity TransientOutwardCurrentRGate is
    port (
        clk : in std_logic;
        
        -- Declare Inputs
        v_in : in signed(31 downto 0);
        time_in : in signed(31 downto 0);
        
        -- Declare Outputs
        r_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of TransientOutwardCurrentRGate is
    
    -- Declare Outputs
    signal r : signed(31 downto 0) := CREATE_FP(0.0);
    
    -- Declare Internal Variables
    signal r_inf : signed(31 downto 0) := CREATE_FP(0.0);
    signal tau_r : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable r_update : signed(31 downto 0) := CREATE_FP(0.0);
        
        -- Internal Variables
        variable r_inf_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable tau_r_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Flow Operations
            r_update := r + FP_MULT((FP_DIV((r_inf - r), tau_r)), step_size);
            
            -- Perform Update Operations
            r_inf_update := FP_DIV(CREATE_FP(1.0), (CREATE_FP(1.0) + FP_EXP((FP_DIV((CREATE_FP(20.0) - v_in), CREATE_FP(6.0))))));
            tau_r_update := FP_MULT(CREATE_FP(9.5), FP_EXP((FP_DIV(-(FP_POWER((v_in + CREATE_FP(40.0)), CREATE_FP(2.0))), CREATE_FP(1800.0))))) + CREATE_FP(0.8);
            
            
            -- Map Outputs
            r_out <= r_update;
            r <= r_update;
            
            -- Map Internal Variables
            r_inf <= r_inf_update;
            tau_r <= tau_r_update;

        end if;
    end process;
end architecture;