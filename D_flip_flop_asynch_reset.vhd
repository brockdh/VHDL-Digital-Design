----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/19/2019 04:26:26 PM
-- Design Name: 
-- Module Name: D_flip_flop_asynch_reset - Behavioral
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

entity D_flip_flop_asynch_reset is
    Port ( clk : in STD_LOGIC;
           d : in STD_LOGIC;
           rst : in STD_LOGIC;
           q : out STD_LOGIC);
end D_flip_flop_asynch_reset;

--Use rising_edge (maybe)

architecture Behavioral of D_flip_flop_asynch_reset is

SIGNAL Ds, Clock, Reset, QOut, QBarOut : STD_LOGIC;

begin
Reset   <= rst;
Clock   <= clk;
Ds      <= d;

Qout <= '0' when Reset = '1'        else
        Ds  when rising_edge(Clock);

q   <=  Qout;
end Behavioral;
