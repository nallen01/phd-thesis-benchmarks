library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity RapidTimeDependentPotassiumCurrentXr2Gate is
    port (
        clk : in std_logic;
        
        -- Declare Inputs
        v_in : in signed(31 downto 0);
        time_in : in signed(31 downto 0);
        
        -- Declare Outputs
        xr2_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of RapidTimeDependentPotassiumCurrentXr2Gate is
    
    -- Declare Outputs
    signal xr2 : signed(31 downto 0) := CREATE_FP(1.0);
    
    -- Declare Internal Variables
    signal xr2_inf : signed(31 downto 0) := CREATE_FP(0.0);
    signal alpha_xr2 : signed(31 downto 0) := CREATE_FP(0.0);
    signal beta_xr2 : signed(31 downto 0) := CREATE_FP(0.0);
    signal tau_xr2 : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable xr2_update : signed(31 downto 0) := CREATE_FP(1.0);
        
        -- Internal Variables
        variable xr2_inf_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable alpha_xr2_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable beta_xr2_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable tau_xr2_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Flow Operations
            xr2_update := xr2 + FP_MULT((FP_DIV((xr2_inf - xr2), tau_xr2)), step_size);
            
            -- Perform Update Operations
            xr2_inf_update := FP_DIV(CREATE_FP(1.0), (CREATE_FP(1.0) + FP_EXP((FP_DIV((v_in + CREATE_FP(88.0)), CREATE_FP(24.0))))));
            alpha_xr2_update := FP_DIV(CREATE_FP(3.0), (CREATE_FP(1.0) + FP_EXP((FP_DIV((CREATE_FP(-60.0) - v_in), CREATE_FP(20.0))))));
            beta_xr2_update := FP_DIV(CREATE_FP(1.12), (CREATE_FP(1.0) + FP_EXP((FP_DIV((v_in - CREATE_FP(60.0)), CREATE_FP(20.0))))));
            tau_xr2_update := FP_MULT(FP_MULT(CREATE_FP(1.0), alpha_xr2), beta_xr2);
            
            
            -- Map Outputs
            xr2_out <= xr2_update;
            xr2 <= xr2_update;
            
            -- Map Internal Variables
            xr2_inf <= xr2_inf_update;
            alpha_xr2 <= alpha_xr2_update;
            beta_xr2 <= beta_xr2_update;
            tau_xr2 <= tau_xr2_update;

        end if;
    end process;
end architecture;