-- A DUT entity is used to wrap your design.
--  This example shows how you can do this for the
--  _gate.

library ieee;
use ieee.std_logic_1164.all;

entity DUT is
   port(input_vector: in std_logic_vector(11 downto 0);
       	output_vector: out std_logic_vector(7 downto 0));
end entity;

architecture DutWrap of DUT is
   component barrel_shift is
		port(a  : in std_logic_vector(7 downto 0); -- Inputs: a(7) MSB and a(0) LSB
			  b0,b1,b2,left_sig: in std_logic;      -- select lines b0 for 1 bit right shift and b2 for 4-bit right shift
			  y:   out std_logic_vector(7 downto 0));-- Outputs: y(7) MSB and y(0) LSB 
   end component;
	
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: barrel_shift 
			port map(
					left_sig => input_vector(11),
					b2       => input_vector(10),
					b1       => input_vector(9),
					b0       => input_vector(8),
					
				   a(7)   => input_vector(7),
					a(6)   => input_vector(6),
					a(5)   => input_vector(5),
					a(4)   => input_vector(4),
					a(3)   => input_vector(3),
					a(2)   => input_vector(2),
					a(1)   => input_vector(1),
					a(0)   => input_vector(0),
					
				   y(7)   => output_vector(7),
					y(6)   => output_vector(6),
					y(5)   => output_vector(5),
					y(4)   => output_vector(4),
					y(3)   => output_vector(3),
					y(2)   => output_vector(2),
					y(1)   => output_vector(1),
					y(0)   => output_vector(0));
					


end DutWrap;
