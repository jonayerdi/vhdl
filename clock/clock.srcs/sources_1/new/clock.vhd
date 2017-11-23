----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Jon Ayerdi
-- 
-- Create Date: 26.09.2017 13:37:15
-- Design Name: 
-- Module Name: clock - Behavioral
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

entity clock is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           led : out STD_LOGIC);
end clock;

architecture Behavioral of clock is

signal count: STD_LOGIC_VECTOR (26 downto 0) := (others => '0');
signal state: STD_LOGIC := '0';

begin

led <= state;

routine: process
begin
if (rst = '1') then
    count <= (others => '0');
    state <= '0';
end if;
if (clk'event and clk = '1') then
    count <= count + 1;
    if (count = "111011100110101100101000000") then -- 125MHz
        count <= (others => '0');
        state <= not state;
    end if;
end if;
end process;

end Behavioral;
