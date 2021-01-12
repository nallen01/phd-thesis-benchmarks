library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity PotassiumDynamics is
    port (
        clk : in std_logic;
        
        -- Declare Inputs
        time_in : in signed(31 downto 0);
        f_in : in signed(31 downto 0);
        cm_in : in signed(31 downto 0);
        v_c_in : in signed(31 downto 0);
        i_k1_in : in signed(31 downto 0);
        i_to_in : in signed(31 downto 0);
        i_nak_in : in signed(31 downto 0);
        i_kr_in : in signed(31 downto 0);
        i_ks_in : in signed(31 downto 0);
        i_p_k_in : in signed(31 downto 0);
        i_stim_in : in signed(31 downto 0);
        
        -- Declare Outputs
        k_i_out : out signed(31 downto 0);
        k_o_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of PotassiumDynamics is
    
    -- Declare Outputs
    signal k_i : signed(31 downto 0) := CREATE_FP(138.3);
    signal k_o : signed(31 downto 0) := CREATE_FP(5.4);
begin
    process(clk)
        
        -- Outputs
        variable k_i_update : signed(31 downto 0) := CREATE_FP(138.3);
        variable k_o_update : signed(31 downto 0) := CREATE_FP(5.4);


    begin
        if clk'event and clk = '1' then
            -- Perform Flow Operations
            k_i_update := k_i + FP_MULT((FP_DIV((FP_MULT(FP_MULT(CREATE_FP(-1.0), ((i_k1_in + i_to_in + i_kr_in + i_ks_in + i_p_k_in + i_stim_in) - FP_MULT(CREATE_FP(2.0), i_nak_in))), cm_in)), (FP_MULT(FP_MULT(CREATE_FP(1.0), v_c_in), f_in)))), step_size);
            
            
            -- Map Outputs
            k_i_out <= k_i_update;
            k_i <= k_i_update;
            k_o_out <= k_o_update;
            k_o <= k_o_update;

        end if;
    end process;
end architecture;