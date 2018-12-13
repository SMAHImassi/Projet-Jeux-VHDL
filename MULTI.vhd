Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.numeric_std.all;
Use ieee.std_logic_unsigned.all;
entity MULTI is
generic (taille : integer := 4);
PORT (MM : IN STD_LOGIC_VECTOR(taille-1 DOWNTO 0);
		UU : IN STD_LOGIC_VECTOR(taille-1 DOWNTO 0);
		LL:out std_logic);
		end MULTI;
architecture multi_P of MULTI is
begin
LL<= ((MM(3)AND UU(3)) OR (MM(2)AND UU(2)) OR (MM(1)AND UU(1)) OR (MM(0)AND UU(0)));  
end;
