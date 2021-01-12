library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity CrossBridges is
    generic(
        a : signed(31 downto 0) := CREATE_FP(0.35);
        a_1 : signed(31 downto 0) := CREATE_FP(-29.0);
        a_2 : signed(31 downto 0) := CREATE_FP(138.0);
        a_3 : signed(31 downto 0) := CREATE_FP(129.0);
        alpha_1 : signed(31 downto 0) := CREATE_FP(0.03);
        alpha_2 : signed(31 downto 0) := CREATE_FP(0.13);
        alpha_3 : signed(31 downto 0) := CREATE_FP(0.625)
    );

    port (
        clk : in std_logic;
        
        -- Declare Inputs
        time_in : in signed(31 downto 0);
        d_extension_ratiodt_in : in signed(31 downto 0);
        t_0_in : in signed(31 downto 0);
        
        -- Declare Outputs
        tension_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of CrossBridges is

    -- Declare Custom Functions
    function TensionPw(q: signed(31 downto 0); t_0: signed(31 downto 0))
            return signed is
    begin
        if q < CREATE_FP(0.0) then
            return FP_DIV((FP_MULT(t_0, (FP_MULT(a, q) + CREATE_FP(1.0)))), (CREATE_FP(1.0) - q));
        
        else
            return FP_DIV((FP_MULT(t_0, (CREATE_FP(1.0) + FP_MULT((a + CREATE_FP(2.0)), q)))), (CREATE_FP(1.0) + q));
        
        end if;
    end TensionPw;
    
    -- Declare Outputs
    signal tension : signed(31 downto 0) := CREATE_FP(0.0);
    
    -- Declare Internal Variables
    signal q : signed(31 downto 0) := CREATE_FP(0.0);
    signal q_1 : signed(31 downto 0) := CREATE_FP(0.0);
    signal q_2 : signed(31 downto 0) := CREATE_FP(0.0);
    signal q_3 : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable tension_update : signed(31 downto 0) := CREATE_FP(0.0);
        
        -- Internal Variables
        variable q_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable q_1_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable q_2_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable q_3_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Flow Operations
            q_1_update := q_1 + FP_MULT((FP_MULT(a_1, d_extension_ratiodt_in) - FP_MULT(alpha_1, q_1)), step_size);
            q_2_update := q_2 + FP_MULT((FP_MULT(a_2, d_extension_ratiodt_in) - FP_MULT(alpha_2, q_2)), step_size);
            q_3_update := q_3 + FP_MULT((FP_MULT(a_3, d_extension_ratiodt_in) - FP_MULT(alpha_3, q_3)), step_size);
            
            -- Perform Update Operations
            q_update := q_1_update + q_2_update + q_3_update;
            tension_update := TensionPw(q, t_0_in);
            
            
            -- Map Outputs
            tension_out <= tension_update;
            tension <= tension_update;
            
            -- Map Internal Variables
            q <= q_update;
            q_1 <= q_1_update;
            q_2 <= q_2_update;
            q_3 <= q_3_update;

        end if;
    end process;
end architecture;