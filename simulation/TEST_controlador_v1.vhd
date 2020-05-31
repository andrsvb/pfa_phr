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

entity test_contador_v1 is
--	Port ();
end test_contador_v1;

architecture Behavioral of test_contador_v1 is

component contador_v1 is	
	port(
		clk : in std_logic;
		tick : out std_logic
	);
end component;

signal clk_in : std_logic;
signal tick_out : std_logic;

begin

t_contador : contador_v1 port map(
	clk=> clk_in,
	tick => tick_out
);

t_process : process
begin
 	
 	--primer ciclo de reloj, salida esperada: 0
	clk_in <='0';
    wait for 100 ns;
    clk_in <='1';
	wait for 100 ns;
 	--segundo ciclo de reloj, salida esperada: 1
	clk_in <='0';
    wait for 100 ns;
    clk_in <='1';
	wait for 100 ns;
 	--tercer ciclo de reloj, salida esperada: 0
	clk_in <='0';
    wait for 100 ns;
    clk_in <='1';
	wait for 100 ns;
 	--cuarto ciclo de reloj, salida esperada: 1
	clk_in <='0';
    wait for 100 ns;
    clk_in <='1';
	wait for 100 ns;
 	--quinto ciclo de reloj, salida esperada: 0
	clk_in <='0';
    wait for 100 ns;
    clk_in <='1';
	wait for 100 ns;
	
  end process;
 end behavioral;

