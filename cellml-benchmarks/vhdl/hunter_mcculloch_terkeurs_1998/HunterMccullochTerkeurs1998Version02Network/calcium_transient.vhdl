library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity CalciumTransient is
    generic(
        ca_max : signed(31 downto 0) := CREATE_FP(1.0);
        tau_ca : signed(31 downto 0) := CREATE_FP(0.06);
        ca_o : signed(31 downto 0) := CREATE_FP(0.01)
    );

    port (
        clk : in std_logic;
        
        -- Declare Inputs
        time_in : in signed(31 downto 0);
        
        -- Declare Outputs
        ca_i_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of CalciumTransient is
    
    -- Declare Outputs
    signal ca_i : signed(31 downto 0) := CREATE_FP(10.0);
begin
    process(clk)
        
        -- Outputs
        variable ca_i_update : signed(31 downto 0) := CREATE_FP(10.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Flow Operations
            ca_i_update := ca_i + FP_MULT(FP_MULT(CREATE_FP(1.0), (ca_o + FP_MULT(FP_MULT((ca_max - ca_o), (FP_DIV(time_in, tau_ca))), FP_EXP((FP_DIV((CREATE_FP(1.0) - time_in), tau_ca)))))), step_size);
            
            
            -- Map Outputs
            ca_i_out <= ca_i_update;
            ca_i <= ca_i_update;

        end if;
    end process;
end architecture;