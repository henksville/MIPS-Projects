.data
			user_input: .space 11 	#This instruction creates space for 10 characters including spaces

.text
	main:
            li $v0, 8                           # instruction get input from user
            la $a0, user_input									# This instruction load register of input
            li $a1, 11													# This read largest characters of input
            syscall

						la $s0, user_input                  # Gets the address of the stored input string
						addi $t1, $zero, 0                  # Initialize the offsets to 0
						addi $t4, $zero, 10									# Checked for string ending with reg $t4
						addi $t3, $zero, 0									# Sum given to 0 is held by register $t3

						Loop:
							 # Perform Loop through the string to use Counters , increments and jump to sub-string
							 add $t5, $t1, $s0								# Increment counter to the address of the string
							 lb $a2, 0($t5)										#retrieve string current value
							 
