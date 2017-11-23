----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Jon Ayerdi
-- 
-- Create Date: 05.10.2017 14:11:32
-- Design Name: 
-- Module Name: visualadder_tb - Behavioral
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

entity visualadder_tb is
--  Port ( );
end visualadder_tb;

architecture Behavioral of visualadder_tb is

component visualadder is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           btn : in STD_LOGIC_VECTOR (1 downto 0);
           sw : in STD_LOGIC_VECTOR (3 downto 0);
           led : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal clk : STD_LOGIC := '0';
signal rst : STD_LOGIC := '0';
signal btn : STD_LOGIC_VECTOR (1 downto 0) := "00";
signal sw : STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal led : STD_LOGIC_VECTOR (2 downto 0) := "000";

begin

vadder : visualadder port map (
    clk => clk,
    rst => rst,
    btn => btn,
    sw => sw,
    led => led
);

clk_proc : process
begin
wait for 10 ps;
clk <= not clk;
end process;

stim_proc : process
begin
wait for 10 ns;
rst <= '1';
wait for 10 ns;
rst <= '0';
wait for 10 ns;
sw <= "0000";
wait for 10 ns;
sw <= "0001";
wait for 10 ns;
sw <= "0010";
wait for 10 ns;
sw <= "0011";
wait for 10 ns;
sw <= "0100";
wait for 10 ns;
sw <= "1000";
wait for 10 ns;
sw <= "1100";
wait for 10 ns;
btn <= "01";
wait for 10 ns;
btn <= "00";
wait for 10 ns;
sw <= "0000";
wait for 10 ns;
sw <= "0001";
wait for 10 ns;
sw <= "0010";
wait for 10 ns;
sw <= "0011";
wait for 10 ns;
sw <= "0100";
wait for 10 ns;
sw <= "1000";
wait for 10 ns;
sw <= "1100";
wait for 10 ns;
btn <= "01";
wait for 10 ns;
btn <= "00";
wait for 10 ns;
sw <= "0000";
wait for 10 ns;
sw <= "0001";
wait for 10 ns;
sw <= "0010";
wait for 10 ns;
sw <= "0011";
wait for 10 ns;
sw <= "0100";
wait for 10 ns;
sw <= "1000";
wait for 10 ns;
sw <= "1100";
wait for 10 ns;
btn <= "01";
wait for 10 ns;
btn <= "00";
wait for 10 ns;
sw <= "0000";
wait for 10 ns;
sw <= "0001";
wait for 10 ns;
sw <= "0010";
wait for 10 ns;
sw <= "0011";
wait for 10 ns;
sw <= "0100";
wait for 10 ns;
sw <= "1000";
wait for 10 ns;
sw <= "1100";
wait for 10 ns;
btn <= "10";
wait for 10 ns;
btn <= "00";
wait for 10 ns;
sw <= "0000";
wait for 10 ns;
sw <= "0001";
wait for 10 ns;
sw <= "0010";
wait for 10 ns;
sw <= "0011";
wait for 10 ns;
sw <= "0100";
wait for 10 ns;
sw <= "1000";
wait for 10 ns;
sw <= "1100";
end process;

end Behavioral;