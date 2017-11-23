----------------------------------------------------------------------------------
-- Company: MU
-- Engineer: Jon Ayerdi
-- 
-- Create Date: 09.11.2017 14:13:24
-- Design Name: 
-- Module Name: muxer - Behavioral
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

entity muxer is
    Port ( in0 : in STD_LOGIC_VECTOR (3 downto 0);
           in1 : in STD_LOGIC_VECTOR (3 downto 0);
           in2 : in STD_LOGIC_VECTOR (3 downto 0);
           sel : in STD_LOGIC_VECTOR (1 downto 0);
           out0 : out STD_LOGIC_VECTOR (3 downto 0));
end muxer;

architecture Behavioral of muxer is

begin

out0 <= in0 when sel = "00" else
        in1 when sel = "01" else
        in2 when sel = "10" else
        in0;

end Behavioral;
