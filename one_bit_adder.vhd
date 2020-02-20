
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity one_bit_adder is
    Port ( aIn : in STD_LOGIC;
           bIn : in STD_LOGIC;
           carryIn : in STD_LOGIC;
           sum : out STD_LOGIC;
           carryOut : out STD_LOGIC);
end one_bit_adder;

architecture Behavioral of one_bit_adder is

SIGNAL S0, S1, S2 : STD_LOGIC;

component AND2
    PORT( A: IN STD_LOGIC;
          B: IN STD_LOGIC;
          Z: OUT STD_LOGIC);
END COMPONENT;

component OR2
    PORT( A: IN STD_LOGIC;
          B: IN STD_LOGIC;
          Z: OUT STD_LOGIC);
END COMPONENT;

component XOR2
    PORT( A: IN STD_LOGIC;
          B: IN STD_LOGIC;
          X: OUT STD_LOGIC);
END COMPONENT;

begin

X0: XOR2 PORT MAP (A => aIn,
                   B => bIn,
                   X => S0);
              
X1: XOR2 PORT MAP (A => S0,
                   B => carryIn,
                   X => sum);
                   
A0: AND2 PORT MAP (A => S0,
                   B => carryIn,
                   Z => S1);
                   
A1: AND2 PORT MAP (A => aIn,
                   B => bIn,
                   Z => S2);
                   
O0: OR2 PORT MAP (A => S1,
                  B => S2,
                  Z => carryOut);

end Behavioral;