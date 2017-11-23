----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Jon Ayerdi
-- 
-- Create Date: 21.09.2017 13:38:42
-- Design Name: 
-- Module Name: sumador - model
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

entity sumador is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           cin : in STD_LOGIC;
           sal : out STD_LOGIC;
           cout : out STD_LOGIC);
end sumador;

architecture Behavioral of sumador is

begin

sal <= a xor b xor cin;
cout <= (a and b) or ((a xor b) and cin);

--sal <= ((not a) and (not b) and (    cin))
--    or ((not a) and (    b) and (not cin))
--    or ((    a) and (not b) and (not cin)) 
--    or ((    a) and (    b) and (    cin));
      
--cout <= ((not a) and (    b) and (    cin))
--     or ((    a) and (not b) and (    cin))
--     or ((    a) and (    b) and (not cin)) 
--     or ((    a) and (    b) and (    cin));

end Behavioral;
