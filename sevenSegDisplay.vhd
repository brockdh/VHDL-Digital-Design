----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/28/2019 11:28:01 PM
-- Design Name: 
-- Module Name: sevenSegDisplay - Behavioral
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

entity sevenSegDisplay is
    Port ( Enabler : in STD_LOGIC;
           S : in STD_LOGIC_VECTOR (3 downto 0);
           A : out STD_LOGIC;
           C : out STD_LOGIC_VECTOR (6 downto 0));
end sevenSegDisplay;

architecture Behavioral of sevenSegDisplay is

begin

A <= Enabler;

C <= "0000001" when S="0000" else
     "1001111" when S="0001" else
     "0010010" when S="0010" else
     "0000110" when S="0011" else
     "1001100" when S="0100" else
     "0100100" when S="0101" else
     "0100000" when S="0110" else
     "0001111" when S="0111" else
     "0000000" when S="1000" else
     "0000100" when S="1001" else
     "0001000" when S="1010" else
     "1100000" when S="1011" else
     "0110001" when S="1100" else
     "1000100" when S="1101" else
     "0110000" when S="1110" else
     "0111000" when S="1111";

end Behavioral;
