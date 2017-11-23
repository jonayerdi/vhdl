----------------------------------------------------------------------------------
-- Company: MU
-- Engineer: Jon Ayerdi
-- 
-- Create Date: 16.11.2017 13:29:03
-- Design Name: 
-- Module Name: punto_control_mux - Behavioral
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

entity punto_control_mux is
    Port ( sw : in STD_LOGIC_VECTOR (1 downto 0);
           regs : in STD_LOGIC_VECTOR (7 downto 0);
           led : out STD_LOGIC_VECTOR (3 downto 0));
end punto_control_mux;

architecture Behavioral of punto_control_mux is

signal reg0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal reg1 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal reg2 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal reg3 : STD_LOGIC_VECTOR (3 downto 0) := "0000";

begin

reg0 <= "00" & regs(0) & regs(1);
reg1 <= "00" & regs(2) & regs(3);
reg2 <= "00" & regs(4) & regs(5);
reg3 <= "00" & regs(6) & regs(7);

with sw select
    led <= (reg0) when "00",
           (reg0 and reg1) when "01",
           (reg2 + reg3) when "10",
           (reg1 + 1) when "11",
           "0000" when others;

end Behavioral;
