----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/12/2019 04:14:25 PM
-- Design Name: 
-- Module Name: Four_Bit_Multiplier - Behavioral
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

entity Four_Bit_Multiplier is
    Port ( sw : in STD_LOGIC_VECTOR (7 downto 0);
           led : out STD_LOGIC_VECTOR (7 downto 0));
end Four_Bit_Multiplier;


architecture Behavioral of Four_Bit_Multiplier is

SIGNAL temp : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL P0, P1, P2, P3 : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL temp0: STD_LOGIC;

COMPONENT four_to_one_multiplier is
    Port ( ins : in STD_LOGIC_VECTOR (3 downto 0);
           A : in STD_LOGIC;
           prod : out STD_LOGIC_VECTOR (3 downto 0));
END COMPONENT;

COMPONENT Four_Bit_Adder is
    Port ( A4 : in STD_LOGIC_VECTOR (3 downto 0);
           B4 : in STD_LOGIC_VECTOR (3 downto 0);
           carryIn4: in STD_LOGIC;
           sum4 : out STD_LOGIC_VECTOR (3 downto 0);
           carryOut4 : out STD_LOGIC);
END COMPONENT;

begin

M0 : four_to_one_multiplier PORT MAP(ins    => sw(7 downto 4),
                                     A      => sw(0),
                                     prod   => P0);

M1 : four_to_one_multiplier PORT MAP(ins    => sw(7 downto 4),
                                     A      => sw(1),
                                     prod   => P1);

M2 : four_to_one_multiplier PORT MAP(ins    => sw(7 downto 4),
                                     A      => sw(2),
                                     prod   => P2);

M3 : four_to_one_multiplier PORT MAP(ins    => sw(7 downto 4),
                                     A      => sw(3),
                                     prod   => P3);

S0 : Four_Bit_Adder PORT MAP(A4             => P0,
                             B4(0)          => '0',
                             B4(3 downto 1) => P1(2 downto 0),
                             carryIn4       => '0',
                             sum4           => temp(3 downto 0),
                             carryOut4      => temp0);

S1 : Four_Bit_Adder PORT MAP(A4(2 downto 0) => temp(4 downto 2),
                             A4(3)          => P1(3),
                             B4(3 downto 1) => P2(2 downto 0),
                             B4(0)          => '0',
                             carryIn4       => '0',
                             sum4           => temp(5 downto 2),
                             carryOut4      => temp0);

S2 : Four_Bit_Adder PORT MAP(A4(2 downto 0) => temp(5 downto 3),
                             A4(3)          => P2(3),
                             B4(3 downto 1) => P3(2 downto 0),
                             B4(0)          => '0',
                             carryIn4       => '0',
                             sum4           => temp(6 downto 3),
                             carryOut4      => temp0);
                    
temp(7) <= temp0;

led     <= temp;

end Behavioral;
