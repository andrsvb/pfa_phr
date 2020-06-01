----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.05.2020 15:54:39
-- Design Name: 
-- Module Name: test_decoder_anodes - Behavioral
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

entity test_decoder_anodes is
--  Port ( );
end test_decoder_anodes;

architecture Behavioral of test_decoder_anodes is

component decoder_anodes is
    port(
      selector : in integer range 0 to 7;
      displays_anodes : out std_logic_vector (7 downto 0)
	);
end component;

signal selector_in : integer range 0 to 7;
signal displays_anodes_out : std_logic_vector (7 downto 0);

begin

t_decoder_a : decoder_anodes port map(
    selector => selector_in,
    displays_anodes => displays_anodes_out
 );
 
 t_process : process    
 begin
 --Los leds se encienden con logica negada y de uno en uno
 --si quiero encender el led i, el bit i de displays_anodes estara a 0 y los demas bits a uno
 

  --enciende el primer led: '01111111'
    selector_in <= 0;
    wait for 100 ns;
  --enciende el segundo led: '10111111'
    selector_in <= 1;
    wait for 100 ns;
  --enciende el tercer led: '110111111'
    selector_in <= 2;
    wait for 100 ns;
  --enciende el cuarto led: '11101111'
    selector_in <= 3;
    wait for 100 ns;
  --enciende el quinto led: '11110111'
    selector_in <= 4;
    wait for 100 ns;
  --enciende el sexto led: '11111011'
    selector_in <= 5;
    wait for 100 ns;
  --enciende el septimo led: '11111101'
    selector_in <= 6;
    wait for 100 ns;
  --enciende el octavo led: '11111110'
    selector_in <= 7;
    wait for 100 ns;
    
 end process;

end Behavioral;
