# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Division.create(name: 'ঢাকা')
Division.create(name: 'রাজশাহী')
Division.create(name: 'বরিশাল')
Division.create(name: 'চট্টগ্রাম')
Division.create(name: 'খুলনা')
Division.create(name: 'সিলেট')
Division.create(name: 'রংপুর')

Category.create(name: 'জাতীয়')
Category.create(name: 'সারাদেশ')
Category.create(name: 'রাজনীতি')
Category.create(name: 'অর্থনীতি')
Category.create(name: 'আর্ন্তজাতিক')
Category.create(name: 'খেলাধুলা')
Category.create(name: 'তথ্য-প্রযুক্তি')
Category.create(name: 'প্রবাসের কথা')
Category.create(name: 'বিনোদন')
Category.create(name: 'ঢাকার বাইরে')
User.create(email: 'sahidul03@gmail.com',password: 'abcd1234')
User.create(email: 'sahid.kuet@gmail.com',password: 'abcd1234')
User.create(email: 'abcd@gmail.com',password: 'abcd1234')