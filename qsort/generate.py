import random

file_name = "test.in"
file = open(file_name, 'w')

count   = random.randint(1000000, 1000000)
max_val = random.randint(1000000, 1000000)
min_val = random.randint(100,  200)

test_str = str(count) + "\n\n"
for j in range(count) :
    if (j % 10 == 0 and j > 0) :
        test_str += "\n"
        file.write(test_str)
        test_str = ""
    test_str += str(random.randint(min_val, max_val)) + "\t"


test_str += "\n"
file.write(test_str)
file.close()