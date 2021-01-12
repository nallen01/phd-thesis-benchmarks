library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity Interface is
    port (
        clk : in std_logic;
        
        -- Declare Inputs
        v_cyc_private_in : in signed(31 downto 0);
        net_free_energy_private_in : in signed(31 downto 0);
        
        -- Declare Outputs
        time_private_out : out signed(31 downto 0);
        vm_private_out : out signed(31 downto 0);
        cmgadp_private_out : out signed(31 downto 0);
        cna_i_private_out : out signed(31 downto 0);
        v_cyc_out : out signed(31 downto 0);
        net_free_energy_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of Interface is
    
    -- Declare Outputs
    signal time_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal vm_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal cmgadp_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal cna_i_private : signed(31 downto 0) := CREATE_FP(0.0);
    signal v_cyc : signed(31 downto 0) := CREATE_FP(0.0);
    signal net_free_energy : signed(31 downto 0) := CREATE_FP(0.0);
    
    -- Declare Internal Variables
    signal time : signed(31 downto 0) := CREATE_FP(0.0);
    signal vm : signed(31 downto 0) := CREATE_FP(-150.0);
    signal c_mg_a_d_p : signed(31 downto 0) := CREATE_FP(0.01);
    signal cna_i : signed(31 downto 0) := CREATE_FP(50.0);
begin
    process(clk)
        
        -- Outputs
        variable time_private_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable vm_private_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable cmgadp_private_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable cna_i_private_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable v_cyc_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable net_free_energy_update : signed(31 downto 0) := CREATE_FP(0.0);
        
        -- Internal Variables
        variable time_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable vm_update : signed(31 downto 0) := CREATE_FP(-150.0);
        variable c_mg_a_d_p_update : signed(31 downto 0) := CREATE_FP(0.01);
        variable cna_i_update : signed(31 downto 0) := CREATE_FP(50.0);


    begin
        if clk'event and clk = '1' then
            -- Perform Flow Operations
            vm_update := vm + FP_MULT(CREATE_FP(1.0), step_size);
            c_mg_a_d_p_update := c_mg_a_d_p + FP_MULT(CREATE_FP(0.0), step_size);
            cna_i_update := cna_i + FP_MULT(CREATE_FP(0.0), step_size);
            time_update := time + FP_MULT(CREATE_FP(1000.0), step_size);
            
            -- Perform Update Operations
            time_private_update := time_update;
            vm_private_update := vm_update;
            cmgadp_private_update := c_mg_a_d_p_update;
            cna_i_private_update := cna_i_update;
            v_cyc_update := v_cyc_private_in;
            net_free_energy_update := net_free_energy_private_in;
            
            
            -- Map Outputs
            time_private_out <= time_private_update;
            time_private <= time_private_update;
            vm_private_out <= vm_private_update;
            vm_private <= vm_private_update;
            cmgadp_private_out <= cmgadp_private_update;
            cmgadp_private <= cmgadp_private_update;
            cna_i_private_out <= cna_i_private_update;
            cna_i_private <= cna_i_private_update;
            v_cyc_out <= v_cyc_update;
            v_cyc <= v_cyc_update;
            net_free_energy_out <= net_free_energy_update;
            net_free_energy <= net_free_energy_update;
            
            -- Map Internal Variables
            time <= time_update;
            vm <= vm_update;
            c_mg_a_d_p <= c_mg_a_d_p_update;
            cna_i <= cna_i_update;

        end if;
    end process;
end architecture;