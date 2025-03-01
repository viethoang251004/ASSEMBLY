#Viet chuong trinh con kiem tra so hoan thien
#Tac gia: Nguyen Dinh Viet Hoang
#Ngay tao: 12/1/2023
#Version:1
.data
	answer:	.word
	bien:	.asciiz "Nhap vao n: "
	bien1:	.asciiz "La so hoan thien"
	bien2:	.asciiz "Khong la so hoan thien"
.text
.globl main
main:
	#Print cau nhap n
	li $v0, 4
	la $a0, bien
	syscall
	#Nhap n
	li $v0, 5
	syscall
	move $t1, $v0
	#Goi CTC
	jal hh
	sw $v0, answer
	#Kiem tra
	beq $v0, $t1, stop
	li $v0, 4
	la $a0, bien2
	syscall
	j end1
stop:
	li $v0, 4
	la $a0, bien1
	syscall		
		
end1:
	#Exit
	li $v0, 10
	syscall
.end main
#Chuong trinh con
.globl hh
.ent hh
hh:
	li $t0, 1 
	li $v0, 0	#tich = 1
	li $t5, 0
Loop:
	rem $t4, $t1, $t0
	bgt $t4, 0, false
	add $t5, $t5, $t0
false:
	addi $t0, $t0, 1
	li $t4, 0
	blt $t0, $t1, Loop
	move $v0, $t5
	jr $ra
.end hh