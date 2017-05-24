 .data
num1:   .word 0xfffe1234
num2:   .word 0xabcd1234
num3:   .word 0xf0000000
num4:   .word 0x8fffffff
result: .word 0

      .text
      la $t0, result
      xor $t1, $t1, $t1
      xor $t2, $t2, $t2
      xor $t3, $t3, $t3
      xor $t4, $t4, $t4
      addi $t1, $t1, 1
      addi $t2, $t2, 2
      addi $t3, $t3, -1
 

      #test lw              0
      lw    $t4, 0($t0)
      addi  $t0, $t0, 4

      #test add addi        0
      add   $t5, $t1, $t3
      sw    $t5, 0($t0)
      addi  $t0, $t0, 4

      #test addu  addiu          
      addu  $t5, $t1, $t2
      sw    $t5, 0($t0)
      addi  $t0, $t0, 4
      addiu $t5, $t5, 0xabcd
      sw    $t5, 0($t0)
      addi  $t0, $t0, 4

      #test sub             2
      sub   $t5, $t1, $t3
      sw    $t5, 0($t0)
      addi  $t0, $t0, 4

      #test subu            1
      subu  $t5, $t2, $t1
      sw    $t5, 0($t0)
      addi  $t0, $t0, 4

      #test and             1
      and   $t5, $t1, $t3
      sw    $t5, 0($t0)
      addi  $t0, $t0, 4

      #test andi ori xori lui slti sltiu
      andi  $t5, $t3, 16
      lw    $t4, num2
      andi  $t6, $t4, 0xdcba
      ori   $t6, $t4, 0xdcba
      sw    $t5, 0($t0)
      addi  $t0, $t0, 4
      sw    $t6, 0($t0)
      addi  $t0, $t0, 4
      xori  $t5, $t4, 0xdcba
      lui   $t6, 0x2134
      sw    $t5, 0($t0)
      addi  $t0, $t0, 4
      sw    $t6, 0($t0)
      addi  $t0, $t0, 4
      addi  $t5, $0, 0x1234
      slti  $t6, $t5, -1
      sw    $t6, 0($t0)
      addi  $t0, $t0, 4
      sltiu $t6, $t5, -1
      sw    $t6, 0($t0)
      addi  $t0, $t0, 4

      #test or              3
      or    $t5, $t1, $t2
      sw    $t5, 0($t0)
      addi  $t0, $t0, 4

      #test nor             0
      nor   $t5, $t3, $t1
      sw    $t5, 0($t0)
      addi  $t0, $t0, 4

      #test xor             -2
      xor   $t5, $t3, $t1
      sw    $t5, 0($t0)
      addi  $t0, $t0, 4
      addi  $t5, $t5, 5


      #test bgtz j branch_prediction          
LABLE:
      addi  $t5, $t5, -1
      bgtz  $t5, LABLE
      j     FINISH
      addi  $t5, $t5, 1
FINISH:
      sw    $t5, 0($t0)
      addi  $t0, $t0, 4

      #test bnz              0
      bne   $t5, $t1, NE     #[t5] = 1
      xor   $t5, $t5, $t5
NE:
      sw    $t5, 0($t0)
      addi  $t0, $t0, 4
      
      #test beq
      addi  $t5, $t0, 0
      beq   $t0, $t5, EQ
      add   $t5, $t5, $t5
EQ:
      sw    $t5, 0($t0)
      addi  $t0, $t0, 4



      #test jr                8
      la    $t6, TJR
      xor   $t5, $t5, $t5
      jr    $t6
      addi  $t5, $t5, 16
TJR:
      addi  $t5, $t5, 8
      sw    $t5, 0($t0)
      addi  $t0, $t0, 4


      #test forword * 2       2
      la    $t6, result
      lw    $t1, 0($t6)       # $t1 = [$t0] = 0
      add   $t1, $t2, $t3
      add   $t3, $t1, $t1
      sw    $t3, 0($t0)
      addi  $t0, $t0, 4
      
      #test stall, forward * 1
      lw    $t1, -4($t0)
      add   $t2, $t1, $t2
      add   $t3, $t1, $t2
      sw    $t3, 0($t0)
      
      #test jal slt sltu
      jal   TJAL
      addi  $t1, $0, -1
      addi  $t2, $0, 2
      sltu  $t3, $t1, $t2
      slt   $t4, $t1, $t2
      sw    $t3, 0($t0)
      addi  $t0, $t0, 8
      sw    $t4, -4($t0)
      
      #test overflow
      lw    $t3, num3 #11110000
      lw    $t4, num4 #10001111
      add   $t5, $t3, $t4
      sw    $t5, 0($t0)
      

OUT:
      j     OUT

TJAL: #test sll srl sra sllv srlv srav 
      lw    $t1, num1  #$t1=0xfffe1234
      addi  $t2, $0, 5
      sll   $t3, $t1, 5
      sw    $t3, 0($t0)
      addi  $t0, $t0, 4
      srl   $t3, $t1, 5
      sra   $t4, $t1, 5
      sw    $t3, 0($t0)
      sw    $t4, 4($t0)
      addi  $t0, $t0, 8
      sllv  $t3, $t1, $t2
      sw    $t3, 0($t0)
      addi  $t0, $t0, 4
      srlv  $t3, $t1, $t2
      srav  $t4, $t1, $t2
      sw    $t3, 0($t0)
      sw    $t4, 4($t0)
      addi  $t0, $t0, 8
      jr    $31
      
