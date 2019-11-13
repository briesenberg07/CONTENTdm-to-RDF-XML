name = 'Benjamin M. Riesenberg'
my_age = 42
height = 71 # inches
weight = 185 # lbs
my_eyes = 'hazel'
teeth = 'white'
my_hair = 'brown'

print(f"Let's talk about {name}.")
print(f"They are {height} inches tall.")
print(f"They are {weight} pounds heavy.")
print("Actually that's not too heavy.")
print(f"They have {my_eyes} eyes and {my_hair} hair.")
print(f"Their teeth are usually {teeth} depending on the coffee.")

# this line is tricky, try to get it exactly right
total = my_age + height + weight
print(f"If I add {my_age}, {height}, and {weight} I get {total}.")
# I'm REFUSING to make this script exactly the same as in the book.

# Here's my extra stuff for Study Drill 2
wMetric = round(weight * 0.453592, 1)
hMetric = round(height * 0.3048, 1)
print(f"By the way, {height} inches is {hMetric} meters, and {weight} pounds is {wMetric} kilograms.")
# There must be a way to limit the output (is this the right word? of hMetric and wMetric so that I won't get really long numbers for the values...)

# About this exercise: Remembering to add the 'f' before a string that I'm putting a variable into seems like one thing that I may have to try and remember when I need it
