////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: CPU_synthesis.v
// /___/   /\     Timestamp: Sat May 13 20:59:37 2017
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/synthesis -ofmt verilog -sim CPU.ngc CPU_synthesis.v 
// Device	: xc6slx16-3-csg324
// Input file	: CPU.ngc
// Output file	: C:\Users\WQ\Desktop\2017Spring\ComputerOriganization\experiment\E7\MIPS\netgen\synthesis\CPU_synthesis.v
// # of Modules	: 1
// Design Name	: CPU
// Xilinx        : F:\xilinx\14.7\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module CPU (
  clk, rst_n, reg1, reg2
)/* synthesis syn_black_box syn_noprune=1 */;
  input clk;
  input rst_n;
  output [31 : 0] reg1;
  output [31 : 0] reg2;
  
  // synthesis translate_off
  
  wire clk_BUFGP_0;
  wire clk_INV_2_o;
  wire reg1_9_OBUF_2;
  wire \NLW_u_MemControl/u_Data_Mem_spo<31>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Data_Mem_spo<30>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Data_Mem_spo<29>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Data_Mem_spo<28>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Data_Mem_spo<27>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Data_Mem_spo<26>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Data_Mem_spo<25>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Data_Mem_spo<24>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Data_Mem_spo<23>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Data_Mem_spo<22>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Data_Mem_spo<21>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Data_Mem_spo<20>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Data_Mem_spo<19>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Data_Mem_spo<18>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Data_Mem_spo<17>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Data_Mem_spo<16>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Data_Mem_spo<15>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Data_Mem_spo<14>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Data_Mem_spo<13>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Data_Mem_spo<12>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Data_Mem_spo<11>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Data_Mem_spo<10>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Data_Mem_spo<9>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Data_Mem_spo<8>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Data_Mem_spo<7>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Data_Mem_spo<6>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Data_Mem_spo<5>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Data_Mem_spo<4>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Data_Mem_spo<3>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Data_Mem_spo<2>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Data_Mem_spo<1>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Data_Mem_spo<0>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Instr_Mem_spo<31>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Instr_Mem_spo<30>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Instr_Mem_spo<29>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Instr_Mem_spo<28>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Instr_Mem_spo<27>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Instr_Mem_spo<26>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Instr_Mem_spo<25>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Instr_Mem_spo<24>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Instr_Mem_spo<23>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Instr_Mem_spo<22>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Instr_Mem_spo<21>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Instr_Mem_spo<20>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Instr_Mem_spo<19>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Instr_Mem_spo<18>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Instr_Mem_spo<17>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Instr_Mem_spo<16>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Instr_Mem_spo<15>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Instr_Mem_spo<14>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Instr_Mem_spo<13>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Instr_Mem_spo<12>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Instr_Mem_spo<11>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Instr_Mem_spo<10>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Instr_Mem_spo<9>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Instr_Mem_spo<8>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Instr_Mem_spo<7>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Instr_Mem_spo<6>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Instr_Mem_spo<5>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Instr_Mem_spo<4>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Instr_Mem_spo<3>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Instr_Mem_spo<2>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Instr_Mem_spo<1>_UNCONNECTED ;
  wire \NLW_u_MemControl/u_Instr_Mem_spo<0>_UNCONNECTED ;
  GND   XST_GND (
    .G(reg1_9_OBUF_2)
  );
  OBUF   reg1_31_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg1[31])
  );
  OBUF   reg1_30_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg1[30])
  );
  OBUF   reg1_29_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg1[29])
  );
  OBUF   reg1_28_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg1[28])
  );
  OBUF   reg1_27_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg1[27])
  );
  OBUF   reg1_26_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg1[26])
  );
  OBUF   reg1_25_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg1[25])
  );
  OBUF   reg1_24_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg1[24])
  );
  OBUF   reg1_23_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg1[23])
  );
  OBUF   reg1_22_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg1[22])
  );
  OBUF   reg1_21_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg1[21])
  );
  OBUF   reg1_20_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg1[20])
  );
  OBUF   reg1_19_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg1[19])
  );
  OBUF   reg1_18_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg1[18])
  );
  OBUF   reg1_17_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg1[17])
  );
  OBUF   reg1_16_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg1[16])
  );
  OBUF   reg1_15_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg1[15])
  );
  OBUF   reg1_14_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg1[14])
  );
  OBUF   reg1_13_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg1[13])
  );
  OBUF   reg1_12_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg1[12])
  );
  OBUF   reg1_11_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg1[11])
  );
  OBUF   reg1_10_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg1[10])
  );
  OBUF   reg1_9_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg1[9])
  );
  OBUF   reg1_8_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg1[8])
  );
  OBUF   reg1_7_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg1[7])
  );
  OBUF   reg1_6_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg1[6])
  );
  OBUF   reg1_5_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg1[5])
  );
  OBUF   reg1_4_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg1[4])
  );
  OBUF   reg1_3_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg1[3])
  );
  OBUF   reg1_2_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg1[2])
  );
  OBUF   reg1_1_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg1[1])
  );
  OBUF   reg1_0_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg1[0])
  );
  OBUF   reg2_31_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg2[31])
  );
  OBUF   reg2_30_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg2[30])
  );
  OBUF   reg2_29_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg2[29])
  );
  OBUF   reg2_28_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg2[28])
  );
  OBUF   reg2_27_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg2[27])
  );
  OBUF   reg2_26_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg2[26])
  );
  OBUF   reg2_25_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg2[25])
  );
  OBUF   reg2_24_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg2[24])
  );
  OBUF   reg2_23_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg2[23])
  );
  OBUF   reg2_22_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg2[22])
  );
  OBUF   reg2_21_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg2[21])
  );
  OBUF   reg2_20_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg2[20])
  );
  OBUF   reg2_19_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg2[19])
  );
  OBUF   reg2_18_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg2[18])
  );
  OBUF   reg2_17_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg2[17])
  );
  OBUF   reg2_16_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg2[16])
  );
  OBUF   reg2_15_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg2[15])
  );
  OBUF   reg2_14_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg2[14])
  );
  OBUF   reg2_13_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg2[13])
  );
  OBUF   reg2_12_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg2[12])
  );
  OBUF   reg2_11_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg2[11])
  );
  OBUF   reg2_10_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg2[10])
  );
  OBUF   reg2_9_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg2[9])
  );
  OBUF   reg2_8_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg2[8])
  );
  OBUF   reg2_7_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg2[7])
  );
  OBUF   reg2_6_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg2[6])
  );
  OBUF   reg2_5_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg2[5])
  );
  OBUF   reg2_4_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg2[4])
  );
  OBUF   reg2_3_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg2[3])
  );
  OBUF   reg2_2_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg2[2])
  );
  OBUF   reg2_1_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg2[1])
  );
  OBUF   reg2_0_OBUF (
    .I(reg1_9_OBUF_2),
    .O(reg2[0])
  );
  BUFGP   clk_BUFGP (
    .I(clk),
    .O(clk_BUFGP_0)
  );
  INV   clk_INV_2_o1_INV_0 (
    .I(clk_BUFGP_0),
    .O(clk_INV_2_o)
  );
  Data_Mem   \u_MemControl/u_Data_Mem  (
    .clk(clk_INV_2_o),
    .we(reg1_9_OBUF_2),
    .a({reg1_9_OBUF_2, reg1_9_OBUF_2, reg1_9_OBUF_2, reg1_9_OBUF_2, reg1_9_OBUF_2, reg1_9_OBUF_2, reg1_9_OBUF_2, reg1_9_OBUF_2, reg1_9_OBUF_2}),
    .d({reg1_9_OBUF_2, reg1_9_OBUF_2, reg1_9_OBUF_2, reg1_9_OBUF_2, reg1_9_OBUF_2, reg1_9_OBUF_2, reg1_9_OBUF_2, reg1_9_OBUF_2, reg1_9_OBUF_2, 
reg1_9_OBUF_2, reg1_9_OBUF_2, reg1_9_OBUF_2, reg1_9_OBUF_2, reg1_9_OBUF_2, reg1_9_OBUF_2, reg1_9_OBUF_2, reg1_9_OBUF_2, reg1_9_OBUF_2, reg1_9_OBUF_2, 
reg1_9_OBUF_2, reg1_9_OBUF_2, reg1_9_OBUF_2, reg1_9_OBUF_2, reg1_9_OBUF_2, reg1_9_OBUF_2, reg1_9_OBUF_2, reg1_9_OBUF_2, reg1_9_OBUF_2, reg1_9_OBUF_2, 
reg1_9_OBUF_2, reg1_9_OBUF_2, reg1_9_OBUF_2}),
    .spo({\NLW_u_MemControl/u_Data_Mem_spo<31>_UNCONNECTED , \NLW_u_MemControl/u_Data_Mem_spo<30>_UNCONNECTED , 
\NLW_u_MemControl/u_Data_Mem_spo<29>_UNCONNECTED , \NLW_u_MemControl/u_Data_Mem_spo<28>_UNCONNECTED , 
\NLW_u_MemControl/u_Data_Mem_spo<27>_UNCONNECTED , \NLW_u_MemControl/u_Data_Mem_spo<26>_UNCONNECTED , 
\NLW_u_MemControl/u_Data_Mem_spo<25>_UNCONNECTED , \NLW_u_MemControl/u_Data_Mem_spo<24>_UNCONNECTED , 
\NLW_u_MemControl/u_Data_Mem_spo<23>_UNCONNECTED , \NLW_u_MemControl/u_Data_Mem_spo<22>_UNCONNECTED , 
\NLW_u_MemControl/u_Data_Mem_spo<21>_UNCONNECTED , \NLW_u_MemControl/u_Data_Mem_spo<20>_UNCONNECTED , 
\NLW_u_MemControl/u_Data_Mem_spo<19>_UNCONNECTED , \NLW_u_MemControl/u_Data_Mem_spo<18>_UNCONNECTED , 
\NLW_u_MemControl/u_Data_Mem_spo<17>_UNCONNECTED , \NLW_u_MemControl/u_Data_Mem_spo<16>_UNCONNECTED , 
\NLW_u_MemControl/u_Data_Mem_spo<15>_UNCONNECTED , \NLW_u_MemControl/u_Data_Mem_spo<14>_UNCONNECTED , 
\NLW_u_MemControl/u_Data_Mem_spo<13>_UNCONNECTED , \NLW_u_MemControl/u_Data_Mem_spo<12>_UNCONNECTED , 
\NLW_u_MemControl/u_Data_Mem_spo<11>_UNCONNECTED , \NLW_u_MemControl/u_Data_Mem_spo<10>_UNCONNECTED , \NLW_u_MemControl/u_Data_Mem_spo<9>_UNCONNECTED 
, \NLW_u_MemControl/u_Data_Mem_spo<8>_UNCONNECTED , \NLW_u_MemControl/u_Data_Mem_spo<7>_UNCONNECTED , \NLW_u_MemControl/u_Data_Mem_spo<6>_UNCONNECTED 
, \NLW_u_MemControl/u_Data_Mem_spo<5>_UNCONNECTED , \NLW_u_MemControl/u_Data_Mem_spo<4>_UNCONNECTED , \NLW_u_MemControl/u_Data_Mem_spo<3>_UNCONNECTED 
, \NLW_u_MemControl/u_Data_Mem_spo<2>_UNCONNECTED , \NLW_u_MemControl/u_Data_Mem_spo<1>_UNCONNECTED , \NLW_u_MemControl/u_Data_Mem_spo<0>_UNCONNECTED 
})
  );
  Instr_Mem   \u_MemControl/u_Instr_Mem  (
    .a({reg1_9_OBUF_2, reg1_9_OBUF_2, reg1_9_OBUF_2, reg1_9_OBUF_2, reg1_9_OBUF_2, reg1_9_OBUF_2, reg1_9_OBUF_2, reg1_9_OBUF_2, reg1_9_OBUF_2}),
    .spo({\NLW_u_MemControl/u_Instr_Mem_spo<31>_UNCONNECTED , \NLW_u_MemControl/u_Instr_Mem_spo<30>_UNCONNECTED , 
\NLW_u_MemControl/u_Instr_Mem_spo<29>_UNCONNECTED , \NLW_u_MemControl/u_Instr_Mem_spo<28>_UNCONNECTED , 
\NLW_u_MemControl/u_Instr_Mem_spo<27>_UNCONNECTED , \NLW_u_MemControl/u_Instr_Mem_spo<26>_UNCONNECTED , 
\NLW_u_MemControl/u_Instr_Mem_spo<25>_UNCONNECTED , \NLW_u_MemControl/u_Instr_Mem_spo<24>_UNCONNECTED , 
\NLW_u_MemControl/u_Instr_Mem_spo<23>_UNCONNECTED , \NLW_u_MemControl/u_Instr_Mem_spo<22>_UNCONNECTED , 
\NLW_u_MemControl/u_Instr_Mem_spo<21>_UNCONNECTED , \NLW_u_MemControl/u_Instr_Mem_spo<20>_UNCONNECTED , 
\NLW_u_MemControl/u_Instr_Mem_spo<19>_UNCONNECTED , \NLW_u_MemControl/u_Instr_Mem_spo<18>_UNCONNECTED , 
\NLW_u_MemControl/u_Instr_Mem_spo<17>_UNCONNECTED , \NLW_u_MemControl/u_Instr_Mem_spo<16>_UNCONNECTED , 
\NLW_u_MemControl/u_Instr_Mem_spo<15>_UNCONNECTED , \NLW_u_MemControl/u_Instr_Mem_spo<14>_UNCONNECTED , 
\NLW_u_MemControl/u_Instr_Mem_spo<13>_UNCONNECTED , \NLW_u_MemControl/u_Instr_Mem_spo<12>_UNCONNECTED , 
\NLW_u_MemControl/u_Instr_Mem_spo<11>_UNCONNECTED , \NLW_u_MemControl/u_Instr_Mem_spo<10>_UNCONNECTED , 
\NLW_u_MemControl/u_Instr_Mem_spo<9>_UNCONNECTED , \NLW_u_MemControl/u_Instr_Mem_spo<8>_UNCONNECTED , 
\NLW_u_MemControl/u_Instr_Mem_spo<7>_UNCONNECTED , \NLW_u_MemControl/u_Instr_Mem_spo<6>_UNCONNECTED , 
\NLW_u_MemControl/u_Instr_Mem_spo<5>_UNCONNECTED , \NLW_u_MemControl/u_Instr_Mem_spo<4>_UNCONNECTED , 
\NLW_u_MemControl/u_Instr_Mem_spo<3>_UNCONNECTED , \NLW_u_MemControl/u_Instr_Mem_spo<2>_UNCONNECTED , 
\NLW_u_MemControl/u_Instr_Mem_spo<1>_UNCONNECTED , \NLW_u_MemControl/u_Instr_Mem_spo<0>_UNCONNECTED })
  );

// synthesis translate_on

endmodule

// synthesis translate_off

`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

// synthesis translate_on
