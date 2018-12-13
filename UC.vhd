LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY UC IS
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
END UC;

ARCHITECTURE BEHAVIOR_T OF UC IS
    TYPE type_fstate IS (Arret, MoveUP, MoveDown, MoveLeft, MoveRight);
    SIGNAL state, state_f: type_fstate;
   
BEGIN
	P0:process (clk,reset)
	BEGIN
			IF (reset='1') THEN
            state <= Arret;
        ELSIF clk'event and clk = '1' then
				state <= state_f	;
			end if ;
	end process P0;
    P1:PROCESS (state,P,S,Dir,FLECHEE)
    BEGIN
            CASE state IS
                WHEN Arret =>
					 IF (P = '1') THEN
                       if (FLECHEE(3) = '1' )then 
								state_f <= MoveUP;
								else
									if (FLECHEE(2)= '1' )then 
									state_f <= MoveDown;
									else
										if (FLECHEE(1) = '1' )then 
										state_f <= MoveLeft;
										else
											if (FLECHEE(0) = '1' )then 
											state_f <= MoveRight;
											else
											state_f <= Arret;
											end if;
										end if;
									end if;
								end if;	
                    ELSE
									state_f <= Arret;
                    END IF;
					 
					 WHEN MoveUP =>
                    IF (P = '1') THEN
								if (FLECHEE(3) = '1' )then 
								state_f <= MoveUP;
								else
									if (FLECHEE(2) = '1' )then 
									state_f <= MoveDown;
									else
										if (FLECHEE(1) = '1' )then 
										state_f <= MoveLeft;
										else
											if (FLECHEE(0) = '1' )then 
											state_f <= MoveRight;
											else
											state_f <= Arret;
											end if;
										end if;
									end if;
								end if;							
                    ELSE
                      If (S = '1') then 
									if (Dir(3)='1') then
									state_f <= MoveUP;
									else 
										if (Dir(2)='1') then
										state_f <= MoveDown;
										else
											if (Dir(1)='1') then
											state_f <= MoveLeft;
											else 
												if (Dir(0)='1') then
												state_f <= MoveRight;
												else
												state_f <= Arret;
												end if;
											end if;
										end if;
									end if;
								Else 
								state_f <= Arret;
							End if;
						 END IF;	  
                WHEN MoveDown =>
                    IF (P = '1') THEN
								if (FLECHEE(3) = '1' )then 
								state_f <= MoveUP;
								else
									if (FLECHEE(2) = '1' )then 
									state_f <= MoveDown;
									else
										if ( FLECHEE(1) = '1' )then 
										state_f <= MoveLeft;
										else
											if (FLECHEE(0) = '1' )then 
											state_f <= MoveRight;
											else
											state_f <= Arret;
											end if;
										end if;
									end if;
								end if;
                    ELSE
                       If (S = '1') then 
									if (Dir(3)='1') then
									state_f <= MoveUP;
									else 
										if (Dir(2)='1') then
										state_f <= MoveDown;
										else
											if (Dir(1)='1') then
											state_f <= MoveLeft;
											else 
												if (Dir(0)='1') then
												state_f <= MoveRight;
												else
												state_f <= Arret;
												end if;
											end if;
										end if;
									end if;
								Else 
									state_f <= Arret;
							end if;
						 END IF;
                WHEN MoveLeft =>
                     IF (P = '1') THEN
								if (FLECHEE(3) = '1' )then 
								state_f <= MoveUP;
								else
									if (FLECHEE(2) = '1' )then 
									state_f <= MoveDown;
									else
										if (FLECHEE(1) = '1' )then 
										state_f <= MoveLeft;
										else
											if (FLECHEE(0) = '1' )then 
											state_f <= MoveRight;
											else
											state_f <= Arret;
											end if;
										end if;
									end if;
								end if;									
                    ELSE
                     If (S = '1') then 
									if (Dir(3)='1') then
									state_f <= MoveUP;
									else 
										if (Dir(2)='1') then
										state_f <= MoveDown;
										else
											if (Dir(1)='1') then
											state_f <= MoveLeft;
											else 
												if (Dir(0)='1') then
												state_f <= MoveRight;
												else
												state_f <= Arret;
												end if;
											end if;
										end if;
									end if;
								Else 
									state_f <= Arret;
							end if;
						 END IF;
						  WHEN MoveRight =>
                     IF (P = '1') THEN
								if (FLECHEE(3) = '1' )then 
								state_f <= MoveUP;
								else
									if (FLECHEE(2) = '1' )then 
									state_f <= MoveDown;
									else
										if (FLECHEE(1) = '1' )then 
										state_f <= MoveLeft;
										else
											if (FLECHEE(0) = '1' )then 
											state_f <= MoveRight;
											else
											state_f <= Arret;
											end if;
										end if;
									end if;
								end if;
                    ELSE
                      If (S = '1') then 
									if (Dir(3)='1') then
									state_f <= MoveUP;
									else 
										if (Dir(2)='1') then
										state_f <= MoveDown;
										else
											if (Dir(1)='1') then
											state_f <= MoveLeft;
											else 
												if (Dir(0)='1') then
												state_f <= MoveRight;
												else
												state_f <= Arret;
												end if;
											end if;
										end if;
									end if;
								Else 
									state_f <= Arret;
							end if;
						 END IF;
						  
                WHEN OTHERS =>
							state_f <= Arret;
            END CASE;
    END PROCESS P1;
	P2:process (state)
	BEGIN
	CASE state IS
	when Arret =>
	Ex <= '0';
	Ey <= '0';
	UPx <='0';
	UPy <= '0';
	when MoveUP =>
	Ex <= '0';
	Ey <= '1';
	UPy <= '0';
	UPx <='0';
	
	when MoveDown =>
	Ex <= '0';
	Ey <= '1';
	UPx <='0';
	UPy <= '1';
	
	when MoveLeft =>
	Ex <= '1';
	Ey <= '0';
	UPx <= '0';
   UPy <= '0';	
	
	when MoveRight => 
	Ex <= '1';
	Ey <= '0';
	UPx <= '1';
	UPy <= '0';
	
	end case;
	end process P2;
    
	 
END BEHAVIOR_T;