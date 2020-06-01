----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.05.2020 11:58:06
-- Design Name: 
-- Module Name: test_controlador_colision - Behavioral
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

entity test_controlador_colision is
--  Port ( );
end test_controlador_colision;

architecture Behavioral of test_controlador_colision is

component controlador_colision is
 port ( 
  posicion : in integer range 0 to 2;
  tick : in std_logic;
  obstaculo3 : in integer range 0 to 5;
  colision: out std_logic
  );
end component;

signal posicion_in : integer range 0 to 2;
signal tick_in : std_logic;
signal obs_3_in : integer range 0 to 5;
signal colision_out: std_logic;


begin

t_controlador : controlador_colision port map(
  posicion => posicion_in,
  tick => tick_in,
  obstaculo3 => obs_3_in,
  colision => colision_out
);
 
 t_process : process
 begin
 
    --Colisiones 
	
	--Jugador abajo y obstaculo abajo
    posicion_in <= 0;
	obs_3_in <= 1;
    tick_in <= '0';
    wait for 100 ns;
    tick_in <= '1';
    wait for 100 ns;
	--Jugador en medio y obstaculo en medio
    posicion_in <= 1;
	obs_3_in <= 2;
    tick_in <= '0';
    wait for 100 ns;
    tick_in <= '1';
    wait for 100 ns;
	--Jugador arriba y obstaculo arriba
    posicion_in <= 2;
	obs_3_in <= 3;
    tick_in <= '0';
    wait for 100 ns;
    tick_in <= '1';
    wait for 100 ns;
    --Jugador en medio y obstaculo cuadrado abajo
    posicion_in <= 1;
	obs_3_in <= 4;
    tick_in <= '0';
    wait for 100 ns;
    tick_in <= '1';
    wait for 100 ns;
	--Jugador arriba y obstaculo cuadrado arriba
    posicion_in <= 2;
	obs_3_in <= 5;
    tick_in <= '0';
    wait for 100 ns;
    tick_in <= '1';
    wait for 100 ns;
	--Jugador en medio y obstaculo cuadrado arriba
    posicion_in <= 1;
	obs_3_in <= 5;
    tick_in <= '0';
    wait for 100 ns;
    tick_in <= '1';
    wait for 100 ns;
	
    --No Colisiones 
	
	--Jugador en medio y obstaculo abajo
    posicion_in <= 1;
	obs_3_in <= 1;
    tick_in <= '0';
    wait for 100 ns;
    tick_in <= '1';
    wait for 100 ns;
	--Jugador arriba y obstaculo abajo
    posicion_in <= 2;
	obs_3_in <= 1;
    tick_in <= '0';
    wait for 100 ns;
    tick_in <= '1';
    wait for 100 ns;
	--Jugador abajo y obstaculo en medio
    posicion_in <= 0;
	obs_3_in <= 2;
    tick_in <= '0';
    wait for 100 ns;
    tick_in <= '1';
    wait for 100 ns;
	--Jugador arriba y obstaculo en medio
    posicion_in <= 2;
	obs_3_in <= 2;
    tick_in <= '0';
    wait for 100 ns;
    tick_in <= '1';
    wait for 100 ns;
    --Jugador abajo y obstaculo arriba
    posicion_in <= 0;
	obs_3_in <= 3;
    tick_in <= '0';
    wait for 100 ns;
    tick_in <= '1';
    wait for 100 ns;
	--Jugador en medio y obstaculo arriba
    posicion_in <= 1;
	obs_3_in <= 3;
    tick_in <= '0';
    wait for 100 ns;
    tick_in <= '1';
    wait for 100 ns;
	--Jugador arriba y obstaculo cuadrado abajo
    posicion_in <= 2;
	obs_3_in <= 4;
    tick_in <= '0';
    wait for 100 ns;
    tick_in <= '1';
    wait for 100 ns;
	--Jugador abajo y obstaculo cuadrado arriba
    posicion_in <= 0;
	obs_3_in <= 5;
    tick_in <= '0';
    wait for 100 ns;
    tick_in <= '1';
    wait for 100 ns;
	--Jugador abajo y no obstaculo
    posicion_in <= 0;
	obs_3_in <= 0;
    tick_in <= '0';
    wait for 100 ns;
    tick_in <= '1';
    wait for 100 ns;
	--Jugador en medio y no obstaculo
    posicion_in <= 0;
	obs_3_in <= 0;
    tick_in <= '0';
    wait for 100 ns;
    tick_in <= '1';
    wait for 100 ns;
	--Jugador arriba y no obstaculo
    posicion_in <= 0;
	obs_3_in <= 0;
    tick_in <= '0';
    wait for 100 ns;
    tick_in <= '1';
    wait for 100 ns;
	
 end process;

end Behavioral;
