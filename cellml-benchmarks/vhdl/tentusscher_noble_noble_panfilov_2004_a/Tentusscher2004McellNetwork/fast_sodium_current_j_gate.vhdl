library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity FastSodiumCurrentJGate is
    port (
        clk : in std_logic;
        
        -- Declare Inputs
        v_in : in signed(31 downto 0);
        time_in : in signed(31 downto 0);
        
        -- Declare Outputs
        j_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of FastSodiumCurrentJGate is

    -- Declare Custom Functions
    function AlphaJPw(v: signed(31 downto 0))
            return signed is
    begin
        if v < CREATE_FP(-40.0) then
            return FP_DIV((FP_DIV((FP_MULT((FP_MULT(CREATE_FP(-25428.0), FP_EXP(FP_MULT(CREATE_FP(0.2444), v))) - FP_MULT(CREATE_FP(6.948), FP_EXP(FP_MULT(CREATE_FP(-0.04391), v)))), (v + CREATE_FP(37.78)))), CREATE_FP(1.0))), (CREATE_FP(1.0) + FP_EXP(FP_MULT(CREATE_FP(0.311), (v + CREATE_FP(79.23))))));
        
        else
            return CREATE_FP(0.0);
        
        end if;
    end AlphaJPw;
    function BetaJPw(v: signed(31 downto 0))
            return signed is
    begin
        if v < CREATE_FP(-40.0) then
            return FP_DIV((FP_MULT(CREATE_FP(0.02424), FP_EXP(FP_MULT(CREATE_FP(-0.01052), v)))), (CREATE_FP(1.0) + FP_EXP(FP_MULT(CREATE_FP(-0.1378), (v + CREATE_FP(40.14))))));
        
        else
            return FP_DIV((FP_MULT(CREATE_FP(0.6), FP_EXP(FP_MULT(CREATE_FP(0.057), v)))), (CREATE_FP(1.0) + FP_EXP(FP_MULT(CREATE_FP(-0.1), (v + CREATE_FP(32.0))))));
        
        end if;
    end BetaJPw;
    
    -- Declare Outputs
    signal j : signed(31 downto 0) := CREATE_FP(0.75);
    
    -- Declare Internal Variables
    signal j_inf : signed(31 downto 0) := CREATE_FP(0.0);
    signal alpha_j : signed(31 downto 0) := CREATE_FP(0.0);
    signal beta_j : signed(31 downto 0) := CREATE_FP(0.0);
    signal tau_j : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable j_update : signed(31 downto 0) := CREATE_FP(0.75);
        
        -- Internal Variables
        variable j_inf_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable alpha_j_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable beta_j_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable tau_j_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Flow Operations
            j_update := j + FP_MULT((FP_DIV((j_inf - j), tau_j)), step_size);
            
            -- Perform Update Operations
            j_inf_update := FP_DIV(CREATE_FP(1.0), (FP_POWER((CREATE_FP(1.0) + FP_EXP((FP_DIV((v_in + CREATE_FP(71.55)), CREATE_FP(7.43))))), CREATE_FP(2.0))));
            alpha_j_update := AlphaJPw(v_in);
            beta_j_update := BetaJPw(v_in);
            tau_j_update := FP_DIV(CREATE_FP(1.0), (alpha_j + beta_j));
            
            
            -- Map Outputs
            j_out <= j_update;
            j <= j_update;
            
            -- Map Internal Variables
            j_inf <= j_inf_update;
            alpha_j <= alpha_j_update;
            beta_j <= beta_j_update;
            tau_j <= tau_j_update;

        end if;
    end process;
end architecture;