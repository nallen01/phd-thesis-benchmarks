library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.lib.all;

-- Entity
entity system is
    port (
        clk : in std_logic;
        
        -- Declare Outputs
        plant_x_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of system is
    -- Declare all internal signals
    signal nuclear_plant_plant_x : signed(31 downto 0) := CREATE_FP(0.0);


    -- Declare base component
    component NuclearPlant is
        port(
            clk : in std_logic;
            plant_x_out : out signed(31 downto 0)
        );
    end component NuclearPlant;
begin
    -- Create base instance
    nuclear_plant_inst : component NuclearPlant
        port map(
            clk => clk,
            plant_x_out => nuclear_plant_plant_x
        );

    -- Perform Mapping
    plant_x_out <= nuclear_plant_plant_x;
end architecture;