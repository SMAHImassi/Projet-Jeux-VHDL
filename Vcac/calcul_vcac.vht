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
-- Generated on "05/17/2018 19:15:58"
                                                            
-- Vhdl Test Bench template for design  :  calcul_vcac
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;  
use ieee.numeric_std.all;                              

ENTITY calcul_vcac_vhd_tst IS
END calcul_vcac_vhd_tst;
ARCHITECTURE calcul_vcac_arch OF calcul_vcac_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL D : STD_LOGIC_VECTOR(11 DOWNTO 0);
SIGNAL eoc : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
SIGNAL syn : STD_LOGIC;
SIGNAL Vcac : STD_LOGIC_VECTOR(11 DOWNTO 0);
COMPONENT calcul_vcac
	PORT (
	clk : IN STD_LOGIC;
	D : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
	eoc : IN STD_LOGIC;
	reset : IN STD_LOGIC;
	syn : OUT STD_LOGIC;
	Vcac : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : calcul_vcac
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	D => D,
	eoc => eoc,
	reset => reset,
	syn => syn,
	Vcac => Vcac
	);
	
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
      reset <= '1';
		D <= std_LOGIC_VECTOR(to_unsigned(12,12));
		 eoc <= '1' ;
		 wait for 10 ns ;
		 eoc <= '0' ;
		 reset <= '0';
			wait for 190 ns ;
		D <= std_LOGIC_VECTOR(to_unsigned(56,12));
		 eoc <= '1' ;
		 wait for 10 ns ;
		 eoc <= '0' ;
		wait for 190 ns ;
		       D <= std_LOGIC_VECTOR(to_unsigned(192,12));
		 eoc <= '1' ;
		 wait for 10 ns ;
		 eoc <= '0' ;
			wait for 190 ns ;
	       D <= std_LOGIC_VECTOR(to_unsigned(7,12));
		 eoc <= '1' ;
		 wait for 10 ns ;
		 eoc <= '0' ;
			wait for 190 ns ;
	       D <= std_LOGIC_VECTOR(to_unsigned(45,12));
		 eoc <= '1' ;
		 wait for 10 ns ;
		 eoc <= '0' ;
			wait for 190 ns ;
       D <= std_LOGIC_VECTOR(to_unsigned(123,12));
		 eoc <= '1' ;
		 wait for 10 ns ;
		 eoc <= '0' ;
			wait for 190 ns ;
		D <= std_LOGIC_VECTOR(to_unsigned(450,12));
		 eoc <= '1' ;
		 wait for 10 ns ;
		 eoc <= '0' ;
			wait for 190 ns ;
		D <= std_LOGIC_VECTOR(to_unsigned(5,12));
		 eoc <= '1' ;
		 wait for 10 ns ;
		 eoc <= '0' ;
			wait for 190 ns ;
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS 
		                                  
BEGIN                                                         
       clk <= '1';
 for i in 0 to 400 loop
		wait for 5 ns ;
		clk <= not(clk) ; 
		
		end loop;    -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always;                                          
END calcul_vcac_arch;
