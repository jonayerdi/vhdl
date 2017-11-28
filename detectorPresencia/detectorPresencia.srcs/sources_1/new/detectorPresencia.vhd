----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.11.2017 19:36:37
-- Design Name: 
-- Module Name: detectorPresencia - Behavioral
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

entity detectorPresencia is
    Port ( data_in : in STD_LOGIC_VECTOR (22 downto 0);
           decision : out STD_LOGIC);
end detectorPresencia;

architecture Behavioral of detectorPresencia is

begin

decision <= '0' when data_in < "00000000001000000000000" else '1';

end Behavioral;
