library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity SodiumPotassiumPumpCurrent is
    generic(
        p_nak : signed(31 downto 0) := CREATE_FP(1.362);
        k_mk : signed(31 downto 0) := CREATE_FP(1.0);
        k_mna : signed(31 downto 0) := CREATE_FP(40.0)
    );

    port (
        clk : in std_logic;
        
        -- Declare Inputs
        k_o_in : in signed(31 downto 0);
        na_i_in : in signed(31 downto 0);
        time_in : in signed(31 downto 0);
        r_in : in signed(31 downto 0);
        f_in : in signed(31 downto 0);
        t_in : in signed(31 downto 0);
        v_in : in signed(31 downto 0);
        
        -- Declare Outputs
        i_nak_out : out signed(31 downto 0);
        v_private_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of SodiumPotassiumPumpCurrent is
    
    -- Declare Outputs
    signal i_nak : signed(31 downto 0) := CREATE_FP(0.0);
    signal v_private : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable i_nak_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable v_private_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Update Operations
            i_nak_update := FP_DIV((FP_DIV((FP_MULT((FP_DIV((FP_MULT(p_nak, k_o_in)), (k_o_in + k_mk))), na_i_in)), (na_i_in + k_mna))), (CREATE_FP(1.0) + FP_MULT(CREATE_FP(0.1245), FP_EXP((FP_DIV((FP_MULT(FP_MULT(CREATE_FP(-0.1), v_in), f_in)), (FP_MULT(r_in, t_in)))))) + FP_MULT(CREATE_FP(0.0353), FP_EXP((FP_DIV((FP_MULT(-v_in, f_in)), (FP_MULT(r_in, t_in))))))));
            v_private_update := v_in;
            
            
            -- Map Outputs
            i_nak_out <= i_nak_update;
            i_nak <= i_nak_update;
            v_private_out <= v_private_update;
            v_private <= v_private_update;

        end if;
    end process;
end architecture;