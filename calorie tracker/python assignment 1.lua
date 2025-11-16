print("---------------------------------------------------------------\n")
print("\n Welcome to DailyCal Tracker!")
print("Log your meals, count your calories, and take control of your health! 💪")
print("Let's start tracking your nutrition and stay healthy!")
print("---------------------------------------------------------------\n")

meal_list = []
meal_record = set()  # To prevent duplicates
calorie_list = []
status_msg = ""  # Final result
user_data = {}  # Store final data

user_name = input("Enter your Name: ")  # Getting the name of the user 
max_calories = float(input("Enter your max amount of cal you want to maintain: "))
meal_count = int(input("How many meals are you having today: "))  # Number of meals to log

for i in range(meal_count):
    print("\n")
    current_meal = input(f"Enter your {i+1} meal name: ")

    # Prevent duplicate meal entries
    if current_meal in meal_record:
        print("⚠️ You already entered this meal! Skipping duplicate...")
        continue

    meal_calories = float(input("Enter the amount of calorie you get: "))
    meal_record.add(current_meal)
    meal_list.append(current_meal)
    calorie_list.append(meal_calories)

# Calculate total calories
total_calories = sum(calorie_list)

if total_calories == max_calories:
    print(f"\n Congratulations {user_name}, you maintained your calorie intake perfectly!")
    status_msg = "Maintained"
elif total_calories < max_calories:
    print(f"\n Your calorie intake is less by {max_calories - total_calories:.2f} kcal.")
    status_msg = f"Less by {max_calories - total_calories:.2f} kcal"
else:
    print(f"\n You exceeded your calorie goal by {total_calories - max_calories:.2f} kcal.")
    status_msg = f"Exceeded by {total_calories - max_calories:.2f} kcal"

# Display results
print("\n====================================")
print("\n 📝 Summary of Your Meals:\n")
print("Meal Name\t\tCalories")
print("-" * 35)

# Print each meal in tabular form
for name, cal in zip(meal_list, calorie_list):
    print(f"{name:<16}\t{cal:.2f}")

print("-" * 35)
print(f"Total:\t\t\t{total_calories:.2f}")
print(f"Average:\t\t{total_calories / len(calorie_list):.2f}")
print(f"Status:\t\t\t{status_msg}")
print("====================================\n")
print("💬 Thanks for using DailyCal Tracker! Stay healthy and balanced!\n")