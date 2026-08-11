CREATE DATABASE retail_project;

-- Tabla clientes
CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    edad INT CHECK (edad >= 18),
    fecha_registro DATE DEFAULT CURRENT_DATE
);


-- Tabla productos
CREATE TABLE productos (
    id_producto SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    precio DECIMAL(10,2) NOT NULL CHECK (precio > 0),
    stock INT NOT NULL CHECK (stock >= 0)
);


-- Tabla ventas
-- Se crea última porque tiene claves foráneas hacia clientes y productos.
CREATE TABLE ventas (
    id_venta SERIAL PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad > 0),
    fecha_venta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_ventas_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente),

    CONSTRAINT fk_ventas_producto
        FOREIGN KEY (id_producto)
        REFERENCES productos(id_producto)
);

-- 3. DML - CARGA INICIAL DE DATOS

BEGIN;

-- 3.1 Insertar clientes - mínimo 5 registros

INSERT INTO clientes (nombre, email, edad) VALUES
('Ana Garcia', 'ana.garcia@email.com', 32),
('Juan Perez', 'juan.perez@email.com', 27),
('Sofia Lopez', 'sofia.lopez@email.com', 35),
('Martin Rodriguez', 'martin.rodriguez@email.com', 42),
('Laura Fernandez', 'laura.fernandez@email.com', 29);

-- 3.2 Insertar productos - mínimo 5 registros
INSERT INTO productos (nombre, categoria, precio, stock) VALUES
('Notebook Lenovo', 'Tecnologia', 850000.00, 10),
('Mouse Logitech', 'Tecnologia', 35000.00, 25),
('Teclado Redragon', 'Tecnologia', 65000.00, 15),
('Silla de oficina', 'Muebles', 180000.00, 8),
('Escritorio', 'Muebles', 250000.00, 5);


-- ------------------------------------------------------------
-- 3.3 Insertar ventas - mínimo 5 registros
-- ------------------------------------------------------------
INSERT INTO ventas (id_cliente, id_producto, cantidad) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 1),
(4, 4, 1),
(5, 5, 2);


COMMIT;


-- ============================================================
-- 4. MANTENIMIENTO - UPDATE
-- ============================================================

-- SELECT previo para comprobar qué productos serán modificados.
SELECT *
FROM productos
WHERE categoria = 'Tecnologia';

-- Aumentar un 10% el precio de los productos de Tecnología.
UPDATE productos
SET precio = precio * 1.10
WHERE categoria = 'Tecnologia';


-- ============================================================
-- 5. MANTENIMIENTO - DELETE
-- ============================================================

-- SELECT previo para comprobar qué venta se eliminará.
SELECT *
FROM ventas
WHERE id_venta = 5;

-- Eliminar una venta específica utilizando WHERE.
DELETE FROM ventas
WHERE id_venta = 5;


-- ============================================================
-- 6. CONSULTAS FINALES DE VERIFICACIÓN
-- ============================================================

SELECT * FROM clientes;
SELECT * FROM productos;
SELECT * FROM ventas;
