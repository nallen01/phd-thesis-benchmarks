library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.lib.all;

-- Entity
entity TrainGate is
    port (
        clk : in std_logic;
        
        -- Declare Outputs
        train_pos_out : out signed(31 downto 0);
        gate_pos_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of TrainGate is
    -- Declare all internal signals
    signal train_gate_request_up : boolean := false;
    signal train_gate_request_down : boolean := false;
    signal train_position : signed(31 downto 0) := CREATE_FP(0.0);
    signal gate_gate_request_up : boolean := false;
    signal gate_gate_request_down : boolean := false;
    signal gate_position : signed(31 downto 0) := CREATE_FP(0.0);

    -- Declare child components
    component Train is
        generic(
            train_speed : signed(31 downto 0) := CREATE_FP(1.0)
        );
        port(
            clk : in std_logic;
            gate_request_up_out : out boolean;
            gate_request_down_out : out boolean;
            position_out : out signed(31 downto 0)
        );
    end component Train;

    component Gate is
        port(
            clk : in std_logic;
            gate_request_up_in : in boolean;
            gate_request_down_in : in boolean;
            position_out : out signed(31 downto 0)
        );
    end component Gate;

begin
    -- Create child instances
    train_inst : component Train
        port map(
            clk => clk,
            gate_request_up_out => train_gate_request_up,
            gate_request_down_out => train_gate_request_down,
            position_out => train_position
        );

    gate_inst : component Gate
        port map(
            clk => clk,
            gate_request_up_in => gate_gate_request_up,
            gate_request_down_in => gate_gate_request_down,
            position_out => gate_position
        );

    -- Perform Mapping
    train_pos_out <= train_position;
    gate_pos_out <= gate_position;
    gate_gate_request_up <= train_gate_request_up;
    gate_gate_request_down <= train_gate_request_down;
end architecture;