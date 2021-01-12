library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.lib.all;

package config is

    constant step_size : signed(31 downto 0) := CREATE_FP(0.001);

end package config;
