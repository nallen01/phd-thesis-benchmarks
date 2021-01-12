library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.lib.all;

-- Entity
entity system is
    port (
        clk : in std_logic;
        
        -- Declare Outputs
        train_pos_out : out signed(31 downto 0);
        gate_pos_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of system is
    -- Declare all internal signals
    signal train_gate_train_pos : signed(31 downto 0) := CREATE_FP(0.0);
    signal train_gate_gate_pos : signed(31 downto 0) := CREATE_FP(0.0);


    -- Declare base component
    component TrainGate is
        port(
            clk : in std_logic;
            train_pos_out : out signed(31 downto 0);
            gate_pos_out : out signed(31 downto 0)
        );
    end component TrainGate;
begin
    -- Create base instance
    train_gate_inst : component TrainGate
        port map(
            clk => clk,
            train_pos_out => train_gate_train_pos,
            gate_pos_out => train_gate_gate_pos
        );

    -- Perform Mapping
    train_pos_out <= train_gate_train_pos;
    gate_pos_out <= train_gate_gate_pos;
end architecture;