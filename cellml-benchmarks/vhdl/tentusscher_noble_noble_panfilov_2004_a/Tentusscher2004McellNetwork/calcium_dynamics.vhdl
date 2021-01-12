library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity CalciumDynamics is
    generic(
        tau_g : signed(31 downto 0) := CREATE_FP(2.0);
        a_rel : signed(31 downto 0) := CREATE_FP(0.016464);
        b_rel : signed(31 downto 0) := CREATE_FP(0.25);
        c_rel : signed(31 downto 0) := CREATE_FP(0.008232);
        k_up : signed(31 downto 0) := CREATE_FP(2.5E-4);
        v_leak : signed(31 downto 0) := CREATE_FP(8.0E-5);
        vmax_up : signed(31 downto 0) := CREATE_FP(4.25E-4);
        buf_c : signed(31 downto 0) := CREATE_FP(0.15);
        k_buf_c : signed(31 downto 0) := CREATE_FP(0.001);
        buf_sr : signed(31 downto 0) := CREATE_FP(10.0);
        k_buf_sr : signed(31 downto 0) := CREATE_FP(0.3);
        v_sr : signed(31 downto 0) := CREATE_FP(0.001094)
    );

    port (
        clk : in std_logic;
        
        -- Declare Inputs
        v_in : in signed(31 downto 0);
        v_c_in : in signed(31 downto 0);
        time_in : in signed(31 downto 0);
        d_in : in signed(31 downto 0);
        f_in : in signed(31 downto 0);
        cm_in : in signed(31 downto 0);
        i_cal_in : in signed(31 downto 0);
        i_naca_in : in signed(31 downto 0);
        i_p_ca_in : in signed(31 downto 0);
        i_b_ca_in : in signed(31 downto 0);
        
        -- Declare Outputs
        ca_i_out : out signed(31 downto 0);
        ca_o_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of CalciumDynamics is

    -- Declare Custom Functions
    function GInfPw(ca_i: signed(31 downto 0))
            return signed is
    begin
        if ca_i < CREATE_FP(3.5E-4) then
            return FP_DIV(CREATE_FP(1.0), (CREATE_FP(1.0) + FP_POWER((FP_DIV(ca_i, CREATE_FP(3.5E-4))), CREATE_FP(6.0))));
        
        else
            return FP_DIV(CREATE_FP(1.0), (CREATE_FP(1.0) + FP_POWER((FP_DIV(ca_i, CREATE_FP(3.5E-4))), CREATE_FP(16.0))));
        
        end if;
    end GInfPw;
    function GPw(g_inf: signed(31 downto 0); g: signed(31 downto 0); v: signed(31 downto 0); d_g: signed(31 downto 0))
            return signed is
    begin
        if g_inf > g and v > CREATE_FP(-60.0) then
            return CREATE_FP(0.0);
        
        else
            return d_g;
        
        end if;
    end GPw;
    
    -- Declare Outputs
    signal ca_i : signed(31 downto 0) := CREATE_FP(2.0E-4);
    signal ca_o : signed(31 downto 0) := CREATE_FP(2.0);
    
    -- Declare Internal Variables
    signal ca_sr : signed(31 downto 0) := CREATE_FP(0.2);
    signal i_rel : signed(31 downto 0) := CREATE_FP(0.0);
    signal i_up : signed(31 downto 0) := CREATE_FP(0.0);
    signal i_leak : signed(31 downto 0) := CREATE_FP(0.0);
    signal g : signed(31 downto 0) := CREATE_FP(1.0);
    signal g_inf : signed(31 downto 0) := CREATE_FP(0.0);
    signal ca_i_bufc : signed(31 downto 0) := CREATE_FP(0.0);
    signal ca_sr_bufsr : signed(31 downto 0) := CREATE_FP(0.0);
    signal d_g : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable ca_i_update : signed(31 downto 0) := CREATE_FP(2.0E-4);
        variable ca_o_update : signed(31 downto 0) := CREATE_FP(2.0);
        
        -- Internal Variables
        variable ca_sr_update : signed(31 downto 0) := CREATE_FP(0.2);
        variable i_rel_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable i_up_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable i_leak_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable g_update : signed(31 downto 0) := CREATE_FP(1.0);
        variable g_inf_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable ca_i_bufc_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable ca_sr_bufsr_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable d_g_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Flow Operations
            g_update := g + FP_MULT(GPw(g_inf, g, v_in, d_g), step_size);
            ca_i_update := ca_i + FP_MULT(FP_MULT(ca_i_bufc, (((i_leak - i_up) + i_rel) - FP_MULT((FP_DIV((FP_MULT(CREATE_FP(1.0), ((i_cal_in + i_b_ca_in + i_p_ca_in) - FP_MULT(CREATE_FP(2.0), i_naca_in)))), (FP_MULT(FP_MULT(FP_MULT(CREATE_FP(2.0), CREATE_FP(1.0)), v_c_in), f_in)))), cm_in))), step_size);
            ca_sr_update := ca_sr + FP_MULT(FP_MULT((FP_DIV((FP_MULT(ca_sr_bufsr, v_c_in)), v_sr)), (i_up - (i_rel + i_leak))), step_size);
            
            -- Perform Update Operations
            i_rel_update := FP_MULT(FP_MULT((FP_DIV((FP_MULT(a_rel, (FP_POWER(ca_sr_update, CREATE_FP(2.0))))), (FP_POWER(b_rel, CREATE_FP(2.0)) + FP_POWER(ca_sr_update, CREATE_FP(2.0)))) + c_rel), d_in), g_update);
            i_up_update := FP_DIV(vmax_up, (CREATE_FP(1.0) + FP_DIV((FP_POWER(k_up, CREATE_FP(2.0))), (FP_POWER(ca_i_update, CREATE_FP(2.0))))));
            i_leak_update := FP_MULT(v_leak, (ca_sr_update - ca_i_update));
            g_inf_update := GInfPw(ca_i_update);
            d_g_update := FP_DIV((g_inf - g_update), tau_g);
            ca_i_bufc_update := FP_DIV(CREATE_FP(1.0), (CREATE_FP(1.0) + FP_DIV((FP_MULT(buf_c, k_buf_c)), (FP_POWER((ca_i_update + k_buf_c), CREATE_FP(2.0))))));
            ca_sr_bufsr_update := FP_DIV(CREATE_FP(1.0), (CREATE_FP(1.0) + FP_DIV((FP_MULT(buf_sr, k_buf_sr)), (FP_POWER((ca_sr_update + k_buf_sr), CREATE_FP(2.0))))));
            
            
            -- Map Outputs
            ca_i_out <= ca_i_update;
            ca_i <= ca_i_update;
            ca_o_out <= ca_o_update;
            ca_o <= ca_o_update;
            
            -- Map Internal Variables
            ca_sr <= ca_sr_update;
            i_rel <= i_rel_update;
            i_up <= i_up_update;
            i_leak <= i_leak_update;
            g <= g_update;
            g_inf <= g_inf_update;
            ca_i_bufc <= ca_i_bufc_update;
            ca_sr_bufsr <= ca_sr_bufsr_update;
            d_g <= d_g_update;

        end if;
    end process;
end architecture;