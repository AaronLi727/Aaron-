.data
expVal123: .asciiz "Expected value:23 Your value: "
expVal121: .asciiz "Expected value:21 Your value: "
endl: .asciiz "\n"

.text

##
# int getDigit(int number);
# List Used Registers Here:
# $t0 = sum
# $t3 = number
# $t4 = number ( %//) 10
# $a1 = 10
# 
##

getDigit:
mul $t3,$t2,2	# sum * 2  ( digit * 2 )
bge $t3,10,else	# ( number !< 10)
add $t0,$t0,$t3	# sum = number
j return
else:
div $t3,$a1	# number % 10
mfhi $t4	# Hi 
add $t0,$t0,$t4	# sum += number % 10
div $t3,$a1	# number / 10
mflo $t4	# Lo 
add $t0,$t0,$t4	# sum += number % 10 + number / 10
j return

##
# int sumOfDoubleEvenPlace (int number);
# sum --> $s0 
# digit --> $s1
#
##

sumOfDoubleEvenPlace:
li $t0,0	# $t0 = sum = 0
li $a1,10	# $a1 = 10
li $a2,100 	# $a2 = 100
div $t1,$a1	# number = number/ 10
mflo $t1	# Lo 
while:
div $t1,$a1 # number = number / 10
mfhi $t2	# Hi 
j getDigit	# returns sum
return:
div $t1,$a2	# number = number / 100
mflo $t1	# Lo 
bgt $t1,0,while # number !> 0
jr $ra
  




main:
li $s0,89744563 # int test1 = 89744563;
li $s1,98756421 # int test2 = 98756421;
li $s2,0	# int result1 = 0;
li $s3,0	# int result2 = 0;

# code for first function call

move $t1,$s0 
jal sumOfDoubleEvenPlace
move $s2,$t0

li $v0,4
la $a0,expVal123
syscall

li $v0,1
move $a0,$s2
syscall

li $v0,4
la $a0,endl
syscall

# code for second function call

move $t1,$s1
jal sumOfDoubleEvenPlace
move $s3,$t0

li $v0,4
la $a0,expVal121
syscall
  
li $v0,1
move $a0,$s3
syscall



li $v0,10
syscall
