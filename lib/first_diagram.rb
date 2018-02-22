objects1 = ["person", "bike", "docking station"]
messages1 = ["release_a_bike"]
#puts objects1
#puts messages1

objects2 = ["person", "bike"]
messages2 = ["bike_is_working"]
#puts objects2
#puts messages2

objects = (objects1 + objects2).uniq
messages = (messages1 + messages2)
print objects.to_s + "\n"
print messages.to_s + "\n"
