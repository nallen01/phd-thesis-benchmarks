library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity Membrane is
    generic(
        cm : signed(31 downto 0) := CREATE_FP(1.0)
    );

    port (
        clk : in std_logic;
        
        -- Declare Inputs
        time_in : in signed(31 downto 0);
        i_na_in : in signed(31 downto 0);
        i_k_in : in signed(31 downto 0);
        i_l_in : in signed(31 downto 0);
        
        -- Declare Outputs
        v_out : out signed(31 downto 0);
        e_r_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of Membrane is

    -- Declare Custom Functions
    function IStimPw(time: signed(31 downto 0))
            return signed is
    begin
        if time >= CREATE_FP(10.0) and time <= CREATE_FP(10.5) then
            return CREATE_FP(20.0);
        
        else
            return CREATE_FP(0.0);
        
        end if;
    end IStimPw;
    
    -- Declare Outputs
    signal v : signed(31 downto 0) := CREATE_FP(-75.0);
    signal e_r : signed(31 downto 0) := CREATE_FP(-75.0);
    
    -- Declare Internal Variables
    signal i_stim : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable v_update : signed(31 downto 0) := CREATE_FP(-75.0);
        variable e_r_update : signed(31 downto 0) := CREATE_FP(-75.0);
        
        -- Internal Variables
        variable i_stim_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Flow Operations
            v_update := v + FP_MULT((FP_DIV(-(-i_stim + i_na_in + i_k_in + i_l_in), cm)), step_size);
            
            -- Perform Update Operations
            i_stim_update := IStimPw(time_in);
            
            
            -- Map Outputs
            v_out <= v_update;
            v <= v_update;
            e_r_out <= e_r_update;
            e_r <= e_r_update;
            
            -- Map Internal Variables
            i_stim <= i_stim_update;

        end if;
    end process;
end architecture;