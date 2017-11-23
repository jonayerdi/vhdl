----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Jon Ayerdi
-- 
-- Create Date: 22.09.2017 15:07:48
-- Design Name: 
-- Module Name: sumador_3bit - Behavioral
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

entity sumador_3bit is
    Port ( a : in STD_LOGIC_VECTOR (2 downto 0);
           b : in STD_LOGIC_VECTOR (2 downto 0);
           sal : out STD_LOGIC_VECTOR (3 downto 0));
end sumador_3bit;

architecture Behavioral of sumador_3bit is

component sumador is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           cin : in STD_LOGIC;
           sal : out STD_LOGIC;
           cout : out STD_LOGIC);
end component;

signal cin : STD_LOGIC := '0';
signal c0 : STD_LOGIC := '0';
signal c1 : STD_LOGIC := '0';

begin

sum0 : sumador port map (
    a => a(0),
    b => b(0),
    cin => cin,
    sal => sal(0),
    cout => c0
);

sum1 : sumador port map (
    a => a(1),
    b => b(1),
    cin => c0,
    sal => sal(1),
    cout => c1
);

sum2 : sumador port map (
    a => a(2),
    b => b(2),
    cin => c1,
    sal => sal(2),
    cout => sal(3)
);

end Behavioral;
