----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.05.2020 13:44:56
-- Design Name: 
-- Module Name: test_registro_o - Behavioral
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

entity test_registro_o is
--  Port ( );
end test_registro_o;

architecture Behavioral of test_registro_o is

COMPONENT registro_o
    Port ( 
      valor_in : in integer range 0 to 5;
      valor_out : out integer range 0 to 5;
      tick : in std_logic
      );
END COMPONENT;

signal new_obs :  integer range 0 to 5;
signal obs :  integer range 0 to 5;
signal tick : std_logic;

begin

t_ro : registro_o port map(
    tick => tick,
    valor_in => new_obs,
    valor_out => obs
 );

test : process
begin

	--meter el obstaculo 0 en el registro
	tick <='0';
	new_obs <=0;
    wait for 100 ns;
	tick <='1';
	wait for 100 ns;
	--meter el obstaculo 1 en el registro
	tick <='0';
	new_obs <=1;
    wait for 100 ns;
	tick <='1';
	wait for 100 ns;
	--meter el obstaculo 2 en el registro
	tick <='0';
	new_obs <=2;
    wait for 100 ns;
	tick <='1';
	wait for 100 ns;
	--meter el obstaculo 3 en el registro
	tick <='0';
	new_obs <=3;
    wait for 100 ns;
	tick <='1';
	wait for 100 ns;
	--meter el obstaculo 4 en el registro
	tick <='0';
	new_obs <=4;
    wait for 100 ns;
	tick <='1';
	wait for 100 ns;
	--meter el obstaculo 5 en el registro
	tick <='0';
	new_obs <=4;
    wait for 100 ns;
	tick <='1';
	wait for 100 ns;
	
end process;

end Behavioral;
