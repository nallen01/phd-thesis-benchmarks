library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity SodiumDynamics is
    port (
        clk : in std_logic;
        
        -- Declare Inputs
        time_in : in signed(31 downto 0);
        f_in : in signed(31 downto 0);
        cm_in : in signed(31 downto 0);
        v_c_in : in signed(31 downto 0);
        i_na_in : in signed(31 downto 0);
        i_naca_in : in signed(31 downto 0);
        i_nak_in : in signed(31 downto 0);
        i_b_na_in : in signed(31 downto 0);
        
        -- Declare Outputs
        na_i_out : out signed(31 downto 0);
        na_o_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of SodiumDynamics is
    
    -- Declare Outputs
    signal na_i : signed(31 downto 0) := CREATE_FP(11.6);
    signal na_o : signed(31 downto 0) := CREATE_FP(140.0);
begin
    process(clk)
        
        -- Outputs
        variable na_i_update : signed(31 downto 0) := CREATE_FP(11.6);
        variable na_o_update : signed(31 downto 0) := CREATE_FP(140.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Flow Operations
            na_i_update := na_i + FP_MULT((FP_DIV((FP_MULT(FP_MULT(CREATE_FP(-1.0), (i_na_in + i_b_na_in + FP_MULT(CREATE_FP(3.0), i_nak_in) + FP_MULT(CREATE_FP(3.0), i_naca_in))), cm_in)), (FP_MULT(FP_MULT(CREATE_FP(1.0), v_c_in), f_in)))), step_size);
            
            
            -- Map Outputs
            na_i_out <= na_i_update;
            na_i <= na_i_update;
            na_o_out <= na_o_update;
            na_o <= na_o_update;

        end if;
    end process;
end architecture;