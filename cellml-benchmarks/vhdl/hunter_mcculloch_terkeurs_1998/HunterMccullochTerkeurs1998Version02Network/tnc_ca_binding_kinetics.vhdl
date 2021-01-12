library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity TncCaBindingKinetics is
    generic(
        ca_b_max : signed(31 downto 0) := CREATE_FP(2.26);
        rho_0 : signed(31 downto 0) := CREATE_FP(100.0);
        rho_1 : signed(31 downto 0) := CREATE_FP(163.0)
    );

    port (
        clk : in std_logic;
        
        -- Declare Inputs
        time_in : in signed(31 downto 0);
        ca_i_in : in signed(31 downto 0);
        to_in : in signed(31 downto 0);
        t_in : in signed(31 downto 0);
        
        -- Declare Outputs
        ca_b_out : out signed(31 downto 0);
        lambda_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of TncCaBindingKinetics is
    
    -- Declare Outputs
    signal ca_b : signed(31 downto 0) := CREATE_FP(0.0);
    signal lambda : signed(31 downto 0) := CREATE_FP(2.6);
begin
    process(clk)
        
        -- Outputs
        variable ca_b_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable lambda_update : signed(31 downto 0) := CREATE_FP(2.6);


    begin
        if clk'event and clk = '1' then
            -- Perform Flow Operations
            ca_b_update := ca_b + FP_MULT((FP_MULT(FP_MULT(rho_0, ca_i_in), (ca_b_max - ca_b)) - FP_MULT(FP_MULT(rho_1, ca_b), (CREATE_FP(1.0) - FP_DIV(t_in, (FP_MULT(lambda, to_in)))))), step_size);
            
            
            -- Map Outputs
            ca_b_out <= ca_b_update;
            ca_b <= ca_b_update;
            lambda_out <= lambda_update;
            lambda <= lambda_update;

        end if;
    end process;
end architecture;