library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity ThinFilamentKinetics is
    generic(
        c_50 : signed(31 downto 0) := CREATE_FP(1.0);
        pc_50_ref : signed(31 downto 0) := CREATE_FP(6.2);
        n_ref : signed(31 downto 0) := CREATE_FP(6.9);
        alpha_0 : signed(31 downto 0) := CREATE_FP(2.0);
        t_ref : signed(31 downto 0) := CREATE_FP(100.0);
        beta_0 : signed(31 downto 0) := CREATE_FP(1.45);
        beta_1 : signed(31 downto 0) := CREATE_FP(1.95);
        beta_2 : signed(31 downto 0) := CREATE_FP(0.31)
    );

    port (
        clk : in std_logic;
        
        -- Declare Inputs
        time_in : in signed(31 downto 0);
        ca_b_in : in signed(31 downto 0);
        lambda_in : in signed(31 downto 0);
        
        -- Declare Outputs
        to_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of ThinFilamentKinetics is
    
    -- Declare Outputs
    signal p_to : signed(31 downto 0) := CREATE_FP(0.0);
    
    -- Declare Internal Variables
    signal z : signed(31 downto 0) := CREATE_FP(0.0);
    signal pc_50 : signed(31 downto 0) := CREATE_FP(0.0);
    signal n : signed(31 downto 0) := CREATE_FP(4.5);
begin
    process(clk)
        
        -- Outputs
        variable to_update : signed(31 downto 0) := CREATE_FP(0.0);
        
        -- Internal Variables
        variable z_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable pc_50_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable n_update : signed(31 downto 0) := CREATE_FP(4.5);


    begin
        if clk'event and clk = '1' then
            -- Perform Flow Operations
            z_update := z + FP_MULT(FP_MULT(alpha_0, (FP_MULT((FP_POWER((FP_DIV(ca_b_in, c_50)), n)), (CREATE_FP(1.0) - z)) - z)), step_size);
            
            -- Perform Update Operations
            to_update := FP_MULT(FP_MULT(t_ref, (CREATE_FP(1.0) + FP_MULT(beta_0, (lambda_in - CREATE_FP(1.0))))), z_update);
            n_update := FP_MULT(n_ref, (CREATE_FP(1.0) + FP_MULT(beta_1, (lambda_in - CREATE_FP(1.0)))));
            pc_50_update := FP_MULT(pc_50_ref, (CREATE_FP(1.0) + FP_MULT(beta_2, (lambda_in - CREATE_FP(1.0)))));
            
            
            -- Map Outputs
            to_out <= to_update;
            p_to <= to_update;
            
            -- Map Internal Variables
            z <= z_update;
            pc_50 <= pc_50_update;
            n <= n_update;

        end if;
    end process;
end architecture;