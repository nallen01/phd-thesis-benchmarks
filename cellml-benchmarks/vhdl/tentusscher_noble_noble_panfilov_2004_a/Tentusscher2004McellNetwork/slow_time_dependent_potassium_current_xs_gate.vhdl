library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity SlowTimeDependentPotassiumCurrentXsGate is
    port (
        clk : in std_logic;
        
        -- Declare Inputs
        v_in : in signed(31 downto 0);
        time_in : in signed(31 downto 0);
        
        -- Declare Outputs
        xs_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of SlowTimeDependentPotassiumCurrentXsGate is
    
    -- Declare Outputs
    signal xs : signed(31 downto 0) := CREATE_FP(0.0);
    
    -- Declare Internal Variables
    signal xs_inf : signed(31 downto 0) := CREATE_FP(0.0);
    signal alpha_xs : signed(31 downto 0) := CREATE_FP(0.0);
    signal beta_xs : signed(31 downto 0) := CREATE_FP(0.0);
    signal tau_xs : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable xs_update : signed(31 downto 0) := CREATE_FP(0.0);
        
        -- Internal Variables
        variable xs_inf_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable alpha_xs_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable beta_xs_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable tau_xs_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Flow Operations
            xs_update := xs + FP_MULT((FP_DIV((xs_inf - xs), tau_xs)), step_size);
            
            -- Perform Update Operations
            xs_inf_update := FP_DIV(CREATE_FP(1.0), (CREATE_FP(1.0) + FP_EXP((FP_DIV((CREATE_FP(-5.0) - v_in), CREATE_FP(14.0))))));
            alpha_xs_update := FP_DIV(CREATE_FP(1100.0), FP_SQRT((CREATE_FP(1.0) + FP_EXP((FP_DIV((CREATE_FP(-10.0) - v_in), CREATE_FP(6.0)))))));
            beta_xs_update := FP_DIV(CREATE_FP(1.0), (CREATE_FP(1.0) + FP_EXP((FP_DIV((v_in - CREATE_FP(60.0)), CREATE_FP(20.0))))));
            tau_xs_update := FP_MULT(FP_MULT(CREATE_FP(1.0), alpha_xs), beta_xs);
            
            
            -- Map Outputs
            xs_out <= xs_update;
            xs <= xs_update;
            
            -- Map Internal Variables
            xs_inf <= xs_inf_update;
            alpha_xs <= alpha_xs_update;
            beta_xs <= beta_xs_update;
            tau_xs <= tau_xs_update;

        end if;
    end process;
end architecture;