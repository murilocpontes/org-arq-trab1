	.data
option: .word 0
	.align 0
menu_string: .asciz "\nEscolha:\n0. Pedra \n1. Papel \n2.Tesoura \n3. Sair\n"
	.text
	.globl main
main:
	la t0, option		# t0 = &option
	la t1, menu_string	# t1 = &menu_string
	li t3, 3		# t3 = 3 (end_menu condition)
menu:	
	bge x0, t3, end_menu	# while(true) -> x0 will never be >= t3
	li a7, 4		# a7 = 4 = PrintString number
	add a0, x0, t1		# a0 = &menu_string = print parameter
	ecall			# print syscall
	li a7, 5		# a7 = 5 = ReadInt number
	ecall			# read syscall
	beq a0, t3, end_menu	# if ao == t4 (user entry equal to exit menu command)
	sw a0, 0(t0)		# option = a0 (storing user entry on option memory)
	j menu			# jumping back to the loop start
				# /////////////////////
				# para continuar: vcs criam funções e linkam elas dentro desse while, e antes do "j menu", ou
				# façam que, se o programa tiver que voltar para o começo do while, que vcs deem j menu:
				# ex de link de função: jal random_number 
				# se quiserem que o programa acabe em determinado momento, vcs podem chamar o "end_menu", mas
				# para retornar outro número além de 0 vcs tem q fazer outra syscall com a7 = 93 e setar esse numero
end_menu:
	li a7, 10		# a7 = 10 = exit number
	ecall			# exiting program
