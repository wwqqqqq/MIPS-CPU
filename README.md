# MIPS-CPU

## Developing Environment
OS: Windows 10

Software:
- Xilinx
- Diligent

Language: Verilog

Hardware / FPGA device: Nexys 3 Spartan-6 FPGA, 100 MHz

## Functionalities and features

### Supported Instructions:
Basic instructions:
```
add addi addu sub subu 
and andi or nor xor
bgtz bne j jr
lw sw
```
Additional instructions:
```
slt sltu sll srl sra sllv srlv srav jal 
addiu ori xori lui slti sltiu beq
```

### Interruption
- [ ]	Deviding by zero interruption (1)
- [ ]	Overflow interruption (1)
- [ ]	Instruction interruption (2)
- [x]	Breakpoint interruption (3)
- [ ]	Single-step int (3)

### Pipeline
- [x]	Stall
- [x]	Forwarding \*1
- [x]	Forwarding \*2

### On FPGA Device
- [ ]	Check RAM sequentially
- [x]	Check RAM with FPGA switches


