-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "06/23/2018 00:50:11"
                                                            
-- Vhdl Test Bench template for design  :  Position_PacMan
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Position_PacMan_vhd_tst IS
END Position_PacMan_vhd_tst;
ARCHITECTURE Position_PacMan_arch OF Position_PacMan_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL Col : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL D : STD_LOGIC;
SIGNAL L : STD_LOGIC;
SIGNAL Pos_x : STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL Pos_y : STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL R : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
SIGNAL U : STD_LOGIC;
COMPONENT Position_PacMan
	PORT (
	clk : IN STD_LOGIC;
	Col : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	D : IN STD_LOGIC;
	L : IN STD_LOGIC;
	Pos_x : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
	Pos_y : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
	R : IN STD_LOGIC;
	reset : IN STD_LOGIC;
	U : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : Position_PacMan
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	Col => Col,
	D => D,
	L => L,
	Pos_x => Pos_x,
	Pos_y => Pos_y,
	R => R,
	reset => reset,
	U => U
	);
init: PROCESS                                               
-- variable  
BEGIN
Clk<='1';
 for i in 0 to 100 loop
  wait for 50 ns;
 Clk<= not Clk;
 end loop;  
WAIT;
END PROCESS init;                                                     
    -- code that executes only once                                                                                                                
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         

reset<='0';
R<='0';U<='0';L<='0';D<='0'; -- aucun bouton n'est enfoncé                                            
Col<="0101"; --case0 -- collision up et left 
wait for 500 ns;
Col<="0101"; --case0 --collision up et left
R<='0';
U<='0';L<='0';D<='0'; -- aucun bouton acitionné
wait for 500 ns;
Col<="0010"; -- collision up, down et right
R<='0';U<='0';L<='0';D<='0'; --case1 aucun bouton n'est actionné 
wait for 500 ns;
Col<="1011"; --case2 -- collision down
U<='1';   -- bouton up enfoncé
R<='0';L<='0';D<='0';
wait for 500 ns; 
Col<="1010"; -- collision down et right
R<='0';U<='0';L<='0';D<='0';--case3 aucun bouton actionné
wait for 500 ns;
Col<="1011"; --case2 collision down
U<='0';
R<='0';L<='1';D<='0'; -- bouton left enfoncé
wait for 500 ns; 
Col<="1111"; -- aucune collision
R<='0';U<='0';L<='0';D<='0'; --case4 aucun bouton actionné
wait for 500 ns;
Col<="0100"; -- collision up, left et right
R<='0';U<='0';L<='0';D<='1'; --case5 bouton down enfoncé
wait for 500 ns;     -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always;                                          
END Position_PacMan_arch;
