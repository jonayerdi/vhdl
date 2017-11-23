----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Jon Ayerdi
-- 
-- Create Date: 21.09.2017 14:56:14
-- Design Name: 
-- Module Name: sumador_tb - Behavioral
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

entity sumador_tb is
--  Port ( );
end sumador_tb;

architecture Behavioral of sumador_tb is

component sumador is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           cin : in STD_LOGIC;
           sal : out STD_LOGIC;
           cout : out STD_LOGIC);
end component;

signal a : STD_LOGIC := '0';
signal b : STD_LOGIC := '0';
signal cin : STD_LOGIC := '0';
signal sal : STD_LOGIC := '0';
signal cout : STD_LOGIC := '0';

begin

sum : sumador port map (
    a => a,
    b => b,
    cin => cin,
    sal => sal,
    cout => cout
);

stim_proc : process
begin
a <= '0';
b <= '0';
cin <= '0';
wait for 10 ns;
a <= '0';
b <= '0';
cin <= '1';
wait for 10 ns;
a <= '0';
b <= '1';
cin <= '0';
wait for 10 ns;
a <= '0';
b <= '1';
cin <= '1';
wait for 10 ns;
a <= '1';
b <= '0';
cin <= '0';
wait for 10 ns;
a <= '1';
b <= '0';
cin <= '1';
wait for 10 ns;
a <= '1';
b <= '1';
cin <= '0';
wait for 10 ns;
a <= '1';
b <= '1';
cin <= '1';
wait for 10 ns;
end process;

end Behavioral;
