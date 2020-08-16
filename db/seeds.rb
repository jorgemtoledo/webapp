# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!([
    {email: "zezinho@gmail.com", password: "123456", password_confirmation: "123456", name: "Zezinho", admin: false, position: "Estagiario",  department:"Suporte",  workload: 30},
    {email: "huguinho@gmail.com", password: "123456", password_confirmation: "123456", name: "Huguinho", admin: false, position: "Estagiario",  department:"Compras",  workload: 30},
    {email: "luizinho@gmail.com", password: "123456", password_confirmation: "123456", name: "Luizinho", admin: false, position: "Estagiario",  department:"Comercial",  workload: 30},
    {email: "mariazinha@gmail.com", password: "123456", password_confirmation: "123456", name: "mariazinha", admin: true, position: "Gerente",  department:"RH",  workload: 40},
    {email: "zepequeno@gmail.com", password: "123456", password_confirmation: "123456", name: "Ze Pequeno", admin: false, position: "Estagiario",  department:"Vendas",  workload: 40},
    {email: "tiopatinha@gmail.com", password: "123456", password_confirmation: "123456", name: "Tio Patinha", admin: true, position: "Diretor",  department:"Empresário",  workload: 40},
    {email: "joaninha@gmail.com", password: "123456", password_confirmation: "123456", name: "Joana", admin: true, position: "Coordenadora",  department:"Vendas",  workload: 40},
    {email: "rebeca@gmail.com", password: "123456", password_confirmation: "123456", name: "Rebeca", admin: true, position: "Diretora",  department:"Comercial",  workload: 40}
])

Appointment.create!([
    {appointment_date: "2020-08-10 08:00:00", appointment_type: "beginning_workday", user_id: 1},
    {appointment_date: "2020-08-10 12:00:00", appointment_type: "lunch_time", user_id: 1},
    {appointment_date: "2020-08-10 13:30:00", appointment_type: "return_of_lunch", user_id: 1},
    {appointment_date: "2020-08-10 15:30:44", appointment_type: "end_workday", user_id: 1},

    {appointment_date: "2020-08-11 08:00:00", appointment_type: "beginning_workday", user_id: 2},
    {appointment_date: "2020-08-11 12:00:00", appointment_type: "lunch_time", user_id: 2},
    {appointment_date: "2020-08-11 13:30:00", appointment_type: "return_of_lunch", user_id: 2},
    {appointment_date: "2020-08-11 15:30:44", appointment_type: "end_workday", user_id: 2},

    {appointment_date: "2020-08-12 08:00:00", appointment_type: "beginning_workday", user_id: 3},
    {appointment_date: "2020-08-12 12:00:00", appointment_type: "lunch_time", user_id: 3},
    {appointment_date: "2020-08-12 13:30:00", appointment_type: "return_of_lunch", user_id: 3},
    {appointment_date: "2020-08-12 15:30:44", appointment_type: "end_workday", user_id: 3},   
])
