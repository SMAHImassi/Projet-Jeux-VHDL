LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

-------------------------------------------------------------------------------------
ENTITY Position_PacMan IS
  port(
			clk : IN STD_LOGIC;
        reset : IN STD_LOGIC := '0';
        Col : IN STD_LOGIC_VECTOR (3 downto 0) := "0000";
        U : IN STD_LOGIC;
        D : In STD_LOGIC;
        L: IN STD_LOGIC;
		  R : IN STD_LOGIC;
		  Pos_x : OUT STD_LOGIC_VECTOR (5 downto 0) := "000000";
		  Pos_y : OUT STD_LOGIC_VECTOR (5 downto 0) := "000000");
END ENTITY Position_PacMan ;
-------------------------------------------------------------------------------------
architecture structurel of Position_PacMan is
signal F,P,S,UU,DD,MM,LL: std_logic;
signal Ex,UPx,Ey,UPy,LOAD : std_logic;
signal FLECHEE,Fleche_Mem: std_logic_VECTOR(3 downto 0);
signal DATA: std_logic_VECTOR(5 downto 0);
signal Dir: std_logic_VECTOR(3 downto 0);
--signal Pos_x: std_logic_VECTOR(5 downto 0);
--signal Pos_y: std_logic_VECTOR(4 downto 0);

component registre_T
generic ( taille : integer := 4);
	PORT(
		D : IN STD_LOGIC_VECTOR(taille-1 DOWNTO 0);
		clk, E, R: IN STD_LOGIC;
		Q : OUT STD_LOGIC_VECTOR(taille-1 DOWNTO 0));
	end component;
	
	component Bouton_P
	generic ( taille : integer := 4);
	PORT(clk : in std_LOGIC;
		  U : IN STD_LOGIC;
        D : In STD_LOGIC;
        L: IN STD_LOGIC;
		  R : IN STD_LOGIC;
		  FLECHEE : out STD_LOGIC_VECTOR (taille-1 downto 0):= "0000";
		  F: out std_LOGIC:='0');
	end component;
	
	component compteur_generic_pos
	generic (taille : integer := 6);
	PORT (
	RESET, CLOCK, LOAD, UP, E: in std_logic;
	DATA : in std_logic_vector (taille-1 downto 0);
	Q : out std_logic_vector (taille-1 downto 0));
	end component;
	
	component MULTI is
	generic (taille : integer := 4);
PORT (MM : IN STD_LOGIC_VECTOR(taille-1 DOWNTO 0);
		UU : IN STD_LOGIC_VECTOR(taille-1 DOWNTO 0);
		LL:out std_logic);
		end component;
	
	component UC
	generic ( taille : integer := 4);
    PORT (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC := '0';
		  Dir : in std_logic_vector (3 downto 0);
		  FLECHEE : in std_logic_vector (3 downto 0);
		  P : IN STD_LOGIC := '0';
		  S : IN STD_LOGIC := '0';
		  Ex,UPx : OUT STD_LOGIC;
		  Ey,UPy : OUT STD_LOGIC
    );
	end component;
 
begin

B_P:Bouton_P
	generic map (taille=>4)
	port Map (FLECHEE=>FLECHEE,F=>F, U=>U, D=>D, L=>L, R=>R,clk=>clk);
	
	  
	  MULTI_P: MULTI
generic map (taille=>4)
port map (MM=>Col,UU=>FLECHEE, LL=>P);
	
R_Dir : registre_T
	  generic map(taille => 4)
	  port map(D=>FLECHEE, clk => clk,E=>P, R => R, Q => Dir);
	  
	  MULTI_S: MULTI
generic map (taille=>4)
port map (MM=>COl,UU=>Dir, LL=>S);
	  
	  controle : UC
port map(Dir=>Dir, FLECHEE=>FLECHEE, reset => reset,clk => clk, P => P,S => S,Ex  => Ex,UPx => UPx,Ey => Ey,UPy => UPy);

	  
Position_x : compteur_generic_pos
generic map (taille => 6)	
port map ( CLOCK=>clk, UP=>UPx, LOAD=>LOAD, RESET=>reset, E=>Ex, DATA=>DATA, Q=>pos_x ); 


Position_y : compteur_generic_pos
generic map (taille => 6)	
port map (CLOCK=>clk,UP=>UPy, LOAD=>LOAD,RESET=>reset,E=>Ey, DATA=>DATA,Q=>pos_y );

	 	

end structurel;
-------------------------------------------------------------------------------------
