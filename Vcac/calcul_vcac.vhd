LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

-------------------------------------------------------------------------------------
ENTITY calcul_vcac IS
  port(
    D : in std_LOGIC_VECTOR(11 downto 0);
    eoc, reset, clk : in std_LOGIC; 
    Vcac : out std_logic_vector (11 downto 0);
	 syn : out std_LOGIC
    );
END ENTITY calcul_vcac ;
-------------------------------------------------------------------------------------
architecture structurel of calcul_vcac is
	signal Dr, Drm, Drl, Dsous : std_LOGIC_VECTOR(11 downto 0);
	signal S, I, Er, Em, El, Ev : std_LOGIC;
		component registre
		generic ( taille : integer := 4);
	PORT(D : IN STD_LOGIC_VECTOR(taille-1 DOWNTO 0);
	clk, E, R: IN STD_LOGIC;
	Q : OUT STD_LOGIC_VECTOR(taille-1 DOWNTO 0));
	end component;
	component add_sous_gen
	generic ( taille : integer := 4);
	PORT(a,b : IN STD_LOGIC_VECTOR(taille-1 DOWNTO 0);
	as : IN STD_LOGIC;
	s : OUT STD_LOGIC_VECTOR(taille-1 DOWNTO 0));
	end component;
	component comparateur
	generic ( taille : integer := 4);
	PORT(A, B : IN STD_LOGIC_VECTOR(taille-1 DOWNTO 0);
	inf, sup, eg: out STD_LOGIC
	);
	end component;
	component UC
	PORT (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC := '0';
        EOC : IN STD_LOGIC := '0';
        S : IN STD_LOGIC := '0';
        I : In STD_LOGIC := '0';
        Er : OUT STD_LOGIC;
		  Em : OUT STD_LOGIC;
		  El : OUT STD_LOGIC;
		  Ev : OUT STD_LOGIC;
		  Syn : OUT STD_LOGIC
    );
	end component;
 
begin
controle : UC
port map(reset => reset, clk => clk, Eoc => Eoc, S => S, I => I, Er =>er, Em => Em, El => El, Ev => Ev, Syn => Syn);

R : registre
	  generic map(taille => 12)
	  port map(D => D, clk => clk, E => Er, R => '0', Q => Dr);
	  
Compsup : comparateur
		generic map(taille => 12)
		port map(A => Dr, B => DRM, sup => S);
		
compinf : comparateur
		generic map(taille => 12)
		port map(A => Dr, B => DRL, inf => I);
		
RM : registre
	  generic map(taille => 12)
	  port map(D => D, clk => clk, E => Em, R => '0', Q => Drm);
	  
RL : registre
	  generic map(taille => 12)
	  port map(D => D, clk => clk, E => El, R => '0', Q => Drl);

sous : add_sous_gen
	  generic map(taille => 12)
	  port map (a => Drm, b => Drl, as => '0', s => Dsous);
	  
RV : registre
	  generic map(taille => 12)
	  port map(D => Dsous, clk => clk, E => Ev, R => '0', Q => Vcac);	 	

end structurel;
-------------------------------------------------------------------------------------
