user = User.new(email: 'user@gmail.com', password: 'password')
admin = User.new(email: 'admin@gmail.com', password: 'password', admin: true)

user.save
admin.save