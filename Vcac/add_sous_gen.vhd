LIBRARY ieee;
USE ieee.std_logic_unsigned.ALL;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.all;
ENTITY add_sous_gen IS 
generic ( taille : integer := 4);
	PORT(a,b : IN STD_LOGIC_VECTOR(taille-1 DOWNTO 0);
	as : IN STD_LOGIC;
	s : OUT STD_LOGIC_VECTOR(taille-1 DOWNTO 0));
	end add_sous_gen;
ARCHITECTURE structural OF add_sous_gen IS
signal ADDS : STD_LOGIC_VECTOR(taille-1 downto 0);
begin 
	process (a, b, as)
	begin
		if (as ='1') then
			adds <= a + b ;	
		else
			adds <= a - b ;
		end if;
	end process;
s <= ADDS(taille-1 downto 0);
end structural;