library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity Membrane is
    generic(
        stim_start : signed(31 downto 0) := CREATE_FP(10.0);
        stim_period : signed(31 downto 0) := CREATE_FP(1000.0);
        stim_duration : signed(31 downto 0) := CREATE_FP(1.0);
        stim_amplitude : signed(31 downto 0) := CREATE_FP(52.0)
    );

    port (
        clk : in std_logic;
        
        -- Declare Inputs
        time_in : in signed(31 downto 0);
        i_k1_in : in signed(31 downto 0);
        i_to_in : in signed(31 downto 0);
        i_kr_in : in signed(31 downto 0);
        i_ks_in : in signed(31 downto 0);
        i_cal_in : in signed(31 downto 0);
        i_nak_in : in signed(31 downto 0);
        i_na_in : in signed(31 downto 0);
        i_b_na_in : in signed(31 downto 0);
        i_naca_in : in signed(31 downto 0);
        i_b_ca_in : in signed(31 downto 0);
        i_p_k_in : in signed(31 downto 0);
        i_p_ca_in : in signed(31 downto 0);
        
        -- Declare Outputs
        v_out : out signed(31 downto 0);
        r_out : out signed(31 downto 0);
        t_out : out signed(31 downto 0);
        f_out : out signed(31 downto 0);
        cm_out : out signed(31 downto 0);
        v_c_out : out signed(31 downto 0);
        i_stim_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of Membrane is

    -- Declare Custom Functions
    function IStimPw(time: signed(31 downto 0))
            return signed is
    begin
        if time - FP_MULT(FP_FLOOR((FP_DIV(time, stim_period))), stim_period) >= stim_start and time - FP_MULT(FP_FLOOR((FP_DIV(time, stim_period))), stim_period) <= stim_start + stim_duration then
            return -stim_amplitude;
        
        else
            return CREATE_FP(0.0);
        
        end if;
    end IStimPw;
    
    -- Declare Outputs
    signal v : signed(31 downto 0) := CREATE_FP(-86.2);
    signal r : signed(31 downto 0) := CREATE_FP(8314.472);
    signal t : signed(31 downto 0) := CREATE_FP(310.0);
    signal f : signed(31 downto 0) := CREATE_FP(96485.3415);
    signal cm : signed(31 downto 0) := CREATE_FP(0.185);
    signal v_c : signed(31 downto 0) := CREATE_FP(0.016404);
    signal i_stim : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable v_update : signed(31 downto 0) := CREATE_FP(-86.2);
        variable r_update : signed(31 downto 0) := CREATE_FP(8314.472);
        variable t_update : signed(31 downto 0) := CREATE_FP(310.0);
        variable f_update : signed(31 downto 0) := CREATE_FP(96485.3415);
        variable cm_update : signed(31 downto 0) := CREATE_FP(0.185);
        variable v_c_update : signed(31 downto 0) := CREATE_FP(0.016404);
        variable i_stim_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Flow Operations
            v_update := v + FP_MULT(FP_MULT((FP_DIV(CREATE_FP(-1.0), CREATE_FP(1.0))), (i_k1_in + i_to_in + i_kr_in + i_ks_in + i_cal_in + i_nak_in + i_na_in + i_b_na_in + i_naca_in + i_b_ca_in + i_p_k_in + i_p_ca_in + i_stim)), step_size);
            
            -- Perform Update Operations
            i_stim_update := IStimPw(time_in);
            
            
            -- Map Outputs
            v_out <= v_update;
            v <= v_update;
            r_out <= r_update;
            r <= r_update;
            t_out <= t_update;
            t <= t_update;
            f_out <= f_update;
            f <= f_update;
            cm_out <= cm_update;
            cm <= cm_update;
            v_c_out <= v_c_update;
            v_c <= v_c_update;
            i_stim_out <= i_stim_update;
            i_stim <= i_stim_update;

        end if;
    end process;
end architecture;