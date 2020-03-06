# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

servicio = Servicio.create!(
      "nombre": 'Recorrido.cl',
      "horarios": [
        {
          "day": 'Lunes',
          "turnos": { "start": '19', end: '24' }
        },
        {
          "day": 'Martes',
          "turnos": { "start": '19', end: '24' }
        },
        {
          "day": 'Miercoles',
          "turnos": { "start": '19', end: '24' }
        },
        {
          "day": 'Jueves',
          "turnos": { "start": '19', end: '24' }
        },
        {
          "day": 'Viernes',
          "turnos": { "start": '19', end: '24' }
        },
        {
          "day": 'Sabado',
          "turnos": { "start": '10', end: '24' }
        },
        {
          "day": 'Domingo',
          "turnos": { "start": '10', end: '24' }
        }
      ]
)

servicio.usuarios.create([
                           { nombre: 'Ernesto', disponibilidad: 15, color: 'orange' },
                           { nombre: 'Bárbara', disponibilidad: 19, color: 'purple' },
                           { nombre: 'Benjamín', disponibilidad: 16, color: 'blue' }
                         ])

servicio.asignar(10)
servicio.asignar(11)


otroServicio = Servicio.create!(
  "nombre": 'Buses Castillo',
  "horarios": [
    {
      "day": 'Lunes',
      "turnos": { "start": '17', end: '22' }
    },
    {
      "day": 'Martes',
      "turnos": { "start": '17', end: '22' }
    },
    {
      "day": 'Miercoles',
      "turnos": { "start": '17', end: '22' }
    },
    {
      "day": 'Jueves',
      "turnos": { "start": '17', end: '22' }
    },
    {
      "day": 'Viernes',
      "turnos": { "start": '17', end: '22' }
    },
    {
      "day": 'Sabado',
      "turnos": { "start": '11', end: '23' }
    },
    {
      "day": 'Domingo',
      "turnos": { "start": '11', end: '23' }
    }
  ]
)

otroServicio.usuarios.create([
                       { nombre: 'Paulina', disponibilidad: 15, color: 'yellow' },
                       { nombre: 'Antonia', disponibilidad: 19, color: 'pink' },
                       { nombre: 'Ross', disponibilidad: 16, color: 'lime' }
                     ])

otroServicio.asignar(10)
otroServicio.asignar(11)