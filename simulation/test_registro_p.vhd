----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.05.2020 13:45:25
-- Design Name: 
-- Module Name: test_registro_p - Behavioral
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

entity test_registro_p is
--  Port ( );
end test_registro_p;

architecture Behavioral of test_registro_p is

COMPONENT registro_p
    port(
      new_pos : in integer range 0 to 2;
      pos_r : out integer range 0 to 2;
      tick_r : in std_logic
	);
END COMPONENT;

signal new_pos :  integer range 0 to 2;
signal pos :  integer range 0 to 2;
signal tick : std_logic;

begin

t_rp : registro_p port map(
    tick_r => tick,
    new_pos => new_pos,
    pos_r => pos
 );

test : process
begin

	--meter la posicion 0 en el registro
	tick <='0';
	new_pos <=0;
    wait for 100 ns;
	tick <='1';
	wait for 100 ns;
	--meter la posicion 1 en el registro
	tick <='0';
	new_pos <=1;
    wait for 100 ns;
	tick <='1';
	wait for 100 ns;
	--meter la posicion 2 en el registro
	tick <='0';
	new_pos <=2;
    wait for 100 ns;
	tick <='1';
	wait for 100 ns;

end process;

end Behavioral;
