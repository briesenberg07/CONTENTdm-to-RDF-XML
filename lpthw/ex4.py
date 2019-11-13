# These guys are all pretty straightforward.
# See comments below about "How do the types of 'equation' components affect the types of outputs?" I'm still not totally clear on this.
cars = 100
space_in_a_car = 4
drivers = 30
passengers = 90

# Here we get interesting because we begin using the products of other variables as the values of these variables.
cars_not_driven = cars - drivers
cars_driven = drivers
carpool_capacity = cars_driven * space_in_a_car
average_passengers_per_car = passengers / cars_driven


print("There are", cars, "cars available.")
print("There are only", drivers, "drivers available.")
print("There will be", cars_not_driven, "empty cars today.")
print("We can transport", carpool_capacity, "people today.")
print("We have", passengers, "to carpool today.")
print("We need to put about", average_passengers_per_car, "in each car.")

# space_in_a_car was originally written "[...] = 4.0"
# This yields a *floating point* output for carpool_capacity
# When L2 changed to "4", integer is output.
# So if *any* component of what I'm calling an "equation" has a given type, the output of that equation will have that type?
# Well but wait, the other component had type ingteger, so why wouldn't that be used? Is it the most "verbose" type among the components?
