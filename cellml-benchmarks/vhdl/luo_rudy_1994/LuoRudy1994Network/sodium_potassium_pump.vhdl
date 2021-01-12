library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity SodiumPotassiumPump is
    generic(
        i_nak1 : signed(31 downto 0) := CREATE_FP(0.015);
        k_mnai : signed(31 downto 0) := CREATE_FP(10.0);
        k_mko : signed(31 downto 0) := CREATE_FP(1.5)
    );

    port (
        clk : in std_logic;
        
        -- Declare Inputs
        time_in : in signed(31 downto 0);
        v_in : in signed(31 downto 0);
        r_in : in signed(31 downto 0);
        t_in : in signed(31 downto 0);
        f_in : in signed(31 downto 0);
        nai_in : in signed(31 downto 0);
        nao_in : in signed(31 downto 0);
        ko_in : in signed(31 downto 0);
        
        -- Declare Outputs
        i_nak_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of SodiumPotassiumPump is
    
    -- Declare Outputs
    signal i_nak : signed(31 downto 0) := CREATE_FP(0.0);
    
    -- Declare Internal Variables
    signal f_nak : signed(31 downto 0) := CREATE_FP(0.0);
    signal sigma : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable i_nak_update : signed(31 downto 0) := CREATE_FP(0.0);
        
        -- Internal Variables
        variable f_nak_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable sigma_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Update Operations
            f_nak_update := FP_DIV(CREATE_FP(1.0), (CREATE_FP(1.0) + FP_MULT(CREATE_FP(0.1245), FP_EXP(FP_MULT(CREATE_FP(-0.1), (FP_DIV((FP_MULT(v_in, f_in)), (FP_MULT(r_in, t_in))))))) + FP_MULT(FP_MULT(CREATE_FP(0.0365), sigma), FP_EXP(-(FP_DIV((FP_MULT(v_in, f_in)), (FP_MULT(r_in, t_in))))))));
            sigma_update := FP_MULT((FP_DIV(CREATE_FP(1.0), CREATE_FP(7.0))), (FP_EXP((FP_DIV(nao_in, CREATE_FP(67.3)))) - CREATE_FP(1.0)));
            i_nak_update := FP_MULT(FP_MULT(FP_MULT(FP_MULT(i_nak1, f_nak), (FP_DIV(CREATE_FP(1.0), (CREATE_FP(1.0) + FP_POWER((FP_DIV(k_mnai, nai_in)), CREATE_FP(1.5)))))), (FP_DIV(ko_in, (ko_in + k_mko)))), CREATE_FP(0.9999999999999999));
            
            
            -- Map Outputs
            i_nak_out <= i_nak_update;
            i_nak <= i_nak_update;
            
            -- Map Internal Variables
            f_nak <= f_nak_update;
            sigma <= sigma_update;

        end if;
    end process;
end architecture;