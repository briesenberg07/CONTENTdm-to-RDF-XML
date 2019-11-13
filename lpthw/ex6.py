# Simple value for variable types_of_people
types_of_people = 10

# Now a more complicated variable: an f-string including the variable that we just created
# Also--interesting... I'm using 'f' to format this string (creating an f-string), but I'm not printing it (at least not printing it in *this* line of code.)
x = f"There are {types_of_people} types of people."

# More variables with seemingly pretty simple values--the value of each is a string
binary = "binary"
do_not = "don't"

# Now another variable with value f-string, this time an f-string including *two* vars
y = f"Those who know {binary} and those who {do_not}." # string-in-a-string x2

# These two are new on me: printing variables
# How do you say this? Printing the 'value' of variables?
print(x)
print(y)

# More printing now of f-strings; f-strings which include variables which are themselves f-strings!!
print(f"I said: {x}") # string-in-a-string x1
print(f"I also said: '{y}'") # string-in-a-string x1

# Simple variable
hilarious = False
# I don't understand what the brackets are doing here
joke_evaluation = "Isn't that joke so funny?! {}"
# I'm guessing that the brackets in the joke_evaluation var allow '.format(hilarious) to work?'
print(joke_evaluation.format(hilarious)) #string-in-a-string x1

# More simple variables
w = "This is the left side of..."
e = "a string with a right side."

# Printing the simple variables together, in order
# BUT I would not have thought that I could use '+' to put them together in this way
print(w + e)

# string-in-a-string total = 5

# Explain why adding the two strings w and e with + makes a longer string:
    # As I said, I wouldn't have thought that you could put them together this way.
    # But to state the obvious, it puts them together, making a longer string.
    # See plusString.py
