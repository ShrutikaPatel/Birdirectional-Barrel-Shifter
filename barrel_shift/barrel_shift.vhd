library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;  

entity barrel_shift is 
	
	port(a  : in std_logic_vector(7 downto 0); -- Inputs: a(7) MSB and a(0) LSB
		  b0,b1,b2,left_sig: in std_logic;      -- select lines b0 for 1 bit right shift and b2 for 4-bit right shift
		  y:   out std_logic_vector(7 downto 0));-- Outputs: y(7) MSB and y(0) LSB 
	
end entity; 


architecture struct of barrel_shift is

	signal l: std_logic_vector(8 downto 1);
	signal s: std_logic_vector(48 downto 41); -- s41,s42,s43,s44,s45,s46,s47,s48,
	signal s2: std_logic_vector(8 downto 1);  -- s21,s2,s23,s24,s25,s26,s27,s28, 
	signal s1: std_logic_vector(8 downto 1);  -- s11,s12,s13,s14,s15,s16,s17,s18; 
	
	component mux_2to1 is 
	
	port(I  : in std_logic_vector(1 downto 0);
		  sel: in std_logic;
		  Y:   out std_logic);
	
	end component; 
	
	begin 
	
	M1: mux_2to1 port map(I(1) => a(0), I(0) => a(7), sel => left_sig, Y => l(1));
	M2: mux_2to1 port map(I(1) => a(1), I(0) => a(6), sel => left_sig, Y => l(2));
	M3: mux_2to1 port map(I(1) => a(2), I(0) => a(5), sel => left_sig, Y => l(3));
	M4: mux_2to1 port map(I(1) => a(3), I(0) => a(4), sel => left_sig, Y => l(4));
	M5: mux_2to1 port map(I(1) => a(4), I(0) => a(3), sel => left_sig, Y => l(5));
	M6: mux_2to1 port map(I(1) => a(5), I(0) => a(2), sel => left_sig, Y => l(6));
	M7: mux_2to1 port map(I(1) => a(6), I(0) => a(1), sel => left_sig, Y => l(7));
	M8: mux_2to1 port map(I(1) => a(7), I(0) => a(0), sel => left_sig, Y => l(8)); 
	
	M9:  mux_2to1 port map(I(1) => '0',  I(0) => l(1), sel => b2, Y => s(41));
	M10: mux_2to1 port map(I(1) => '0',  I(0) => l(2), sel => b2, Y => s(42));
	M11: mux_2to1 port map(I(1) => '0',  I(0) => l(3), sel => b2, Y => s(43));
	M12: mux_2to1 port map(I(1) => '0',  I(0) => l(4), sel => b2, Y => s(44));
	M13: mux_2to1 port map(I(1) => l(1), I(0) => l(5), sel => b2, Y => s(45));
	M14: mux_2to1 port map(I(1) => l(2), I(0) => l(6), sel => b2, Y => s(46));
	M15: mux_2to1 port map(I(1) => l(3), I(0) => l(7), sel => b2, Y => s(47));
	M16: mux_2to1 port map(I(1) => l(4), I(0) => l(8), sel => b2, Y => s(48));
	
	M17: mux_2to1 port map(I(1) => '0',   I(0) => s(41), sel => b1, Y => s2(1));
	M18: mux_2to1 port map(I(1) => '0',   I(0) => s(42), sel => b1, Y => s2(2));
	M19: mux_2to1 port map(I(1) => s(41), I(0) => s(43), sel => b1, Y => s2(3));
	M20: mux_2to1 port map(I(1) => s(42), I(0) => s(44), sel => b1, Y => s2(4));
	M21: mux_2to1 port map(I(1) => s(43), I(0) => s(45), sel => b1, Y => s2(5));
	M22: mux_2to1 port map(I(1) => s(44), I(0) => s(46), sel => b1, Y => s2(6));
	M23: mux_2to1 port map(I(1) => s(45), I(0) => s(47), sel => b1, Y => s2(7));
	M24: mux_2to1 port map(I(1) => s(46), I(0) => s(48), sel => b1, Y => s2(8));	

	M25: mux_2to1 port map(I(1) => '0',   I(0) => s2(1), sel => b0, Y => s1(1));
	M26: mux_2to1 port map(I(1) => s2(1), I(0) => s2(2), sel => b0, Y => s1(2));
	M27: mux_2to1 port map(I(1) => s2(2), I(0) => s2(3), sel => b0, Y => s1(3));
	M28: mux_2to1 port map(I(1) => s2(3), I(0) => s2(4), sel => b0, Y => s1(4));
	M29: mux_2to1 port map(I(1) => s2(4), I(0) => s2(5), sel => b0, Y => s1(5));
	M30: mux_2to1 port map(I(1) => s2(5), I(0) => s2(6), sel => b0, Y => s1(6));
	M31: mux_2to1 port map(I(1) => s2(6), I(0) => s2(7), sel => b0, Y => s1(7));
	M32: mux_2to1 port map(I(1) => s2(7), I(0) => s2(8), sel => b0, Y => s1(8));
	
	M33: mux_2to1 port map(I(1) => s1(8), I(0) => s1(1), sel => left_sig, Y => y(7));
	M34: mux_2to1 port map(I(1) => s1(7), I(0) => s1(2), sel => left_sig, Y => y(6));
	M35: mux_2to1 port map(I(1) => s1(6), I(0) => s1(3), sel => left_sig, Y => y(5));
	M36: mux_2to1 port map(I(1) => s1(5), I(0) => s1(4), sel => left_sig, Y => y(4));
	M37: mux_2to1 port map(I(1) => s1(4), I(0) => s1(5), sel => left_sig, Y => y(3));
	M38: mux_2to1 port map(I(1) => s1(3), I(0) => s1(6), sel => left_sig, Y => y(2));
	M39: mux_2to1 port map(I(1) => s1(2), I(0) => s1(7), sel => left_sig, Y => y(1));
	M40: mux_2to1 port map(I(1) => s1(1), I(0) => s1(8), sel => left_sig, Y => y(0));
	
end struct;
