# i sell this code to someone on fiver but after getting code he cancelled the order


.data

used1: .word 0
used2: .word 0
used3: .word 0
used4: .word 0
minInt: .word 0

oneInt: .word 0


hopPtr:  .word 0
hopPtr1: .word 0
hopPtr2: .word 0
hopPtr3: .word 0
hopPtr4: .word 0


begA1Str: .asciiz "beginning a1: "
cpaA1Str: .asciiz "chkPointA a1: "
proA1Str: .asciiz "processed a1: "

comAfStr: .asciiz   ": "
einStr: .asciiz    "Enter integer #"
moStr: .asciiz    "Max of "
ieStr: .asciiz    " ints entered..."
eaiStr: .asciiz   "End adding ints? (y or Y = yes, others = no) "
dacStr: .asciiz   "Do another case? (n or N = no, others = yes) "
dlStr: .asciiz    "================================"
byeStr:  .asciiz  "bye..."
intNum: .word 0
reply: .word 0
comAeStr: .asciiz "          a"


a1: .space 48
a2: .space 48
a3: .space 48
a4: .space 48



#a4: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0




.text
main:

li $a1, 0 # used1
li $a2, 0 # used2
li $a3, 0 # used3
li $v1, 0 # used4
li $t5, 0 # intNum
li $t6, 0 # minInt
li $t7, 0 # oneInt

la $t1, a1 # hopPtr1 -> a1
la $t2, a2 # hopPtr2 -> a2
la $t3, a3 # hopPtr3 -> a3
la $t4, a4 # hopPtr4 -> a4



la $t0,intNum
li $t1,0
sw $t1,0($t0)
la $t0,hopPtr
li $t1,0
sw $t1,0($t0)
la $t0,hopPtr1
li $t1,0
sw $t1,0($t0)
la $t0,hopPtr2
li $t1,0
sw $t1,0($t0)
la $t0,hopPtr3
li $t1,0
sw $t1,0($t0)




li $a0,10
li $v0,11
syscall




begDW1:
la $t6,a1
la $t7,a2



WTest1:



begW1:    

la $a0,eaiStr
li $v0,4
syscall


li $v0,12
syscall


li $t8,89
beq $v0,$t8,xitW1
li $t8,121
beq $v0,$t8,xitW1

li $a0,10
li $v0,11
syscall



la $a0,einStr
li $v0,4
syscall



la $t0,intNum
lw $a0,0($t0)
addi $a0,$a0,1
li $v0,1
syscall

li $a0,32
li $v0,11
syscall
li $a0,0


li $v0,5
syscall

la $t0,intNum
lw $t1,0($t0)

li $t8,0
beq $t1,$t8,begI1
li $t8,1
beq $t1,$t8,else

li $t2,2
div $t1,$t2
mfhi $t1  #remainder
li $t8,0
beq $t1,$t8,begI1
li $t8,1
beq $t1,$t8,else



begI1:   #yaha se even wale
sw $v0,0($t6)
addi $t6,$t6,4

la $t0,intNum
lw $t1,0($t0)
addi $t1,$t1,1
sw $t1,0($t0)

la $s0,hopPtr
lw $s1,0($s0)
addi $s1,$s1,1
sw $s1,0($s0)


la $t0,intNum
lw $t1,0($t0)
li $t8,12
beq $t1,$t8,xitW1



j begW1

else:
sw $v0,0($t7)
addi $t7,$t7,4

la $t0,intNum
lw $t1,0($t0)
addi $t1,$t1,1
sw $t1,0($t0)


la $s0,hopPtr1
lw $s1,0($s0)
addi $s1,$s1,1
sw $s1,0($s0)


la $t0,intNum
lw $t1,0($t0)
li $t8,12
beq $t1,$t8,xitW1



j begW1












xitW1:    #yaha se print hoga




li $a0,10
li $v0,11
syscall


la $a0,begA1Str
li $v0,4
syscall









la $t0,a1
li $t1,0
la $t2,hopPtr
lw $t3,0($t2)
begW2:
beq $t1,$t3,endW2
addi $t1,$t1,1
lw $a0,0($t0)
li $v0,1
syscall
addi $t0,$t0,4

li $a0,32
li $v0,11
syscall


j begW2
endW2:
     

li $a0,10
li $v0,11
syscall                          
                             
WTest2:               


la $a0,comAeStr
li $v0,4
syscall

li $a0,2
li $v0,1
syscall

la $a0,comAfStr
li $v0,4
syscall




la $t0,a2
li $t1,0
la $t2,hopPtr1
lw $t3,0($t2)
begW3:
beq $t1,$t3,endW3
addi $t1,$t1,1
lw $a0,0($t0)
li $v0,1
syscall
addi $t0,$t0,4

li $a0,32
li $v0,11
syscall


j begW3
endW3:






la $t1,hopPtr
lw $s5,0($t1)
la $t1,a1
la $t2,a3
li $t3,2
li $s6,0
li $t0,0
begI3:
beq $t0,$s5,endI3
addi $t0,$t0,1
lw $t4,0($t1)
li $t8,1
beq $t4,$t8,elseI3
div $t4,$t3
mfhi $t5
li $t8,1
beq $t5,$t8,elseI3
addi $t1,$t1,4
j begI3

elseI3:
lw $t4,0($t1)
sw $t4,0($t2)
addi $t1,$t1,4
addi $t2,$t2,4
la $s0,hopPtr2
lw $s1,0($s0)
addi $s1,$s1,1
sw $s1,0($s0)
j begI3
endI3:





la $t1,hopPtr1
lw $s5,0($t1)
la $t1,a2
li $t3,2
li $s6,0
li $t0,0
begI4:
beq $t0,$s5,endI4
addi $t0,$t0,1
lw $t4,0($t1)
li $t8,1
beq $t4,$t8,elseI4
div $t4,$t3
mfhi $t5
li $t8,1
beq $t5,$t8,elseI4
addi $t1,$t1,4
j begI4

elseI4:
lw $t4,0($t1)
sw $t4,0($t2)
addi $t1,$t1,4
addi $t2,$t2,4
la $s0,hopPtr2
lw $s1,0($s0)
addi $s1,$s1,1
sw $s1,0($s0)
j begI4
endI4:


li $a0,10
li $v0,11
syscall



la $a0,comAeStr
li $v0,4
syscall

li $a0,3
li $v0,1
syscall

la $a0,comAfStr
li $v0,4
syscall






la $t0,a3
li $t1,0
la $t2,hopPtr2
lw $t3,0($t2)
begW5:
beq $t1,$t3,endW5
addi $t1,$t1,1
lw $a0,0($t0)
li $v0,1
syscall
addi $t0,$t0,4

li $a0,32
li $v0,11
syscall


j begW5
endW5:






#yaha se even start


la $t1,hopPtr
lw $s5,0($t1)
la $t1,a1
la $t2,a4
li $t3,2
li $s6,0
li $t0,0
begI6:
beq $t0,$s5,endI6
addi $t0,$t0,1
lw $t4,0($t1)
li $t8,0
beq $t4,$t8,elseI6
div $t4,$t3
mfhi $t5
li $t8,0
beq $t5,$t8,elseI6
addi $t1,$t1,4
j begI6

elseI6:
lw $t4,0($t1)
sw $t4,0($t2)
addi $t1,$t1,4
addi $t2,$t2,4
la $s0,hopPtr3
lw $s1,0($s0)
addi $s1,$s1,1
sw $s1,0($s0)
j begI6
endI6:





la $t1,hopPtr1
lw $s5,0($t1)
la $t1,a2
li $t3,2
li $s6,0
li $t0,0
begI7:
beq $t0,$s5,endI7
addi $t0,$t0,1
lw $t4,0($t1)
li $t8,0
beq $t4,$t8,elseI7
div $t4,$t3
mfhi $t5
li $t8,0
beq $t5,$t8,elseI7
addi $t1,$t1,4
j begI7

elseI7:
lw $t4,0($t1)
sw $t4,0($t2)
addi $t1,$t1,4
addi $t2,$t2,4
la $s0,hopPtr3
lw $s1,0($s0)
addi $s1,$s1,1
sw $s1,0($s0)
j begI7
endI7:








li $a0,10
li $v0,11
syscall


la $a0,comAeStr
li $v0,4
syscall

li $a0,4
li $v0,1
syscall

la $a0,comAfStr
li $v0,4
syscall




la $t0,a4
li $t1,0
la $t2,hopPtr3
lw $t3,0($t2)
begW6:
beq $t1,$t3,endW6
addi $t1,$t1,1
lw $a0,0($t0)
li $v0,1
syscall
addi $t0,$t0,4

li $a0,32
li $v0,11
syscall


j begW6
endW6:








#yaha se second part start hoga
W7:

la $t0,a3
la $t1,a1
li $t2,0
la $s0,hopPtr2
lw $s1,0($s0)

I10:
beq $t2,$s1,endI10
addi $t2,$t2,1
lw $s2,0($t0)
sw $s2,0($t1)
addi $t0,$t0,4
addi $t1,$t1,4
j I10
endI10:




la $t0,a4
la $t1,a2
li $t2,0
la $s0,hopPtr3
lw $s1,0($s0)

I11:
beq $t2,$s1,endI11
addi $t2,$t2,1
lw $s2,0($t0)
sw $s2,0($t1)
addi $t0,$t0,4
addi $t1,$t1,4
j I11
endI11:






#sorting start hogi yaha se

la $t1,hopPtr2
lw $t0,0($t1)
li $t1,0

I12:
beq $t1,$t0,endI12
addi $t1,$t1,1
la $s0,a1
li $t2,1
else12:
beq $t2,$t0,endelse12
addi $t2,$t2,1
lw $s1,0($s0)
lw $s2,4($s0)
bge $s1,$s2,elseI12
addi $s0,$s0,4
j else12
elseI12:
sw $s1,4($s0)
sw $s2,0($s0)
addi $s0,$s0,4
j else12
endelse12:

j I12
endI12:




la $t1,hopPtr3
lw $t0,0($t1)
li $t1,0

I13:
beq $t1,$t0,endI13
addi $t1,$t1,1
la $s0,a2
li $t2,1
else13:
beq $t2,$t0,endelse13
addi $t2,$t2,1
lw $s1,0($s0)
lw $s2,4($s0)
bge $s1,$s2,elseI13
addi $s0,$s0,4
j else13
elseI13:
sw $s1,4($s0)
sw $s2,0($s0)
addi $s0,$s0,4
j else13
endelse13:

j I13
endI13:









#printing of second part
W8:

li $a0,10
li $v0,11
syscall

la $a0,cpaA1Str
li $v0,4
syscall




la $t0,a1
li $t1,0
la $t2,hopPtr2
lw $t3,0($t2)
I14:
beq $t1,$t3,endI14
addi $t1,$t1,1
lw $a0,0($t0)
li $v0,1
syscall
addi $t0,$t0,4

li $a0,32
li $v0,11
syscall

j I14
endI14:




li $a0,10
li $v0,11
syscall


la $a0,comAeStr
li $v0,4
syscall

li $a0,2
li $v0,1
syscall

la $a0,comAfStr
li $v0,4
syscall










la $t0,a2
li $t1,0
la $t2,hopPtr3
lw $t3,0($t2)
I15:
beq $t1,$t3,endI15
addi $t1,$t1,1
lw $a0,0($t0)
li $v0,1
syscall
addi $t0,$t0,4
li $a0,32
li $v0,11
syscall
j I15
endI15:


W12:


li $a0,10
li $v0,11
syscall




la $a0,comAeStr
li $v0,4
syscall

li $a0,3
li $v0,1
syscall

la $a0,comAfStr
li $v0,4
syscall











la $t0,a3
li $t1,0
la $t2,hopPtr2
lw $t3,0($t2)
I16:
beq $t1,$t3,endI16
addi $t1,$t1,1
lw $a0,0($t0)
li $v0,1
syscall
addi $t0,$t0,4

li $a0,32
li $v0,11
syscall

j I16
endI16:




li $a0,10
li $v0,11
syscall



la $a0,comAeStr
li $v0,4
syscall

li $a0,4
li $v0,1
syscall

la $a0,comAfStr
li $v0,4
syscall






la $t0,a4
li $t1,0
la $t2,hopPtr3
lw $t3,0($t2)
I17:
beq $t1,$t3,endI17
addi $t1,$t1,1
lw $a0,0($t0)
li $v0,1
syscall
addi $t0,$t0,4
li $a0,32
li $v0,11
syscall
j I17
endI17:






#fianl Processing yaba se hogi


W14:

li $a0,10
li $v0,11
syscall

la $a0,proA1Str
li $v0,4
syscall



la $t0,a1
li $t1,0
la $t2,hopPtr2
lw $t3,0($t2)
I18:
beq $t1,$t3,endI18
addi $t1,$t1,1
lw $a0,0($t0)
li $v0,1
syscall
addi $t0,$t0,4

li $a0,32
li $v0,11
syscall

j I18
endI18:




li $a0,10
li $v0,11
syscall


la $a0,comAeStr
li $v0,4
syscall

li $a0,2
li $v0,1
syscall


la $a0,comAfStr
li $v0,4
syscall


la $t0,a2
li $t1,0
la $t2,hopPtr3
lw $t3,0($t2)
I19:
beq $t1,$t3,endI19
addi $t1,$t1,1
lw $a0,0($t0)
li $v0,1
syscall
addi $t0,$t0,4

li $a0,32
li $v0,11
syscall

j I19
endI19:




la $t0,a1
la $t1,a3
li $t2,0
la $s0,hopPtr2
lw $s1,0($s0)

I20:
beq $t2,$s1,endI20
addi $t2,$t2,1
lw $s2,0($t0)
sw $s2,0($t1)
addi $t0,$t0,4
addi $t1,$t1,4
j I20
endI20:




la $t0,a2
la $t1,a4
li $t2,0
la $s0,hopPtr3
lw $s1,0($s0)

I21:
beq $t2,$s1,endI21
addi $t2,$t2,1
lw $s2,0($t0)
sw $s2,0($t1)
addi $t0,$t0,4
addi $t1,$t1,4
j I21
endI21:





la $t0,hopPtr3
lw $t1,0($t0)
li $t8,0
beq $t1,$t8,else25



la $t0,hopPtr2
lw $t1,0($t0)
li $t8,0
beq $t1,$t8,else26





la $t0,a3
lw $t1,0($t0)
la $t2,a4
lw $t3,0($t2)
ble $t1,$t3,I22
j I25


I22:
la $t0,hopPtr2
lw $t1,0($t0)
li $t8,4
mul $t1,$t1,$t8
la $t0,a3
add $t0,$t0,$t1
la $t1,a4

la $s0,hopPtr3
lw $s1,0($s0)
li $s0,0
I23:
beq $s0,$s1,endI23
addi $s0,$s0,1
lw $t3,0($t1)
sw $t3,0($t0)
addi $t0,$t0,4
addi $t1,$t1,4
j I23
endI23:


la $t0,hopPtr2
lw $t1,0($t0)
la $t0,hopPtr3
lw $t2,0($t0)
add $t1,$t1,$t2
la $t0,hopPtr2
sw $t1,0($t0)

#sorting
la $t1,hopPtr2
lw $t0,0($t1)
li $t1,0
I24:
beq $t1,$t0,endI24
addi $t1,$t1,1
la $s0,a3
li $t2,1
else24:
beq $t2,$t0,endelse24
addi $t2,$t2,1
lw $s1,0($s0)
lw $s2,4($s0)
bge $s1,$s2,elseI24
addi $s0,$s0,4
j else24
elseI24:
sw $s1,4($s0)
sw $s2,0($s0)
addi $s0,$s0,4
j else24
endelse24:

j I24
endI24:
j else25






I25:
la $t0,hopPtr3
lw $t1,0($t0)
li $t8,4
mul $t1,$t1,$t8
la $t0,a4
add $t0,$t0,$t1
la $t1,a3

la $s0,hopPtr2
lw $s1,0($s0)
li $s0,0
I26:
beq $s0,$s1,endI26
addi $s0,$s0,1
lw $t3,0($t1)
sw $t3,0($t0)
addi $t0,$t0,4
addi $t1,$t1,4
j I26
endI26:


la $t0,hopPtr3
lw $t1,0($t0)
la $t0,hopPtr2
lw $t2,0($t0)
add $t1,$t1,$t2
la $t0,hopPtr3
sw $t1,0($t0)

#sorting
la $t1,hopPtr3
lw $t0,0($t1)
li $t1,0
I27:
beq $t1,$t0,endI27
addi $t1,$t1,1
la $s0,a4
li $t2,1
else27:
beq $t2,$t0,endelse27
addi $t2,$t2,1
lw $s1,0($s0)
lw $s2,4($s0)
bge $s1,$s2,elseI27
addi $s0,$s0,4
j else27
elseI27:
sw $s1,4($s0)
sw $s2,0($s0)
addi $s0,$s0,4
j else27
endelse27:

j I27
endI27:
j else26












else25:

li $a0,10
li $v0,11
syscall

la $a0,comAeStr
li $v0,4
syscall

li $a0,3
li $v0,1
syscall

la $a0,comAfStr
li $v0,4
syscall


la $t0,a3
li $t1,0
la $t2,hopPtr2
lw $t3,0($t2)
I27a:
beq $t1,$t3,endI27a
addi $t1,$t1,1
lw $a0,0($t0)
li $v0,1
syscall
addi $t0,$t0,4

li $a0,32
li $v0,11
syscall

j I27a
endI27a:

li $a0,10
li $v0,11
syscall

la $a0,comAeStr
li $v0,4
syscall

li $a0,4
li $v0,1
syscall

la $a0,comAfStr
li $v0,4
syscall

j code_exit








else26:





li $a0,10
li $v0,11
syscall

la $a0,comAeStr
li $v0,4
syscall

li $a0,3
li $v0,1
syscall

la $a0,comAfStr
li $v0,4
syscall


li $a0,10
li $v0,11
syscall

la $a0,comAeStr
li $v0,4
syscall

li $a0,4
li $v0,1
syscall

la $a0,comAfStr
li $v0,4
syscall






la $t0,a4
li $t1,0
la $t2,hopPtr3
lw $t3,0($t2)
I28:
beq $t1,$t3,endI28
addi $t1,$t1,1
lw $a0,0($t0)
li $v0,1
syscall
addi $t0,$t0,4

li $a0,32
li $v0,11
syscall

j I28
endI28:




code_exit:
li $a0,10
li $v0,11
syscall

la $a0,dacStr
li $v0,4
syscall

li $v0,12
syscall


li $t8,89
beq $v0,$t8,main
li $t8,121
beq $v0,$t8,main

