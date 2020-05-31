----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.05.2020 11:58:06
-- Design Name: 
-- Module Name: test_decoder_vidas - Behavioral
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

entity test_decoder_vidas is
--  Port ( );
end test_decoder_vidas;

architecture Behavioral of test_decoder_vidas is

component decoder_vidas is
 Port ( 
  vidas : in integer range 0 to 3;
  leds : out std_logic_vector (7 downto 0)
  );
end component;

signal vidas_in : integer range 0 to 3;
signal leds_out : std_logic_vector (7 downto 0);

begin

t_decoder : decoder_vidas port map(
    vidas => vidas_in,
    leds => leds_out
 );
 
 t_process : process
 begin
    -- Vidas = 0
    vidas_in <= 0;
    wait for 100 ns;
	-- Vidas = 1
    vidas_in <= 1;
    wait for 100 ns;
	-- Vidas = 2
    vidas_in <= 2;
    wait for 100 ns;
	-- Vidas = 3
    vidas_in <= 3;
    wait for 100 ns;
	
 end process;

end Behavioral;
