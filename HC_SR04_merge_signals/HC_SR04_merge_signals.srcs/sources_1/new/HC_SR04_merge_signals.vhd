----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.12.2017 13:04:39
-- Design Name: 
-- Module Name: HC_SR04_merge_signals - Behavioral
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

entity HC_SR04_merge_signals is
    Port ( ready : in STD_LOGIC;
           data : in STD_LOGIC_VECTOR (22 downto 0);
           presence : in STD_LOGIC;
           result : out STD_LOGIC_VECTOR (31 downto 0));
end HC_SR04_merge_signals;

architecture Behavioral of HC_SR04_merge_signals is

begin

result <=  "1010101" & data & presence & ready;

end Behavioral;
