----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Jon Ayerdi
-- 
-- Create Date: 28.09.2017 13:29:08
-- Design Name: 
-- Module Name: ledmove - Behavioral
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

entity ledmove is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           right : in STD_LOGIC;
           left : in STD_LOGIC;
           led : out STD_LOGIC_VECTOR (3 downto 0));
end ledmove;

architecture Behavioral of ledmove is

signal state : STD_LOGIC_VECTOR (1 downto 0) := "00";
signal rightbtnstate : STD_LOGIC := '0';
signal leftbtnstate : STD_LOGIC := '0';

begin

led(0) <= '1' when state = "00" else '0';
led(1) <= '1' when state = "01" else '0';
led(2) <= '1' when state = "10" else '0';
led(3) <= '1' when state = "11" else '0';

routine: process(rst, clk)
begin
if (rst = '1') then
    state <= "00";
    rightbtnstate <= '0';
    leftbtnstate <= '0';
elsif (clk'event and clk = '1') then
    if right = '1' and rightbtnstate = '0' then
        rightbtnstate <= '1';
    elsif right = '0' and rightbtnstate = '1' then
        rightbtnstate <= '0';
        state <= state + 1;
    end if;
    if left = '1' and leftbtnstate = '0' then
        leftbtnstate <= '1';
    elsif left = '0' and leftbtnstate = '1' then
        leftbtnstate <= '0';
        state <= state - 1;
    end if;
end if;
end process;

end Behavioral;
