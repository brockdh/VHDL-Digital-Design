----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/08/2019 12:08:50 AM
-- Design Name: 
-- Module Name: Multiplexer - Behavioral
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

entity Multiplexer is
    Port ( S0 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           I0 : in STD_LOGIC;
           I1 : in STD_LOGIC;
           I2 : in STD_LOGIC;
           I3 : in STD_LOGIC;
           Y : out STD_LOGIC);
end Multiplexer;

architecture Behavioral of Multiplexer is

SIGNAL R0, R1, R2, R3, M0, M1, M2, M3: STD_LOGIC;

component AND2
    PORT( A: IN STD_LOGIC;
          B: IN STD_LOGIC;
          Z: OUT STD_LOGIC);
END COMPONENT;

component OR4
    PORT( A: IN STD_LOGIC;
          B: IN STD_LOGIC;
          C: IN STD_LOGIC;
          D: IN STD_LOGIC;
          Z: OUT STD_LOGIC);
END COMPONENT;

component twoBitDecoder
    PORT( A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           E : in STD_LOGIC;
           Y0 : out STD_LOGIC;
           Y1 : out STD_LOGIC;
           Y2 : out STD_LOGIC;
           Y3 : out STD_LOGIC);
END COMPONENT;

begin

D0: twoBitDecoder PORT MAP (A0 => S0,
                            A1 => S1,
                            E => '1',
                            Y0 => R0,
                            Y1 => R1,
                            Y2 => R2,
                            Y3 => R3);

A0: AND2 PORT MAP(A => R0,
                  B => I0,
                  Z => M0);

A1: AND2 PORT MAP(A => R1,
                  B => I1,
                  Z => M1);

A2: AND2 PORT MAP(A => R2,
                  B => I2,
                  Z => M2);

A3: AND2 PORT MAP(A => R3,
                  B => I3,
                  Z => M3);

O0: OR4 PORT MAP(A => M0,
                 B => M1,
                 C => M2,
                 D => M3,
                 Z => Y);

end Behavioral;
