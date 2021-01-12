library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity IntracellularIonConcentrations is
    port (
        clk : in std_logic;
        
        -- Declare Inputs
        time_in : in signed(31 downto 0);
        ca_trpn_max_in : in signed(31 downto 0);
        j_trpn_in : in signed(31 downto 0);
        
        -- Declare Outputs
        ca_i_out : out signed(31 downto 0);
        ca_b_out : out signed(31 downto 0);
        trpn_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of IntracellularIonConcentrations is

    -- Declare Custom Functions
    function CaIPw(time: signed(31 downto 0))
            return signed is
    begin
        if time < CREATE_FP(1.0) then
            return FP_MULT(CREATE_FP(1000.0), CREATE_FP(1.8433));
        
        elsif time >= CREATE_FP(10.0) and time < CREATE_FP(15.0) then
            return FP_MULT(CREATE_FP(1000.0), (((FP_MULT(CREATE_FP(1.055), (FP_POWER((FP_DIV(time, CREATE_FP(1000.0))), CREATE_FP(3.0)))) - FP_MULT(CREATE_FP(0.03507), (FP_POWER((FP_DIV(time, CREATE_FP(1000.0))), CREATE_FP(2.0))))) + FP_DIV((FP_MULT(CREATE_FP(3.992E-4), time)), CREATE_FP(1000.0))) - CREATE_FP(1.356)));
        
        elsif time >= CREATE_FP(15.0) and time < CREATE_FP(55.0) then
            return FP_MULT(CREATE_FP(1000.0), (((FP_MULT(CREATE_FP(0.014), (FP_POWER((FP_DIV(time, CREATE_FP(1000.0))), CREATE_FP(3.0)))) - FP_MULT(CREATE_FP(0.002555), (FP_POWER((FP_DIV(time, CREATE_FP(1000.0))), CREATE_FP(2.0))))) + FP_DIV((FP_MULT(CREATE_FP(1.494E-4), time)), CREATE_FP(1000.0))) - CREATE_FP(1.428)));
        
        elsif time >= CREATE_FP(55.0) and time < CREATE_FP(250.0) then
            return FP_MULT(CREATE_FP(1000.0), (((FP_MULT(CREATE_FP(1.739), (FP_POWER((FP_DIV(time, CREATE_FP(1000.0))), CREATE_FP(3.0)))) - FP_MULT(CREATE_FP(3.209), (FP_POWER((FP_DIV(time, CREATE_FP(1000.0))), CREATE_FP(2.0))))) - FP_DIV((FP_MULT(CREATE_FP(5.689), time)), CREATE_FP(1000.0))) + CREATE_FP(1.719)));
        
        elsif time >= CREATE_FP(250.0) and time < CREATE_FP(490.0) then
            return FP_MULT(CREATE_FP(1000.0), ((((FP_MULT(CREATE_FP(1.321E-4), (FP_POWER((FP_DIV(time, CREATE_FP(1000.0))), CREATE_FP(4.0)))) - FP_MULT(CREATE_FP(2.197E-4), (FP_POWER((FP_DIV(time, CREATE_FP(1000.0))), CREATE_FP(3.0))))) + FP_MULT(CREATE_FP(1.374E-4), (FP_POWER((FP_DIV(time, CREATE_FP(1000.0))), CREATE_FP(2.0))))) - FP_DIV((FP_MULT(CREATE_FP(3.895), time)), CREATE_FP(1000.0))) + CREATE_FP(4.441)));
        
        else
            return FP_MULT(CREATE_FP(1000.0), CREATE_FP(1.2148));
        
        end if;
    end CaIPw;
    
    -- Declare Outputs
    signal ca_i : signed(31 downto 0) := CREATE_FP(0.0);
    signal ca_b : signed(31 downto 0) := CREATE_FP(0.0);
    signal trpn : signed(31 downto 0) := CREATE_FP(0.067593139865);
begin
    process(clk)
        
        -- Outputs
        variable ca_i_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable ca_b_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable trpn_update : signed(31 downto 0) := CREATE_FP(0.067593139865);


    begin
        if clk'event and clk = '1' then
            -- Perform Flow Operations
            trpn_update := trpn + FP_MULT(j_trpn_in, step_size);
            
            -- Perform Update Operations
            ca_b_update := ca_trpn_max_in - trpn_update;
            ca_i_update := CaIPw(time_in);
            
            
            -- Map Outputs
            ca_i_out <= ca_i_update;
            ca_i <= ca_i_update;
            ca_b_out <= ca_b_update;
            ca_b <= ca_b_update;
            trpn_out <= trpn_update;
            trpn <= trpn_update;

        end if;
    end process;
end architecture;