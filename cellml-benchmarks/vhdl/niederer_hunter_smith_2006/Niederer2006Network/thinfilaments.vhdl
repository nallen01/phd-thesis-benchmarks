library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity Thinfilaments is
    port (
        clk : in std_logic

    );
end;

-- Architecture
architecture behavior of Thinfilaments is
begin
    process(clk)


    begin
        if clk'event and clk = '1' then

        end if;
    end process;
end architecture;