#Viet chuong trinh tinh tong va trung binh cac so trong mang
#Tac gia: Nguyen Dinh Viet Hoang
#Ngay tao: 4/1/2023
#Version:1

.data
	mang1: .word 0
	soluong: .asciiz "So luong phan tu: "
	msgnhap: .asciiz "Nhap mang: "
	Tong: .asciiz "Tong la: "
	Tb: .asciiz "\nTB cong la: "
	space: .asciiz " "
.text
.globl main
main: 
	li $v0, 4
	la $a0,  soluong
	syscall
	li $v0, 5
	syscall
	move $s2, $v0
	li $v0, 4
	la $a0, msgnhap
	syscall
#Khoi tao ban dau
	la $s0, mang1
	li $s1, 0

#Nhap mang
readloop:
	li $v0,5
	syscall 
	sw $v0, ($s0) 
	addi $s1, $s1, 1 #i=i+1
	addi $s0, $s0, 4
	bne $s1, $s2, readloop
#Tong, trung binh
	li $s1,0
	li $t0,0
	la $s0,mang1
sumloop:
	lw $t0,($s0)
	add $t1,$t1,$t0
	addi $s1, $s1, 1 #i=i+1
	addi $s0, $s0, 4
	bne $s1, $s2, sumloop
	mtc1 $s2,$f2
	addi $t2,$t1,0
	mtc1 $t2,$f1
	div.s $f3,$f1,$f2
#Xuat ket qua
	li $v0,4
	la $a0,Tong
	syscall
	li $v0, 1
	move $a0, $t1
	syscall
	li $v0,4
	la $a0,Tb
	syscall
	li $v0, 2
	mov.s $f12, $f3
	syscall
#exit
	li $v0,10
	syscall
.end main