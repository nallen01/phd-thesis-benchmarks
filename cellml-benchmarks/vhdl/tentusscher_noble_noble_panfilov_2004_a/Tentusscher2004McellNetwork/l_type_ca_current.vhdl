library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity LTypeCaCurrent is
    generic(
        g_cal : signed(31 downto 0) := CREATE_FP(1.75E-4)
    );

    port (
        clk : in std_logic;
        
        -- Declare Inputs
        ca_o_in : in signed(31 downto 0);
        ca_i_in : in signed(31 downto 0);
        r_in : in signed(31 downto 0);
        f_in : in signed(31 downto 0);
        t_in : in signed(31 downto 0);
        time_in : in signed(31 downto 0);
        v_in : in signed(31 downto 0);
        d_private_in : in signed(31 downto 0);
        f1_private_in : in signed(31 downto 0);
        fca_private_in : in signed(31 downto 0);
        
        -- Declare Outputs
        i_cal_out : out signed(31 downto 0);
        ca_i_private_out : out signed(31 downto 0);
        time_private_out : out signed(31 downto 0);
        v_private_out : out signed(31 downto 0);
        d_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of LTypeCaCurrent is
    
    -- Declare Outputs
    signal i_cal : signed(31 downto 0) := CREATE_FP(0.0);
    signal ca_i_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal time_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal v_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal d : signed(31 downto 0) := CREATE_FP(0.0);
    
    -- Declare Internal Variables
    signal f1 : signed(31 downto 0) := CREATE_FP(0.0);
    signal f_ca : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable i_cal_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable ca_i_private_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable time_private_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable v_private_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable d_update : signed(31 downto 0) := CREATE_FP(0.0);
        
        -- Internal Variables
        variable f1_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable f_ca_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Update Operations
            i_cal_update := FP_DIV((FP_MULT((FP_DIV((FP_MULT(FP_MULT(FP_MULT(FP_MULT(FP_MULT(FP_MULT(g_cal, d), f1), f_ca), CREATE_FP(4.0)), v_in), (FP_POWER(f_in, CREATE_FP(2.0))))), (FP_MULT(r_in, t_in)))), (FP_MULT(ca_i_in, FP_EXP((FP_DIV((FP_MULT(FP_MULT(CREATE_FP(2.0), v_in), f_in)), (FP_MULT(r_in, t_in)))))) - FP_MULT(CREATE_FP(0.341), ca_o_in)))), (FP_EXP((FP_DIV((FP_MULT(FP_MULT(CREATE_FP(2.0), v_in), f_in)), (FP_MULT(r_in, t_in))))) - CREATE_FP(1.0)));
            ca_i_private_update := ca_i_in;
            time_private_update := time_in;
            v_private_update := v_in;
            d_update := d_private_in;
            f1_update := f1_private_in;
            f_ca_update := fca_private_in;
            
            
            -- Map Outputs
            i_cal_out <= i_cal_update;
            i_cal <= i_cal_update;
            ca_i_private_out <= ca_i_private_update;
            ca_i_private <= ca_i_private_update;
            time_private_out <= time_private_update;
            time_private <= time_private_update;
            v_private_out <= v_private_update;
            v_private <= v_private_update;
            d_out <= d_update;
            d <= d_update;
            
            -- Map Internal Variables
            f1 <= f1_update;
            f_ca <= f_ca_update;

        end if;
    end process;
end architecture;