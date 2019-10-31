.data
			user_input: .space 11 	#This instruction creates space for 10 characters including spaces

.text
	main:
            li $v0, 8                           # instruction get input from user
            la $a0, user_input									# This instruction load register of input
            li $a1, 10													# This read largest characters of input
            syscall

						la $s0, user_input                  # Gets the address of the stored input string
						addi $t1, $zero, 0                  # Initialize the offsets to 0

						Loop_1:
									add $t0, $t1, $s0               # Increment the address of the string and store
									lb $a2, 0($t0)                  # Get the current character
									jal ConvertToDecimal             
