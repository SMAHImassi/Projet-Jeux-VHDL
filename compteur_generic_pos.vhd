Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.numeric_std.all;
Use ieee.std_logic_unsigned.all;
entity compteur_generic_pos is
generic (taille : integer := 6);
PORT (
	RESET, CLOCK, UP, E: in std_logic;
	LOAD :in std_logic:='0';
	DATA : in std_logic_vector (taille-1 downto 0):="000000" ;
	Q : out std_logic_vector (taille-1 downto 0):="000000");
end compteur_generic_pos ;
architecture DESCRIPTION_T of compteur_generic_pos  is
signal CMP: std_logic_vector (taille-1 downto 0):="000000";
begin
	process (RESET,CLOCK)
		begin
		if RESET ='1' then
			CMP <= (others => '0'); -- Remise à zero asynchrone du compteur
		elsif (CLOCK ='1' and CLOCK'event) then
			if (E = '1') then
				if (LOAD ='1') then
					CMP <= DATA; -- Préchargement synchrone
				else
					if (UP ='1') then
					CMP <= CMP + 1 ; -- Incrémentation synchrone
					else
					CMP <= CMP - 1 ; -- décrémentation 
					end if;
				end if;
			end if;
		end if;
	end process;
	Q <= CMP;
end DESCRIPTION_T;