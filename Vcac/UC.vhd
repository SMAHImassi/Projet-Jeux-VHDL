LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY UC IS
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
END UC;

ARCHITECTURE BEHAVIOR OF UC IS
    TYPE type_fstate IS (S0,attente,S1,S2,S3);
    SIGNAL state, state_f : type_fstate;
   
BEGIN
	process (clk,reset)
	BEGIN
			IF (reset='1') THEN
            state <= S0;
        ELSIF clk'event and clk = '1' then
				state <= state_f;
			end if ;
	end process;
    PROCESS (I,state, eoc,S)
    BEGIN
            CASE state IS
                WHEN S0 =>
					 state_f <= attente;
					 		Er <= '1';
                    Em <= '1';
							El <= '1';
                    Ev <= '1';
						  Syn <= '1';
					 WHEN attente =>
                    IF (Eoc = '1') THEN
                        state_f <= s1;
								Er <= '1';
                    ELSE
                       state_f <= attente;
							  Er <= '0';
                    END IF;
						
                    Em <= '0';
							El <= '0';
                    Ev <= '0';
						  Syn <= '0';
                WHEN S1 =>
                    IF (S = '1') THEN
                        state_f <= S2;
                    Em <= '1';
                    El <= '0';						  
                    ELSIF (I = '1') THEN
                        state_f <= S2;
                    Em <= '0';
                    El <= '1';						  
                    ELSE
                        state_f <= attente;
                   Em <= '0';
                    El <= '0';									
                    END IF;
							Er <= '1';

                    Ev <= '0';
						  Syn <= '0';
                WHEN S2 =>
                        state_f <= S3;
                   Er <= '0';
                    Em <= '0';
							El <= '0';
                    Ev <= '1';
						  Syn <= '0';
                WHEN OTHERS =>
                        state_f <= attente;
                   
                    Er <= '0';
                    Em <= '0';
							El <= '0';
                    Ev <= '0';
						  Syn <= '1';
            END CASE;
    END PROCESS;
END BEHAVIOR;