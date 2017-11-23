----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.09.2017 13:22:59
-- Design Name: 
-- Module Name: sumador_16bit_tb - Behavioral
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

entity sumador_16bit_tb is
--  Port ( );
end sumador_16bit_tb;

architecture Behavioral of sumador_16bit_tb is

component sumador_16bit is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           b : in STD_LOGIC_VECTOR (15 downto 0);
           sal : out STD_LOGIC_VECTOR (16 downto 0));
end component;

signal a : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
signal b : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
signal sal : STD_LOGIC_VECTOR (16 downto 0) := (others => '0');

begin

sum : sumador_16bit port map (
    a => a,
    b => b,
    sal => sal
);

stim_proc : process
begin
a <= "0000000000000000";
b <= "0000000000000000";
wait for 10 ns;
a <= "0000011000000101";
b <= "0000001100000110";
wait for 10 ns;
a <= "1110001000100101";
b <= "1110001100000100";
wait for 10 ns;
a <= "0001010101010010";
b <= "0101010100110101";
wait for 10 ns;
end process;

end Behavioral;
