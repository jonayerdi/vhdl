----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Jon Ayerdi
-- 
-- Create Date: 05.10.2017 13:26:53
-- Design Name: 
-- Module Name: visualadder - Behavioral
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

entity visualadder is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           btn : in STD_LOGIC_VECTOR (1 downto 0);
           sw : in STD_LOGIC_VECTOR (3 downto 0);
           led : out STD_LOGIC_VECTOR (2 downto 0));
end visualadder;

architecture Behavioral of visualadder is

signal state : STD_LOGIC_VECTOR (3 downto 0) := "0001";
signal value : STD_LOGIC_VECTOR (2 downto 0) := "000";
signal a : STD_LOGIC_VECTOR (1 downto 0) := "00";
signal b : STD_LOGIC_VECTOR (1 downto 0) := "00";

begin

a(0) <= sw(0);
a(1) <= sw(1);
b(0) <= sw(2);
b(1) <= sw(3);

led(0) <= value(0);
led(1) <= value(1);
led(2) <= value(2);

with state and "0011" select
    value <= ('0' & a) when "0001",
             ('0' & b) when "0010",
             ('0' & a) + ('0' & b) when others;

state_machine: process(clk,rst)
begin
if (rst = '1') then
    state <= "0001";
elsif (clk'event and clk = '1') then
    if state = "0001" then
        if btn(0) = '1' then
            state <= "0101";
        elsif btn(1) = '1' then
            state <= "1001";
        end if;
    elsif state = "0010" then
        if btn(0) = '1' then
            state <= "0110";
        elsif btn(1) = '1' then
            state <= "1010";
        end if;
    elsif state = "0011" then
        if btn(0) = '1' then
            state <= "0111";
        elsif btn(1) = '1' then
            state <= "1011";
        end if;
    elsif state = "0101" then
        if btn(0) = '0' then
            state <= "0010";
        end if;
    elsif state = "0110" then
        if btn(0) = '0' then
            state <= "0011";
        end if;
    elsif state = "0111" then
        if btn(0) = '0' then
            state <= "0001";
        end if;
    elsif state = "1001" then
        if btn(1) = '0' then
            state <= "0011";
        end if;
    elsif state = "1010" then
         if btn(1) = '0' then
            state <= "0001";
        end if;
    elsif state = "1011" then
        if btn(1) = '0' then
            state <= "0010";
        end if;
    else
        state <= "0001";
    end if;
end if;
end process;

end Behavioral;
