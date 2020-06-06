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
-- se comunica con el componente creado con el xadc wizard para obtener la posicion del joystick
--      y lo saca transformado en dos señales: up y down

architecture Behavioral of adaptador_joystick is

-- componente generado por el wizard
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

signal adc_high : std_logic_vector (7 downto 0);        -- parte mas significativa del valor recibido por el adc
signal adc_low : std_logic_vector (7 downto 0);         -- parte menos significativa del valor recibido por el adc
signal enableint : std_logic := '1';                    -- siguiendo el tutorial, para que funcione en 1

begin

xadc : xadc_wiz_0 
    port map(
    daddr_in        => "0010011",                       --direccion del registro del puerto A13
    den_in          => enableint,                       -- para que funcione en 1
    di_in           => (others => '0'),                 -- a 0 porq no lo usamos
    dwe_in          => '0',                             -- a 0 porq no lo usamos
    do_out (15 downto 8)   => adc_high,                 -- pasamos la parte mas significativa
    do_out (7 downto 0)    => adc_low,                  -- pasamos la parte menos significativa
    drdy_out        => open,                            -- abierto porq no lo usamos
    dclk_in         => clk,                             -- reloj de la Nexys, de 100 MHz
    reset_in        => reset,                           -- señal de reset
    vauxp0          => adc,                             -- puerto conectado al U/D de joystick
    vauxn0          => '0',                             -- a 0 porq no lo usamos
    busy_out        => open,                            -- abierto porq no lo usamos
    channel_out     => open,                            -- abierto porq no lo usamos
    eoc_out         => enableint,                       -- para que funcione en 1
    eos_out         => open,                            -- abierto porq no lo usamos
    alarm_out       => open,                            -- abierto porq no lo usamos
    vp_in           => '0',                             -- a 0 porq no lo usamos
    vn_in           => '0'                              -- a 0 porq no lo usamos
);

up <= '1' when adc_high = "11111111" else '0';          -- cuando el joystick esta subido ponemos up a 1, si no esta a 0
down <= '1' when adc_high = "00000000" else '0';        -- cuando el joystick esta bajado ponemos down a 1, si no esta a 0

end Behavioral;
