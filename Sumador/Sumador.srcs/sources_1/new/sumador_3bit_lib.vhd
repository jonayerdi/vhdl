----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Jon Ayerdi
-- 
-- Create Date: 23.09.2017 22:16:56
-- Design Name: 
-- Module Name: sumador_3bit_lib - Behavioral
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
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sumador_3bit_lib is
    Port ( a : in STD_LOGIC_VECTOR (2 downto 0);
           b : in STD_LOGIC_VECTOR (2 downto 0);
           sal : out STD_LOGIC_VECTOR (3 downto 0));
end sumador_3bit_lib;

architecture Behavioral of sumador_3bit_lib is

begin

sal <= ('0' & a) + ('0' & b);

end Behavioral;
