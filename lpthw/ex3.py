# Overall Note:
# I ran this in my terminal using just `python ex3.py`, and the results were different!
# There were some parens in the results that I didn't get with v3.6, AND
# ... the result for print(3 + 2 + 1 - 5 + 4 % 2 - 1 / 4 + 6)
# was different!

# This just prints a string.
print("I will now count my chickens:")

# There are obviously some things to understand here regarding the *order of operations*
# AH: PEDMAS!
# Parenthesis, Exponents, Multiplication, Division, Addition, Subtraction
# But then, where in PEDMAS does the modulo fit in??
# Same priority as multiply/divide

# Prints a string, outputs result of 25 + (30/6), also known as 25 + 5.
print("Hens", 25 + 30 / 6)

# Okay I think I got this one:
# So, 25 * 3 = 75, 75 % 4 = 3, 100 - 3 = 97
print("Roosters", 100 - 25 * 3 % 4)

# Just printing a string again.
print("Now I will count the eggs:")

# 3 + 2 + 1 - 5 + *0* - *0.25* + 6
print(3 + 2 + 1 - 5 + 4 % 2 - 1 / 4 + 6)

# Just a string
print("Is it true that 3 + 2 < 5 - 7")

# Asking for T/F (boolean): Is 5 < -2 ?
print(3 + 2 < 5 - 7)

#Print string, then print result of 3 + 2
print("What is 3 + 2?", 3 + 2)
# Print string, then print result of 5 - 7
print("What is 5 - 7?", 5 - 7)

# Print string
print("Oh, that's why it's False.")

# Print string
print("How about some more.")

# Print string, then print boolean T/F result of *Is 5 > -2*
print("Is it greater?", 5 > -2)

# Print string, then print boolean T/F result of *Is 5 greater than or equal to -2*
print("Is it greater or equal?", 5 >= -2)

# Print string, then print boolean T/F result of *Is 5 less than or equal to -2*
print("Is it less or equal?", 5 <= -2)
