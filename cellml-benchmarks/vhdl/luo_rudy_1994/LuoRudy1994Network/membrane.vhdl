library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity Membrane is
    generic(
        cm : signed(31 downto 0) := CREATE_FP(0.01);
        i_st : signed(31 downto 0) := CREATE_FP(0.0)
    );

    port (
        clk : in std_logic;
        
        -- Declare Inputs
        time_in : in signed(31 downto 0);
        i_na_in : in signed(31 downto 0);
        i_ca_l_in : in signed(31 downto 0);
        i_k_in : in signed(31 downto 0);
        i_naca_in : in signed(31 downto 0);
        i_k1_in : in signed(31 downto 0);
        i_kp_in : in signed(31 downto 0);
        i_p_ca_in : in signed(31 downto 0);
        i_na_b_in : in signed(31 downto 0);
        i_ca_b_in : in signed(31 downto 0);
        i_nak_in : in signed(31 downto 0);
        i_ns_ca_in : in signed(31 downto 0);
        
        -- Declare Outputs
        v_out : out signed(31 downto 0);
        r_out : out signed(31 downto 0);
        t_out : out signed(31 downto 0);
        f_out : out signed(31 downto 0);
        dv_dt_out : out signed(31 downto 0);
        i_stim_c_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of Membrane is
    
    -- Declare Outputs
    signal v : signed(31 downto 0) := CREATE_FP(-84.624);
    signal r : signed(31 downto 0) := CREATE_FP(8314.5);
    signal t : signed(31 downto 0) := CREATE_FP(310.0);
    signal f : signed(31 downto 0) := CREATE_FP(96845.0);
    signal dv_dt : signed(31 downto 0) := CREATE_FP(0.0);
    signal i_stim_c : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable v_update : signed(31 downto 0) := CREATE_FP(-84.624);
        variable r_update : signed(31 downto 0) := CREATE_FP(8314.5);
        variable t_update : signed(31 downto 0) := CREATE_FP(310.0);
        variable f_update : signed(31 downto 0) := CREATE_FP(96845.0);
        variable dv_dt_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable i_stim_c_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Flow Operations
            v_update := v + FP_MULT(dv_dt, step_size);
            
            -- Perform Update Operations
            dv_dt_update := FP_DIV((i_st - (i_na_in + i_ca_l_in + i_k_in + i_k1_in + i_kp_in + i_naca_in + i_p_ca_in + i_na_b_in + i_ca_b_in + i_nak_in + i_ns_ca_in)), cm);
            i_stim_c_update := i_st;
            
            
            -- Map Outputs
            v_out <= v_update;
            v <= v_update;
            r_out <= r_update;
            r <= r_update;
            t_out <= t_update;
            t <= t_update;
            f_out <= f_update;
            f <= f_update;
            dv_dt_out <= dv_dt_update;
            dv_dt <= dv_dt_update;
            i_stim_c_out <= i_stim_c_update;
            i_stim_c <= i_stim_c_update;

        end if;
    end process;
end architecture;