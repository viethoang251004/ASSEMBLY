#Viet chuong trinh nhap vao 1 chuoi ky tu, xuat ra chuoi nguoc lai, VD: ABCDEF, xuat ra: FEDCBA
#Tac gia: Nguyen Dinh Viet Hoang
#Ngay tao: 18/1/2023
#Version: 1.0
.data
	str:		.asciiz	"Enter full name: "
	inputsp:	.space	81
	inputsize:	.word	80

.text
.globl main
main:
	li	$v0, 4
	la	$a0, str
	syscall
 	li	$v0, 8		#Text = readString()
	la	$a0, inputsp
	li	$a1, 256	#Size of input buffer
	syscall
	la	$t0, inputsp	#addr = text
	move	$t2, $t0	#orig = addr (backup of original address)
find:
	lb	$t1, 0($t0)	#tmp = *addr
	beq	$t1, 0, print	#while(tmp != NUL)
	addi	$t0, $t0, 1	#addr++
	j	find		#End loop

print:
	subi	$t0, $t0, 1	#--addr
	blt	$t0, $t2, end	#while (addr >= orig)
	li	$v0, 11		#PrintChar(
	lb	$a0, 0($t0)	#*addr
	syscall			# )
	j	print           #End loop
end:
	li	$v0, 10         #Exit clearly
	syscall