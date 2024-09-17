	.data
option: .word 0
	.align 0
menu_string: .asciz "\nEscolha:\n0. Pedra \n1. Papel \n2.Tesoura \n3. Sair\n"
	.text
	.globl main
main:
	la t0, option		# t0 = &option
	la t1, menu_string	# t1 = &menu_string
	li a0, 0
	li t3, 3		# t3 = 3 (end_menu condition)
menu:	
	li a7, 4		# a7 = 4 = PrintString number
	add a0, x0, t1		# a0 = &menu_string = print parameter
	ecall			# print syscall
	li a7, 5		# a7 = 5 = ReadInt number
	ecall			# read syscall
	bge a0, t3, end_menu	# if ao >= t4 (works as a do-while, but only stores if is a valid option)
	bltz a0, end_menu	# end if a0 < 0 as well
	sw a0, 0(t0)		# option = a0 (storing user entry on option memory)
	j menu			# jumping back to the loop start
				
end_menu:
	li a7, 10		# a7 = 10 = exit number
	ecall			# exiting program
