library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity LTypeCaCurrentFcaGate is
    port (
        clk : in std_logic;
        
        -- Declare Inputs
        ca_i_in : in signed(31 downto 0);
        v_in : in signed(31 downto 0);
        time_in : in signed(31 downto 0);
        
        -- Declare Outputs
        f_ca_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of LTypeCaCurrentFcaGate is

    -- Declare Custom Functions
    function FcaPw(fca_inf: signed(31 downto 0); f_ca: signed(31 downto 0); v: signed(31 downto 0); d_fca: signed(31 downto 0))
            return signed is
    begin
        if fca_inf > f_ca and v > CREATE_FP(-60.0) then
            return CREATE_FP(0.0);
        
        else
            return d_fca;
        
        end if;
    end FcaPw;
    
    -- Declare Outputs
    signal f_ca : signed(31 downto 0) := CREATE_FP(1.0);
    
    -- Declare Internal Variables
    signal alpha_fca : signed(31 downto 0) := CREATE_FP(0.0);
    signal beta_fca : signed(31 downto 0) := CREATE_FP(0.0);
    signal gama_fca : signed(31 downto 0) := CREATE_FP(0.0);
    signal fca_inf : signed(31 downto 0) := CREATE_FP(0.0);
    signal tau_fca : signed(31 downto 0) := CREATE_FP(0.0);
    signal d_fca : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable f_ca_update : signed(31 downto 0) := CREATE_FP(1.0);
        
        -- Internal Variables
        variable alpha_fca_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable beta_fca_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable gama_fca_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable fca_inf_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable tau_fca_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable d_fca_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Flow Operations
            f_ca_update := f_ca + FP_MULT(FcaPw(fca_inf, f_ca, v_in, d_fca), step_size);
            
            -- Perform Update Operations
            alpha_fca_update := FP_DIV(CREATE_FP(1.0), (CREATE_FP(1.0) + FP_POWER((FP_DIV(ca_i_in, CREATE_FP(3.25E-4))), CREATE_FP(8.0))));
            beta_fca_update := FP_DIV(CREATE_FP(0.1), (CREATE_FP(1.0) + FP_EXP((FP_DIV((ca_i_in - CREATE_FP(5.0E-4)), CREATE_FP(1.0E-4))))));
            gama_fca_update := FP_DIV(CREATE_FP(0.2), (CREATE_FP(1.0) + FP_EXP((FP_DIV((ca_i_in - CREATE_FP(7.5E-4)), CREATE_FP(8.0E-4))))));
            fca_inf_update := FP_DIV((alpha_fca + beta_fca + gama_fca + CREATE_FP(0.23)), CREATE_FP(1.46));
            tau_fca_update := CREATE_FP(2.0);
            d_fca_update := FP_DIV((fca_inf - f_ca_update), tau_fca);
            
            
            -- Map Outputs
            f_ca_out <= f_ca_update;
            f_ca <= f_ca_update;
            
            -- Map Internal Variables
            alpha_fca <= alpha_fca_update;
            beta_fca <= beta_fca_update;
            gama_fca <= gama_fca_update;
            fca_inf <= fca_inf_update;
            tau_fca <= tau_fca_update;
            d_fca <= d_fca_update;

        end if;
    end process;
end architecture;