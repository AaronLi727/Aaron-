.data
    endl:    .asciiz  "\n"   # used for cout << endl;
    sumlbl:    .asciiz  "Sum: " # label for sum
    revlbl:    .asciiz  "Reversed Number: " # label for rev
    pallbl:    .asciiz  "Is Palindrome: " # label for isPalindrome
    sumarr:    .word 1
               .word 3
               .word 44
               .word 66
               .word 88
               .word 90
               .word 9
               .word 232
               .word 4325
               .word 2321
    arr:       .word 1
               .word 2
               .word 3
               .word 4
               .word 5
               .word 4
               .word 3
               .word 2
               .word 1

.text

# sum               --> $s0
# address of sumarr --> $s1
# rev               --> $s2
# num               --> $s3
# isPalindrome      --> $s4
# address of arr    --> $s5
# i                 --> $t0
# beg               --> $s6
# end               --> $s7
# d                 --> $t1
# 10                --> $t2
# 100               --> $t3
main:
li $s0, 0 #sum = 0
la $s1, sumarr #address of sumarr
li $t0, 0 #i = 0
  
for:beq $t0, 10, end 
sll $t4, $t0, 2       
add $t4, $t4, $s1
lw $t4, 0($t4)
add $s0, $s0, $t4
addi $t0, $t0, 1
j for 

end: 
li $s3, 45689 #num = 45689
li $s2, 0 #rev = 0
li $t1, -1 #d = -1
li $t2, 10 # division and remainder

whileloop: 
rem $t1, $s3, $t2 # d= num % 10
mul $t5, $s2, $t2 # rev x 10 
add $s2, $t5, $t1 #(rev x 10) + d
div $s3, $s3, $t2 # num / 10
bgt $s3, $0, whileloop 

li $s4, 1 #Palindrome = 1
la $s5, arr #address of array
li $s6,0 #beg = 0 
li $s7, 0 #end = 0

whileloop2: 
sll $t6, $s6, 2 #beg x 4
add $t6, $t6, $s5 # (addr ) + (beg x 4)
lw $t6, ($t6)
sll $t7, $s7,2 #end x 4
add $t7, $t7, $s4 # addr + (beg x 4)
 

bge $t6, $t7, finish
add $s4, $0, -1 
finish:
add $s6, $s6, 1
sub $s7, $s7, -1



exit:

  la   $a0, sumlbl    # puts sumlbl into arg0 (a0 register) for cout

  addi $v0, $0, 4     # puts 4 in v0 which denotes we are printing a string

  syscall             # make a syscall to system


  move $a0, $s0       # puts sum into arg0 (a0 register) for cout

  addi $v0, $0, 1     # puts 1 in v0 to denote we are printing an int

  syscall             # make a syscall to system


  la   $a0, endl      # puts the address of the string endl into a0

  addi $v0, $0, 4     # puts 4 into v0 saying we are printing a string

  syscall


  la   $a0, revlbl    # puts revlbl into arg0 (a0 register) for cout

  addi $v0, $0, 4     # puts 4 in v0 which denotes we are printing an string

  syscall             # make a syscall to system


  move $a0, $s2       # puts rev into arg0 (a0 register) for cout

  addi $v0, $0, 1     # puts 1 in v0 to denote we are printing an int

  syscall             # make a syscall to system


  la   $a0, endl      # puts the address of the string endl into a0

  addi $v0, $0, 4     # puts 4 into v0 saying we are printing a string

  syscall


  la   $a0, pallbl    # puts pallbl into arg0 (a0 register) for cout

  addi $v0, $0, 4     # puts 4 in v0 which denotes we are printing a string

  syscall             # make a syscall to system


  move $a0, $s4       # puts isPalindrome into arg0 (a0 register) for cout

  addi $v0, $0, 1     # puts 1 in v0 to denote we are printing an int

  syscall             # make a syscall to system


  la   $a0, endl      # puts the address of the string endl into a0

  addi $v0, $0, 4     # puts 4 into v0 saying we are printing a string

  syscall


  addi $v0,$0, 10

  syscall
