library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test_mux21 is
-- Port();
end test_mux21;

architecture Behavioral of test_mux21 is

component mux2_1 is
port (
 a : in std_logic;
 b : in std_logic;
 speed : in std_logic;
 tick : out std_logic
 );
end component;

signal a_in : std_logic;
signal b_in : std_logic;
signal speed_in : std_logic;
signal tick_out : std_logic;

begin

t_mux21 : mux2_1 port map(
a=> a_in,
b=> b_in,
speed=> speed_in
);

t_process : process
begin

    --a 0, b 1, selector 0, salida esperada: 0
	speed_in<='0';
	a_in<='0';
	b_in<='1';
    wait for 100 ns;
    --a 0, b 1, selector 1, salida esperada: 1
    speed_in<='1';
    wait for 100 ns;
    --a 1, b 0, selector 1, salida esperada: 0
	a_in<='1';
	b_in<='0';
    wait for 100 ns;
    --a 1, b 0, selector 0, salida esperada: 1
    speed_in<='0';
    wait for 100 ns;
	
  end process;
 end behavioral;
