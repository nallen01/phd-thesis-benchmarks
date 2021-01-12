library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity LTypeCaChannelDGate is
    port (
        clk : in std_logic;
        
        -- Declare Inputs
        v_in : in signed(31 downto 0);
        time_in : in signed(31 downto 0);
        
        -- Declare Outputs
        d_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of LTypeCaChannelDGate is
    
    -- Declare Outputs
    signal d : signed(31 downto 0) := CREATE_FP(0.0);
    
    -- Declare Internal Variables
    signal alpha_d : signed(31 downto 0) := CREATE_FP(0.0);
    signal beta_d : signed(31 downto 0) := CREATE_FP(0.0);
    signal d_infinity : signed(31 downto 0) := CREATE_FP(0.0);
    signal tau_d : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable d_update : signed(31 downto 0) := CREATE_FP(0.0);
        
        -- Internal Variables
        variable alpha_d_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable beta_d_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable d_infinity_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable tau_d_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Flow Operations
            d_update := d + FP_MULT((FP_MULT(alpha_d, (CREATE_FP(1.0) - d)) - FP_MULT(beta_d, d)), step_size);
            
            -- Perform Update Operations
            alpha_d_update := FP_DIV(d_infinity, tau_d);
            d_infinity_update := FP_DIV(CREATE_FP(1.0), (CREATE_FP(1.0) + FP_EXP(-(FP_DIV((v_in + CREATE_FP(10.0)), CREATE_FP(6.24))))));
            tau_d_update := FP_MULT(d_infinity, (FP_DIV((CREATE_FP(1.0) - FP_EXP(-(FP_DIV((v_in + CREATE_FP(10.0)), CREATE_FP(6.24))))), (FP_MULT(CREATE_FP(0.035), (v_in + CREATE_FP(10.0)))))));
            beta_d_update := FP_DIV((CREATE_FP(1.0) - d_infinity), tau_d);
            
            
            -- Map Outputs
            d_out <= d_update;
            d <= d_update;
            
            -- Map Internal Variables
            alpha_d <= alpha_d_update;
            beta_d <= beta_d_update;
            d_infinity <= d_infinity_update;
            tau_d <= tau_d_update;

        end if;
    end process;
end architecture;