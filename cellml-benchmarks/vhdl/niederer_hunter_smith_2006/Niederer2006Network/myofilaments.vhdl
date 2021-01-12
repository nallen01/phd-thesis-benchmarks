library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity Myofilaments is
    port (
        clk : in std_logic;
        
        -- Declare Inputs
        time_in : in signed(31 downto 0);
        
        -- Declare Outputs
        lambda_out : out signed(31 downto 0);
        extension_ratio_out : out signed(31 downto 0);
        d_extension_ratiodt_out : out signed(31 downto 0);
        lambda_prev_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of Myofilaments is

    -- Declare Custom Functions
    function ExtensionratioPw(time: signed(31 downto 0))
            return signed is
    begin
        if time > CREATE_FP(1000.0) then
            return CREATE_FP(1.0);
        
        else
            return CREATE_FP(1.0);
        
        end if;
    end ExtensionratioPw;
    function LambdaPw(extension_ratio: signed(31 downto 0))
            return signed is
    begin
        if extension_ratio > CREATE_FP(0.8) and extension_ratio <= CREATE_FP(1.15) then
            return extension_ratio;
        
        elsif extension_ratio > CREATE_FP(1.15) then
            return CREATE_FP(1.15);
        
        else
            return CREATE_FP(0.8);
        
        end if;
    end LambdaPw;
    
    -- Declare Outputs
    signal lambda : signed(31 downto 0) := CREATE_FP(0.0);
    signal extension_ratio : signed(31 downto 0) := CREATE_FP(0.0);
    signal d_extension_ratiodt : signed(31 downto 0) := CREATE_FP(0.0);
    signal lambda_prev : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        
        -- Outputs
        variable lambda_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable extension_ratio_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable d_extension_ratiodt_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable lambda_prev_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Update Operations
            extension_ratio_update := ExtensionratioPw(time_in);
            lambda_prev_update := extension_ratio;
            d_extension_ratiodt_update := CREATE_FP(0.0);
            lambda_update := LambdaPw(extension_ratio);
            
            
            -- Map Outputs
            lambda_out <= lambda_update;
            lambda <= lambda_update;
            extension_ratio_out <= extension_ratio_update;
            extension_ratio <= extension_ratio_update;
            d_extension_ratiodt_out <= d_extension_ratiodt_update;
            d_extension_ratiodt <= d_extension_ratiodt_update;
            lambda_prev_out <= lambda_prev_update;
            lambda_prev <= lambda_prev_update;

        end if;
    end process;
end architecture;