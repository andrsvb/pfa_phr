----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.05.2020 18:39:42
-- Design Name: 
-- Module Name: adaptador_uart - Behavioral
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

entity adaptador_uart is
    Port ( 
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           puntuacion : in STD_LOGIC_VECTOR (9 downto 0);
           rx : in STD_LOGIC;
           tx : out STD_LOGIC
    );
end adaptador_uart;

architecture Behavioral of adaptador_uart is

signal enable : std_logic := '0';                   --
signal tx_data : std_logic_vector (7 downto 0);     --
signal tx_busy : std_logic;                         --
signal rx_data : std_logic_vector (7 downto 0);     --no lo usamos ya que no recibimos
signal rx_busy : std_logic;                         --^^
signal rx_error : std_logic;                        --^^
signal contador : std_logic := '0';                 --para saber si hemos mandado la primera parte del mensaje o la segunda

begin

uart : ENTITY work.uart
	GENERIC MAP(
		clk_freq	=> 100_000_000,
		baud_rate	=> 19_200,
		os_rate		=> 16,
		d_width		=> 8,
		parity		=> 1,
		parity_eo	=> '0'
	)
	PORT MAP(
		clk		=> clk,
		reset_n	=> reset,
		tx_ena	=> enable,
		tx_data	=> tx_data,
		rx		=> rx,
		rx_busy	=> rx_busy,
		rx_error => rx_error,
		rx_data	=> rx_data,
		tx_busy	=> tx_busy,
		tx		=> tx
    );
    
uart_proc : process (puntuacion)
begin
        if(tx_busy = '0') then
            if(contador = '0') then
                tx_data (7 downto 2) <= "000000";
                tx_data (1 downto 0) <= puntuacion (9 downto 8);
            else
                tx_data (7 downto 0) <= puntuacion (7 downto 0);
            end if;
            contador <= NOT contador;
            enable <= '1';
        end if;
        if(enable = '1') then
            enable <= '0';
        end if;
end process;

end Behavioral;
