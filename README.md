# Retail Project - Re-entrega SQL

## Descripción

Este proyecto contiene el script SQL solicitado para la re-entrega de la materia.

El script crea la base de datos `retail_project` y las tablas:

- `clientes`
- `productos`
- `ventas`

También incluye restricciones de integridad, carga inicial de datos, una actualización masiva de precios y la eliminación de una venta específica.

## Requisitos

- PostgreSQL
- DBeaver (opcional)
- GitHub o GitLab para publicar el repositorio

## Cómo ejecutar el script

### 1. Crear la base de datos

Ejecutar primero:

```sql
CREATE DATABASE retail_project;
```

Luego, en DBeaver, conectarse/seleccionar la base de datos `retail_project`.

### 2. Ejecutar el resto del archivo

Ejecutar las sentencias correspondientes a la creación de las tablas y la carga de datos.

El orden de creación es:

1. `clientes`
2. `productos`
3. `ventas`

Esto permite que las claves foráneas de `ventas` apunten correctamente a las tablas existentes.

## Restricciones incluidas

El proyecto contiene más de las 3 restricciones `CHECK` solicitadas:

- `clientes.edad >= 18`
- `productos.precio > 0`
- `productos.stock >= 0`
- `ventas.cantidad > 0`

Además:

- Todas las tablas tienen `PRIMARY KEY`.
- `clientes.email` es `NOT NULL` y `UNIQUE`.
- `ventas` tiene una `FOREIGN KEY` hacia `clientes`.
- `ventas` tiene una `FOREIGN KEY` hacia `productos`.
- Se utiliza `SERIAL` para los identificadores.
- Se utiliza `DECIMAL` para los precios.
- Se utiliza `VARCHAR` para textos.
- Se utiliza `DATE`/`TIMESTAMP` para fechas.

## Carga de datos

Los datos iniciales se cargan dentro de una transacción explícita:

```sql
BEGIN;
...
COMMIT;
```

Se incluyen al menos 5 registros en cada tabla.

## UPDATE y DELETE

El script contiene:

- Un `SELECT` previo y un `UPDATE` que aumenta en un 10% los precios de la categoría `Tecnologia`.
- Un `SELECT` previo y un `DELETE` que elimina específicamente la venta con `id_venta = 5`.

Ambas operaciones utilizan `WHERE` para evitar modificar o eliminar todos los registros.

## Archivos

- `retail_project.sql`: script completo de PostgreSQL.
- `README.md`: instrucciones de ejecución y descripción del proyecto.
