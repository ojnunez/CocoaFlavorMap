# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
if User.count == 0
  User.create!(name: 'CodeCastle', email: "admin@codecastle.com.sv", lastname: "", password: "codecastle2018")
  User.first.add_role("admin")
end