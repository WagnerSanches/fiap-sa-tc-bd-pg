CREATE TABLE Item (
    id_item SERIAL PRIMARY KEY,      
    name VARCHAR(255) NOT NULL,        
    description TEXT,                   
    type VARCHAR(20),                
    cook_time_min INTEGER NOT NULL,
    price DECIMAL(5,2)
);

CREATE TABLE Client (
    id_client SERIAL PRIMARY KEY,
    document VARCHAR(11) UNIQUE NOT NULL,
    email VARCHAR(100),
    name VARCHAR(100)
);

CREATE TABLE Orders (
    id_order SERIAL PRIMARY KEY,
    document varchar(11),
    price DECIMAL(5, 2),
    preparation_time VARCHAR(15),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Payment (
    id_payment SERIAL PRIMARY KEY, 
    id_order INTEGER UNIQUE NOT NULL,
    status VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_order) REFERENCES Orders(id_order)
);

CREATE TABLE Status (
    id_status SERIAL PRIMARY KEY,
    name VARCHAR(15)
);

CREATE TABLE OrderStatus (
    id_order_status SERIAL PRIMARY KEY,
    id_order INTEGER UNIQUE NOT NULL,
    id_status INTEGER,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_status FOREIGN KEY (id_status) REFERENCES Status(id_status),
    FOREIGN KEY (id_order) REFERENCES Orders(id_order)
);

CREATE TABLE OrderItems (
    id_order INTEGER NOT NULL,
    id_item INTEGER NOT NULL,
    quantity INTEGER,
    PRIMARY KEY (id_order, id_item, quantity),
    CONSTRAINT fk_order FOREIGN KEY (id_order) REFERENCES Orders(id_order),
    CONSTRAINT fk_item FOREIGN KEY (id_item) REFERENCES Item(id_item)
);

INSERT INTO Item (name, description, type, cook_time_min, price) VALUES ('Pizza Margherita', 'Massa artesanal com molho de tomate, manjericão e queijo mozzarella.', 'Pizza', 15, 29.90);
INSERT INTO Item (name, description, type, cook_time_min, price) VALUES ('Hambúrguer Clássico', 'Pão brioche, hambúrguer 150g, queijo cheddar, alface e tomate.', 'Sanduíche', 10, 19.50);
INSERT INTO Item (name, description, type, cook_time_min, price) VALUES ('Sushi Especial', '10 peças de sushi com peixe fresco e arroz temperado.', 'Comida Japonesa', 15, 45.00);

INSERT INTO Status(name) VALUES ('RECEIVED');
INSERT INTO Status(name) VALUES ('IN_PROCESS');
INSERT INTO Status(name) VALUES ('READY');
INSERT INTO Status(name) VALUES ('FINISHED');
INSERT INTO Status(name) VALUES ('CANCELED');