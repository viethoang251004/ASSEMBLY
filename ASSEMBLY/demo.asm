.data
array: .word  
msg: .asciiz"Nhap vao n \n"
msgnhap: .asciiz"Nhap mang: \n"


.text
main:
#in cau nhap n
		li $v0,4
		la $a0,msg
		syscall
	#nhap n
		li $v0,5
		syscall
		move $t1,$v0
	#in cau nhap mang
		li $v0,4
		la $a0,msgnhap
		syscall
	# khoi tao ban dau
	la $s0 , array
	li $s1,0
	
	# Nhap  mang
	readLoop:
		# get integer
		li $v0,5
		syscall
		sw $v0,($s0)
		addi $s1,$s1,1
		addi $s0,$s0,4
		bne $s1,$t1, readLoop
	
		li $t5,0
		la $s0 , array
Loop:		
		lw $t2,($s0)			
		
		li $t0,0 
				
		
			
powLoop:
			mul $t3,$t0,$t0 
			beq $t3,$t2,true
			addi $t0,$t0,1 # i=i+1
			li $t3,0
			blt $t0,$t2,powLoop 
			j out
true:			add $t4,$t4,$t2	
out:			add $t5,$t5,1
			addi $s0, $s0, 4
			blt $t5,$t1,Loop 
		
	# in
		li $v0,1
		move $a0,$t4
		syscall
	#exit
		li $v0,10
		syscall