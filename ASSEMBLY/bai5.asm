#Viet chuong trinh sap xep va xuat ra man hinh danh sach mang theo thu tu tang dan
#Tac gia: Nguyen Dinh Viet Hoang
#Ngay tao: 4/1/2023
#Version:1

.data
	mang1: .word 0
	mang2: .word 0
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
	move $s3, $v0
	li $v0, 4
	la $a0, msgnhap
	syscall
#Khoi tao
	la $s1, mang1
	la $s2, mang2
	li $s0, 0 #Bo dem
#Nhap lieu
readloop:
	li $v0, 5
	syscall
	sw $a0, ($s1)
	addi $s1, $s1, 4
	addi $s0, $s0, 1 #Bo dem + 1
	bne $s3, $s0, readloop
#Sap xep mang 
	li $s0, 0	#Reset bo dem
	lw $t0, 0($s1)
#Lay gia tri tung phan 
outer_loop:
    beq $t1, $t0, done
    li $t2, 0

inner_loop:
    beq $t2, $t0, outer_done
    sll $t3, $t2, 2
    addu $t4, $a0, $t3
    lw $t5, 0($t4)
    addu $t4, $t4, 4
    lw $t6, 0($t4)
    blt $t5, $t6, skip
    sw $t6, 0($t4)
    sw $t5, 0($t4)

skip:
    addi $t2, $t2, 1
    j inner_loop

outer_done:
    addi $t1, $t1, 1     # $t1++
    j outer_loop
