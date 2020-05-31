----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.05.2020 12:25:44
-- Design Name: 
-- Module Name: circuito_general - Behavioral
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

entity circuito_general is
  port(
    clk_cg : in std_logic;
    reset_cg : in std_logic;
    boton_speed_cg : in std_logic;
    boton_pausa_cg : in std_logic;
    displays_anodes_cg : out std_logic_vector (7 downto 0);
    displays_cathodes_cg : out std_logic_vector (7 downto 0);
    adc_cg : in std_logic;
    rx_cg : in STD_LOGIC;
    tx_cg : out STD_LOGIC
  );
end circuito_general;

architecture Behavioral of circuito_general is

COMPONENT adaptador_joystick 
    port(
        adc : in std_logic;
        clk : in std_logic;
        reset : in std_logic;
        up : out std_logic;
        down : out std_logic
	);
END COMPONENT;

component juego is
  port(
    clk : in std_logic;
    reset : in std_logic;
    boton_speed : in std_logic;
    boton_pausa : in std_logic;
    up : in std_logic;
    down : in std_logic;
    displays_anodes : out std_logic_vector (7 downto 0);
    displays_cathodes : out std_logic_vector (7 downto 0);
    puntuacion : out STD_LOGIC_VECTOR (9 downto 0)
  );
end component;

component adaptador_uart is
    Port ( 
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           puntuacion : in STD_LOGIC_VECTOR (9 downto 0);
           rx : in STD_LOGIC;
           tx : out STD_LOGIC
    );
end component;

signal s_reset : std_logic;
signal puntuacion : STD_LOGIC_VECTOR (9 downto 0);
signal up : std_logic;
signal down : std_logic;

begin
	
a_joy : adaptador_joystick 
    port map(
        clk => clk_cg,
        reset => reset_cg,
        up => up,
        down => down,
        adc => adc_cg
	);
	
game : juego 
    port map(
        clk => clk_cg,
        reset => reset_cg,
        boton_speed => boton_speed_cg,
        boton_pausa => boton_pausa_cg,
        up => up,
        down => down,
        displays_anodes => displays_anodes_cg,
        displays_cathodes => displays_cathodes_cg,
        puntuacion => puntuacion
	);
	
a_uart : adaptador_uart
    port map(
           clk => clk_cg,
           reset => reset_cg,
           puntuacion => puntuacion,
           rx => rx_cg,
           tx => tx_cg
    );

end Behavioral;
