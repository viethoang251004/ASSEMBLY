#Viet chuong trinh xuat mang N so nguyen do ra man hinh
#Tac gia: Nguyen Dinh Viet Hoang
#Ngay tao: 4/1/2023
#Version:1

.data
	mang1: .word 0
	soluong: .asciiz "So luong phan tu: "
	msgnhap: .asciiz "Nhap mang: "
	msgxuat: .asciiz "Mang xuat: "
	space: .asciiz " "
.text
.globl main
main: 
	li $v0, 4	#Load code = 4 de he thong biet in chuoi
	la $a0, soluong		#Load dia chi cua chuoi soluong can xuat vao $a0
	syscall		#Goi he thong de thuc hien lenh in chuoi $a0
	li $v0, 5	#Load code = 5 de he thong biet doc so nguyen
	syscall		#Goi he thong de thuc hien lenh nhap so nguyen va luu gia tri do vao $v0
	move $s2, $v0	#Di chuyen gia tri cua $v0 vao $s2
	li $v0, 4	#Load code = 4 de he thong biet print chuoi
	la $a0, msgnhap	#Load dia chi cua chuoi msgnhap can xuat vao $a0
	syscall		#Goi he thong de biet lenh in chuoi $a0
	la $s0, mang1	#Load dia chi cua chuoi mang1 vao $s0
	li $s1, 0	#Load gia tri bang 0 vao $s1

readloop:
	li $v0, 5	#Load code = 5 de he thong biet nhap so nguyen
	syscall		#Goi he thong de thuc hien lenh nhap so nguyen va luu gia tri do vao $v0
	sw $v0, ($s0)	#Luu gia tri cua $v0 vao vi tri phan tu hien tai cua mang luu tai $s0
	addi $s1, $s1, 1	#Tang gia tri cua $s1 len 1 don vi
	addi $s0, $s0, 4	#Tang gia tri cua $s0 them 4 bytes de truy xuat phan tu tiep theo trong mang
	bne $s1, $s2, readloop	#So sanh $s1 va $s2, khi $s1 = $s2 ket thuc vong lap
#In chuoi xuat 
	li $v0, 4	#Load code = 4 de he thong biet print chuoi
	la $a0, msgxuat	#Load dia chi cua chuoi msgxuat can xuat vao $a0
	syscall		#Goi he thong de thuc hien lenh in chuoi $a0
#Xuat mang da nhap
	la $s0, mang1	#Load dia chi cua chuoi mang1 vao $s0
	li $s1, 0	#Load gia tri bang 0 vao $s1
printloop:
	li $v0,1	#Load code = 1 de he thong biet print so tu nhien
	lw $a0, ($s0)	#Luu gia tri phan tu hien tai cua $s0 vao $a0
	syscall		#Goi he thong de thuc hien lenh in gia tri $a0 ra man hinh
	li $v0,4	#Load code = 4 de he thong biet print chuoi
	la $a0, space	#Load dia chi cua chuoi space can xuat vao $a0
	syscall		#Goi he thong de thuc hien lenh in chuoi $a0
	addi $s1,$s1, 1	#Tang gia tri cua $s1 len 1 don vi
	addi $s0,$s0, 4	#Tang gia tri cua $s0 them 4 bytes de truy xuat phan tu tiep theo trong mang
	bne $s1,$s2, printloop	#So sanh $s1 va $s2, khi $s1 = $s2 ket thuc vong lap
#Exit
	li $v0, 10	#Load code = 10 de he thong biet thoat
	syscall		#Goi he thong de thuc hien lenh thoat
.end main
