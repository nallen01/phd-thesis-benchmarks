library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity RapidTimeDependentPotassiumCurrentXr1Gate is
    port (
        clk : in std_logic;
        
        -- Declare Inputs
        v_in : in signed(31 downto 0);
        time_in : in signed(31 downto 0);
        
        -- Declare Outputs
        xr1_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of RapidTimeDependentPotassiumCurrentXr1Gate is
    
    -- Declare Outputs
    signal xr1 : signed(31 downto 0) := CREATE_FP(0.0);
    
    -- Declare Internal Variables
    signal xr1_inf : signed(31 downto 0) := CREATE_FP(0.0);
    signal alpha_xr1 : signed(31 downto 0) := CREATE_FP(0.0);
    signal beta_xr1 : signed(31 downto 0) := CREATE_FP(0.0);
    signal tau_xr1 : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable xr1_update : signed(31 downto 0) := CREATE_FP(0.0);
        
        -- Internal Variables
        variable xr1_inf_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable alpha_xr1_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable beta_xr1_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable tau_xr1_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Flow Operations
            xr1_update := xr1 + FP_MULT((FP_DIV((xr1_inf - xr1), tau_xr1)), step_size);
            
            -- Perform Update Operations
            xr1_inf_update := FP_DIV(CREATE_FP(1.0), (CREATE_FP(1.0) + FP_EXP((FP_DIV((CREATE_FP(-26.0) - v_in), CREATE_FP(7.0))))));
            alpha_xr1_update := FP_DIV(CREATE_FP(450.0), (CREATE_FP(1.0) + FP_EXP((FP_DIV((CREATE_FP(-45.0) - v_in), CREATE_FP(10.0))))));
            beta_xr1_update := FP_DIV(CREATE_FP(6.0), (CREATE_FP(1.0) + FP_EXP((FP_DIV((v_in + CREATE_FP(30.0)), CREATE_FP(11.5))))));
            tau_xr1_update := FP_MULT(FP_MULT(CREATE_FP(1.0), alpha_xr1), beta_xr1);
            
            
            -- Map Outputs
            xr1_out <= xr1_update;
            xr1 <= xr1_update;
            
            -- Map Internal Variables
            xr1_inf <= xr1_inf_update;
            alpha_xr1 <= alpha_xr1_update;
            beta_xr1 <= beta_xr1_update;
            tau_xr1 <= tau_xr1_update;

        end if;
    end process;
end architecture;