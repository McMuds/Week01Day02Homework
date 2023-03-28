DROP TABLE IF EXISTS list_items;
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS shopping_list;
DROP TABLE IF EXISTS categories;

 
CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);
 
CREATE TABLE shopping_list (
    id SERIAL PRIMARY KEY,
    date_created DATE NOT NULL,
    date_shopped DATE
);
 
CREATE TABLE items (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    cat_id int REFERENCES categories(id) ON DELETE CASCADE
);
 
CREATE TABLE  list_items(
    id SERIAL PRIMARY KEY,
    list_id int REFERENCES shopping_list(id) ON DELETE CASCADE,
    item_id int REFERENCES items(id) ON DELETE CASCADE,
    selected boolean NOT NULL,
    quantity int
);
 
INSERT INTO categories (name) VALUES ('dairy'); --1
INSERT INTO categories (name) VALUES ('fruit'); --2
INSERT INTO categories (name) VALUES ('vegetables');  --3
INSERT INTO categories (name) VALUES ('meat'); --4
INSERT INTO categories (name) VALUES ('needy'); --5
INSERT INTO categories (name) VALUES ('bakery'); --6

INSERT INTO shopping_list (date_created, date_shopped) VALUES ('2023-03-20','2023-03-24');
INSERT INTO shopping_list (date_created, date_shopped) VALUES ('2023-03-25','2023-03-26');
INSERT INTO shopping_list (date_created) VALUES ('2023-03-27');

INSERT INTO items (name, cat_id) VALUES ('milk',1);  --1
INSERT INTO items (name, cat_id) VALUES ('yoghurt',1);  --2
INSERT INTO items (name, cat_id) VALUES ('bananas',2); --3
INSERT INTO items (name, cat_id) VALUES ('apples',2); --4
INSERT INTO items (name, cat_id) VALUES ('bread',6); --5
INSERT INTO items (name, cat_id) VALUES ('peanut butter',6); --6
INSERT INTO items (name, cat_id) VALUES ('eggs',6); --7
INSERT INTO items (name, cat_id) VALUES ('chicken',6); --8
INSERT INTO items (name, cat_id) VALUES ('mince',6); --9
INSERT INTO items (name, cat_id) VALUES ('potatoes',6); --10
INSERT INTO items (name, cat_id) VALUES ('onions',6); --11
INSERT INTO items (name, cat_id) VALUES ('strawberries',6); --12

INSERT INTO list_items (list_id, item_id, quantity, selected) VALUES (1,1,3, True); -- shopping list 1, milk
INSERT INTO list_items (list_id, item_id, quantity, selected) VALUES (1,3, 5, True); -- shopping list 1, bananas
INSERT INTO list_items (list_id, item_id, quantity, selected) VALUES (1,5, 1, True); -- shopping list 1, bread
INSERT INTO list_items (list_id, item_id, quantity, selected) VALUES (2,1, 1, False); -- shopping list 2, milk
INSERT INTO list_items (list_id, item_id, quantity, selected) VALUES (2,2, 4, True); -- shopping list 2, yoghurt
INSERT INTO list_items (list_id, item_id, quantity, selected) VALUES (2,4, 6, True); -- shopping list 2, apples
INSERT INTO list_items (list_id, item_id, quantity, selected) VALUES (2,5, 1, True); -- shopping list 2, bread
INSERT INTO list_items (list_id, item_id, quantity, selected) VALUES (2,6, 1, True); -- shopping list 2, peanut butter
INSERT INTO list_items (list_id, item_id, quantity, selected) VALUES (3,4, 3, True); -- shopping list 3, apples
INSERT INTO list_items (list_id, item_id, quantity, selected) VALUES (3,10, 4, True); -- shopping list 3, potatoes