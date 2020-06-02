----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.05.2020 16:55:14
-- Design Name: 
-- Module Name: adaptador_joystick - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adaptador_joystick is
    port(
        adc : in std_logic;
        clk : in std_logic;
        reset : in std_logic;
        up : out std_logic;
        down : out std_logic
	);
end adaptador_joystick;

architecture Behavioral of adaptador_joystick is

component xadc_wiz_0 is
   port
   (
    daddr_in        : in  STD_LOGIC_VECTOR (6 downto 0);     -- Address bus for the dynamic reconfiguration port
    den_in          : in  STD_LOGIC;                         -- Enable Signal for the dynamic reconfiguration port
    di_in           : in  STD_LOGIC_VECTOR (15 downto 0);    -- Input data bus for the dynamic reconfiguration port
    dwe_in          : in  STD_LOGIC;                         -- Write Enable for the dynamic reconfiguration port
    do_out          : out  STD_LOGIC_VECTOR (15 downto 0);   -- Output data bus for dynamic reconfiguration port
    drdy_out        : out  STD_LOGIC;                        -- Data ready signal for the dynamic reconfiguration port
    dclk_in         : in  STD_LOGIC;                         -- Clock input for the dynamic reconfiguration port
    reset_in        : in  STD_LOGIC;                         -- Reset signal for the System Monitor control logic
    vauxp0          : in  STD_LOGIC;                         -- Auxiliary Channel 0
    vauxn0          : in  STD_LOGIC;
    busy_out        : out  STD_LOGIC;                        -- ADC Busy signal
    channel_out     : out  STD_LOGIC_VECTOR (4 downto 0);    -- Channel Selection Outputs
    eoc_out         : out  STD_LOGIC;                        -- End of Conversion Signal
    eos_out         : out  STD_LOGIC;                        -- End of Sequence Signal
    alarm_out       : out STD_LOGIC;                         -- OR'ed output of all the Alarms
    vp_in           : in  STD_LOGIC;                         -- Dedicated Analog Input Pair
    vn_in           : in  STD_LOGIC
);
end component;

signal adc_high : std_logic_vector (7 downto 0);
signal adc_low : std_logic_vector (7 downto 0);
signal enableint : std_logic := '1';

begin

xadc : xadc_wiz_0 
    port map(
    daddr_in        => "0010011",
    den_in          => enableint,
    di_in           => (others => '0'),
    dwe_in          => '0',
    do_out (15 downto 8)   => adc_high,
    do_out (7 downto 0)    => adc_low,
    drdy_out        => open,
    dclk_in         => clk,
    reset_in        => reset,
    vauxp0          => adc,
    vauxn0          => '0',
    busy_out        => open,
    channel_out     => open,
    eoc_out         => enableint,
    eos_out         => open,
    alarm_out       => open,
    vp_in           => '0',
    vn_in           => '0'
);

up <= '1' when adc_high = "11111111" else '0';
down <= '1' when adc_high = "00000000" else '0';

end Behavioral;
