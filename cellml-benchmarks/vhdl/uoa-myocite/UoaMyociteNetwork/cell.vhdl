library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config.all;
use work.lib.all;

-- Entity
entity Cell is
    generic(
        c1 : signed(31 downto 0) := CREATE_FP(-8.7);
        c2 : signed(31 downto 0) := CREATE_FP(-190.9);
        c3 : signed(31 downto 0) := CREATE_FP(-190.4);
        c4 : signed(31 downto 0) := CREATE_FP(-23.6);
        c5 : signed(31 downto 0) := CREATE_FP(-45.5);
        c6 : signed(31 downto 0) := CREATE_FP(-12.9);
        c7 : signed(31 downto 0) := CREATE_FP(777200.0);
        c8 : signed(31 downto 0) := CREATE_FP(58900.0);
        c9 : signed(31 downto 0) := CREATE_FP(276600.0);
        c10 : signed(31 downto 0) := CREATE_FP(-6.9);
        c11 : signed(31 downto 0) := CREATE_FP(75.9);
        c12 : signed(31 downto 0) := CREATE_FP(6826.5);
        c13 : signed(31 downto 0) := CREATE_FP(-33.2);
        c14 : signed(31 downto 0) := CREATE_FP(20.0);
        c15 : signed(31 downto 0) := CREATE_FP(2.0);
        v_o : signed(31 downto 0) := CREATE_FP(131.1);
        v_t : signed(31 downto 0) := CREATE_FP(44.5);
        v_r : signed(31 downto 0) := CREATE_FP(30.0);
        v_n_r_max : signed(31 downto 0) := CREATE_FP(0.04);
        autorhythmic_rate : signed(31 downto 0) := CREATE_FP(0.0)
    );

    port (
        clk : in std_logic;
        
        -- Declare Inputs
        g_in : in signed(31 downto 0);
        
        -- Declare Outputs
        resting_out : out boolean;
        stimulated_out : out boolean;
        v_out : out signed(31 downto 0)

    );
end;

-- Architecture
architecture behavior of Cell is
    -- States
    type CELL_STATE is (
        CELL_Q0,
        CELL_Q1,
        CELL_Q2,
        CELL_Q3
    );

    -- Declare Custom Functions
    function F(theta: signed(31 downto 0))
            return signed is
    begin
        if theta >= v_n_r_max then
            return CREATE_FP(4.03947);
        
        end if;
        
        return FP_MULT(CREATE_FP(0.29), FP_EXP(FP_MULT(CREATE_FP(62.89), theta))) + FP_MULT(CREATE_FP(0.7), FP_EXP(FP_MULT(CREATE_FP(-10.99), theta)));
    end F;
    function CalculatePacingRate
            return signed is
    begin
        if autorhythmic_rate > CREATE_FP(0.0) then
            return FP_DIV(CREATE_FP(60.0), autorhythmic_rate);
        
        end if;
        
        return CREATE_FP(0.0);
    end CalculatePacingRate;

    -- Declare State
    signal state : CELL_STATE := CELL_Q0;
    
    -- Declare Outputs
    signal resting : boolean := true;
    signal stimulated : boolean := false;
    signal v : signed(31 downto 0) := CREATE_FP(0.0);
    
    -- Declare Internal Variables
    signal pacing_rate : signed(31 downto 0) := CalculatePacingRate;
    signal t_auto : signed(31 downto 0) := CREATE_FP(0.0);
    signal v_x : signed(31 downto 0) := CREATE_FP(0.0);
    signal v_y : signed(31 downto 0) := CREATE_FP(0.0);
    signal v_z : signed(31 downto 0) := CREATE_FP(0.0);
    signal theta : signed(31 downto 0) := CREATE_FP(0.0);
    signal f_theta : signed(31 downto 0) := CREATE_FP(0.0);
begin
    process(clk)
        -- State Variable
        variable state_update : CELL_STATE := CELL_Q0;
        
        -- Outputs
        variable resting_update : boolean := true;
        variable stimulated_update : boolean := false;
        variable v_update : signed(31 downto 0) := CREATE_FP(0.0);
        
        -- Internal Variables
        variable pacing_rate_update : signed(31 downto 0) := CalculatePacingRate;
        variable t_auto_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable v_x_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable v_y_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable v_z_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable theta_update : signed(31 downto 0) := CREATE_FP(0.0);
        variable f_theta_update : signed(31 downto 0) := CREATE_FP(0.0);


    begin
        if clk'event and clk = '1' then
            -- Run the state machine for transition logic
            if  state = CELL_Q0 then -- Logic for state q0
                if pacing_rate > CREATE_FP(0.0) and t_auto >= pacing_rate then
                    -- Perform Update Operations
                    v_x_update := FP_DIV((FP_MULT(v_t, c7)), ((c7 - c8) + c9));
                    v_y_update := FP_DIV((FP_MULT(v_t, c8)), ((c7 - c8) + c9));
                    v_z_update := FP_DIV((FP_MULT(v_t, c9)), ((c7 - c8) + c9));
                    v_update := v_t;
                    theta_update := CREATE_FP(0.0);
                    f_theta_update := F(CREATE_FP(0.0));
                    
                    -- Next state is q1
                    state_update := CELL_Q1;
                
                elsif g_in >= v_t and (pacing_rate <= CREATE_FP(0.0) or t_auto < pacing_rate) then
                    -- Perform Update Operations
                    v_x_update := FP_MULT(CREATE_FP(0.3), v);
                    v_y_update := FP_MULT(CREATE_FP(0.0), v);
                    v_z_update := FP_MULT(CREATE_FP(0.7), v);
                    theta_update := FP_DIV(v, v_t);
                    f_theta_update := F(FP_DIV(v, v_t));
                    
                    -- Next state is q1
                    state_update := CELL_Q1;
                
                elsif v < v_t and g_in < v_t and (pacing_rate <= CREATE_FP(0.0) or t_auto < pacing_rate) then
                    -- Perform Flow Operations
                    v_x_update := v_x + FP_MULT(FP_MULT(c1, v_x), step_size);
                    v_y_update := v_y + FP_MULT(FP_MULT(c2, v_y), step_size);
                    v_z_update := v_z + FP_MULT(FP_MULT(c3, v_z), step_size);
                    t_auto_update := t_auto + FP_MULT(CREATE_FP(1.0), step_size);
                    
                    -- Perform Update Operations
                    v_update := (v_x_update - v_y_update) + v_z_update;
                    resting_update := true;
                    
                    -- Perform Saturation
                    if t_auto_update < pacing_rate and t_auto > pacing_rate then
                        -- Need to saturate t_auto to pacing_rate
                        t_auto_update := pacing_rate;

                    end if;
                    
                end if;
            
            elsif  state = CELL_Q1 then -- Logic for state q1
                if v = v_t or (pacing_rate > CREATE_FP(0.0) and t_auto >= pacing_rate) then
                    -- Perform Update Operations
                    t_auto_update := CREATE_FP(0.0);
                    resting_update := false;
                    
                    -- Next state is q2
                    state_update := CELL_Q2;
                
                elsif g_in <= CREATE_FP(0.0) and v < v_t and t_auto < pacing_rate then
                    -- Next state is q0
                    state_update := CELL_Q0;
                
                elsif v < v_t and g_in > CREATE_FP(0.0) and (pacing_rate <= CREATE_FP(0.0) or t_auto < pacing_rate) then
                    -- Perform Flow Operations
                    v_x_update := v_x + FP_MULT((FP_MULT(c4, v_x) + FP_MULT(c7, g_in)), step_size);
                    v_y_update := v_y + FP_MULT((FP_MULT(c5, v_y) + FP_MULT(c8, g_in)), step_size);
                    v_z_update := v_z + FP_MULT((FP_MULT(c6, v_z) + FP_MULT(c9, g_in)), step_size);
                    t_auto_update := t_auto + FP_MULT(CREATE_FP(1.0), step_size);
                    
                    -- Perform Update Operations
                    v_update := (v_x_update - v_y_update) + v_z_update;
                    
                    -- Perform Saturation
                    if (v_update > v_t and v < v_t) or (v_update < v_t and v > v_t) then
                        -- Need to saturate v to v_t

                        -- First, some dependencies need saturating
                        v_x_update := v_x + FP_MULT((FP_DIV((v_t - v), (v_update - v))), (v_x_update - v_x));
                        v_y_update := v_y + FP_MULT((FP_DIV((v_t - v), (v_update - v))), (v_y_update - v_y));
                        v_z_update := v_z + FP_MULT((FP_DIV((v_t - v), (v_update - v))), (v_z_update - v_z));
                        
                        v_update := v_t;

                    end if;
                    if t_auto_update < pacing_rate and t_auto > pacing_rate then
                        -- Need to saturate t_auto to pacing_rate
                        t_auto_update := pacing_rate;

                    end if;
                    if v_update < v_t and v > v_t then
                        -- Need to saturate v to v_t

                        -- First, some dependencies need saturating
                        v_x_update := v_x + FP_MULT((FP_DIV((v_t - v), (v_update - v))), (v_x_update - v_x));
                        v_y_update := v_y + FP_MULT((FP_DIV((v_t - v), (v_update - v))), (v_y_update - v_y));
                        v_z_update := v_z + FP_MULT((FP_DIV((v_t - v), (v_update - v))), (v_z_update - v_z));
                        
                        v_update := v_t;

                    end if;
                    
                end if;
            
            elsif  state = CELL_Q2 then -- Logic for state q2
                if v = v_o - FP_MULT(CREATE_FP(80.1), FP_SQRT(theta)) then
                    -- Perform Update Operations
                    stimulated_update := false;
                    
                    -- Next state is q3
                    state_update := CELL_Q3;
                
                elsif v < v_o - FP_MULT(CREATE_FP(80.1), FP_SQRT(theta)) then
                    -- Perform Flow Operations
                    v_x_update := v_x + FP_MULT(FP_MULT(c10, v_x), step_size);
                    v_y_update := v_y + FP_MULT(FP_MULT(c11, v_y), step_size);
                    v_z_update := v_z + FP_MULT(FP_MULT(c12, v_z), step_size);
                    t_auto_update := t_auto + FP_MULT(CREATE_FP(1.0), step_size);
                    
                    -- Perform Update Operations
                    v_update := (v_x_update - v_y_update) + v_z_update;
                    stimulated_update := true;
                    
                    -- Perform Saturation
                    if (v_update > v_o - FP_MULT(CREATE_FP(80.1), FP_SQRT(theta)) and v < v_o - FP_MULT(CREATE_FP(80.1), FP_SQRT(theta))) or (v_update < v_o - FP_MULT(CREATE_FP(80.1), FP_SQRT(theta)) and v > v_o - FP_MULT(CREATE_FP(80.1), FP_SQRT(theta))) then
                        -- Need to saturate v to v_o - FP_MULT(CREATE_FP(80.1), FP_SQRT(theta))

                        -- First, some dependencies need saturating
                        v_x_update := v_x + FP_MULT((FP_DIV(((v_o - FP_MULT(CREATE_FP(80.1), FP_SQRT(theta))) - v), (v_update - v))), (v_x_update - v_x));
                        v_y_update := v_y + FP_MULT((FP_DIV(((v_o - FP_MULT(CREATE_FP(80.1), FP_SQRT(theta))) - v), (v_update - v))), (v_y_update - v_y));
                        v_z_update := v_z + FP_MULT((FP_DIV(((v_o - FP_MULT(CREATE_FP(80.1), FP_SQRT(theta))) - v), (v_update - v))), (v_z_update - v_z));
                        
                        v_update := v_o - FP_MULT(CREATE_FP(80.1), FP_SQRT(theta));

                    end if;
                    
                end if;
            
            elsif  state = CELL_Q3 then -- Logic for state q3
                if v = v_r then
                    -- Next state is q0
                    state_update := CELL_Q0;
                
                elsif v > v_r then
                    -- Perform Flow Operations
                    v_x_update := v_x + FP_MULT(FP_MULT(FP_MULT(c13, v_x), f_theta), step_size);
                    v_y_update := v_y + FP_MULT(FP_MULT(FP_MULT(c14, v_y), f_theta), step_size);
                    v_z_update := v_z + FP_MULT(FP_MULT(c15, v_z), step_size);
                    t_auto_update := t_auto + FP_MULT(CREATE_FP(1.0), step_size);
                    
                    -- Perform Update Operations
                    v_update := (v_x_update - v_y_update) + v_z_update;
                    
                    -- Perform Saturation
                    if (v_update > v_r and v < v_r) or (v_update < v_r and v > v_r) then
                        -- Need to saturate v to v_r

                        -- First, some dependencies need saturating
                        v_x_update := v_x + FP_MULT((FP_DIV((v_r - v), (v_update - v))), (v_x_update - v_x));
                        v_y_update := v_y + FP_MULT((FP_DIV((v_r - v), (v_update - v))), (v_y_update - v_y));
                        v_z_update := v_z + FP_MULT((FP_DIV((v_r - v), (v_update - v))), (v_z_update - v_z));
                        
                        v_update := v_r;

                    end if;
                    
                end if;

            end if;

            -- Map State
            state <= state_update;
            
            -- Map Outputs
            resting_out <= resting_update;
            resting <= resting_update;
            stimulated_out <= stimulated_update;
            stimulated <= stimulated_update;
            v_out <= v_update;
            v <= v_update;
            
            -- Map Internal Variables
            pacing_rate <= pacing_rate_update;
            t_auto <= t_auto_update;
            v_x <= v_x_update;
            v_y <= v_y_update;
            v_z <= v_z_update;
            theta <= theta_update;
            f_theta <= f_theta_update;

        end if;
    end process;
end architecture;