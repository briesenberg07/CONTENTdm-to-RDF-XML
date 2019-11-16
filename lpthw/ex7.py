# Simple print here
print("Mary had a little lamb.")
# Printing with formatting here, but a certain *kind* of formatting,
# not the f"blah blah {var_here}" kind, but the kind where you (to my understanding)
# don't include the var definition in the f-string but instead leave empty brackets and then use
# .format([var or string]) to fill them
print("Its fleece was white as {}.".format('snow'))
# Simple print again
print("And everywhere that Mary went.")
# Here's a new one. The '.' is a string, and it gets printed ten times because * 10
print("." * 10) # What'd that do?

# Initially I thought that 'endN' had some kind of *special* meaning,
# but I think that these are all just variable names. The 'end' part is meaningless
# except as part of the variable names.
end1 = "C"
end2 = "h"
end3 = "e"
end4 = "e"
end5 = "s"
end6 = "e"
end7 = "B"
end8 = "u"
end9 = "r"
end10 = "g"
end11 = "e"
end12 = "r"

# Watch end = ' ' at the end. Try removing it to see what happens.
# Okay so when I remove it, the following line of code (beginning with end7) prints on a new line,
# as opposed to on the same line after the space in end=''.
# What I don't understand is what is it that makes the next line of code continue printing on the same line?
# As best I can see, all end= ' ' should do is insert a space

# Prints the vars in order, no space in between because no space is included in the print args
# until the last line.
# But aha! Here now perhaps I see 'end' having an actual function as a--what?
# An argument of the print function? SEE BELOW
print(end1 + end2 + end3 + end4 + end5 + end6, end = ' ')
print(end7 + end8 + end9 + end10 + end11 + end12)

# See https://www.geeksforgeeks.org/gfact-50-python-end-parameter-in-print/
    # By default python’s print() function ends with a newline.
    # A programmer with C/C++ background may wonder how to print without newline.
    # Python’s print() function comes with a parameter called ‘end’.
    # By default, the value of this parameter is ‘\n’, i.e. the new line character.
    # You can end a print statement with any character/string using this parameter.
