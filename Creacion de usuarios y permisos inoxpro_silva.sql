USE inoxpro_silva;

-- Creacion de usuario + contraseña 
CREATE USER 'gsilva'@'localhost' IDENTIFIED BY 'silva2023';

CREATE USER 'ccastillo'@'localhost' IDENTIFIED BY 'castillo2023';

-- Otorgamiento de permisos
GRANT SELECT ON inoxpro_silva.* TO 'gsilva'@'localhost';

GRANT SELECT, INSERT, UPDATE ON inoxpro_silva.* TO 'ccastillo'@'localhost';