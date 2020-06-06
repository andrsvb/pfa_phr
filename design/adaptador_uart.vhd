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
           clk : in STD_LOGIC;                                  -- señal de reloj
           reset : in STD_LOGIC;                                -- señal de reset
           puntuacion : in STD_LOGIC_VECTOR (9 downto 0);       -- puntuacion en 10 bits
           rx : in STD_LOGIC;                                   -- pin rx
           tx : out STD_LOGIC                                   -- pin tx
    );
end adaptador_uart;

architecture Behavioral of adaptador_uart is

signal enable : std_logic := '0';                    -- señal enable para mandar mensajes
signal tx_data : std_logic_vector (7 downto 0);      -- datos a mandar
signal tx_busy : std_logic;                          -- señal busy de mandar mensajes
signal rx_data : std_logic_vector (7 downto 0);      -- no lo usamos ya que no recibimos
signal rx_busy : std_logic;                          -- ^^
signal rx_error : std_logic;                         -- ^^
signal contador : std_logic := '0';                  -- para saber si hay que mandar la primera parte del mensaje o la segunda

begin

uart : ENTITY work.uart
	GENERIC MAP(
		clk_freq	=> 100_000_000,                  -- frecuencia de reloj de la Nexys: 100 MHz
		baud_rate	=> 19_200,                       -- baudios con los que queremos que trabaje la uart
		os_rate		=> 16,                           -- oversampling
		d_width		=> 8,                            -- tamaño del bus
		parity		=> 1,                            -- paridad
		parity_eo	=> '0'                           -- paridad even
	)
	PORT MAP(
		clk		=> clk,                              -- señal de reloj de la Nexys
		reset_n	=> reset,                            -- señal reset
		tx_ena	=> enable,                           -- señal enable
		tx_data	=> tx_data,                          -- datos a mandar
		rx		=> rx,                               -- pin rx
		rx_busy	=> rx_busy,                          -- no lo usamos ya que no recibimos
		rx_error => rx_error,                        -- ^^
		rx_data	=> rx_data,                          -- ^^
		tx_busy	=> tx_busy,                          -- señal busy de mandar mensajes
		tx		=> tx                                -- pin tx
    );
    
uart_proc : process (puntuacion)        -- como la puntuacion es de 10 bits y el bus de 8, hay que mandarla en dos mensajes con 0s para rellenar
begin
        if(tx_busy = '0') then
            if(contador = '0') then                         -- mandamos la primera parte
                tx_data (7 downto 2) <= "000000";                   -- relleno
                tx_data (1 downto 0) <= puntuacion (9 downto 8);    -- primeros dos bits de puntuacion
            else                                            -- mandamos la segunda parte
                tx_data (7 downto 0) <= puntuacion (7 downto 0);    -- ultimos 8 bits de puntuacion
            end if;
            contador <= NOT contador;       -- para enviar las partes correctamente
            enable <= '1';                  -- para mandar el mensaje
        end if;
        if(enable = '1') then
            enable <= '0';
        end if;
end process;

end Behavioral;
