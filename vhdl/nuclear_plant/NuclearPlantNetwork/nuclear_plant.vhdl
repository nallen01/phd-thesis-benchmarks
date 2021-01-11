library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.lib.all;

-- Entity
entity NuclearPlant is
    port (
        clk : in std_logic;
        
        -- Declare Outputs
        plant_x_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of NuclearPlant is
    -- Declare all internal signals
    signal plant_add1 : boolean := false;
    signal plant_remove1 : boolean := false;
    signal plant_add2 : boolean := false;
    signal plant_remove2 : boolean := false;
    signal plant_x : signed(31 downto 0) := CREATE_FP(0.0);
    signal controller_x : signed(31 downto 0) := CREATE_FP(0.0);
    signal controller_add1 : boolean := false;
    signal controller_remove1 : boolean := false;
    signal controller_add2 : boolean := false;
    signal controller_remove2 : boolean := false;

    -- Declare child components
    component Plant is
        port(
            clk : in std_logic;
            add1_in : in boolean;
            remove1_in : in boolean;
            add2_in : in boolean;
            remove2_in : in boolean;
            x_out : out signed(31 downto 0)
        );
    end component Plant;

    component Controller is
        port(
            clk : in std_logic;
            x_in : in signed(31 downto 0);
            add1_out : out boolean;
            remove1_out : out boolean;
            add2_out : out boolean;
            remove2_out : out boolean
        );
    end component Controller;

begin
    -- Create child instances
    plant_inst : component Plant
        port map(
            clk => clk,
            add1_in => plant_add1,
            remove1_in => plant_remove1,
            add2_in => plant_add2,
            remove2_in => plant_remove2,
            x_out => plant_x
        );

    controller_inst : component Controller
        port map(
            clk => clk,
            x_in => controller_x,
            add1_out => controller_add1,
            remove1_out => controller_remove1,
            add2_out => controller_add2,
            remove2_out => controller_remove2
        );

    -- Perform Mapping
    process(clk)
    begin
        if clk'event and clk = '1' then
            plant_x_out <= plant_x;
            plant_add1 <= controller_add1;
            plant_remove1 <= controller_remove1;
            plant_add2 <= controller_add2;
            plant_remove2 <= controller_remove2;
            controller_x <= plant_x;
        end if;
    end process;
end architecture;