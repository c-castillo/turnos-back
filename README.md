# MaaS Backend

Este backend está diseñado en Ruby on Rails, en modo API.

## Componentes

Los componentes principales son (siguiendo el patrón MVC):

- Modelos: Servicios -> [Usuarios, Turnos]
- Controladores: Tanto usuarios como turnos son _nested routes_ dentro de servicios ya que dependen del _servicio_id_
- Vistas: La capa de presentación se reduce al JSON que cada api devuelve.

## Setup

Para iniciar la API existe un one-liner que instala dependencias, agrega seeds a la base de datos e inicia el servidor:

```
./quickstart.sh
```

