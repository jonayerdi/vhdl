----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Jon Ayerdi
-- 
-- Create Date: 03.10.2017 13:55:01
-- Design Name: 
-- Module Name: ledmove_tb - Behavioral
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

entity ledmove_tb is
--  Port ( );
end ledmove_tb;

architecture Behavioral of ledmove_tb is

component ledmove is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           right : in STD_LOGIC;
           left : in STD_LOGIC;
           led : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal clk : STD_LOGIC := '0';
signal rst : STD_LOGIC := '0';
signal right : STD_LOGIC := '0';
signal left : STD_LOGIC := '0';
signal led : STD_LOGIC_VECTOR (3 downto 0) := "0000";

begin

ledmove : ledmove port map (
    clk => clk,
    rst => rst,
    right => right,
    left => left,
    led => led
);

clk_proc : process
begin
wait for 10 ps; -- 100MHz
clk <= not clk;
end process;

stim_proc : process
begin

wait for 10 ns;
end process;

end Behavioral;
