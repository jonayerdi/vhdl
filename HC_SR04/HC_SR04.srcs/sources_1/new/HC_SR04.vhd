----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Xabier Odriozola
-- 
-- Create Date: 21.11.2017 13:19:07
-- Design Name: 
-- Module Name: HC_SR04 - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity HC_SR04 is
    Port (                     
            clk : in STD_LOGIC;    
            reset : in STD_LOGIC;    
            enable : in STD_LOGIC;
            echo : in STD_LOGIC;
            ready : out STD_LOGIC;
            trigger : out STD_LOGIC;
            sal : out STD_LOGIC_VECTOR(22 downto 0));
end HC_SR04;

architecture Behavioral of HC_SR04 is

signal counter : STD_LOGIC_VECTOR (10 downto 0) := "00000000000";
signal counter2 : STD_LOGIC_VECTOR (22 downto 0) := "00000000000000000000000";
signal out_sig : STD_LOGIC_VECTOR (22 downto 0) := "00000000000000000000000";
signal state : STD_LOGIC_VECTOR (2 downto 0) := "000";

begin

sal <= out_sig;

    routine: process(clk, reset)
        begin            
            if (reset = '1') then
                ready <= '0';
                state <= "000";
                counter <= "00000000000";
                counter2 <= "00000000000000000000000";
                out_sig <= "00000000000000000000000";
                                
            elsif (clk'event and clk = '1') then
                if enable = '1' and state = "000" and counter < 1250 then 
                    trigger <= '1';
                    counter <= counter + 1;
                    ready <= '0';      
                    out_sig <= (others => '0');            
                elsif enable = '1' and state = "000" and counter = 1250 then
                    trigger <= '0';
                    state <= "001";
                end if;
                
                if state = "001" and echo = '1' then
                    counter2 <= counter2 + 1;
                    state <= "010";
                end if;
                
                if state = "010" and echo = '1' then
                    counter2 <= counter2 + 1; 
                elsif state = "010" and echo = '0' then
                    state <= "011";
                end if;
                
                if state = "011" then
                    ready <= '1';
                    out_sig <= counter2;
                    state <= "111";
                end if;
                
                if state = "111" and enable = '0' then 
                    state <= "000";
                    counter <= "00000000000";
                    counter2 <= "00000000000000000000000";
                end if;                  
            end if;
        
        end process;

end Behavioral;
