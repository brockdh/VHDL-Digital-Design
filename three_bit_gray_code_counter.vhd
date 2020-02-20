----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/26/2019 04:18:21 PM
-- Design Name: 
-- Module Name: three_bit_gray_code_counter - Behavioral
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

entity three_bit_gray_code_counter is
    Port (man_clock : in    STD_LOGIC;
          reset     : in    STD_LOGIC;
          led       : out   STD_LOGIC_VECTOR (2 downto 0));
end three_bit_gray_code_counter;

architecture Behavioral of three_bit_gray_code_counter is

SIGNAL gray : STD_LOGIC_VECTOR (2 downto 0);

begin

gray(2) <= '0'                                                          when reset = '1' else
           ((gray(2) and gray(0)) or (gray(1) and (NOT gray(0))))       when rising_edge(man_clock);
gray(1) <= '0'                                                          when reset = '1' else
           (((NOT gray(2)) and gray(0)) or (gray(1) and (NOT gray(0)))) when rising_edge(man_clock);
gray(0) <= '0'                                                          when reset = '1' else
           (((NOT gray(2)) and (NOT gray(1))) or (gray(2) and gray(1))) when rising_edge(man_clock);
                                            
led <= gray;
end Behavioral;
