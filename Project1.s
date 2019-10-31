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
							 add $t0, $t1, $s0								# Increment counter to the address of the string
							 lb $a2, 0($t0)										# retrieve string current value
							 jal DeciConverter								# Perform jump to get current decimal value in subroutine
							 add $t3, $t3, $v1								# Performs sums conversion and adds values
							 beq $t1, $t4, Printsum						# Prints sum, if counter is at final string.
							 addi $t1, $t1, 1									# increases counter by one
							 j Loop														# Start over



						DeciConverter:
						# Performs conversion using my Howard ID = 02826194 with formula N = 26 + (X % 11) where N = 34.
						# With M = N - 10 calculation shows M = 24 considered to be my range, value = (A &'a' to X &'x')
						# Range = (0 to 9) to equal (0 to 9) Range = (A &'a' to X &'x') to equal (10 to 33)

							add $t6, $zero, $a2								# line duplicates values in reg $a2 to reg $t6
							addi $t5, $zero, 87								# ASCII reference value of 87 for lowercase characters loaded to temporary reg $t5
							bgt $t6, 'x', Exit0								# If statement for current value greater than 'x', return to output
							bge $t6, 'a', Exit1								# If statement for current value between 'a' and 'x'

							addi $t5, $zero, 55								# ASCII reference value of 55 for uppercase characters loaded to temporary reg $t5
							bgt $t6, 'X', Exit0								# If statement for current value greater than 'X', return to output
							bge $t6, 'A', Exit1								# If statement for current value between 'A' and 'X'

							addi $t5, $zero, 48								# ASCII reference value of 55 for decimal integers loaded to temporary reg $t5
							bgt $t6, '9', Exit0								# If statement for current value greater than '9', return to output
							bge $t6, '0', Exit1								# If statement for current value between '0' and '9'
							bge $t6, '0', Exit0								# While characters are out of all range converts to '0'

						Exit0:
						# Line exits and return 0 value in $v1
						add $v1, $zero, $zero								# constant loads 0 to reg $v1
						
