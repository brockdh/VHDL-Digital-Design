----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/05/2019 03:09:24 PM
-- Design Name: 
-- Module Name: minterm - Behavioral
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

entity minterm is
    Port ( sw : in STD_LOGIC_VECTOR (2 downto 0);
           F : out STD_LOGIC);
end minterm;

architecture Behavioral of minterm is

begin

F <= '1' when (sw="111" OR sw="011" OR sw="000" OR sw="110") else
     '0';

end Behavioral;
