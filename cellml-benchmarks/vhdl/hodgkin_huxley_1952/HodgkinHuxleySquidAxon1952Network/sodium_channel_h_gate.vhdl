library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity SodiumChannelHGate is
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
architecture behavior of SodiumChannelHGate is
    
    -- Declare Outputs
    signal h : signed(31 downto 0) := CREATE_FP(0.6);
    
    -- Declare Internal Variables
    signal alpha_h : signed(31 downto 0) := CREATE_FP(0.0);
    signal beta_h : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable h_update : signed(31 downto 0) := CREATE_FP(0.6);
        
        -- Internal Variables
        variable alpha_h_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable beta_h_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Flow Operations
            h_update := h + FP_MULT((FP_MULT(alpha_h, (CREATE_FP(1.0) - h)) - FP_MULT(beta_h, h)), step_size);
            
            -- Perform Update Operations
            alpha_h_update := FP_MULT(CREATE_FP(0.07), FP_EXP((FP_DIV(-(v_in + CREATE_FP(75.0)), CREATE_FP(20.0)))));
            beta_h_update := FP_DIV(CREATE_FP(1.0), (FP_EXP((FP_DIV(-(v_in + CREATE_FP(45.0)), CREATE_FP(10.0)))) + CREATE_FP(1.0)));
            
            
            -- Map Outputs
            h_out <= h_update;
            h <= h_update;
            
            -- Map Internal Variables
            alpha_h <= alpha_h_update;
            beta_h <= beta_h_update;

        end if;
    end process;
end architecture;