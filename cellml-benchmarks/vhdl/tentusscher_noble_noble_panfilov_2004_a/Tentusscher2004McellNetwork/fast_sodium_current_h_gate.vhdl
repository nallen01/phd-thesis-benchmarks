library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity FastSodiumCurrentHGate is
    port (
        clk : in std_logic;
        
        -- Declare Inputs
        v_in : in signed(31 downto 0);
        time_in : in signed(31 downto 0);
        
        -- Declare Outputs
        h_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of FastSodiumCurrentHGate is

    -- Declare Custom Functions
    function AlphaHPw(v: signed(31 downto 0))
            return signed is
    begin
        if v < CREATE_FP(-40.0) then
            return FP_MULT(CREATE_FP(0.057), FP_EXP((FP_DIV(-(v + CREATE_FP(80.0)), CREATE_FP(6.8)))));
        
        else
            return CREATE_FP(0.0);
        
        end if;
    end AlphaHPw;
    function BetaHPw(v: signed(31 downto 0))
            return signed is
    begin
        if v < CREATE_FP(-40.0) then
            return FP_MULT(CREATE_FP(2.7), FP_EXP(FP_MULT(CREATE_FP(0.079), v))) + FP_MULT(CREATE_FP(310000.0), FP_EXP(FP_MULT(CREATE_FP(0.3485), v)));
        
        else
            return FP_DIV(CREATE_FP(0.77), (FP_MULT(CREATE_FP(0.13), (CREATE_FP(1.0) + FP_EXP((FP_DIV((v + CREATE_FP(10.66)), CREATE_FP(-11.1))))))));
        
        end if;
    end BetaHPw;
    
    -- Declare Outputs
    signal h : signed(31 downto 0) := CREATE_FP(0.75);
    
    -- Declare Internal Variables
    signal h_inf : signed(31 downto 0) := CREATE_FP(0.0);
    signal alpha_h : signed(31 downto 0) := CREATE_FP(0.0);
    signal beta_h : signed(31 downto 0) := CREATE_FP(0.0);
    signal tau_h : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable h_update : signed(31 downto 0) := CREATE_FP(0.75);
        
        -- Internal Variables
        variable h_inf_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable alpha_h_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable beta_h_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable tau_h_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Flow Operations
            h_update := h + FP_MULT((FP_DIV((h_inf - h), tau_h)), step_size);
            
            -- Perform Update Operations
            h_inf_update := FP_DIV(CREATE_FP(1.0), (FP_POWER((CREATE_FP(1.0) + FP_EXP((FP_DIV((v_in + CREATE_FP(71.55)), CREATE_FP(7.43))))), CREATE_FP(2.0))));
            alpha_h_update := AlphaHPw(v_in);
            beta_h_update := BetaHPw(v_in);
            tau_h_update := FP_DIV(CREATE_FP(1.0), (alpha_h + beta_h));
            
            
            -- Map Outputs
            h_out <= h_update;
            h <= h_update;
            
            -- Map Internal Variables
            h_inf <= h_inf_update;
            alpha_h <= alpha_h_update;
            beta_h <= beta_h_update;
            tau_h <= tau_h_update;

        end if;
    end process;
end architecture;