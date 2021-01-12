library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity CrossbridgeKinetics is
    generic(
        a : signed(31 downto 0) := CREATE_FP(0.5);
        a1 : signed(31 downto 0) := CREATE_FP(50.0);
        a2 : signed(31 downto 0) := CREATE_FP(175.0);
        a3 : signed(31 downto 0) := CREATE_FP(175.0);
        alpha_1 : signed(31 downto 0) := CREATE_FP(33.0);
        alpha_2 : signed(31 downto 0) := CREATE_FP(2850.0);
        alpha_3 : signed(31 downto 0) := CREATE_FP(2850.0);
        tau : signed(31 downto 0) := CREATE_FP(0.0)
    );

    port (
        clk : in std_logic;
        
        -- Declare Inputs
        time_in : in signed(31 downto 0);
        to_in : in signed(31 downto 0);
        
        -- Declare Outputs
        t_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of CrossbridgeKinetics is
    
    -- Declare Outputs
    signal t : signed(31 downto 0) := CREATE_FP(0.0);
    
    -- Declare Internal Variables
    signal q : signed(31 downto 0) := CREATE_FP(0.0);
    signal dlambda_dt : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable t_update : signed(31 downto 0) := CREATE_FP(0.0);
        
        -- Internal Variables
        variable q_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable dlambda_dt_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Update Operations
            dlambda_dt_update := FP_MULT((FP_DIV(alpha_1, a1)), (FP_DIV((FP_DIV(t, to_in) - CREATE_FP(1.0)), (FP_DIV(t, to_in) + a))));
            t_update := FP_MULT(to_in, (FP_DIV((CREATE_FP(1.0) + FP_MULT(a, q)), (CREATE_FP(1.0) - q))));
            q_update := FP_MULT(a1, FP_MULT(FP_MULT(FP_EXP(FP_MULT(-alpha_1, (time_in - tau))), dlambda_dt), tau)) + FP_MULT(a2, FP_MULT(FP_MULT(FP_EXP(FP_MULT(-alpha_2, (time_in - tau))), dlambda_dt), tau)) + FP_MULT(a3, FP_MULT(FP_MULT(FP_EXP(FP_MULT(-alpha_3, (time_in - tau))), dlambda_dt), tau));
            
            
            -- Map Outputs
            t_out <= t_update;
            t <= t_update;
            
            -- Map Internal Variables
            q <= q_update;
            dlambda_dt <= dlambda_dt_update;

        end if;
    end process;
end architecture;