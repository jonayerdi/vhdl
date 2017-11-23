----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Jon Ayerdi
-- 
-- Create Date: 23.09.2017 22:35:40
-- Design Name: 
-- Module Name: sumador_16bit - Behavioral
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

entity sumador_16bit is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           b : in STD_LOGIC_VECTOR (15 downto 0);
           sal : out STD_LOGIC_VECTOR (16 downto 0));
end sumador_16bit;

architecture Behavioral of sumador_16bit is

component sumador is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           cin : in STD_LOGIC;
           sal : out STD_LOGIC;
           cout : out STD_LOGIC);
end component;

signal c : STD_LOGIC_VECTOR (16 downto 0) := (others => '0');

begin

adders : for n in 0 to 15 generate
    sum : sumador port map (
        a => a(n),
        b => b(n),
        cin => c(n),
        sal => sal(n),
        cout => c(n+1)
    );
end generate adders;

sal(sal'range) <= c(c'range);

end Behavioral;
