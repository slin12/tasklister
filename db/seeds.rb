# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

list1 = List.create(name: "Groceries")
list2 = List.create(name: "To-Do")
task1 = Task.create(name: "eggs", list: list1)
task2 = Task.create(name: "bread", list: list1)
task3 = Task.create(name: "laundry", list: list2)
task4 = Task.create(name: "homework", list: list2)
