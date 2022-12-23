CREATE DATABASE confeitaria;
USE confeitaria;

CREATE TABLE IF NOT EXISTS pedido(
Id_Pedido INT(6) ,
Descricao VARCHAR(120),
Web BOOLEAN NOT NULL,
TempoData DATETIME NOT NULL,
PRIMARY KEY (Id_Pedido)
);

CREATE TABLE IF NOT EXISTS bolo(
Codigo_Bolo VARCHAR(6),
Id_Pedido INT(6),
Nome_Doce VARCHAR(20),
Sabor_Doce VARCHAR(20),
Kilo_Doce INT(10),
ValorKg_Doce DECIMAL(10,2),
Formato VARCHAR(20),
Sabor_Cobertura VARCHAR(20),
Camadas INT(2),
PRIMARY KEY (Codigo_Bolo),
FOREIGN KEY (Id_Pedido) REFERENCES pedido(Id_Pedido)
);

CREATE TABLE IF NOT EXISTS pudim(
Codigo_Pudim VARCHAR(6),
Id_Pedido INT(6),
Nome_Doce VARCHAR(20),
Sabor_Doce VARCHAR(20),
Kilo_Doce INT(10),
ValorKg_Doce DECIMAL(10,2),
Tamanho VARCHAR(6),
Lactose BOOLEAN NOT NULL,
Quantidade INT(2),
PRIMARY KEY (Codigo_Pudim),
FOREIGN KEY (Id_Pedido) REFERENCES pedido(Id_Pedido)
);

CREATE TABLE IF NOT EXISTS torta(
Codigo_Torta VARCHAR(6),
Id_Pedido INT(6),
Nome_Doce VARCHAR(20),
Sabor_Doce VARCHAR(20),
Kilo_Doce INT(10),
ValorKg_Doce DECIMAL(10,2),
Vegana BOOLEAN NOT NULL,
Decoracao VARCHAR(120),
IsDoce BOOLEAN NOT NULL,
PRIMARY KEY (Codigo_Torta),
FOREIGN KEY (Id_Pedido) REFERENCES pedido(Id_Pedido)
);

CREATE TABLE IF NOT EXISTS cliente(
Cpf_Cliente INT(11),
Id_Pedido INT(6),
Nome_Cliente VARCHAR(30),
Sobrenome_Cliente VARCHAR(30),
Ultimo_Nome VARCHAR(30),
Telefone_Cliente INT(16),
PRIMARY KEY (Cpf_Cliente),
FOREIGN KEY (Id_Pedido) REFERENCES pedido(Id_Pedido)
);


ALTER TABLE pedido
    ADD Codigo_Bolo VARCHAR(6),
    ADD Codigo_Pudim VARCHAR(6),
    ADD Codigo_Torta VARCHAR(6),
    ADD Cpf_Cliente INT(11),
    ADD FOREIGN KEY (Codigo_Bolo) REFERENCES bolo(Codigo_Bolo),
    ADD FOREIGN KEY (Codigo_Pudim) REFERENCES pudim(Codigo_Pudim),
    ADD FOREIGN KEY (Codigo_Torta) REFERENCES torta(Codigo_Torta),
    ADD FOREIGN KEY (Cpf_Cliente) REFERENCES cliente(Cpf_Cliente);
