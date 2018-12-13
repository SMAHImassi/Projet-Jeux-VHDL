LIBRARY ieee;
USE ieee.std_logic_unsigned.ALL;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.all;
ENTITY Bouton_P IS 
generic ( taille : integer := 4);
	PORT(clk : in std_LOGIC;
		  U : IN STD_LOGIC:='0';
        D : In STD_LOGIC:='0';
        L: IN STD_LOGIC:='0';
		  R : IN STD_LOGIC:='0';
		  --
		  FLECHEE : out STD_LOGIC_VECTOR (taille-1 downto 0):= "0000";
		  F: out std_LOGIC:='0');
	end Bouton_P;
	
ARCHITECTURE Fonction_P OF Bouton_P IS
signal fw: std_logic_vector(taille-1 downto 0):= "0000"; 
begin 
P1: process(U,D,L,R,clk)
begin
				IF (clk'event and clk = '1') then
						if (U = '1') then
							if (D = '1') then
							F<='0';
							fw <= fw;
							else
							if (R='1') then 
							F<='0'; 
							fw <= fw;
							else
							if (L='1') then 
							F<='0'; 
							fw <= fw;
							else 
							fw <="1000";
						   F<='1';
							end if;
							end if; 	
							end if;
								else
								if (D='1') then
								if (U = '1') then
								F<='0';
								fw <= fw;
								else
								if (R='1') then 
								F<='0'; 
								fw <= fw;
								else
								if (L='1') then 
								F<='0';
								fw <= fw;
								else 
								fw <="0100";
								F<='1';
								end if;
								end if; 	
								end if;
							else
								if (L='1') then
								if (U = '1') then
								F<='0';
								fw <= fw;
								else
								if (D ='1') then 
								F<='0'; 
								fw <= fw;
								else
								if (R ='1') then 
								F<='0'; 
								fw <= fw;
								else 
								fw <="0010";
								F<='1';
								end if;
								end if; 	
								end if;
							else
								if (R='1') then
								if (U= '1') then
								F<='0';
								fw <= fw;
								else
								if (D='1') then 
								F<='0'; 
								fw <= fw;
								else
								if (L='1') then 
								F<='0'; 
								fw <= fw;
								else 
								fw<="0001";
								F<='1';
								end if;
								end if; 	
								end if;
										else
										F<='0';
										fw<="0000";
									end if;
							end if;
						end if;
					end if ;
			end if;
end process;
FLECHEE <= fw;
end Fonction_P;