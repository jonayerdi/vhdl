----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Jon Ayerdi
-- 
-- Create Date: 22.09.2017 15:19:30
-- Design Name: 
-- Module Name: sumador_3bit_tb - Behavioral
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

entity sumador_3bit_tb is
--  Port ( );
end sumador_3bit_tb;

architecture Behavioral of sumador_3bit_tb is

component sumador_3bit_lib is
    Port ( a : in STD_LOGIC_VECTOR (2 downto 0);
           b : in STD_LOGIC_VECTOR (2 downto 0);
           sal : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal a : STD_LOGIC_VECTOR (2 downto 0) := "000";
signal b : STD_LOGIC_VECTOR (2 downto 0) := "000";
signal sal : STD_LOGIC_VECTOR (3 downto 0) := "0000";

begin

sum : sumador_3bit_lib port map (
    a => a,
    b => b,
    sal => sal
);

stim_proc : process
begin
a <= "000";
b <= "000";
wait for 10 ns;
a <= "001";
b <= "000";
wait for 10 ns;
a <= "010";
b <= "001";
wait for 10 ns;
a <= "011";
b <= "001";
wait for 10 ns;
a <= "011";
b <= "010";
wait for 10 ns;
a <= "111";
b <= "010";
wait for 10 ns;
a <= "001";
b <= "111";
wait for 10 ns;
a <= "111";
b <= "111";
wait for 10 ns;
a <= "101";
b <= "111";
wait for 10 ns;
a <= "110";
b <= "101";
wait for 10 ns;
end process;

end Behavioral;
