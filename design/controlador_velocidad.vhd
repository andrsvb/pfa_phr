----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.05.2020 12:46:29
-- Design Name: 
-- Module Name: controlador_velocidad - Behavioral
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

entity controlador_velocidad is 
port (
	clk : in std_logic;
	speed : in std_logic;
	tick : out std_logic
	);
end controlador_velocidad;


architecture Behavioral of controlador_velocidad is

COMPONENT contador_v1
	port(
	clk  : in std_logic;
	tick : out std_logic
	);
END COMPONENT;

COMPONENT contador_v2
	port(
	clk : in std_logic;
	tick : out std_logic
	);
END COMPONENT;

COMPONENT mux2_1
	port(
	a : in std_logic;
	b : in std_logic;
	speed : in std_logic;
	salida : out std_logic
	);
END COMPONENT;

signal tick1 : std_logic;
signal tick2 : std_logic;

begin

contador_0 : contador_v1 port map(
clk => clk,
tick => tick1
);

contador_1 : contador_v2 port map(
clk => clk,
tick => tick2
);

mux : mux2_1 port map(
a => tick1,
b => tick2,
speed => speed,
salida => tick
);

end Behavioral;
