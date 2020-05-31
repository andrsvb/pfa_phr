----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.05.2020 13:37:18
-- Design Name: 
-- Module Name: test_controlador_velocidad - Behavioral
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

entity test_controlador_velocidad is
--  Port ( );
end test_controlador_velocidad;

architecture Behavioral of test_controlador_velocidad is

component controlador_velocidad is
port (
 clk : in std_logic;
 speed : in std_logic;
 tick : out std_logic
 );
end component;

signal clk_in : std_logic;
signal speed_in : std_logic;
signal tick_out : std_logic;



begin

t_controlador : controlador_velocidad port map(
 clk => clk_in,
 speed => speed_in,
 tick => tick_out
);

  t_process : process

     begin
     
-- testeo para la velocidad 1 del juego
	speed_in <='0';
 	
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


-- testeo para la velocidad 2 del juego
	speed_in <='1';
	
 	--sexto ciclo de reloj, salida esperada: 0
	clk_in <='0';
    wait for 100 ns;
    clk_in <='1';
	wait for 100 ns;
 	--septimo ciclo de reloj, salida esperada: 0
	clk_in <='0';
    wait for 100 ns;
    clk_in <='1';
	wait for 100 ns;
 	--octavo ciclo de reloj, salida esperada: 1
	clk_in <='0';
    wait for 100 ns;
    clk_in <='1';
	wait for 100 ns;
 	--noveno ciclo de reloj, salida esperada: 0
	clk_in <='0';
    wait for 100 ns;
    clk_in <='1';
	wait for 100 ns;
 	--decimo ciclo de reloj, salida esperada: 0
	clk_in <='0';
    wait for 100 ns;
    clk_in <='1';
	wait for 100 ns;
 	--onceavo ciclo de reloj, salida esperada: 0
	clk_in <='0';
    wait for 100 ns;
    clk_in <='1';
	wait for 100 ns;
 	--duodecimo ciclo de reloj, salida esperada: 1
	clk_in <='0';
    wait for 100 ns;
    clk_in <='1';
	wait for 100 ns;
	
	
  end process;
end Behavioral;
