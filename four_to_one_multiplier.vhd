----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/12/2019 04:28:41 PM
-- Design Name: 
-- Module Name: four_to_one_multiplier - Behavioral
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

entity four_to_one_multiplier is
    Port ( ins : in STD_LOGIC_VECTOR (3 downto 0);
           A : in STD_LOGIC;
           prod : out STD_LOGIC_VECTOR (3 downto 0));
end four_to_one_multiplier;

architecture Behavioral of four_to_one_multiplier is



COMPONENT And2
   PORT (aIn, bIn: IN STD_LOGIC;
         X: OUT STD_LOGIC);
END COMPONENT;

begin

A0 : And2 PORT MAP(aIn  => ins(0),
                   bIn  => A,
                   X    => prod(0));

A1 : And2 PORT MAP(aIn  => ins(1),
                   bIn  => A,
                   X    => prod(1));

A2 : And2 PORT MAP(aIn  => ins(2),
                   bIn  => A,
                   X    => prod(2));

A3 : And2 PORT MAP(aIn  => ins(3),
                   bIn  => A,
                   X    => prod(3));


end Behavioral;
