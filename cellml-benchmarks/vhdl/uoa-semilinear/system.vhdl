library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.lib.all;

-- Entity
entity system is
    port (
        clk : in std_logic;
        
        -- Declare Outputs
        cell_v_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of system is
    -- Declare all internal signals
    signal uoa_semilinear_cell_v : signed(31 downto 0) := CREATE_FP(0.0);


    -- Declare base component
    component UoaSemilinear is
        port(
            clk : in std_logic;
            cell_v_out : out signed(31 downto 0)
        );
    end component UoaSemilinear;
begin
    -- Create base instance
    uoa_semilinear_inst : component UoaSemilinear
        port map(
            clk => clk,
            cell_v_out => uoa_semilinear_cell_v
        );

    -- Perform Mapping
    cell_v_out <= uoa_semilinear_cell_v;
end architecture;