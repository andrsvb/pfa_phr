----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.05.2020 12:46:29
-- Design Name: 
-- Module Name: controlador_vidas - Behavioral
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

entity controlador_colision is
 port ( 
  posicion : in integer range 0 to 2;
  tick : in std_logic;
  obstaculo3 : in integer range 0 to 5;
  colision: out std_logic
  );
end controlador_colision;

architecture Behavioral of controlador_colision is

begin

process (posicion, tick, obstaculo3)
     begin
       if tick = '1' and tick'event then
            if posicion = 0 then
                if obstaculo3 = 1 OR obstaculo3 = 4 then
                    colision <= '1';
                else
                    colision <= '0';
                end if;
            elsif posicion = 1 then
                if obstaculo3 = 2 OR obstaculo3 = 4 OR obstaculo3 = 5 then
                    colision <= '1';
                else
                    colision <= '0';
                end if;
            elsif posicion = 2 then
                if obstaculo3 = 3 OR obstaculo3 = 5 then
                    colision <= '1';
                else
                    colision <= '0';
                end if;
            end if;
	   end if;
end process;


end Behavioral;
