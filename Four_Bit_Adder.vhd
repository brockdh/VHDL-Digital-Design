library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Four_Bit_Adder is
    Port ( A4 : in STD_LOGIC_VECTOR (3 downto 0);
           B4 : in STD_LOGIC_VECTOR (3 downto 0);
           carryIn4 : in STD_LOGIC;
           sum4 : out STD_LOGIC_VECTOR (3 downto 0);
           carryOut4 : out STD_LOGIC);
end Four_Bit_Adder;

architecture Behavioral of Four_Bit_Adder is

-- define some signals to astore temporary info
SIGNAL temp0, temp1, temp2: STD_LOGIC;

-- call out one_bit_adder.vhd file for reuse here
-- define the original I/O's for re0use
COMPONENT One_Bit_Adder
   PORT (aIn, bIn, carryIn: IN STD_LOGIC;
        sum, carryOut: OUT STD_LOGIC);
END COMPONENT;

begin
--instantiate the fiert one_bit_adder, and map IO's to this file I/O's      
 -- refer to the schematic how is this being connected
 -- Note tha A0, A1, A2,... are simply labels
 
 
 A0: One_Bit_Adder PORT MAP (aIn       => A4(0),
                             bIn       => B4(0),
                             carryIn   => carryIn4,
                             sum       => sum4(0),
                             carryOut  => temp0);
                             
 A1:  One_Bit_Adder PORT MAP (aIn      => A4(1),
                              bIn      => B4(1),
                              carryIn  => temp0,
                              sum      => sum4(1),
                              carryOut => temp1);                        
                             
 A2:  One_Bit_Adder PORT MAP (aIn      => A4(2),
                              bIn      => B4(2),
                              carryIn  => temp1,
                              sum      => sum4(2),
                              carryOut => temp2);
                             
 A3: One_Bit_Adder PORT MAP (aIn      => A4(3),
                             bIn      => B4(3),
                             carryIn  => temp2,
                             sum      => sum4(3),
                             carryOut => carryOut4);  

end Behavioral;