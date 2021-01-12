library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity LTypeCaCurrentDGate is
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
architecture behavior of LTypeCaCurrentDGate is
    
    -- Declare Outputs
    signal d : signed(31 downto 0) := CREATE_FP(0.0);
    
    -- Declare Internal Variables
    signal d_inf : signed(31 downto 0) := CREATE_FP(0.0);
    signal alpha_d : signed(31 downto 0) := CREATE_FP(0.0);
    signal beta_d : signed(31 downto 0) := CREATE_FP(0.0);
    signal gamma_d : signed(31 downto 0) := CREATE_FP(0.0);
    signal tau_d : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable d_update : signed(31 downto 0) := CREATE_FP(0.0);
        
        -- Internal Variables
        variable d_inf_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable alpha_d_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable beta_d_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable gamma_d_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable tau_d_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Flow Operations
            d_update := d + FP_MULT((FP_DIV((d_inf - d), tau_d)), step_size);
            
            -- Perform Update Operations
            d_inf_update := FP_DIV(CREATE_FP(1.0), (CREATE_FP(1.0) + FP_EXP((FP_DIV((CREATE_FP(-5.0) - v_in), CREATE_FP(7.5))))));
            alpha_d_update := FP_DIV(CREATE_FP(1.4), (CREATE_FP(1.0) + FP_EXP((FP_DIV((CREATE_FP(-35.0) - v_in), CREATE_FP(13.0)))))) + CREATE_FP(0.25);
            beta_d_update := FP_DIV(CREATE_FP(1.4), (CREATE_FP(1.0) + FP_EXP((FP_DIV((v_in + CREATE_FP(5.0)), CREATE_FP(5.0))))));
            gamma_d_update := FP_DIV(CREATE_FP(1.0), (CREATE_FP(1.0) + FP_EXP((FP_DIV((CREATE_FP(50.0) - v_in), CREATE_FP(20.0))))));
            tau_d_update := FP_MULT(FP_MULT(CREATE_FP(1.0), alpha_d), beta_d) + gamma_d;
            
            
            -- Map Outputs
            d_out <= d_update;
            d <= d_update;
            
            -- Map Internal Variables
            d_inf <= d_inf_update;
            alpha_d <= alpha_d_update;
            beta_d <= beta_d_update;
            gamma_d <= gamma_d_update;
            tau_d <= tau_d_update;

        end if;
    end process;
end architecture;