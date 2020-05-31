----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.05.2020 01:37:43
-- Design Name: 
-- Module Name: decoder_anodes - Behavioral
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

entity decoder_anodes is
    port(
      selector : in integer range 0 to 7;
      displays_anodes : out std_logic_vector (7 downto 0)
	);
end decoder_anodes;

architecture Behavioral of decoder_anodes is

begin

with selector select displays_anodes <=
    "01111111" when 0,
    "10111111" when 1,
    "11011111" when 2,
    "11101111" when 3,
    "11110111" when 4,
    "11111011" when 5,
    "11111101" when 6,
    "11111110" when 7;

end Behavioral;
