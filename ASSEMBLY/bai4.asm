#Viet chuong trinh tinh tong cac so chan/le trong mang
#Tac gia: Nguyen Dinh Viet Hoang
#Ngay tao: 4/1/2023
#Version:1

.data
	mang1: .word 0
	soluong: .asciiz "So luong phan tu: \n"
	msgnhap: .asciiz "Nhap mang: "
	Tongchan: .asciiz "Tong chan la: "
	Tongle: .asciiz "\nTong le la: "
.text
.globl main
main:
	li $v0, 4
	la $a0, soluong
	syscall
	li $v0, 5
	syscall
	move $s2, $v0
	li $v0, 4
	la $a0, msgnhap
	syscall
#Khoi tao
	la $s0, mang1
	li $s1, 0 #Bo dem
	li $t3, 0 #So du
	li $t1, 0 #Tong chan
	li $t2, 0 #Tong le
#Nhap gia tri 
readloop:
	li $v0, 5
	syscall
	sw $v0, ($s0)
	addi $s1, $s1, 1 #Bo dem + 1
	addi $s0, $s0, 4
	bne $s1, $s2, readloop
#Tinh so du va tong chan tong le
	la $s0, mang1
	li $s1, 0
#Tim so du chia cho 2
remloop:
	bge $s1, $s2, exit
	lw $t0, ($s0)
	rem $t3, $t0, 2
	beq $t3, 0, chan
	beq $t3, 1, le
cont:
	addi $s1, $s1, 1 #Bo dem + 1
	addi $s0, $s0, 4
	j remloop
chan:
	add $t1, $t1, $t0
	j cont
le:
	add $t2, $t2, $t0
	j cont
#Ketqua
exit:
	li $v0, 4
	la $a0, Tongchan
	syscall
	li $v0, 1
	move $a0, $t1
	syscall
	li $v0, 4
	la $a0, Tongle
	syscall
	li $v0, 1
	move $a0, $t2
	syscall
#Ketthuc
	li $v0, 10
	syscall
.end main