--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;



SET default_tablespace = '';

SET default_with_oids = false;


---
--- drop tables
---


DROP TABLE IF EXISTS customer_customer_demo;
DROP TABLE IF EXISTS customer_demographics;
DROP TABLE IF EXISTS employee_territories;
DROP TABLE IF EXISTS order_details;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS shippers;
DROP TABLE IF EXISTS suppliers;
DROP TABLE IF EXISTS territories;
DROP TABLE IF EXISTS us_states;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS region;
DROP TABLE IF EXISTS employees;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE categories (
    category_id serial NOT NULL,
    category_name character varying(15) NOT NULL,
    description text,
    picture bytea
);


--
-- Name: customer_customer_demo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE customer_customer_demo (
    customer_id bpchar NOT NULL,
    customer_type_id bpchar NOT NULL
);


--
-- Name: customer_demographics; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE customer_demographics (
    customer_type_id bpchar NOT NULL,
    customer_desc text
);


--
-- Name: customers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE customers (
    customer_id bpchar NOT NULL,
    company_name character varying(40) NOT NULL,
    contact_name character varying(30),
    contact_title character varying(30),
    address character varying(60),
    city character varying(15),
    region character varying(15),
    postal_code character varying(10),
    country character varying(15),
    phone character varying(24),
    fax character varying(24)
);


--
-- Name: employees; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE employees (
    employee_id serial NOT NULL,
    last_name character varying(20) NOT NULL,
    first_name character varying(10) NOT NULL,
    title character varying(30),
    title_of_courtesy character varying(25),
    birth_date date,
    hire_date date,
    address character varying(60),
    city character varying(15),
    region character varying(15),
    postal_code character varying(10),
    country character varying(15),
    home_phone character varying(24),
    extension character varying(4),
    photo bytea,
    notes text,
    reports_to smallint,
    photo_path character varying(255)
);


--
-- Name: employee_territories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE employee_territories (
    employee_id serial NOT NULL,
    territory_id character varying(20) NOT NULL
);




--
-- Name: order_details; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE order_details (
    order_id serial NOT NULL,
    product_id integer NOT NULL,
    unit_price real NOT NULL,
    quantity smallint NOT NULL,
    discount real NOT NULL
);


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE orders (
    order_id serial NOT NULL,
    customer_id bpchar,
    employee_id integer,
    order_date date,
    required_date date,
    shipped_date date,
    ship_via smallint,
    freight real,
    ship_name character varying(40),
    ship_address character varying(60),
    ship_city character varying(15),
    ship_region character varying(15),
    ship_postal_code character varying(10),
    ship_country character varying(15)
);


--
-- Name: products; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE products (
    product_id serial NOT NULL,
    product_name character varying(40) NOT NULL,
    supplier_id integer,
    category_id integer,
    quantity_per_unit character varying(20),
    unit_price real,
    units_in_stock smallint,
    units_on_order smallint,
    reorder_level smallint,
    discontinued integer NOT NULL
);


--
-- Name: region; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE region (
    region_id serial NOT NULL,
    region_description bpchar NOT NULL
);


--
-- Name: shippers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE shippers (
    shipper_id serial NOT NULL,
    company_name character varying(40) NOT NULL,
    phone character varying(24)
);



--
-- Name: suppliers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE suppliers (
    supplier_id serial NOT NULL,
    company_name character varying(40) NOT NULL,
    contact_name character varying(30),
    contact_title character varying(30),
    address character varying(60),
    city character varying(15),
    region character varying(15),
    postal_code character varying(10),
    country character varying(15),
    phone character varying(24),
    fax character varying(24),
    homepage text
);


--
-- Name: territories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE territories (
    territory_id character varying(20) NOT NULL,
    territory_description bpchar NOT NULL,
    region_id smallint NOT NULL
);


--
-- Name: us_states; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE us_states (
    state_id serial NOT NULL,
    state_name character varying(100),
    state_abbr character varying(2),
    state_region character varying(50)
);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO categories VALUES ('Beverages', 'Soft drinks, coffees, teas, beers, and ales', '\x');
INSERT INTO categories VALUES ('Condiments', 'Sweet and savory sauces, relishes, spreads, and seasonings', '\x');
INSERT INTO categories VALUES ('Confections', 'Desserts, candies, and sweet breads', '\x');
INSERT INTO categories VALUES ('Dairy Products', 'Cheeses', '\x');
INSERT INTO categories VALUES ('Grains/Cereals', 'Breads, crackers, pasta, and cereal', '\x');
INSERT INTO categories VALUES ('Meat/Poultry', 'Prepared meats', '\x');
INSERT INTO categories VALUES ('Produce', 'Dried fruit and bean curd', '\x');
INSERT INTO categories VALUES ('Seafood', 'Seaweed and fish', '\x');


--
-- Data for Name: customer_customer_demo; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: customer_demographics; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO customers VALUES ('ALFKI', 'Alfreds Futterkiste', 'Maria Anders', 'Sales Representative', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany', '030-0074321', '030-0076545');
INSERT INTO customers VALUES ('ANATR', 'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Owner', 'Avda. de la Constitución 2222', 'México D.F.', NULL, '05021', 'Mexico', '(5) 555-4729', '(5) 555-3745');
INSERT INTO customers VALUES ('ANTON', 'Antonio Moreno Taquería', 'Antonio Moreno', 'Owner', 'Mataderos  2312', 'México D.F.', NULL, '05023', 'Mexico', '(5) 555-3932', NULL);
INSERT INTO customers VALUES ('AROUT', 'Around the Horn', 'Thomas Hardy', 'Sales Representative', '120 Hanover Sq.', 'London', NULL, 'WA1 1DP', 'UK', '(171) 555-7788', '(171) 555-6750');
INSERT INTO customers VALUES ('BERGS', 'Berglunds snabbköp', 'Christina Berglund', 'Order Administrator', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden', '0921-12 34 65', '0921-12 34 67');
INSERT INTO customers VALUES ('BLAUS', 'Blauer See Delikatessen', 'Hanna Moos', 'Sales Representative', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany', '0621-08460', '0621-08924');
INSERT INTO customers VALUES ('BLONP', 'Blondesddsl père et fils', 'Frédérique Citeaux', 'Marketing Manager', '24, place Kléber', 'Strasbourg', NULL, '67000', 'France', '88.60.15.31', '88.60.15.32');
INSERT INTO customers VALUES ('BOLID', 'Bólido Comidas preparadas', 'Martín Sommer', 'Owner', 'C/ Araquil, 67', 'Madrid', NULL, '28023', 'Spain', '(91) 555 22 82', '(91) 555 91 99');
INSERT INTO customers VALUES ('BONAP', 'Bon app''', 'Laurence Lebihan', 'Owner', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France', '91.24.45.40', '91.24.45.41');
INSERT INTO customers VALUES ('BOTTM', 'Bottom-Dollar Markets', 'Elizabeth Lincoln', 'Accounting Manager', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada', '(604) 555-4729', '(604) 555-3745');
INSERT INTO customers VALUES ('BSBEV', 'B''s Beverages', 'Victoria Ashworth', 'Sales Representative', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK', '(171) 555-1212', NULL);
INSERT INTO customers VALUES ('CACTU', 'Cactus Comidas para llevar', 'Patricio Simpson', 'Sales Agent', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina', '(1) 135-5555', '(1) 135-4892');
INSERT INTO customers VALUES ('CENTC', 'Centro comercial Moctezuma', 'Francisco Chang', 'Marketing Manager', 'Sierras de Granada 9993', 'México D.F.', NULL, '05022', 'Mexico', '(5) 555-3392', '(5) 555-7293');
INSERT INTO customers VALUES ('CHOPS', 'Chop-suey Chinese', 'Yang Wang', 'Owner', 'Hauptstr. 29', 'Bern', NULL, '3012', 'Switzerland', '0452-076545', NULL);
INSERT INTO customers VALUES ('COMMI', 'Comércio Mineiro', 'Pedro Afonso', 'Sales Associate', 'Av. dos Lusíadas, 23', 'Sao Paulo', 'SP', '05432-043', 'Brazil', '(11) 555-7647', NULL);
INSERT INTO customers VALUES ('CONSH', 'Consolidated Holdings', 'Elizabeth Brown', 'Sales Representative', 'Berkeley Gardens 12  Brewery', 'London', NULL, 'WX1 6LT', 'UK', '(171) 555-2282', '(171) 555-9199');
INSERT INTO customers VALUES ('DRACD', 'Drachenblut Delikatessen', 'Sven Ottlieb', 'Order Administrator', 'Walserweg 21', 'Aachen', NULL, '52066', 'Germany', '0241-039123', '0241-059428');
INSERT INTO customers VALUES ('DUMON', 'Du monde entier', 'Janine Labrune', 'Owner', '67, rue des Cinquante Otages', 'Nantes', NULL, '44000', 'France', '40.67.88.88', '40.67.89.89');
INSERT INTO customers VALUES ('EASTC', 'Eastern Connection', 'Ann Devon', 'Sales Agent', '35 King George', 'London', NULL, 'WX3 6FW', 'UK', '(171) 555-0297', '(171) 555-3373');
INSERT INTO customers VALUES ('ERNSH', 'Ernst Handel', 'Roland Mendel', 'Sales Manager', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria', '7675-3425', '7675-3426');
INSERT INTO customers VALUES ('FAMIA', 'Familia Arquibaldo', 'Aria Cruz', 'Marketing Assistant', 'Rua Orós, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil', '(11) 555-9857', NULL);
INSERT INTO customers VALUES ('FISSA', 'FISSA Fabrica Inter. Salchichas S.A.', 'Diego Roel', 'Accounting Manager', 'C/ Moralzarzal, 86', 'Madrid', NULL, '28034', 'Spain', '(91) 555 94 44', '(91) 555 55 93');
INSERT INTO customers VALUES ('FOLIG', 'Folies gourmandes', 'Martine Rancé', 'Assistant Sales Agent', '184, chaussée de Tournai', 'Lille', NULL, '59000', 'France', '20.16.10.16', '20.16.10.17');
INSERT INTO customers VALUES ('FOLKO', 'Folk och fä HB', 'Maria Larsson', 'Owner', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden', '0695-34 67 21', NULL);
INSERT INTO customers VALUES ('FRANK', 'Frankenversand', 'Peter Franken', 'Marketing Manager', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany', '089-0877310', '089-0877451');
INSERT INTO customers VALUES ('FRANR', 'France restauration', 'Carine Schmitt', 'Marketing Manager', '54, rue Royale', 'Nantes', NULL, '44000', 'France', '40.32.21.21', '40.32.21.20');
INSERT INTO customers VALUES ('FRANS', 'Franchi S.p.A.', 'Paolo Accorti', 'Sales Representative', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italy', '011-4988260', '011-4988261');
INSERT INTO customers VALUES ('FURIB', 'Furia Bacalhau e Frutos do Mar', 'Lino Rodriguez', 'Sales Manager', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal', '(1) 354-2534', '(1) 354-2535');
INSERT INTO customers VALUES ('GALED', 'Galería del gastrónomo', 'Eduardo Saavedra', 'Marketing Manager', 'Rambla de Cataluña, 23', 'Barcelona', NULL, '08022', 'Spain', '(93) 203 4560', '(93) 203 4561');
INSERT INTO customers VALUES ('GODOS', 'Godos Cocina Típica', 'José Pedro Freyre', 'Sales Manager', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain', '(95) 555 82 82', NULL);
INSERT INTO customers VALUES ('GOURL', 'Gourmet Lanchonetes', 'André Fonseca', 'Sales Associate', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil', '(11) 555-9482', NULL);
INSERT INTO customers VALUES ('GREAL', 'Great Lakes Food Market', 'Howard Snyder', 'Marketing Manager', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA', '(503) 555-7555', NULL);
INSERT INTO customers VALUES ('GROSR', 'GROSELLA-Restaurante', 'Manuel Pereira', 'Owner', '5ª Ave. Los Palos Grandes', 'Caracas', 'DF', '1081', 'Venezuela', '(2) 283-2951', '(2) 283-3397');
INSERT INTO customers VALUES ('HANAR', 'Hanari Carnes', 'Mario Pontes', 'Accounting Manager', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil', '(21) 555-0091', '(21) 555-8765');
INSERT INTO customers VALUES ('HILAA', 'HILARION-Abastos', 'Carlos Hernández', 'Sales Representative', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela', '(5) 555-1340', '(5) 555-1948');
INSERT INTO customers VALUES ('HUNGC', 'Hungry Coyote Import Store', 'Yoshi Latimer', 'Sales Representative', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA', '(503) 555-6874', '(503) 555-2376');
INSERT INTO customers VALUES ('HUNGO', 'Hungry Owl All-Night Grocers', 'Patricia McKenna', 'Sales Associate', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland', '2967 542', '2967 3333');
INSERT INTO customers VALUES ('ISLAT', 'Island Trading', 'Helen Bennett', 'Marketing Manager', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK', '(198) 555-8888', NULL);
INSERT INTO customers VALUES ('KOENE', 'Königlich Essen', 'Philip Cramer', 'Sales Associate', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany', '0555-09876', NULL);
INSERT INTO customers VALUES ('LACOR', 'La corne d''abondance', 'Daniel Tonini', 'Sales Representative', '67, avenue de l''Europe', 'Versailles', NULL, '78000', 'France', '30.59.84.10', '30.59.85.11');
INSERT INTO customers VALUES ('LAMAI', 'La maison d''Asie', 'Annette Roulet', 'Sales Manager', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France', '61.77.61.10', '61.77.61.11');
INSERT INTO customers VALUES ('LAUGB', 'Laughing Bacchus Wine Cellars', 'Yoshi Tannamuri', 'Marketing Assistant', '1900 Oak St.', 'Vancouver', 'BC', 'V3F 2K1', 'Canada', '(604) 555-3392', '(604) 555-7293');
INSERT INTO customers VALUES ('LAZYK', 'Lazy K Kountry Store', 'John Steel', 'Marketing Manager', '12 Orchestra Terrace', 'Walla Walla', 'WA', '99362', 'USA', '(509) 555-7969', '(509) 555-6221');
INSERT INTO customers VALUES ('LEHMS', 'Lehmanns Marktstand', 'Renate Messner', 'Sales Representative', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany', '069-0245984', '069-0245874');
INSERT INTO customers VALUES ('LETSS', 'Let''s Stop N Shop', 'Jaime Yorres', 'Owner', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA', '(415) 555-5938', NULL);
INSERT INTO customers VALUES ('LILAS', 'LILA-Supermercado', 'Carlos González', 'Accounting Manager', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela', '(9) 331-6954', '(9) 331-7256');
INSERT INTO customers VALUES ('LINOD', 'LINO-Delicateses', 'Felipe Izquierdo', 'Owner', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela', '(8) 34-56-12', '(8) 34-93-93');
INSERT INTO customers VALUES ('LONEP', 'Lonesome Pine Restaurant', 'Fran Wilson', 'Sales Manager', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA', '(503) 555-9573', '(503) 555-9646');
INSERT INTO customers VALUES ('MAGAA', 'Magazzini Alimentari Riuniti', 'Giovanni Rovelli', 'Marketing Manager', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy', '035-640230', '035-640231');
INSERT INTO customers VALUES ('MAISD', 'Maison Dewey', 'Catherine Dewey', 'Sales Agent', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Belgium', '(02) 201 24 67', '(02) 201 24 68');
INSERT INTO customers VALUES ('MEREP', 'Mère Paillarde', 'Jean Fresnière', 'Marketing Assistant', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada', '(514) 555-8054', '(514) 555-8055');
INSERT INTO customers VALUES ('MORGK', 'Morgenstern Gesundkost', 'Alexander Feuer', 'Marketing Assistant', 'Heerstr. 22', 'Leipzig', NULL, '04179', 'Germany', '0342-023176', NULL);
INSERT INTO customers VALUES ('NORTS', 'North/South', 'Simon Crowther', 'Sales Associate', 'South House 300 Queensbridge', 'London', NULL, 'SW7 1RZ', 'UK', '(171) 555-7733', '(171) 555-2530');
INSERT INTO customers VALUES ('OCEAN', 'Océano Atlántico Ltda.', 'Yvonne Moncada', 'Sales Agent', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires', NULL, '1010', 'Argentina', '(1) 135-5333', '(1) 135-5535');
INSERT INTO customers VALUES ('OLDWO', 'Old World Delicatessen', 'Rene Phillips', 'Sales Representative', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA', '(907) 555-7584', '(907) 555-2880');
INSERT INTO customers VALUES ('OTTIK', 'Ottilies Käseladen', 'Henriette Pfalzheim', 'Owner', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Germany', '0221-0644327', '0221-0765721');
INSERT INTO customers VALUES ('PARIS', 'Paris spécialités', 'Marie Bertrand', 'Owner', '265, boulevard Charonne', 'Paris', NULL, '75012', 'France', '(1) 42.34.22.66', '(1) 42.34.22.77');
INSERT INTO customers VALUES ('PERIC', 'Pericles Comidas clásicas', 'Guillermo Fernández', 'Sales Representative', 'Calle Dr. Jorge Cash 321', 'México D.F.', NULL, '05033', 'Mexico', '(5) 552-3745', '(5) 545-3745');
INSERT INTO customers VALUES ('PICCO', 'Piccolo und mehr', 'Georg Pipps', 'Sales Manager', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria', '6562-9722', '6562-9723');
INSERT INTO customers VALUES ('PRINI', 'Princesa Isabel Vinhos', 'Isabel de Castro', 'Sales Representative', 'Estrada da saúde n. 58', 'Lisboa', NULL, '1756', 'Portugal', '(1) 356-5634', NULL);
INSERT INTO customers VALUES ('QUEDE', 'Que Delícia', 'Bernardo Batista', 'Accounting Manager', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil', '(21) 555-4252', '(21) 555-4545');
INSERT INTO customers VALUES ('QUEEN', 'Queen Cozinha', 'Lúcia Carvalho', 'Marketing Assistant', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil', '(11) 555-1189', NULL);
INSERT INTO customers VALUES ('QUICK', 'QUICK-Stop', 'Horst Kloss', 'Accounting Manager', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany', '0372-035188', NULL);
INSERT INTO customers VALUES ('RANCH', 'Rancho grande', 'Sergio Gutiérrez', 'Sales Representative', 'Av. del Libertador 900', 'Buenos Aires', NULL, '1010', 'Argentina', '(1) 123-5555', '(1) 123-5556');
INSERT INTO customers VALUES ('RATTC', 'Rattlesnake Canyon Grocery', 'Paula Wilson', 'Assistant Sales Representative', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA', '(505) 555-5939', '(505) 555-3620');
INSERT INTO customers VALUES ('REGGC', 'Reggiani Caseifici', 'Maurizio Moroni', 'Sales Associate', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy', '0522-556721', '0522-556722');
INSERT INTO customers VALUES ('RICAR', 'Ricardo Adocicados', 'Janete Limeira', 'Assistant Sales Agent', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil', '(21) 555-3412', NULL);
INSERT INTO customers VALUES ('RICSU', 'Richter Supermarkt', 'Michael Holz', 'Sales Manager', 'Grenzacherweg 237', 'Genève', NULL, '1203', 'Switzerland', '0897-034214', NULL);
INSERT INTO customers VALUES ('ROMEY', 'Romero y tomillo', 'Alejandra Camino', 'Accounting Manager', 'Gran Vía, 1', 'Madrid', NULL, '28001', 'Spain', '(91) 745 6200', '(91) 745 6210');
INSERT INTO customers VALUES ('SANTG', 'Santé Gourmet', 'Jonas Bergulfsen', 'Owner', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Norway', '07-98 92 35', '07-98 92 47');
INSERT INTO customers VALUES ('SAVEA', 'Save-a-lot Markets', 'Jose Pavarotti', 'Sales Representative', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA', '(208) 555-8097', NULL);
INSERT INTO customers VALUES ('SEVES', 'Seven Seas Imports', 'Hari Kumar', 'Sales Manager', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK', '(171) 555-1717', '(171) 555-5646');
INSERT INTO customers VALUES ('SIMOB', 'Simons bistro', 'Jytte Petersen', 'Owner', 'Vinbæltet 34', 'Kobenhavn', NULL, '1734', 'Denmark', '31 12 34 56', '31 13 35 57');
INSERT INTO customers VALUES ('SPECD', 'Spécialités du monde', 'Dominique Perrier', 'Marketing Manager', '25, rue Lauriston', 'Paris', NULL, '75016', 'France', '(1) 47.55.60.10', '(1) 47.55.60.20');
INSERT INTO customers VALUES ('SPLIR', 'Split Rail Beer & Ale', 'Art Braunschweiger', 'Sales Manager', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA', '(307) 555-4680', '(307) 555-6525');
INSERT INTO customers VALUES ('SUPRD', 'Suprêmes délices', 'Pascale Cartrain', 'Accounting Manager', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium', '(071) 23 67 22 20', '(071) 23 67 22 21');
INSERT INTO customers VALUES ('THEBI', 'The Big Cheese', 'Liz Nixon', 'Marketing Manager', '89 Jefferson Way Suite 2', 'Portland', 'OR', '97201', 'USA', '(503) 555-3612', NULL);
INSERT INTO customers VALUES ('THECR', 'The Cracker Box', 'Liu Wong', 'Marketing Assistant', '55 Grizzly Peak Rd.', 'Butte', 'MT', '59801', 'USA', '(406) 555-5834', '(406) 555-8083');
INSERT INTO customers VALUES ('TOMSP', 'Toms Spezialitäten', 'Karin Josephs', 'Marketing Manager', 'Luisenstr. 48', 'Münster', NULL, '44087', 'Germany', '0251-031259', '0251-035695');
INSERT INTO customers VALUES ('TORTU', 'Tortuga Restaurante', 'Miguel Angel Paolino', 'Owner', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'Mexico', '(5) 555-2933', NULL);
INSERT INTO customers VALUES ('TRADH', 'Tradição Hipermercados', 'Anabela Domingues', 'Sales Representative', 'Av. Inês de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil', '(11) 555-2167', '(11) 555-2168');
INSERT INTO customers VALUES ('TRAIH', 'Trail''s Head Gourmet Provisioners', 'Helvetius Nagy', 'Sales Associate', '722 DaVinci Blvd.', 'Kirkland', 'WA', '98034', 'USA', '(206) 555-8257', '(206) 555-2174');
INSERT INTO customers VALUES ('VAFFE', 'Vaffeljernet', 'Palle Ibsen', 'Sales Manager', 'Smagsloget 45', 'Århus', NULL, '8200', 'Denmark', '86 21 32 43', '86 22 33 44');
INSERT INTO customers VALUES ('VICTE', 'Victuailles en stock', 'Mary Saveley', 'Sales Agent', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France', '78.32.54.86', '78.32.54.87');
INSERT INTO customers VALUES ('VINET', 'Vins et alcools Chevalier', 'Paul Henriot', 'Accounting Manager', '59 rue de l''Abbaye', 'Reims', NULL, '51100', 'France', '26.47.15.10', '26.47.15.11');
INSERT INTO customers VALUES ('WANDK', 'Die Wandernde Kuh', 'Rita Müller', 'Sales Representative', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany', '0711-020361', '0711-035428');
INSERT INTO customers VALUES ('WARTH', 'Wartian Herkku', 'Pirkko Koskitalo', 'Accounting Manager', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland', '981-443655', '981-443655');
INSERT INTO customers VALUES ('WELLI', 'Wellington Importadora', 'Paula Parente', 'Sales Manager', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil', '(14) 555-8122', NULL);
INSERT INTO customers VALUES ('WHITC', 'White Clover Markets', 'Karl Jablonski', 'Owner', '305 - 14th Ave. S. Suite 3B', 'Seattle', 'WA', '98128', 'USA', '(206) 555-4112', '(206) 555-4115');
INSERT INTO customers VALUES ('WILMK', 'Wilman Kala', 'Matti Karttunen', 'Owner/Marketing Assistant', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finland', '90-224 8858', '90-224 8858');
INSERT INTO customers VALUES ('WOLZA', 'Wolski  Zajazd', 'Zbyszek Piestrzeniewicz', 'Owner', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Poland', '(26) 642-7012', '(26) 642-7012');


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO employees VALUES ('Davolio', 'Nancy', 'Sales Representative', 'Ms.', '1948-12-08', '1992-05-01', '507 - 20th Ave. E.\nApt. 2A', 'Seattle', 'WA', '98122', 'USA', '(206) 555-9857', '5467', '\x', 'Education includes a BA in psychology from Colorado State University in 1970.  She also completed The Art of the Cold Call.  Nancy is a member of Toastmasters International.', 2, 'http://accweb/emmployees/davolio.bmp');
INSERT INTO employees VALUES ('Fuller', 'Andrew', 'Vice President, Sales', 'Dr.', '1952-02-19', '1992-08-14', '908 W. Capital Way', 'Tacoma', 'WA', '98401', 'USA', '(206) 555-9482', '3457', '\x', 'Andrew received his BTS commercial in 1974 and a Ph.D. in international marketing from the University of Dallas in 1981.  He is fluent in French and Italian and reads German.  He joined the company as a sales representative, was promoted to sales manager in January 1992 and to vice president of sales in March 1993.  Andrew is a member of the Sales Management Roundtable, the Seattle Chamber of Commerce, and the Pacific Rim Importers Association.', NULL, 'http://accweb/emmployees/fuller.bmp');
INSERT INTO employees VALUES ('Leverling', 'Janet', 'Sales Representative', 'Ms.', '1963-08-30', '1992-04-01', '722 Moss Bay Blvd.', 'Kirkland', 'WA', '98033', 'USA', '(206) 555-3412', '3355', '\x', 'Janet has a BS degree in chemistry from Boston College (1984).  She has also completed a certificate program in food retailing management.  Janet was hired as a sales associate in 1991 and promoted to sales representative in February 1992.', 2, 'http://accweb/emmployees/leverling.bmp');
INSERT INTO employees VALUES ('Peacock', 'Margaret', 'Sales Representative', 'Mrs.', '1937-09-19', '1993-05-03', '4110 Old Redmond Rd.', 'Redmond', 'WA', '98052', 'USA', '(206) 555-8122', '5176', '\x', 'Margaret holds a BA in English literature from Concordia College (1958) and an MA from the American Institute of Culinary Arts (1966).  She was assigned to the London office temporarily from July through November 1992.', 2, 'http://accweb/emmployees/peacock.bmp');
INSERT INTO employees VALUES ('Buchanan', 'Steven', 'Sales Manager', 'Mr.', '1955-03-04', '1993-10-17', '14 Garrett Hill', 'London', NULL, 'SW1 8JR', 'UK', '(71) 555-4848', '3453', '\x', 'Steven Buchanan graduated from St. Andrews University, Scotland, with a BSC degree in 1976.  Upon joining the company as a sales representative in 1992, he spent 6 months in an orientation program at the Seattle office and then returned to his permanent post in London.  He was promoted to sales manager in March 1993.  Mr. Buchanan has completed the courses Successful Telemarketing and International Sales Management.  He is fluent in French.', 2, 'http://accweb/emmployees/buchanan.bmp');
INSERT INTO employees VALUES ('Suyama', 'Michael', 'Sales Representative', 'Mr.', '1963-07-02', '1993-10-17', 'Coventry House\nMiner Rd.', 'London', NULL, 'EC2 7JR', 'UK', '(71) 555-7773', '428', '\x', 'Michael is a graduate of Sussex University (MA, economics, 1983) and the University of California at Los Angeles (MBA, marketing, 1986).  He has also taken the courses Multi-Cultural Selling and Time Management for the Sales Professional.  He is fluent in Japanese and can read and write French, Portuguese, and Spanish.', 5, 'http://accweb/emmployees/davolio.bmp');
INSERT INTO employees VALUES ('King', 'Robert', 'Sales Representative', 'Mr.', '1960-05-29', '1994-01-02', 'Edgeham Hollow\nWinchester Way', 'London', NULL, 'RG1 9SP', 'UK', '(71) 555-5598', '465', '\x', 'Robert King served in the Peace Corps and traveled extensively before completing his degree in English at the University of Michigan in 1992, the year he joined the company.  After completing a course entitled Selling in Europe, he was transferred to the London office in March 1993.', 5, 'http://accweb/emmployees/davolio.bmp');
INSERT INTO employees VALUES ('Callahan', 'Laura', 'Inside Sales Coordinator', 'Ms.', '1958-01-09', '1994-03-05', '4726 - 11th Ave. N.E.', 'Seattle', 'WA', '98105', 'USA', '(206) 555-1189', '2344', '\x', 'Laura received a BA in psychology from the University of Washington.  She has also completed a course in business French.  She reads and writes French.', 2, 'http://accweb/emmployees/davolio.bmp');
INSERT INTO employees VALUES ('Dodsworth', 'Anne', 'Sales Representative', 'Ms.', '1966-01-27', '1994-11-15', '7 Houndstooth Rd.', 'London', NULL, 'WG2 7LT', 'UK', '(71) 555-4444', '452', '\x', 'Anne has a BA degree in English from St. Lawrence College.  She is fluent in French and German.', 5, 'http://accweb/emmployees/davolio.bmp');


--
-- Data for Name: employee_territories; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO employee_territories VALUES (1, '06897');
INSERT INTO employee_territories VALUES (1, '19713');
INSERT INTO employee_territories VALUES (2, '01581');
INSERT INTO employee_territories VALUES (2, '01730');
INSERT INTO employee_territories VALUES (2, '01833');
INSERT INTO employee_territories VALUES (2, '02116');
INSERT INTO employee_territories VALUES (2, '02139');
INSERT INTO employee_territories VALUES (2, '02184');
INSERT INTO employee_territories VALUES (2, '40222');
INSERT INTO employee_territories VALUES (3, '30346');
INSERT INTO employee_territories VALUES (3, '31406');
INSERT INTO employee_territories VALUES (3, '32859');
INSERT INTO employee_territories VALUES (3, '33607');
INSERT INTO employee_territories VALUES (4, '20852');
INSERT INTO employee_territories VALUES (4, '27403');
INSERT INTO employee_territories VALUES (4, '27511');
INSERT INTO employee_territories VALUES (5, '02903');
INSERT INTO employee_territories VALUES (5, '07960');
INSERT INTO employee_territories VALUES (5, '08837');
INSERT INTO employee_territories VALUES (5, '10019');
INSERT INTO employee_territories VALUES (5, '10038');
INSERT INTO employee_territories VALUES (5, '11747');
INSERT INTO employee_territories VALUES (5, '14450');
INSERT INTO employee_territories VALUES (6, '85014');
INSERT INTO employee_territories VALUES (6, '85251');
INSERT INTO employee_territories VALUES (6, '98004');
INSERT INTO employee_territories VALUES (6, '98052');
INSERT INTO employee_territories VALUES (6, '98104');
INSERT INTO employee_territories VALUES (7, '60179');
INSERT INTO employee_territories VALUES (7, '60601');
INSERT INTO employee_territories VALUES (7, '80202');
INSERT INTO employee_territories VALUES (7, '80909');
INSERT INTO employee_territories VALUES (7, '90405');
INSERT INTO employee_territories VALUES (7, '94025');
INSERT INTO employee_territories VALUES (7, '94105');
INSERT INTO employee_territories VALUES (7, '95008');
INSERT INTO employee_territories VALUES (7, '95054');
INSERT INTO employee_territories VALUES (7, '95060');
INSERT INTO employee_territories VALUES (8, '19428');
INSERT INTO employee_territories VALUES (8, '44122');
INSERT INTO employee_territories VALUES (8, '45839');
INSERT INTO employee_territories VALUES (8, '53404');
INSERT INTO employee_territories VALUES (9, '03049');
INSERT INTO employee_territories VALUES (9, '03801');
INSERT INTO employee_territories VALUES (9, '48075');
INSERT INTO employee_territories VALUES (9, '48084');
INSERT INTO employee_territories VALUES (9, '48304');
INSERT INTO employee_territories VALUES (9, '55113');
INSERT INTO employee_territories VALUES (9, '55439');


--
-- Data for Name: order_details; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO order_details VALUES (11, 14, 12, 0);
INSERT INTO order_details VALUES (42, 9.80000019, 10, 0);
INSERT INTO order_details VALUES (72, 34.7999992, 5, 0);
INSERT INTO order_details VALUES (14, 18.6000004, 9, 0);
INSERT INTO order_details VALUES (51, 42.4000015, 40, 0);
INSERT INTO order_details VALUES (41, 7.69999981, 10, 0);
INSERT INTO order_details VALUES (51, 42.4000015, 35, 0.150000006);
INSERT INTO order_details VALUES (65, 16.7999992, 15, 0.150000006);
INSERT INTO order_details VALUES (22, 16.7999992, 6, 0.0500000007);
INSERT INTO order_details VALUES (57, 15.6000004, 15, 0.0500000007);
INSERT INTO order_details VALUES (65, 16.7999992, 20, 0);
INSERT INTO order_details VALUES (20, 64.8000031, 40, 0.0500000007);
INSERT INTO order_details VALUES (33, 2, 25, 0.0500000007);
INSERT INTO order_details VALUES (60, 27.2000008, 40, 0);
INSERT INTO order_details VALUES (31, 10, 20, 0);
INSERT INTO order_details VALUES (39, 14.3999996, 42, 0);
INSERT INTO order_details VALUES (49, 16, 40, 0);
INSERT INTO order_details VALUES (24, 3.5999999, 15, 0.150000006);
INSERT INTO order_details VALUES (55, 19.2000008, 21, 0.150000006);
INSERT INTO order_details VALUES (74, 8, 21, 0);
INSERT INTO order_details VALUES (2, 15.1999998, 20, 0);
INSERT INTO order_details VALUES (16, 13.8999996, 35, 0);
INSERT INTO order_details VALUES (36, 15.1999998, 25, 0);
INSERT INTO order_details VALUES (59, 44, 30, 0);
INSERT INTO order_details VALUES (53, 26.2000008, 15, 0);
INSERT INTO order_details VALUES (77, 10.3999996, 12, 0);
INSERT INTO order_details VALUES (27, 35.0999985, 25, 0);
INSERT INTO order_details VALUES (39, 14.3999996, 6, 0);
INSERT INTO order_details VALUES (77, 10.3999996, 15, 0);
INSERT INTO order_details VALUES (2, 15.1999998, 50, 0.200000003);
INSERT INTO order_details VALUES (5, 17, 65, 0.200000003);
INSERT INTO order_details VALUES (32, 25.6000004, 6, 0.200000003);
INSERT INTO order_details VALUES (21, 8, 10, 0);
INSERT INTO order_details VALUES (37, 20.7999992, 1, 0);
INSERT INTO order_details VALUES (41, 7.69999981, 16, 0.25);
INSERT INTO order_details VALUES (57, 15.6000004, 50, 0);
INSERT INTO order_details VALUES (62, 39.4000015, 15, 0.25);
INSERT INTO order_details VALUES (70, 12, 21, 0.25);
INSERT INTO order_details VALUES (21, 8, 20, 0);
INSERT INTO order_details VALUES (35, 14.3999996, 20, 0);
INSERT INTO order_details VALUES (5, 17, 12, 0.200000003);
INSERT INTO order_details VALUES (7, 24, 15, 0);
INSERT INTO order_details VALUES (56, 30.3999996, 2, 0);
INSERT INTO order_details VALUES (16, 13.8999996, 60, 0.25);
INSERT INTO order_details VALUES (24, 3.5999999, 28, 0);
INSERT INTO order_details VALUES (30, 20.7000008, 60, 0.25);
INSERT INTO order_details VALUES (74, 8, 36, 0.25);
INSERT INTO order_details VALUES (2, 15.1999998, 35, 0);
INSERT INTO order_details VALUES (41, 7.69999981, 25, 0.150000006);
INSERT INTO order_details VALUES (17, 31.2000008, 30, 0);
INSERT INTO order_details VALUES (70, 12, 20, 0);
INSERT INTO order_details VALUES (12, 30.3999996, 12, 0.0500000007);
INSERT INTO order_details VALUES (40, 14.6999998, 50, 0);
INSERT INTO order_details VALUES (59, 44, 70, 0.150000006);
INSERT INTO order_details VALUES (76, 14.3999996, 15, 0.150000006);
INSERT INTO order_details VALUES (29, 99, 10, 0);
INSERT INTO order_details VALUES (72, 27.7999992, 4, 0);
INSERT INTO order_details VALUES (33, 2, 60, 0.0500000007);
INSERT INTO order_details VALUES (72, 27.7999992, 20, 0.0500000007);
INSERT INTO order_details VALUES (36, 15.1999998, 30, 0);
INSERT INTO order_details VALUES (43, 36.7999992, 25, 0);
INSERT INTO order_details VALUES (33, 2, 24, 0);
INSERT INTO order_details VALUES (20, 64.8000031, 6, 0);
INSERT INTO order_details VALUES (31, 10, 40, 0);
INSERT INTO order_details VALUES (72, 27.7999992, 24, 0);
INSERT INTO order_details VALUES (10, 24.7999992, 24, 0.0500000007);
INSERT INTO order_details VALUES (31, 10, 15, 0.0500000007);
INSERT INTO order_details VALUES (33, 2, 20, 0);
INSERT INTO order_details VALUES (40, 14.6999998, 60, 0.0500000007);
INSERT INTO order_details VALUES (76, 14.3999996, 33, 0.0500000007);
INSERT INTO order_details VALUES (71, 17.2000008, 20, 0);
INSERT INTO order_details VALUES (72, 27.7999992, 7, 0);
INSERT INTO order_details VALUES (24, 3.5999999, 12, 0.0500000007);
INSERT INTO order_details VALUES (59, 44, 6, 0.0500000007);
INSERT INTO order_details VALUES (10, 24.7999992, 15, 0);
INSERT INTO order_details VALUES (13, 4.80000019, 10, 0);
INSERT INTO order_details VALUES (28, 36.4000015, 20, 0);
INSERT INTO order_details VALUES (62, 39.4000015, 12, 0);
INSERT INTO order_details VALUES (44, 15.5, 16, 0);
INSERT INTO order_details VALUES (59, 44, 15, 0);
INSERT INTO order_details VALUES (63, 35.0999985, 8, 0);
INSERT INTO order_details VALUES (73, 12, 25, 0);
INSERT INTO order_details VALUES (17, 31.2000008, 15, 0.25);
INSERT INTO order_details VALUES (24, 3.5999999, 12, 0);
INSERT INTO order_details VALUES (55, 19.2000008, 20, 0);
INSERT INTO order_details VALUES (75, 6.19999981, 30, 0);
INSERT INTO order_details VALUES (19, 7.30000019, 1, 0);
INSERT INTO order_details VALUES (24, 3.5999999, 6, 0);
INSERT INTO order_details VALUES (35, 14.3999996, 4, 0);
INSERT INTO order_details VALUES (30, 20.7000008, 6, 0);
INSERT INTO order_details VALUES (57, 15.6000004, 2, 0);
INSERT INTO order_details VALUES (15, 12.3999996, 20, 0);
INSERT INTO order_details VALUES (19, 7.30000019, 18, 0);
INSERT INTO order_details VALUES (60, 27.2000008, 35, 0);
INSERT INTO order_details VALUES (72, 27.7999992, 3, 0);
INSERT INTO order_details VALUES (27, 35.0999985, 15, 0.25);
INSERT INTO order_details VALUES (44, 15.5, 21, 0);
INSERT INTO order_details VALUES (60, 27.2000008, 20, 0.25);
INSERT INTO order_details VALUES (67, 11.1999998, 5, 0.25);
INSERT INTO order_details VALUES (1, 14.3999996, 45, 0.200000003);
INSERT INTO order_details VALUES (40, 14.6999998, 40, 0.200000003);
INSERT INTO order_details VALUES (53, 26.2000008, 36, 0.200000003);
INSERT INTO order_details VALUES (35, 14.3999996, 100, 0);
INSERT INTO order_details VALUES (62, 39.4000015, 40, 0);
INSERT INTO order_details VALUES (16, 13.8999996, 40, 0.150000006);
INSERT INTO order_details VALUES (34, 11.1999998, 20, 0);
INSERT INTO order_details VALUES (46, 9.60000038, 15, 0.150000006);
INSERT INTO order_details VALUES (54, 5.9000001, 10, 0.100000001);
INSERT INTO order_details VALUES (68, 10, 3, 0.100000001);
INSERT INTO order_details VALUES (3, 8, 30, 0);
INSERT INTO order_details VALUES (64, 26.6000004, 9, 0);
INSERT INTO order_details VALUES (5, 17, 20, 0);
INSERT INTO order_details VALUES (29, 99, 15, 0);
INSERT INTO order_details VALUES (49, 16, 15, 0);
INSERT INTO order_details VALUES (77, 10.3999996, 10, 0);
INSERT INTO order_details VALUES (13, 4.80000019, 20, 0.100000001);
INSERT INTO order_details VALUES (44, 15.5, 24, 0.100000001);
INSERT INTO order_details VALUES (51, 42.4000015, 2, 0.100000001);
INSERT INTO order_details VALUES (20, 64.8000031, 20, 0);
INSERT INTO order_details VALUES (18, 50, 12, 0);
INSERT INTO order_details VALUES (24, 3.5999999, 10, 0);
INSERT INTO order_details VALUES (63, 35.0999985, 5, 0);
INSERT INTO order_details VALUES (75, 6.19999981, 6, 0);
INSERT INTO order_details VALUES (1, 14.3999996, 18, 0);
INSERT INTO order_details VALUES (17, 31.2000008, 15, 0);
INSERT INTO order_details VALUES (43, 36.7999992, 15, 0);
INSERT INTO order_details VALUES (60, 27.2000008, 21, 0);
INSERT INTO order_details VALUES (75, 6.19999981, 6, 0);
INSERT INTO order_details VALUES (56, 30.3999996, 4, 0);
INSERT INTO order_details VALUES (11, 16.7999992, 12, 0);
INSERT INTO order_details VALUES (16, 13.8999996, 30, 0);
INSERT INTO order_details VALUES (69, 28.7999992, 15, 0);
INSERT INTO order_details VALUES (39, 14.3999996, 60, 0);
INSERT INTO order_details VALUES (72, 27.7999992, 20, 0);
INSERT INTO order_details VALUES (2, 15.1999998, 40, 0);
INSERT INTO order_details VALUES (36, 15.1999998, 40, 0.25);
INSERT INTO order_details VALUES (59, 44, 30, 0.25);
INSERT INTO order_details VALUES (62, 39.4000015, 15, 0);
INSERT INTO order_details VALUES (19, 7.30000019, 15, 0);
INSERT INTO order_details VALUES (70, 12, 20, 0);
INSERT INTO order_details VALUES (66, 13.6000004, 30, 0);
INSERT INTO order_details VALUES (68, 10, 20, 0);
INSERT INTO order_details VALUES (40, 14.6999998, 10, 0);
INSERT INTO order_details VALUES (56, 30.3999996, 20, 0);
INSERT INTO order_details VALUES (17, 31.2000008, 40, 0);
INSERT INTO order_details VALUES (28, 36.4000015, 28, 0);
INSERT INTO order_details VALUES (43, 36.7999992, 12, 0);
INSERT INTO order_details VALUES (40, 14.6999998, 40, 0.100000001);
INSERT INTO order_details VALUES (65, 16.7999992, 30, 0.100000001);
INSERT INTO order_details VALUES (68, 10, 15, 0.100000001);
INSERT INTO order_details VALUES (49, 16, 30, 0);
INSERT INTO order_details VALUES (59, 44, 10, 0);
INSERT INTO order_details VALUES (71, 17.2000008, 2, 0);
INSERT INTO order_details VALUES (18, 50, 25, 0.100000001);
INSERT INTO order_details VALUES (29, 99, 25, 0.100000001);
INSERT INTO order_details VALUES (39, 14.3999996, 30, 0.100000001);
INSERT INTO order_details VALUES (30, 20.7000008, 10, 0);
INSERT INTO order_details VALUES (53, 26.2000008, 10, 0);
INSERT INTO order_details VALUES (54, 5.9000001, 5, 0);
INSERT INTO order_details VALUES (62, 39.4000015, 10, 0);
INSERT INTO order_details VALUES (68, 10, 3, 0);
INSERT INTO order_details VALUES (69, 28.7999992, 1, 0);
INSERT INTO order_details VALUES (70, 12, 5, 0);
INSERT INTO order_details VALUES (4, 17.6000004, 20, 0);
INSERT INTO order_details VALUES (6, 20, 30, 0);
INSERT INTO order_details VALUES (42, 11.1999998, 2, 0);
INSERT INTO order_details VALUES (43, 36.7999992, 20, 0);
INSERT INTO order_details VALUES (71, 17.2000008, 3, 0);
INSERT INTO order_details VALUES (16, 13.8999996, 10, 0);
INSERT INTO order_details VALUES (62, 39.4000015, 5, 0);
INSERT INTO order_details VALUES (42, 11.1999998, 6, 0);
INSERT INTO order_details VALUES (69, 28.7999992, 7, 0);
INSERT INTO order_details VALUES (28, 36.4000015, 4, 0);
INSERT INTO order_details VALUES (43, 36.7999992, 24, 0);
INSERT INTO order_details VALUES (53, 26.2000008, 20, 0);
INSERT INTO order_details VALUES (75, 6.19999981, 10, 0);
INSERT INTO order_details VALUES (36, 15.1999998, 12, 0);
INSERT INTO order_details VALUES (32, 25.6000004, 40, 0.100000001);
INSERT INTO order_details VALUES (58, 10.6000004, 30, 0.100000001);
INSERT INTO order_details VALUES (62, 39.4000015, 25, 0.100000001);
INSERT INTO order_details VALUES (34, 11.1999998, 14, 0);
INSERT INTO order_details VALUES (70, 12, 30, 0);
INSERT INTO order_details VALUES (41, 7.69999981, 10, 0);
INSERT INTO order_details VALUES (62, 39.4000015, 70, 0);
INSERT INTO order_details VALUES (1, 14.3999996, 20, 0);
INSERT INTO order_details VALUES (41, 7.69999981, 20, 0);
INSERT INTO order_details VALUES (76, 14.3999996, 6, 0);
INSERT INTO order_details VALUES (17, 31.2000008, 8, 0);
INSERT INTO order_details VALUES (28, 36.4000015, 14, 0);
INSERT INTO order_details VALUES (76, 14.3999996, 30, 0);
INSERT INTO order_details VALUES (71, 17.2000008, 30, 0);
INSERT INTO order_details VALUES (35, 14.3999996, 10, 0);
INSERT INTO order_details VALUES (52, 5.5999999, 20, 0);
INSERT INTO order_details VALUES (15, 12.3999996, 5, 0);
INSERT INTO order_details VALUES (25, 11.1999998, 4, 0);
INSERT INTO order_details VALUES (39, 14.3999996, 4, 0);
INSERT INTO order_details VALUES (16, 13.8999996, 21, 0.150000006);
INSERT INTO order_details VALUES (35, 14.3999996, 70, 0.150000006);
INSERT INTO order_details VALUES (46, 9.60000038, 30, 0);
INSERT INTO order_details VALUES (59, 44, 40, 0.150000006);
INSERT INTO order_details VALUES (63, 35.0999985, 80, 0.150000006);
INSERT INTO order_details VALUES (6, 20, 6, 0);
INSERT INTO order_details VALUES (13, 4.80000019, 12, 0);
INSERT INTO order_details VALUES (14, 18.6000004, 9, 0);
INSERT INTO order_details VALUES (31, 10, 4, 0);
INSERT INTO order_details VALUES (72, 27.7999992, 40, 0);
INSERT INTO order_details VALUES (4, 17.6000004, 24, 0);
INSERT INTO order_details VALUES (57, 15.6000004, 16, 0);
INSERT INTO order_details VALUES (75, 6.19999981, 50, 0);
INSERT INTO order_details VALUES (2, 15.1999998, 25, 0.200000003);
INSERT INTO order_details VALUES (11, 16.7999992, 50, 0.200000003);
INSERT INTO order_details VALUES (30, 20.7000008, 35, 0.200000003);
INSERT INTO order_details VALUES (58, 10.6000004, 30, 0.200000003);
INSERT INTO order_details VALUES (59, 44, 9, 0);
INSERT INTO order_details VALUES (65, 16.7999992, 40, 0);
INSERT INTO order_details VALUES (68, 10, 10, 0);
INSERT INTO order_details VALUES (19, 7.30000019, 10, 0.0500000007);
INSERT INTO order_details VALUES (30, 20.7000008, 8, 0.0500000007);
INSERT INTO order_details VALUES (38, 210.800003, 20, 0.0500000007);
INSERT INTO order_details VALUES (56, 30.3999996, 12, 0.0500000007);
INSERT INTO order_details VALUES (26, 24.8999996, 50, 0.150000006);
INSERT INTO order_details VALUES (72, 27.7999992, 25, 0.150000006);
INSERT INTO order_details VALUES (54, 5.9000001, 15, 0);
INSERT INTO order_details VALUES (18, 50, 40, 0.200000003);
INSERT INTO order_details VALUES (42, 11.1999998, 10, 0.200000003);
INSERT INTO order_details VALUES (47, 7.5999999, 16, 0.200000003);
INSERT INTO order_details VALUES (14, 18.6000004, 10, 0);
INSERT INTO order_details VALUES (21, 8, 10, 0.100000001);
INSERT INTO order_details VALUES (71, 17.2000008, 40, 0.100000001);
INSERT INTO order_details VALUES (52, 5.5999999, 8, 0);
INSERT INTO order_details VALUES (68, 10, 10, 0);
INSERT INTO order_details VALUES (2, 15.1999998, 7, 0.200000003);
INSERT INTO order_details VALUES (31, 10, 25, 0.200000003);
INSERT INTO order_details VALUES (32, 25.6000004, 6, 0.200000003);
INSERT INTO order_details VALUES (51, 42.4000015, 48, 0.200000003);
INSERT INTO order_details VALUES (4, 17.6000004, 18, 0.100000001);
INSERT INTO order_details VALUES (23, 7.19999981, 40, 0);
INSERT INTO order_details VALUES (26, 24.8999996, 24, 0);
INSERT INTO order_details VALUES (36, 15.1999998, 20, 0);
INSERT INTO order_details VALUES (37, 20.7999992, 28, 0);
INSERT INTO order_details VALUES (72, 27.7999992, 25, 0);
INSERT INTO order_details VALUES (17, 31.2000008, 20, 0);
INSERT INTO order_details VALUES (30, 20.7000008, 15, 0);
INSERT INTO order_details VALUES (4, 17.6000004, 10, 0);
INSERT INTO order_details VALUES (17, 31.2000008, 70, 0.0500000007);
INSERT INTO order_details VALUES (62, 39.4000015, 28, 0);
INSERT INTO order_details VALUES (18, 50, 20, 0.0500000007);
INSERT INTO order_details VALUES (41, 7.69999981, 12, 0.0500000007);
INSERT INTO order_details VALUES (43, 36.7999992, 40, 0.0500000007);
INSERT INTO order_details VALUES (33, 2, 8, 0);
INSERT INTO order_details VALUES (59, 44, 9, 0.150000006);
INSERT INTO order_details VALUES (2, 15.1999998, 24, 0.200000003);
INSERT INTO order_details VALUES (31, 10, 56, 0.200000003);
INSERT INTO order_details VALUES (36, 15.1999998, 40, 0.200000003);
INSERT INTO order_details VALUES (55, 19.2000008, 40, 0.200000003);
INSERT INTO order_details VALUES (64, 26.6000004, 50, 0);
INSERT INTO order_details VALUES (68, 10, 4, 0.0500000007);
INSERT INTO order_details VALUES (76, 14.3999996, 15, 0);
INSERT INTO order_details VALUES (4, 17.6000004, 35, 0);
INSERT INTO order_details VALUES (8, 32, 70, 0.25);
INSERT INTO order_details VALUES (8, 32, 70, 0);
INSERT INTO order_details VALUES (19, 7.30000019, 80, 0);
INSERT INTO order_details VALUES (42, 11.1999998, 9, 0);
INSERT INTO order_details VALUES (17, 31.2000008, 36, 0.100000001);
INSERT INTO order_details VALUES (56, 30.3999996, 20, 0);
INSERT INTO order_details VALUES (25, 11.1999998, 10, 0);
INSERT INTO order_details VALUES (39, 14.3999996, 50, 0.150000006);
INSERT INTO order_details VALUES (40, 14.6999998, 4, 0);
INSERT INTO order_details VALUES (75, 6.19999981, 6, 0.150000006);
INSERT INTO order_details VALUES (1, 14.3999996, 15, 0.150000006);
INSERT INTO order_details VALUES (23, 7.19999981, 25, 0);
INSERT INTO order_details VALUES (54, 5.9000001, 24, 0);
INSERT INTO order_details VALUES (50, 13, 15, 0.100000001);
INSERT INTO order_details VALUES (69, 28.7999992, 18, 0.100000001);
INSERT INTO order_details VALUES (38, 210.800003, 20, 0.0500000007);
INSERT INTO order_details VALUES (41, 7.69999981, 13, 0);
INSERT INTO order_details VALUES (44, 15.5, 77, 0.0500000007);
INSERT INTO order_details VALUES (65, 16.7999992, 10, 0.0500000007);
INSERT INTO order_details VALUES (24, 3.5999999, 10, 0);
INSERT INTO order_details VALUES (54, 5.9000001, 20, 0.150000006);
INSERT INTO order_details VALUES (11, 16.7999992, 12, 0.200000003);
INSERT INTO order_details VALUES (38, 210.800003, 50, 0.200000003);
INSERT INTO order_details VALUES (1, 14.3999996, 12, 0);
INSERT INTO order_details VALUES (29, 99, 4, 0);
INSERT INTO order_details VALUES (24, 3.5999999, 25, 0);
INSERT INTO order_details VALUES (57, 15.6000004, 25, 0);
INSERT INTO order_details VALUES (31, 10, 30, 0);
INSERT INTO order_details VALUES (55, 19.2000008, 12, 0);
INSERT INTO order_details VALUES (69, 28.7999992, 20, 0);
INSERT INTO order_details VALUES (10, 24.7999992, 30, 0.200000003);
INSERT INTO order_details VALUES (26, 24.8999996, 16, 0);
INSERT INTO order_details VALUES (60, 27.2000008, 8, 0.200000003);
INSERT INTO order_details VALUES (24, 3.5999999, 10, 0.0500000007);
INSERT INTO order_details VALUES (34, 11.1999998, 10, 0.0500000007);
INSERT INTO order_details VALUES (36, 15.1999998, 20, 0.0500000007);
INSERT INTO order_details VALUES (16, 13.8999996, 56, 0.0500000007);
INSERT INTO order_details VALUES (31, 10, 70, 0.0500000007);
INSERT INTO order_details VALUES (60, 27.2000008, 80, 0.0500000007);
INSERT INTO order_details VALUES (28, 36.4000015, 30, 0);
INSERT INTO order_details VALUES (29, 99, 35, 0);
INSERT INTO order_details VALUES (38, 210.800003, 10, 0);
INSERT INTO order_details VALUES (49, 16, 35, 0);
INSERT INTO order_details VALUES (54, 5.9000001, 28, 0);
INSERT INTO order_details VALUES (39, 14.3999996, 54, 0.100000001);
INSERT INTO order_details VALUES (60, 27.2000008, 55, 0.100000001);
INSERT INTO order_details VALUES (25, 11.1999998, 50, 0);
INSERT INTO order_details VALUES (51, 42.4000015, 20, 0);
INSERT INTO order_details VALUES (54, 5.9000001, 24, 0);
INSERT INTO order_details VALUES (31, 10, 20, 0);
INSERT INTO order_details VALUES (75, 6.19999981, 12, 0);
INSERT INTO order_details VALUES (76, 14.3999996, 12, 0);
INSERT INTO order_details VALUES (69, 28.7999992, 30, 0);
INSERT INTO order_details VALUES (71, 17.2000008, 5, 0);
INSERT INTO order_details VALUES (11, 16.7999992, 24, 0);
INSERT INTO order_details VALUES (65, 16.7999992, 5, 0);
INSERT INTO order_details VALUES (77, 10.3999996, 5, 0);
INSERT INTO order_details VALUES (34, 11.1999998, 36, 0);
INSERT INTO order_details VALUES (54, 5.9000001, 18, 0);
INSERT INTO order_details VALUES (65, 16.7999992, 15, 0);
INSERT INTO order_details VALUES (77, 10.3999996, 7, 0);
INSERT INTO order_details VALUES (21, 8, 5, 0.100000001);
INSERT INTO order_details VALUES (28, 36.4000015, 13, 0.100000001);
INSERT INTO order_details VALUES (57, 15.6000004, 25, 0);
INSERT INTO order_details VALUES (64, 26.6000004, 35, 0.100000001);
INSERT INTO order_details VALUES (29, 99, 20, 0);
INSERT INTO order_details VALUES (56, 30.3999996, 18, 0.25);
INSERT INTO order_details VALUES (1, 14.3999996, 15, 0.150000006);
INSERT INTO order_details VALUES (64, 26.6000004, 30, 0);
INSERT INTO order_details VALUES (74, 8, 20, 0.150000006);
INSERT INTO order_details VALUES (36, 15.1999998, 6, 0.200000003);
INSERT INTO order_details VALUES (20, 64.8000031, 12, 0.25);
INSERT INTO order_details VALUES (38, 210.800003, 40, 0.25);
INSERT INTO order_details VALUES (60, 27.2000008, 70, 0.25);
INSERT INTO order_details VALUES (72, 27.7999992, 42, 0.25);
INSERT INTO order_details VALUES (58, 10.6000004, 80, 0.200000003);
INSERT INTO order_details VALUES (71, 17.2000008, 50, 0.200000003);
INSERT INTO order_details VALUES (31, 10, 30, 0);
INSERT INTO order_details VALUES (58, 10.6000004, 15, 0);
INSERT INTO order_details VALUES (14, 18.6000004, 15, 0);
INSERT INTO order_details VALUES (54, 5.9000001, 10, 0);
INSERT INTO order_details VALUES (31, 10, 42, 0.0500000007);
INSERT INTO order_details VALUES (28, 36.4000015, 20, 0.150000006);
INSERT INTO order_details VALUES (39, 14.3999996, 20, 0.150000006);
INSERT INTO order_details VALUES (71, 17.2000008, 6, 0);
INSERT INTO order_details VALUES (41, 7.69999981, 8, 0.100000001);
INSERT INTO order_details VALUES (63, 35.0999985, 16, 0.100000001);
INSERT INTO order_details VALUES (65, 16.7999992, 20, 0.100000001);
INSERT INTO order_details VALUES (30, 20.7000008, 18, 0.100000001);
INSERT INTO order_details VALUES (53, 26.2000008, 20, 0.100000001);
INSERT INTO order_details VALUES (60, 27.2000008, 6, 0.100000001);
INSERT INTO order_details VALUES (70, 12, 30, 0);
INSERT INTO order_details VALUES (74, 8, 14, 0);
INSERT INTO order_details VALUES (5, 17, 32, 0);
INSERT INTO order_details VALUES (18, 50, 9, 0);
INSERT INTO order_details VALUES (29, 99, 14, 0);
INSERT INTO order_details VALUES (33, 2, 60, 0);
INSERT INTO order_details VALUES (74, 8, 50, 0);
INSERT INTO order_details VALUES (13, 4.80000019, 20, 0);
INSERT INTO order_details VALUES (50, 13, 15, 0);
INSERT INTO order_details VALUES (56, 30.3999996, 20, 0);
INSERT INTO order_details VALUES (20, 64.8000031, 28, 0);
INSERT INTO order_details VALUES (60, 27.2000008, 15, 0);
INSERT INTO order_details VALUES (7, 24, 10, 0.200000003);
INSERT INTO order_details VALUES (60, 27.2000008, 20, 0.200000003);
INSERT INTO order_details VALUES (68, 10, 8, 0.200000003);
INSERT INTO order_details VALUES (24, 3.5999999, 15, 0);
INSERT INTO order_details VALUES (34, 11.1999998, 10, 0);
INSERT INTO order_details VALUES (24, 3.5999999, 15, 0);
INSERT INTO order_details VALUES (28, 36.4000015, 6, 0);
INSERT INTO order_details VALUES (59, 44, 12, 0);
INSERT INTO order_details VALUES (71, 17.2000008, 15, 0);
INSERT INTO order_details VALUES (45, 7.5999999, 15, 0.200000003);
INSERT INTO order_details VALUES (52, 5.5999999, 20, 0.200000003);
INSERT INTO order_details VALUES (53, 26.2000008, 40, 0);
INSERT INTO order_details VALUES (10, 24.7999992, 16, 0);
INSERT INTO order_details VALUES (55, 19.2000008, 15, 0);
INSERT INTO order_details VALUES (62, 39.4000015, 20, 0);
INSERT INTO order_details VALUES (70, 12, 30, 0);
INSERT INTO order_details VALUES (31, 10, 60, 0.100000001);
INSERT INTO order_details VALUES (35, 14.3999996, 40, 0.100000001);
INSERT INTO order_details VALUES (46, 9.60000038, 45, 0);
INSERT INTO order_details VALUES (72, 27.7999992, 24, 0.100000001);
INSERT INTO order_details VALUES (13, 4.80000019, 18, 0);
INSERT INTO order_details VALUES (69, 28.7999992, 50, 0);
INSERT INTO order_details VALUES (2, 15.1999998, 25, 0.25);
INSERT INTO order_details VALUES (14, 18.6000004, 42, 0.25);
INSERT INTO order_details VALUES (25, 11.1999998, 7, 0.25);
INSERT INTO order_details VALUES (26, 24.8999996, 70, 0.25);
INSERT INTO order_details VALUES (31, 10, 32, 0);
INSERT INTO order_details VALUES (13, 4.80000019, 10, 0);
INSERT INTO order_details VALUES (62, 39.4000015, 10, 0);
INSERT INTO order_details VALUES (46, 9.60000038, 28, 0.100000001);
INSERT INTO order_details VALUES (53, 26.2000008, 70, 0.100000001);
INSERT INTO order_details VALUES (69, 28.7999992, 8, 0);
INSERT INTO order_details VALUES (23, 7.19999981, 40, 0);
INSERT INTO order_details VALUES (71, 17.2000008, 60, 0);
INSERT INTO order_details VALUES (72, 27.7999992, 21, 0);
INSERT INTO order_details VALUES (21, 8, 10, 0.150000006);
INSERT INTO order_details VALUES (51, 42.4000015, 18, 0.150000006);
INSERT INTO order_details VALUES (35, 14.3999996, 30, 0);
INSERT INTO order_details VALUES (55, 19.2000008, 120, 0.100000001);
INSERT INTO order_details VALUES (68, 10, 60, 0);
INSERT INTO order_details VALUES (71, 17.2000008, 30, 0);
INSERT INTO order_details VALUES (76, 14.3999996, 35, 0);
INSERT INTO order_details VALUES (77, 10.3999996, 14, 0);
INSERT INTO order_details VALUES (29, 99, 21, 0);
INSERT INTO order_details VALUES (35, 14.3999996, 35, 0);
INSERT INTO order_details VALUES (49, 16, 30, 0);
INSERT INTO order_details VALUES (30, 20.7000008, 18, 0);
INSERT INTO order_details VALUES (56, 30.3999996, 70, 0);
INSERT INTO order_details VALUES (65, 16.7999992, 20, 0);
INSERT INTO order_details VALUES (71, 17.2000008, 60, 0);
INSERT INTO order_details VALUES (23, 7.19999981, 60, 0);
INSERT INTO order_details VALUES (63, 35.0999985, 65, 0);
INSERT INTO order_details VALUES (16, 13.8999996, 21, 0.150000006);
INSERT INTO order_details VALUES (48, 10.1999998, 70, 0.150000006);
INSERT INTO order_details VALUES (26, 24.8999996, 30, 0.0500000007);
INSERT INTO order_details VALUES (42, 11.1999998, 40, 0.0500000007);
INSERT INTO order_details VALUES (49, 16, 30, 0.0500000007);
INSERT INTO order_details VALUES (3, 8, 50, 0);
INSERT INTO order_details VALUES (1, 14.3999996, 10, 0);
INSERT INTO order_details VALUES (21, 8, 30, 0.100000001);
INSERT INTO order_details VALUES (28, 36.4000015, 42, 0.100000001);
INSERT INTO order_details VALUES (36, 15.1999998, 5, 0.100000001);
INSERT INTO order_details VALUES (40, 14.6999998, 2, 0.100000001);
INSERT INTO order_details VALUES (11, 16.7999992, 30, 0);
INSERT INTO order_details VALUES (69, 28.7999992, 15, 0);
INSERT INTO order_details VALUES (71, 17.2000008, 15, 0);
INSERT INTO order_details VALUES (37, 20.7999992, 10, 0);
INSERT INTO order_details VALUES (54, 5.9000001, 6, 0);
INSERT INTO order_details VALUES (62, 39.4000015, 35, 0);
INSERT INTO order_details VALUES (14, 18.6000004, 12, 0);
INSERT INTO order_details VALUES (21, 8, 12, 0);
INSERT INTO order_details VALUES (33, 2, 49, 0);
INSERT INTO order_details VALUES (59, 44, 16, 0);
INSERT INTO order_details VALUES (41, 7.69999981, 25, 0.200000003);
INSERT INTO order_details VALUES (44, 15.5, 40, 0.200000003);
INSERT INTO order_details VALUES (59, 44, 9, 0.200000003);
INSERT INTO order_details VALUES (14, 18.6000004, 20, 0.100000001);
INSERT INTO order_details VALUES (1, 14.3999996, 24, 0);
INSERT INTO order_details VALUES (62, 39.4000015, 40, 0);
INSERT INTO order_details VALUES (76, 14.3999996, 14, 0);
INSERT INTO order_details VALUES (19, 7.30000019, 18, 0.0500000007);
INSERT INTO order_details VALUES (33, 2, 50, 0);
INSERT INTO order_details VALUES (17, 31.2000008, 2, 0);
INSERT INTO order_details VALUES (33, 2, 20, 0);
INSERT INTO order_details VALUES (19, 7.30000019, 20, 0);
INSERT INTO order_details VALUES (53, 26.2000008, 10, 0);
INSERT INTO order_details VALUES (57, 15.6000004, 20, 0);
INSERT INTO order_details VALUES (38, 210.800003, 50, 0);
INSERT INTO order_details VALUES (46, 9.60000038, 2, 0.25);
INSERT INTO order_details VALUES (68, 10, 36, 0.25);
INSERT INTO order_details VALUES (77, 10.3999996, 35, 0);
INSERT INTO order_details VALUES (2, 15.1999998, 60, 0);
INSERT INTO order_details VALUES (47, 7.5999999, 55, 0);
INSERT INTO order_details VALUES (61, 22.7999992, 16, 0);
INSERT INTO order_details VALUES (74, 8, 15, 0);
INSERT INTO order_details VALUES (60, 27.2000008, 60, 0.0500000007);
INSERT INTO order_details VALUES (69, 28.7999992, 20, 0.0500000007);
INSERT INTO order_details VALUES (9, 77.5999985, 20, 0.100000001);
INSERT INTO order_details VALUES (13, 4.80000019, 2, 0.100000001);
INSERT INTO order_details VALUES (70, 12, 8, 0.100000001);
INSERT INTO order_details VALUES (73, 12, 20, 0.100000001);
INSERT INTO order_details VALUES (19, 7.30000019, 4, 0.150000006);
INSERT INTO order_details VALUES (26, 24.8999996, 30, 0);
INSERT INTO order_details VALUES (53, 26.2000008, 15, 0.150000006);
INSERT INTO order_details VALUES (77, 10.3999996, 10, 0.150000006);
INSERT INTO order_details VALUES (26, 24.8999996, 2, 0);
INSERT INTO order_details VALUES (31, 10, 14, 0);
INSERT INTO order_details VALUES (59, 44, 20, 0);
INSERT INTO order_details VALUES (35, 14.3999996, 60, 0.200000003);
INSERT INTO order_details VALUES (38, 210.800003, 49, 0.200000003);
INSERT INTO order_details VALUES (68, 10, 30, 0.200000003);
INSERT INTO order_details VALUES (55, 19.2000008, 10, 0.25);
INSERT INTO order_details VALUES (76, 14.3999996, 20, 0.25);
INSERT INTO order_details VALUES (56, 30.3999996, 5, 0);
INSERT INTO order_details VALUES (64, 26.6000004, 7, 0);
INSERT INTO order_details VALUES (14, 18.6000004, 35, 0);
INSERT INTO order_details VALUES (46, 9.60000038, 20, 0);
INSERT INTO order_details VALUES (50, 13, 40, 0);
INSERT INTO order_details VALUES (63, 35.0999985, 35, 0.25);
INSERT INTO order_details VALUES (17, 31.2000008, 45, 0.200000003);
INSERT INTO order_details VALUES (21, 8, 50, 0);
INSERT INTO order_details VALUES (56, 30.3999996, 30, 0);
INSERT INTO order_details VALUES (59, 44, 70, 0.200000003);
INSERT INTO order_details VALUES (17, 31.2000008, 50, 0.25);
INSERT INTO order_details VALUES (40, 14.6999998, 50, 0.25);
INSERT INTO order_details VALUES (47, 7.5999999, 30, 0.25);
INSERT INTO order_details VALUES (26, 24.8999996, 10, 0);
INSERT INTO order_details VALUES (54, 5.9000001, 40, 0);
INSERT INTO order_details VALUES (56, 30.3999996, 28, 0);
INSERT INTO order_details VALUES (11, 16.7999992, 6, 0);
INSERT INTO order_details VALUES (76, 14.3999996, 18, 0.150000006);
INSERT INTO order_details VALUES (2, 15.1999998, 10, 0);
INSERT INTO order_details VALUES (22, 16.7999992, 12, 0);
INSERT INTO order_details VALUES (72, 27.7999992, 10, 0);
INSERT INTO order_details VALUES (46, 9.60000038, 5, 0);
INSERT INTO order_details VALUES (56, 30.3999996, 40, 0.100000001);
INSERT INTO order_details VALUES (64, 26.6000004, 30, 0.100000001);
INSERT INTO order_details VALUES (75, 6.19999981, 24, 0.100000001);
INSERT INTO order_details VALUES (53, 26.2000008, 15, 0);
INSERT INTO order_details VALUES (19, 7.30000019, 15, 0.200000003);
INSERT INTO order_details VALUES (34, 11.1999998, 20, 0.200000003);
INSERT INTO order_details VALUES (57, 15.6000004, 15, 0.200000003);
INSERT INTO order_details VALUES (12, 30.3999996, 15, 0);
INSERT INTO order_details VALUES (16, 13.8999996, 16, 0);
INSERT INTO order_details VALUES (64, 26.6000004, 6, 0);
INSERT INTO order_details VALUES (74, 8, 30, 0);
INSERT INTO order_details VALUES (2, 15.1999998, 45, 0.150000006);
INSERT INTO order_details VALUES (16, 13.8999996, 49, 0.150000006);
INSERT INTO order_details VALUES (29, 99, 24, 0.150000006);
INSERT INTO order_details VALUES (61, 22.7999992, 90, 0.150000006);
INSERT INTO order_details VALUES (27, 35.0999985, 50, 0);
INSERT INTO order_details VALUES (11, 16.7999992, 30, 0);
INSERT INTO order_details VALUES (54, 5.9000001, 80, 0);
INSERT INTO order_details VALUES (66, 13.6000004, 60, 0);
INSERT INTO order_details VALUES (11, 16.7999992, 6, 0.200000003);
INSERT INTO order_details VALUES (28, 36.4000015, 12, 0);
INSERT INTO order_details VALUES (17, 31.2000008, 10, 0);
INSERT INTO order_details VALUES (26, 24.8999996, 15, 0);
INSERT INTO order_details VALUES (35, 14.3999996, 8, 0);
INSERT INTO order_details VALUES (41, 7.69999981, 30, 0);
INSERT INTO order_details VALUES (39, 14.3999996, 6, 0);
INSERT INTO order_details VALUES (54, 5.9000001, 15, 0);
INSERT INTO order_details VALUES (19, 7.30000019, 12, 0.100000001);
INSERT INTO order_details VALUES (24, 3.5999999, 20, 0.100000001);
INSERT INTO order_details VALUES (31, 10, 3, 0.100000001);
INSERT INTO order_details VALUES (52, 5.5999999, 15, 0.100000001);
INSERT INTO order_details VALUES (19, 7.30000019, 40, 0);
INSERT INTO order_details VALUES (65, 16.7999992, 35, 0);
INSERT INTO order_details VALUES (71, 17.2000008, 2, 0);
INSERT INTO order_details VALUES (26, 24.8999996, 6, 0);
INSERT INTO order_details VALUES (40, 14.6999998, 20, 0);
INSERT INTO order_details VALUES (10, 24.7999992, 14, 0);
INSERT INTO order_details VALUES (52, 5.5999999, 20, 0);
INSERT INTO order_details VALUES (62, 39.4000015, 35, 0);
INSERT INTO order_details VALUES (10, 24.7999992, 20, 0.200000003);
INSERT INTO order_details VALUES (54, 5.9000001, 6, 0.200000003);
INSERT INTO order_details VALUES (55, 19.2000008, 120, 0.100000001);
INSERT INTO order_details VALUES (64, 26.6000004, 35, 0.100000001);
INSERT INTO order_details VALUES (65, 16.7999992, 28, 0.100000001);
INSERT INTO order_details VALUES (77, 10.3999996, 55, 0.100000001);
INSERT INTO order_details VALUES (28, 36.4000015, 15, 0);
INSERT INTO order_details VALUES (44, 15.5, 100, 0.0500000007);
INSERT INTO order_details VALUES (48, 10.1999998, 15, 0.100000001);
INSERT INTO order_details VALUES (70, 12, 25, 0.100000001);
INSERT INTO order_details VALUES (16, 13.8999996, 20, 0.200000003);
INSERT INTO order_details VALUES (33, 2, 20, 0.200000003);
INSERT INTO order_details VALUES (46, 9.60000038, 10, 0.200000003);
INSERT INTO order_details VALUES (39, 14.3999996, 20, 0);
INSERT INTO order_details VALUES (53, 26.2000008, 50, 0);
INSERT INTO order_details VALUES (61, 22.7999992, 25, 0);
INSERT INTO order_details VALUES (71, 17.2000008, 30, 0);
INSERT INTO order_details VALUES (21, 8, 40, 0.150000006);
INSERT INTO order_details VALUES (49, 16, 21, 0.150000006);
INSERT INTO order_details VALUES (59, 44, 36, 0);
INSERT INTO order_details VALUES (26, 24.8999996, 30, 0);
INSERT INTO order_details VALUES (28, 36.4000015, 30, 0);
INSERT INTO order_details VALUES (43, 36.7999992, 20, 0);
INSERT INTO order_details VALUES (56, 30.3999996, 15, 0);
INSERT INTO order_details VALUES (71, 17.2000008, 50, 0);
INSERT INTO order_details VALUES (7, 24, 16, 0.0500000007);
INSERT INTO order_details VALUES (46, 9.60000038, 20, 0.0500000007);
INSERT INTO order_details VALUES (72, 27.7999992, 40, 0);
INSERT INTO order_details VALUES (68, 10, 21, 0.25);
INSERT INTO order_details VALUES (75, 6.19999981, 4, 0.25);
INSERT INTO order_details VALUES (21, 8, 40, 0.25);
INSERT INTO order_details VALUES (30, 20.7000008, 28, 0.25);
INSERT INTO order_details VALUES (55, 19.2000008, 60, 0.25);
INSERT INTO order_details VALUES (13, 4.80000019, 1, 0);
INSERT INTO order_details VALUES (23, 7.19999981, 21, 0);
INSERT INTO order_details VALUES (19, 7.30000019, 21, 0);
INSERT INTO order_details VALUES (42, 11.1999998, 50, 0);
INSERT INTO order_details VALUES (4, 17.6000004, 16, 0.200000003);
INSERT INTO order_details VALUES (43, 36.7999992, 3, 0);
INSERT INTO order_details VALUES (56, 30.3999996, 30, 0.200000003);
INSERT INTO order_details VALUES (60, 27.2000008, 20, 0);
INSERT INTO order_details VALUES (24, 3.5999999, 25, 0);
INSERT INTO order_details VALUES (29, 99, 18, 0.100000001);
INSERT INTO order_details VALUES (40, 14.6999998, 20, 0);
INSERT INTO order_details VALUES (45, 7.5999999, 30, 0.100000001);
INSERT INTO order_details VALUES (50, 13, 25, 0);
INSERT INTO order_details VALUES (11, 16.7999992, 10, 0);
INSERT INTO order_details VALUES (46, 9.60000038, 5, 0);
INSERT INTO order_details VALUES (24, 3.5999999, 28, 0);
INSERT INTO order_details VALUES (25, 11.1999998, 12, 0);
INSERT INTO order_details VALUES (30, 20.7000008, 8, 0);
INSERT INTO order_details VALUES (43, 36.7999992, 15, 0);
INSERT INTO order_details VALUES (2, 15.1999998, 40, 0.150000006);
INSERT INTO order_details VALUES (16, 13.8999996, 35, 0.150000006);
INSERT INTO order_details VALUES (44, 15.5, 2, 0.150000006);
INSERT INTO order_details VALUES (18, 50, 30, 0);
INSERT INTO order_details VALUES (23, 7.19999981, 15, 0);
INSERT INTO order_details VALUES (64, 26.6000004, 8, 0);
INSERT INTO order_details VALUES (7, 24, 30, 0);
INSERT INTO order_details VALUES (56, 30.3999996, 20, 0);
INSERT INTO order_details VALUES (24, 3.5999999, 80, 0.0500000007);
INSERT INTO order_details VALUES (51, 42.4000015, 18, 0);
INSERT INTO order_details VALUES (33, 2, 12, 0);
INSERT INTO order_details VALUES (71, 17.2000008, 12, 0);
INSERT INTO order_details VALUES (14, 18.6000004, 12, 0);
INSERT INTO order_details VALUES (28, 36.4000015, 18, 0);
INSERT INTO order_details VALUES (40, 14.6999998, 21, 0);
INSERT INTO order_details VALUES (75, 6.19999981, 10, 0);
INSERT INTO order_details VALUES (31, 10, 35, 0.150000006);
INSERT INTO order_details VALUES (66, 13.6000004, 60, 0.150000006);
INSERT INTO order_details VALUES (76, 14.3999996, 42, 0.150000006);
INSERT INTO order_details VALUES (55, 19.2000008, 2, 0.0500000007);
INSERT INTO order_details VALUES (70, 12, 12, 0);
INSERT INTO order_details VALUES (1, 14.3999996, 15, 0);
INSERT INTO order_details VALUES (21, 8, 21, 0.25);
INSERT INTO order_details VALUES (39, 14.3999996, 20, 0.25);
INSERT INTO order_details VALUES (10, 24.7999992, 20, 0.0500000007);
INSERT INTO order_details VALUES (38, 210.800003, 30, 0);
INSERT INTO order_details VALUES (53, 26.2000008, 28, 0);
INSERT INTO order_details VALUES (59, 44, 60, 0);
INSERT INTO order_details VALUES (64, 26.6000004, 30, 0);
INSERT INTO order_details VALUES (47, 7.5999999, 30, 0);
INSERT INTO order_details VALUES (59, 44, 12, 0);
INSERT INTO order_details VALUES (49, 16, 24, 0);
INSERT INTO order_details VALUES (60, 27.2000008, 40, 0);
INSERT INTO order_details VALUES (40, 14.6999998, 10, 0);
INSERT INTO order_details VALUES (34, 11.1999998, 35, 0.0500000007);
INSERT INTO order_details VALUES (77, 10.3999996, 30, 0.0500000007);
INSERT INTO order_details VALUES (21, 8, 14, 0);
INSERT INTO order_details VALUES (40, 14.6999998, 10, 0);
INSERT INTO order_details VALUES (51, 42.4000015, 3, 0);
INSERT INTO order_details VALUES (2, 15.1999998, 20, 0.100000001);
INSERT INTO order_details VALUES (3, 8, 20, 0.100000001);
INSERT INTO order_details VALUES (55, 19.2000008, 30, 0.100000001);
INSERT INTO order_details VALUES (70, 12, 60, 0.100000001);
INSERT INTO order_details VALUES (11, 16.7999992, 5, 0);
INSERT INTO order_details VALUES (51, 42.4000015, 25, 0);
INSERT INTO order_details VALUES (74, 8, 16, 0);
INSERT INTO order_details VALUES (19, 7.30000019, 5, 0);
INSERT INTO order_details VALUES (26, 24.8999996, 30, 0);
INSERT INTO order_details VALUES (54, 5.9000001, 24, 0.25);
INSERT INTO order_details VALUES (59, 44, 30, 0);
INSERT INTO order_details VALUES (73, 12, 20, 0.200000003);
INSERT INTO order_details VALUES (11, 16.7999992, 15, 0.25);
INSERT INTO order_details VALUES (16, 13.8999996, 18, 0);
INSERT INTO order_details VALUES (59, 44, 60, 0);
INSERT INTO order_details VALUES (68, 10, 30, 0);
INSERT INTO order_details VALUES (75, 6.19999981, 36, 0);
INSERT INTO order_details VALUES (44, 15.5, 15, 0.150000006);
INSERT INTO order_details VALUES (77, 10.3999996, 7, 0.150000006);
INSERT INTO order_details VALUES (25, 11.1999998, 60, 0.0500000007);
INSERT INTO order_details VALUES (42, 11.1999998, 20, 0.0500000007);
INSERT INTO order_details VALUES (65, 16.7999992, 15, 0.100000001);
INSERT INTO order_details VALUES (66, 13.6000004, 10, 0.100000001);
INSERT INTO order_details VALUES (69, 28.7999992, 10, 0.100000001);
INSERT INTO order_details VALUES (56, 30.3999996, 30, 0);
INSERT INTO order_details VALUES (23, 7.19999981, 10, 0);
INSERT INTO order_details VALUES (41, 7.69999981, 20, 0);
INSERT INTO order_details VALUES (77, 10.3999996, 5, 0);
INSERT INTO order_details VALUES (31, 10, 20, 0.0500000007);
INSERT INTO order_details VALUES (56, 30.3999996, 14, 0);
INSERT INTO order_details VALUES (72, 27.7999992, 25, 0);
INSERT INTO order_details VALUES (77, 10.3999996, 25, 0);
INSERT INTO order_details VALUES (24, 4.5, 14, 0);
INSERT INTO order_details VALUES (40, 18.3999996, 5, 0);
INSERT INTO order_details VALUES (42, 14, 30, 0);
INSERT INTO order_details VALUES (28, 45.5999985, 20, 0);
INSERT INTO order_details VALUES (49, 20, 25, 0);
INSERT INTO order_details VALUES (15, 15.5, 12, 0.0500000007);
INSERT INTO order_details VALUES (28, 45.5999985, 8, 0.0500000007);
INSERT INTO order_details VALUES (54, 7.44999981, 20, 0);
INSERT INTO order_details VALUES (45, 9.5, 21, 0);
INSERT INTO order_details VALUES (53, 32.7999992, 6, 0);
INSERT INTO order_details VALUES (67, 14, 30, 0);
INSERT INTO order_details VALUES (14, 23.25, 70, 0);
INSERT INTO order_details VALUES (65, 21.0499992, 20, 0);
INSERT INTO order_details VALUES (2, 19, 12, 0);
INSERT INTO order_details VALUES (21, 10, 12, 0);
INSERT INTO order_details VALUES (53, 32.7999992, 10, 0);
INSERT INTO order_details VALUES (61, 28.5, 25, 0);
INSERT INTO order_details VALUES (62, 49.2999992, 3, 0);
INSERT INTO order_details VALUES (25, 14, 18, 0.100000001);
INSERT INTO order_details VALUES (70, 15, 14, 0.100000001);
INSERT INTO order_details VALUES (43, 46, 15, 0.150000006);
INSERT INTO order_details VALUES (48, 12.75, 15, 0.150000006);
INSERT INTO order_details VALUES (13, 6, 10, 0);
INSERT INTO order_details VALUES (39, 18, 10, 0);
INSERT INTO order_details VALUES (28, 45.5999985, 3, 0);
INSERT INTO order_details VALUES (29, 123.790001, 36, 0);
INSERT INTO order_details VALUES (75, 7.75, 36, 0.100000001);
INSERT INTO order_details VALUES (4, 22, 50, 0.150000006);
INSERT INTO order_details VALUES (7, 30, 50, 0.150000006);
INSERT INTO order_details VALUES (8, 40, 10, 0.150000006);
INSERT INTO order_details VALUES (24, 4.5, 10, 0.150000006);
INSERT INTO order_details VALUES (46, 12, 9, 0.150000006);
INSERT INTO order_details VALUES (47, 9.5, 6, 0.150000006);
INSERT INTO order_details VALUES (60, 34, 12, 0.150000006);
INSERT INTO order_details VALUES (21, 10, 40, 0.200000003);
INSERT INTO order_details VALUES (32, 32, 50, 0.200000003);
INSERT INTO order_details VALUES (61, 28.5, 15, 0.200000003);
INSERT INTO order_details VALUES (20, 81, 39, 0);
INSERT INTO order_details VALUES (28, 45.5999985, 35, 0);
INSERT INTO order_details VALUES (56, 38, 70, 0);
INSERT INTO order_details VALUES (65, 21.0499992, 39, 0);
INSERT INTO order_details VALUES (75, 7.75, 50, 0);
INSERT INTO order_details VALUES (9, 97, 16, 0.150000006);
INSERT INTO order_details VALUES (16, 17.4500008, 50, 0);
INSERT INTO order_details VALUES (27, 43.9000015, 120, 0);
INSERT INTO order_details VALUES (33, 2.5, 16, 0.150000006);
INSERT INTO order_details VALUES (60, 34, 84, 0.150000006);
INSERT INTO order_details VALUES (18, 62.5, 25, 0.100000001);
INSERT INTO order_details VALUES (41, 9.64999962, 80, 0.100000001);
INSERT INTO order_details VALUES (42, 14, 20, 0);
INSERT INTO order_details VALUES (52, 7, 6, 0);
INSERT INTO order_details VALUES (59, 55, 4, 0);
INSERT INTO order_details VALUES (70, 15, 6, 0);
INSERT INTO order_details VALUES (24, 4.5, 5, 0);
INSERT INTO order_details VALUES (38, 263.5, 15, 0);
INSERT INTO order_details VALUES (44, 19.4500008, 9, 0);
INSERT INTO order_details VALUES (10, 31, 16, 0.0500000007);
INSERT INTO order_details VALUES (56, 38, 40, 0);
INSERT INTO order_details VALUES (60, 34, 10, 0.0500000007);
INSERT INTO order_details VALUES (24, 4.5, 8, 0);
INSERT INTO order_details VALUES (53, 32.7999992, 5, 0);
INSERT INTO order_details VALUES (35, 18, 3, 0);
INSERT INTO order_details VALUES (41, 9.64999962, 10, 0);
INSERT INTO order_details VALUES (68, 12.5, 6, 0);
INSERT INTO order_details VALUES (1, 18, 40, 0.200000003);
INSERT INTO order_details VALUES (8, 40, 24, 0);
INSERT INTO order_details VALUES (30, 25.8899994, 20, 0.200000003);
INSERT INTO order_details VALUES (40, 18.3999996, 25, 0.200000003);
INSERT INTO order_details VALUES (17, 39, 25, 0.100000001);
INSERT INTO order_details VALUES (20, 81, 15, 0.100000001);
INSERT INTO order_details VALUES (37, 26, 18, 0.100000001);
INSERT INTO order_details VALUES (41, 9.64999962, 6, 0.100000001);
INSERT INTO order_details VALUES (10, 31, 2, 0);
INSERT INTO order_details VALUES (30, 25.8899994, 10, 0);
INSERT INTO order_details VALUES (43, 46, 60, 0);
INSERT INTO order_details VALUES (54, 7.44999981, 15, 0);
INSERT INTO order_details VALUES (36, 19, 30, 0);
INSERT INTO order_details VALUES (40, 18.3999996, 15, 0.100000001);
INSERT INTO order_details VALUES (1, 18, 8, 0.150000006);
INSERT INTO order_details VALUES (13, 6, 10, 0);
INSERT INTO order_details VALUES (56, 38, 30, 0.150000006);
INSERT INTO order_details VALUES (4, 22, 50, 0.100000001);
INSERT INTO order_details VALUES (36, 19, 30, 0.100000001);
INSERT INTO order_details VALUES (11, 21, 3, 0);
INSERT INTO order_details VALUES (33, 2.5, 8, 0.200000003);
INSERT INTO order_details VALUES (72, 34.7999992, 9, 0);
INSERT INTO order_details VALUES (55, 24, 14, 0);
INSERT INTO order_details VALUES (68, 12.5, 20, 0);
INSERT INTO order_details VALUES (69, 36, 10, 0);
INSERT INTO order_details VALUES (17, 39, 40, 0);
INSERT INTO order_details VALUES (43, 46, 25, 0);
INSERT INTO order_details VALUES (61, 28.5, 20, 0);
INSERT INTO order_details VALUES (76, 18, 50, 0);
INSERT INTO order_details VALUES (59, 55, 2, 0);
INSERT INTO order_details VALUES (30, 25.8899994, 15, 0);
INSERT INTO order_details VALUES (66, 17, 24, 0);
INSERT INTO order_details VALUES (4, 22, 50, 0.0500000007);
INSERT INTO order_details VALUES (72, 34.7999992, 24, 0);
INSERT INTO order_details VALUES (73, 15, 24, 0.0500000007);
INSERT INTO order_details VALUES (30, 25.8899994, 10, 0);
INSERT INTO order_details VALUES (40, 18.3999996, 10, 0.200000003);
INSERT INTO order_details VALUES (54, 7.44999981, 10, 0.200000003);
INSERT INTO order_details VALUES (11, 21, 50, 0.100000001);
INSERT INTO order_details VALUES (40, 18.3999996, 10, 0.100000001);
INSERT INTO order_details VALUES (57, 19.5, 5, 0.100000001);
INSERT INTO order_details VALUES (59, 55, 15, 0.100000001);
INSERT INTO order_details VALUES (12, 38, 15, 0.25);
INSERT INTO order_details VALUES (31, 12.5, 20, 0);
INSERT INTO order_details VALUES (33, 2.5, 30, 0);
INSERT INTO order_details VALUES (60, 34, 35, 0.25);
INSERT INTO order_details VALUES (31, 12.5, 30, 0);
INSERT INTO order_details VALUES (51, 53, 6, 0);
INSERT INTO order_details VALUES (58, 13.25, 20, 0);
INSERT INTO order_details VALUES (72, 34.7999992, 21, 0);
INSERT INTO order_details VALUES (73, 15, 9, 0);
INSERT INTO order_details VALUES (70, 15, 7, 0);
INSERT INTO order_details VALUES (72, 34.7999992, 1, 0);
INSERT INTO order_details VALUES (13, 6, 8, 0);
INSERT INTO order_details VALUES (21, 10, 15, 0);
INSERT INTO order_details VALUES (33, 2.5, 15, 0);
INSERT INTO order_details VALUES (49, 20, 6, 0);
INSERT INTO order_details VALUES (3, 10, 60, 0);
INSERT INTO order_details VALUES (26, 31.2299995, 40, 0);
INSERT INTO order_details VALUES (38, 263.5, 30, 0);
INSERT INTO order_details VALUES (68, 12.5, 35, 0);
INSERT INTO order_details VALUES (24, 4.5, 35, 0.100000001);
INSERT INTO order_details VALUES (38, 263.5, 4, 0.100000001);
INSERT INTO order_details VALUES (65, 21.0499992, 36, 0.100000001);
INSERT INTO order_details VALUES (71, 21.5, 9, 0.100000001);
INSERT INTO order_details VALUES (11, 21, 15, 0.0500000007);
INSERT INTO order_details VALUES (54, 7.44999981, 24, 0.0500000007);
INSERT INTO order_details VALUES (12, 38, 30, 0.150000006);
INSERT INTO order_details VALUES (23, 9, 70, 0.150000006);
INSERT INTO order_details VALUES (28, 45.5999985, 7, 0);
INSERT INTO order_details VALUES (67, 14, 7, 0);
INSERT INTO order_details VALUES (11, 21, 10, 0);
INSERT INTO order_details VALUES (7, 30, 10, 0);
INSERT INTO order_details VALUES (35, 18, 30, 0);
INSERT INTO order_details VALUES (62, 49.2999992, 40, 0);
INSERT INTO order_details VALUES (32, 32, 24, 0.150000006);
INSERT INTO order_details VALUES (36, 19, 60, 0);
INSERT INTO order_details VALUES (34, 14, 10, 0.25);
INSERT INTO order_details VALUES (41, 9.64999962, 14, 0);
INSERT INTO order_details VALUES (31, 12.5, 55, 0.150000006);
INSERT INTO order_details VALUES (45, 9.5, 100, 0.150000006);
INSERT INTO order_details VALUES (51, 53, 48, 0.150000006);
INSERT INTO order_details VALUES (17, 39, 8, 0.100000001);
INSERT INTO order_details VALUES (19, 9.19999981, 10, 0);
INSERT INTO order_details VALUES (21, 10, 6, 0.100000001);
INSERT INTO order_details VALUES (61, 28.5, 10, 0.100000001);
INSERT INTO order_details VALUES (16, 17.4500008, 40, 0.150000006);
INSERT INTO order_details VALUES (35, 18, 20, 0.150000006);
INSERT INTO order_details VALUES (44, 19.4500008, 40, 0);
INSERT INTO order_details VALUES (69, 36, 18, 0);
INSERT INTO order_details VALUES (75, 7.75, 30, 0);
INSERT INTO order_details VALUES (11, 21, 15, 0);
INSERT INTO order_details VALUES (16, 17.4500008, 14, 0);
INSERT INTO order_details VALUES (22, 21, 24, 0);
INSERT INTO order_details VALUES (31, 12.5, 30, 0);
INSERT INTO order_details VALUES (35, 18, 6, 0);
INSERT INTO order_details VALUES (16, 17.4500008, 30, 0.0500000007);
INSERT INTO order_details VALUES (23, 9, 20, 0.0500000007);
INSERT INTO order_details VALUES (62, 49.2999992, 20, 0.0500000007);
INSERT INTO order_details VALUES (77, 13, 10, 0.0500000007);
INSERT INTO order_details VALUES (14, 23.25, 30, 0.200000003);
INSERT INTO order_details VALUES (19, 9.19999981, 35, 0.200000003);
INSERT INTO order_details VALUES (24, 4.5, 18, 0.200000003);
INSERT INTO order_details VALUES (51, 53, 20, 0.200000003);
INSERT INTO order_details VALUES (56, 38, 40, 0.200000003);
INSERT INTO order_details VALUES (72, 34.7999992, 24, 0);
INSERT INTO order_details VALUES (64, 33.25, 30, 0);
INSERT INTO order_details VALUES (75, 7.75, 20, 0);
INSERT INTO order_details VALUES (47, 9.5, 25, 0);
INSERT INTO order_details VALUES (51, 53, 20, 0);
INSERT INTO order_details VALUES (52, 7, 30, 0);
INSERT INTO order_details VALUES (53, 32.7999992, 18, 0);
INSERT INTO order_details VALUES (73, 15, 3, 0);
INSERT INTO order_details VALUES (41, 9.64999962, 12, 0.0500000007);
INSERT INTO order_details VALUES (55, 24, 18, 0.0500000007);
INSERT INTO order_details VALUES (30, 25.8899994, 20, 0);
INSERT INTO order_details VALUES (62, 49.2999992, 15, 0.25);
INSERT INTO order_details VALUES (44, 19.4500008, 10, 0);
INSERT INTO order_details VALUES (51, 53, 50, 0);
INSERT INTO order_details VALUES (33, 2.5, 20, 0.100000001);
INSERT INTO order_details VALUES (62, 49.2999992, 10, 0.100000001);
INSERT INTO order_details VALUES (36, 19, 25, 0);
INSERT INTO order_details VALUES (52, 7, 70, 0);
INSERT INTO order_details VALUES (17, 39, 16, 0.0500000007);
INSERT INTO order_details VALUES (31, 12.5, 6, 0.0500000007);
INSERT INTO order_details VALUES (55, 24, 25, 0.0500000007);
INSERT INTO order_details VALUES (24, 4.5, 25, 0.100000001);
INSERT INTO order_details VALUES (64, 33.25, 18, 0.100000001);
INSERT INTO order_details VALUES (11, 21, 35, 0.150000006);
INSERT INTO order_details VALUES (18, 62.5, 18, 0.150000006);
INSERT INTO order_details VALUES (76, 18, 10, 0);
INSERT INTO order_details VALUES (31, 12.5, 60, 0.200000003);
INSERT INTO order_details VALUES (51, 53, 3, 0);
INSERT INTO order_details VALUES (59, 55, 40, 0.200000003);
INSERT INTO order_details VALUES (10, 31, 5, 0);
INSERT INTO order_details VALUES (31, 12.5, 35, 0.200000003);
INSERT INTO order_details VALUES (76, 18, 30, 0);
INSERT INTO order_details VALUES (11, 21, 15, 0.0500000007);
INSERT INTO order_details VALUES (56, 38, 60, 0.0500000007);
INSERT INTO order_details VALUES (14, 23.25, 11, 0.150000006);
INSERT INTO order_details VALUES (42, 14, 28, 0.150000006);
INSERT INTO order_details VALUES (16, 17.4500008, 12, 0.100000001);
INSERT INTO order_details VALUES (32, 32, 10, 0.100000001);
INSERT INTO order_details VALUES (40, 18.3999996, 50, 0);
INSERT INTO order_details VALUES (75, 7.75, 15, 0.100000001);
INSERT INTO order_details VALUES (17, 39, 18, 0);
INSERT INTO order_details VALUES (34, 14, 40, 0);
INSERT INTO order_details VALUES (53, 32.7999992, 25, 0);
INSERT INTO order_details VALUES (33, 2.5, 14, 0);
INSERT INTO order_details VALUES (40, 18.3999996, 2, 0);
INSERT INTO order_details VALUES (62, 49.2999992, 10, 0);
INSERT INTO order_details VALUES (64, 33.25, 6, 0);
INSERT INTO order_details VALUES (59, 55, 12, 0);
INSERT INTO order_details VALUES (63, 43.9000015, 6, 0);
INSERT INTO order_details VALUES (72, 34.7999992, 30, 0);
INSERT INTO order_details VALUES (76, 18, 10, 0);
INSERT INTO order_details VALUES (1, 18, 10, 0);
INSERT INTO order_details VALUES (31, 12.5, 20, 0);
INSERT INTO order_details VALUES (44, 19.4500008, 21, 0);
INSERT INTO order_details VALUES (39, 18, 10, 0);
INSERT INTO order_details VALUES (75, 7.75, 20, 0);
INSERT INTO order_details VALUES (77, 13, 18, 0);
INSERT INTO order_details VALUES (35, 18, 20, 0);
INSERT INTO order_details VALUES (57, 19.5, 6, 0);
INSERT INTO order_details VALUES (15, 15.5, 10, 0);
INSERT INTO order_details VALUES (75, 7.75, 21, 0);
INSERT INTO order_details VALUES (14, 23.25, 15, 0.0500000007);
INSERT INTO order_details VALUES (41, 9.64999962, 9, 0.0500000007);
INSERT INTO order_details VALUES (65, 21.0499992, 30, 0.0500000007);
INSERT INTO order_details VALUES (75, 7.75, 50, 0.200000003);
INSERT INTO order_details VALUES (57, 19.5, 4, 0);
INSERT INTO order_details VALUES (76, 18, 14, 0);
INSERT INTO order_details VALUES (29, 123.790001, 10, 0);
INSERT INTO order_details VALUES (60, 34, 24, 0.150000006);
INSERT INTO order_details VALUES (69, 36, 10, 0.150000006);
INSERT INTO order_details VALUES (31, 12.5, 50, 0.0500000007);
INSERT INTO order_details VALUES (47, 9.5, 15, 0);
INSERT INTO order_details VALUES (52, 7, 4, 0.150000006);
INSERT INTO order_details VALUES (26, 31.2299995, 6, 0);
INSERT INTO order_details VALUES (35, 18, 20, 0);
INSERT INTO order_details VALUES (77, 13, 20, 0);
INSERT INTO order_details VALUES (18, 62.5, 40, 0.200000003);
INSERT INTO order_details VALUES (42, 14, 100, 0.200000003);
INSERT INTO order_details VALUES (35, 18, 4, 0);
INSERT INTO order_details VALUES (1, 18, 20, 0);
INSERT INTO order_details VALUES (77, 13, 60, 0.0500000007);
INSERT INTO order_details VALUES (3, 10, 14, 0);
INSERT INTO order_details VALUES (7, 30, 10, 0);
INSERT INTO order_details VALUES (54, 7.44999981, 50, 0);
INSERT INTO order_details VALUES (15, 15.5, 25, 0.0500000007);
INSERT INTO order_details VALUES (26, 31.2299995, 5, 0.0500000007);
INSERT INTO order_details VALUES (20, 81, 21, 0.200000003);
INSERT INTO order_details VALUES (69, 36, 20, 0.200000003);
INSERT INTO order_details VALUES (76, 18, 4, 0.200000003);
INSERT INTO order_details VALUES (52, 7, 24, 0);
INSERT INTO order_details VALUES (58, 13.25, 30, 0);
INSERT INTO order_details VALUES (35, 18, 30, 0.25);
INSERT INTO order_details VALUES (61, 28.5, 120, 0.25);
INSERT INTO order_details VALUES (69, 36, 65, 0.25);
INSERT INTO order_details VALUES (56, 38, 5, 0.200000003);
INSERT INTO order_details VALUES (63, 43.9000015, 24, 0.200000003);
INSERT INTO order_details VALUES (75, 7.75, 30, 0.200000003);
INSERT INTO order_details VALUES (24, 4.5, 35, 0.200000003);
INSERT INTO order_details VALUES (57, 19.5, 20, 0);
INSERT INTO order_details VALUES (65, 21.0499992, 12, 0.200000003);
INSERT INTO order_details VALUES (27, 43.9000015, 50, 0);
INSERT INTO order_details VALUES (71, 21.5, 9, 0);
INSERT INTO order_details VALUES (62, 49.2999992, 10, 0);
INSERT INTO order_details VALUES (54, 7.44999981, 4, 0);
INSERT INTO order_details VALUES (73, 15, 30, 0);
INSERT INTO order_details VALUES (13, 6, 60, 0);
INSERT INTO order_details VALUES (59, 55, 35, 0);
INSERT INTO order_details VALUES (77, 13, 5, 0.25);
INSERT INTO order_details VALUES (22, 21, 48, 0);
INSERT INTO order_details VALUES (49, 20, 25, 0.0500000007);
INSERT INTO order_details VALUES (48, 12.75, 6, 0.100000001);
INSERT INTO order_details VALUES (76, 18, 10, 0.100000001);
INSERT INTO order_details VALUES (16, 17.4500008, 30, 0.0500000007);
INSERT INTO order_details VALUES (59, 55, 20, 0.0500000007);
INSERT INTO order_details VALUES (60, 34, 70, 0.0500000007);
INSERT INTO order_details VALUES (71, 21.5, 15, 0.0500000007);
INSERT INTO order_details VALUES (4, 22, 20, 0.200000003);
INSERT INTO order_details VALUES (55, 24, 20, 0.200000003);
INSERT INTO order_details VALUES (62, 49.2999992, 10, 0.200000003);
INSERT INTO order_details VALUES (7, 30, 45, 0);
INSERT INTO order_details VALUES (17, 39, 100, 0);
INSERT INTO order_details VALUES (33, 2.5, 14, 0);
INSERT INTO order_details VALUES (40, 18.3999996, 42, 0);
INSERT INTO order_details VALUES (72, 34.7999992, 12, 0);
INSERT INTO order_details VALUES (56, 38, 28, 0);
INSERT INTO order_details VALUES (1, 18, 3, 0);
INSERT INTO order_details VALUES (10, 31, 10, 0);
INSERT INTO order_details VALUES (21, 10, 6, 0);
INSERT INTO order_details VALUES (36, 19, 21, 0.25);
INSERT INTO order_details VALUES (1, 18, 6, 0);
INSERT INTO order_details VALUES (2, 19, 10, 0);
INSERT INTO order_details VALUES (60, 34, 15, 0);
INSERT INTO order_details VALUES (10, 31, 70, 0);
INSERT INTO order_details VALUES (36, 19, 55, 0);
INSERT INTO order_details VALUES (49, 20, 18, 0);
INSERT INTO order_details VALUES (60, 34, 40, 0);
INSERT INTO order_details VALUES (76, 18, 80, 0);
INSERT INTO order_details VALUES (13, 6, 8, 0.100000001);
INSERT INTO order_details VALUES (75, 7.75, 40, 0);
INSERT INTO order_details VALUES (11, 21, 14, 0);
INSERT INTO order_details VALUES (21, 10, 8, 0);
INSERT INTO order_details VALUES (39, 18, 5, 0);
INSERT INTO order_details VALUES (55, 24, 5, 0);
INSERT INTO order_details VALUES (38, 263.5, 15, 0.0500000007);
INSERT INTO order_details VALUES (56, 38, 14, 0);
INSERT INTO order_details VALUES (70, 15, 15, 0.0500000007);
INSERT INTO order_details VALUES (71, 21.5, 15, 0.0500000007);
INSERT INTO order_details VALUES (59, 55, 30, 0.150000006);
INSERT INTO order_details VALUES (6, 25, 70, 0);
INSERT INTO order_details VALUES (56, 38, 20, 0);
INSERT INTO order_details VALUES (68, 12.5, 15, 0);
INSERT INTO order_details VALUES (21, 10, 42, 0);
INSERT INTO order_details VALUES (22, 21, 40, 0);
INSERT INTO order_details VALUES (24, 4.5, 5, 0);
INSERT INTO order_details VALUES (52, 7, 5, 0);
INSERT INTO order_details VALUES (19, 9.19999981, 5, 0);
INSERT INTO order_details VALUES (23, 9, 10, 0);
INSERT INTO order_details VALUES (70, 15, 20, 0);
INSERT INTO order_details VALUES (71, 21.5, 15, 0);
INSERT INTO order_details VALUES (2, 19, 20, 0);
INSERT INTO order_details VALUES (68, 12.5, 18, 0.200000003);
INSERT INTO order_details VALUES (14, 23.25, 21, 0);
INSERT INTO order_details VALUES (19, 9.19999981, 15, 0.100000001);
INSERT INTO order_details VALUES (21, 10, 25, 0.100000001);
INSERT INTO order_details VALUES (24, 4.5, 3, 0);
INSERT INTO order_details VALUES (35, 18, 30, 0.100000001);
INSERT INTO order_details VALUES (28, 45.5999985, 10, 0);
INSERT INTO order_details VALUES (29, 123.790001, 6, 0);
INSERT INTO order_details VALUES (44, 19.4500008, 10, 0);
INSERT INTO order_details VALUES (14, 23.25, 3, 0);
INSERT INTO order_details VALUES (42, 14, 5, 0);
INSERT INTO order_details VALUES (60, 34, 10, 0);
INSERT INTO order_details VALUES (53, 32.7999992, 12, 0);
INSERT INTO order_details VALUES (60, 34, 20, 0);
INSERT INTO order_details VALUES (71, 21.5, 20, 0);
INSERT INTO order_details VALUES (62, 49.2999992, 15, 0);
INSERT INTO order_details VALUES (73, 15, 35, 0.150000006);
INSERT INTO order_details VALUES (1, 18, 25, 0);
INSERT INTO order_details VALUES (29, 123.790001, 20, 0);
INSERT INTO order_details VALUES (64, 33.25, 9, 0);
INSERT INTO order_details VALUES (55, 24, 12, 0.0500000007);
INSERT INTO order_details VALUES (76, 18, 35, 0);
INSERT INTO order_details VALUES (75, 7.75, 8, 0.100000001);
INSERT INTO order_details VALUES (2, 19, 30, 0.0500000007);
INSERT INTO order_details VALUES (33, 2.5, 20, 0.0500000007);
INSERT INTO order_details VALUES (12, 38, 36, 0.150000006);
INSERT INTO order_details VALUES (13, 6, 13, 0.150000006);
INSERT INTO order_details VALUES (26, 31.2299995, 35, 0.150000006);
INSERT INTO order_details VALUES (62, 49.2999992, 80, 0.150000006);
INSERT INTO order_details VALUES (7, 30, 35, 0);
INSERT INTO order_details VALUES (18, 62.5, 50, 0);
INSERT INTO order_details VALUES (51, 53, 15, 0);
INSERT INTO order_details VALUES (75, 7.75, 2, 0);
INSERT INTO order_details VALUES (4, 22, 10, 0.100000001);
INSERT INTO order_details VALUES (5, 21.3500004, 15, 0.100000001);
INSERT INTO order_details VALUES (22, 21, 40, 0);
INSERT INTO order_details VALUES (4, 22, 25, 0);
INSERT INTO order_details VALUES (58, 13.25, 6, 0);
INSERT INTO order_details VALUES (11, 21, 10, 0);
INSERT INTO order_details VALUES (50, 16.25, 25, 0.0500000007);
INSERT INTO order_details VALUES (56, 38, 60, 0.0500000007);
INSERT INTO order_details VALUES (45, 9.5, 20, 0);
INSERT INTO order_details VALUES (65, 21.0499992, 21, 0);
INSERT INTO order_details VALUES (72, 34.7999992, 60, 0);
INSERT INTO order_details VALUES (18, 62.5, 8, 0);
INSERT INTO order_details VALUES (69, 36, 20, 0.25);
INSERT INTO order_details VALUES (70, 15, 15, 0.25);
INSERT INTO order_details VALUES (2, 19, 50, 0);
INSERT INTO order_details VALUES (40, 18.3999996, 60, 0);
INSERT INTO order_details VALUES (21, 10, 30, 0.200000003);
INSERT INTO order_details VALUES (61, 28.5, 20, 0.200000003);
INSERT INTO order_details VALUES (28, 45.5999985, 15, 0.25);
INSERT INTO order_details VALUES (39, 18, 21, 0.25);
INSERT INTO order_details VALUES (46, 12, 2, 0.25);
INSERT INTO order_details VALUES (18, 62.5, 4, 0.100000001);
INSERT INTO order_details VALUES (43, 46, 20, 0);
INSERT INTO order_details VALUES (46, 12, 21, 0.100000001);
INSERT INTO order_details VALUES (18, 62.5, 20, 0);
INSERT INTO order_details VALUES (36, 19, 15, 0);
INSERT INTO order_details VALUES (1, 18, 15, 0.25);
INSERT INTO order_details VALUES (10, 31, 18, 0.25);
INSERT INTO order_details VALUES (71, 21.5, 30, 0.25);
INSERT INTO order_details VALUES (77, 13, 35, 0.25);
INSERT INTO order_details VALUES (19, 9.19999981, 30, 0);
INSERT INTO order_details VALUES (39, 18, 20, 0);
INSERT INTO order_details VALUES (22, 21, 15, 0);
INSERT INTO order_details VALUES (24, 4.5, 15, 0.150000006);
INSERT INTO order_details VALUES (28, 45.5999985, 20, 0);
INSERT INTO order_details VALUES (72, 34.7999992, 15, 0);
INSERT INTO order_details VALUES (30, 25.8899994, 30, 0);
INSERT INTO order_details VALUES (53, 32.7999992, 25, 0.0500000007);
INSERT INTO order_details VALUES (54, 7.44999981, 30, 0);
INSERT INTO order_details VALUES (19, 9.19999981, 12, 0.25);
INSERT INTO order_details VALUES (22, 21, 20, 0.25);
INSERT INTO order_details VALUES (30, 25.8899994, 2, 0.25);
INSERT INTO order_details VALUES (42, 14, 20, 0);
INSERT INTO order_details VALUES (16, 17.4500008, 30, 0.100000001);
INSERT INTO order_details VALUES (60, 34, 20, 0.100000001);
INSERT INTO order_details VALUES (4, 22, 12, 0.100000001);
INSERT INTO order_details VALUES (39, 18, 20, 0.100000001);
INSERT INTO order_details VALUES (54, 7.44999981, 6, 0.100000001);
INSERT INTO order_details VALUES (41, 9.64999962, 20, 0.200000003);
INSERT INTO order_details VALUES (14, 23.25, 3, 0.100000001);
INSERT INTO order_details VALUES (44, 19.4500008, 28, 0.100000001);
INSERT INTO order_details VALUES (47, 9.5, 6, 0.100000001);
INSERT INTO order_details VALUES (15, 15.5, 50, 0);
INSERT INTO order_details VALUES (41, 9.64999962, 24, 0);
INSERT INTO order_details VALUES (46, 12, 45, 0);
INSERT INTO order_details VALUES (47, 9.5, 10, 0);
INSERT INTO order_details VALUES (56, 38, 45, 0);
INSERT INTO order_details VALUES (60, 34, 30, 0);
INSERT INTO order_details VALUES (21, 10, 60, 0);
INSERT INTO order_details VALUES (40, 18.3999996, 70, 0.0500000007);
INSERT INTO order_details VALUES (60, 34, 55, 0.0500000007);
INSERT INTO order_details VALUES (77, 13, 70, 0.0500000007);
INSERT INTO order_details VALUES (31, 12.5, 20, 0.0500000007);
INSERT INTO order_details VALUES (40, 18.3999996, 24, 0.0500000007);
INSERT INTO order_details VALUES (70, 15, 40, 0.0500000007);
INSERT INTO order_details VALUES (20, 81, 21, 0);
INSERT INTO order_details VALUES (39, 18, 3, 0.200000003);
INSERT INTO order_details VALUES (58, 13.25, 49, 0.200000003);
INSERT INTO order_details VALUES (68, 12.5, 10, 0);
INSERT INTO order_details VALUES (40, 18.3999996, 30, 0.0500000007);
INSERT INTO order_details VALUES (42, 14, 30, 0.0500000007);
INSERT INTO order_details VALUES (51, 53, 20, 0.0500000007);
INSERT INTO order_details VALUES (10, 31, 24, 0.150000006);
INSERT INTO order_details VALUES (56, 38, 12, 0.150000006);
INSERT INTO order_details VALUES (65, 21.0499992, 15, 0.150000006);
INSERT INTO order_details VALUES (51, 53, 20, 0);
INSERT INTO order_details VALUES (59, 55, 1, 0);
INSERT INTO order_details VALUES (76, 18, 10, 0);
INSERT INTO order_details VALUES (29, 123.790001, 36, 0);
INSERT INTO order_details VALUES (65, 21.0499992, 10, 0);
INSERT INTO order_details VALUES (69, 36, 45, 0.200000003);
INSERT INTO order_details VALUES (71, 21.5, 14, 0.200000003);
INSERT INTO order_details VALUES (31, 12.5, 8, 0.100000001);
INSERT INTO order_details VALUES (55, 24, 4, 0.100000001);
INSERT INTO order_details VALUES (64, 33.25, 15, 0.100000001);
INSERT INTO order_details VALUES (36, 19, 30, 0);
INSERT INTO order_details VALUES (23, 9, 32, 0);
INSERT INTO order_details VALUES (46, 12, 60, 0);
INSERT INTO order_details VALUES (67, 14, 25, 0);
INSERT INTO order_details VALUES (73, 15, 50, 0);
INSERT INTO order_details VALUES (75, 7.75, 25, 0);
INSERT INTO order_details VALUES (16, 17.4500008, 10, 0);
INSERT INTO order_details VALUES (62, 49.2999992, 10, 0);
INSERT INTO order_details VALUES (65, 21.0499992, 12, 0);
INSERT INTO order_details VALUES (38, 263.5, 15, 0.100000001);
INSERT INTO order_details VALUES (71, 21.5, 12, 0);
INSERT INTO order_details VALUES (16, 17.4500008, 3, 0);
INSERT INTO order_details VALUES (42, 14, 6, 0);
INSERT INTO order_details VALUES (43, 46, 6, 0);
INSERT INTO order_details VALUES (23, 9, 5, 0);
INSERT INTO order_details VALUES (14, 23.25, 30, 0);
INSERT INTO order_details VALUES (53, 32.7999992, 10, 0);
INSERT INTO order_details VALUES (58, 13.25, 30, 0);
INSERT INTO order_details VALUES (10, 31, 2, 0);
INSERT INTO order_details VALUES (19, 9.19999981, 7, 0);
INSERT INTO order_details VALUES (44, 19.4500008, 21, 0);
INSERT INTO order_details VALUES (26, 31.2299995, 30, 0.150000006);
INSERT INTO order_details VALUES (33, 2.5, 8, 0.150000006);
INSERT INTO order_details VALUES (12, 38, 100, 0);
INSERT INTO order_details VALUES (33, 2.5, 30, 0);
INSERT INTO order_details VALUES (41, 9.64999962, 120, 0);
INSERT INTO order_details VALUES (54, 7.44999981, 30, 0);
INSERT INTO order_details VALUES (59, 55, 12, 0);
INSERT INTO order_details VALUES (16, 17.4500008, 50, 0.25);
INSERT INTO order_details VALUES (31, 12.5, 20, 0.25);
INSERT INTO order_details VALUES (42, 14, 40, 0.25);
INSERT INTO order_details VALUES (19, 9.19999981, 30, 0.100000001);
INSERT INTO order_details VALUES (21, 10, 12, 0.100000001);
INSERT INTO order_details VALUES (64, 33.25, 28, 0);
INSERT INTO order_details VALUES (33, 2.5, 30, 0);
INSERT INTO order_details VALUES (66, 17, 4, 0);
INSERT INTO order_details VALUES (75, 7.75, 30, 0);
INSERT INTO order_details VALUES (52, 7, 9, 0);
INSERT INTO order_details VALUES (40, 18.3999996, 20, 0);
INSERT INTO order_details VALUES (47, 9.5, 40, 0);
INSERT INTO order_details VALUES (60, 34, 30, 0);
INSERT INTO order_details VALUES (10, 31, 20, 0);
INSERT INTO order_details VALUES (41, 9.64999962, 4, 0);
INSERT INTO order_details VALUES (47, 9.5, 15, 0);
INSERT INTO order_details VALUES (17, 39, 30, 0.200000003);
INSERT INTO order_details VALUES (26, 31.2299995, 15, 0);
INSERT INTO order_details VALUES (9, 97, 50, 0.25);
INSERT INTO order_details VALUES (29, 123.790001, 10, 0);
INSERT INTO order_details VALUES (36, 19, 6, 0.25);
INSERT INTO order_details VALUES (10, 31, 18, 0.100000001);
INSERT INTO order_details VALUES (28, 45.5999985, 60, 0.100000001);
INSERT INTO order_details VALUES (34, 14, 14, 0);
INSERT INTO order_details VALUES (1, 18, 35, 0.25);
INSERT INTO order_details VALUES (56, 38, 20, 0.25);
INSERT INTO order_details VALUES (77, 13, 30, 0.25);
INSERT INTO order_details VALUES (1, 18, 30, 0);
INSERT INTO order_details VALUES (29, 123.790001, 40, 0);
INSERT INTO order_details VALUES (43, 46, 40, 0);
INSERT INTO order_details VALUES (44, 19.4500008, 24, 0);
INSERT INTO order_details VALUES (62, 49.2999992, 48, 0);
INSERT INTO order_details VALUES (63, 43.9000015, 20, 0);
INSERT INTO order_details VALUES (9, 97, 6, 0);
INSERT INTO order_details VALUES (54, 7.44999981, 60, 0.150000006);
INSERT INTO order_details VALUES (69, 36, 30, 0.150000006);
INSERT INTO order_details VALUES (73, 15, 15, 0.150000006);
INSERT INTO order_details VALUES (7, 30, 90, 0);
INSERT INTO order_details VALUES (59, 55, 25, 0);
INSERT INTO order_details VALUES (70, 15, 50, 0);
INSERT INTO order_details VALUES (8, 40, 10, 0);
INSERT INTO order_details VALUES (12, 38, 4, 0);
INSERT INTO order_details VALUES (24, 4.5, 20, 0);
INSERT INTO order_details VALUES (17, 39, 20, 0);
INSERT INTO order_details VALUES (46, 12, 18, 0);
INSERT INTO order_details VALUES (19, 9.19999981, 7, 0.25);
INSERT INTO order_details VALUES (35, 18, 9, 0.25);
INSERT INTO order_details VALUES (58, 13.25, 30, 0.25);
INSERT INTO order_details VALUES (70, 15, 30, 0.25);
INSERT INTO order_details VALUES (11, 21, 15, 0);
INSERT INTO order_details VALUES (17, 39, 8, 0.0500000007);
INSERT INTO order_details VALUES (29, 123.790001, 12, 0.0500000007);
INSERT INTO order_details VALUES (65, 21.0499992, 65, 0.0500000007);
INSERT INTO order_details VALUES (70, 15, 8, 0.0500000007);
INSERT INTO order_details VALUES (47, 9.5, 12, 0);
INSERT INTO order_details VALUES (1, 18, 5, 0.200000003);
INSERT INTO order_details VALUES (34, 14, 12, 0.200000003);
INSERT INTO order_details VALUES (68, 12.5, 40, 0.200000003);
INSERT INTO order_details VALUES (71, 21.5, 60, 0.200000003);
INSERT INTO order_details VALUES (59, 55, 42, 0.150000006);
INSERT INTO order_details VALUES (71, 21.5, 20, 0.150000006);
INSERT INTO order_details VALUES (76, 18, 35, 0.150000006);
INSERT INTO order_details VALUES (3, 10, 6, 0);
INSERT INTO order_details VALUES (76, 18, 15, 0);
INSERT INTO order_details VALUES (2, 19, 5, 0);
INSERT INTO order_details VALUES (59, 55, 35, 0);
INSERT INTO order_details VALUES (73, 15, 35, 0);
INSERT INTO order_details VALUES (4, 22, 6, 0);
INSERT INTO order_details VALUES (24, 4.5, 35, 0);
INSERT INTO order_details VALUES (48, 12.75, 24, 0);
INSERT INTO order_details VALUES (31, 12.5, 20, 0);
INSERT INTO order_details VALUES (32, 32, 4, 0);
INSERT INTO order_details VALUES (16, 17.4500008, 20, 0);
INSERT INTO order_details VALUES (43, 46, 24, 0);
INSERT INTO order_details VALUES (59, 55, 8, 0);
INSERT INTO order_details VALUES (55, 24, 21, 0);
INSERT INTO order_details VALUES (57, 19.5, 40, 0);
INSERT INTO order_details VALUES (70, 15, 28, 0.150000006);
INSERT INTO order_details VALUES (5, 21.3500004, 4, 0);
INSERT INTO order_details VALUES (36, 19, 5, 0);
INSERT INTO order_details VALUES (8, 40, 40, 0);
INSERT INTO order_details VALUES (51, 53, 28, 0);
INSERT INTO order_details VALUES (60, 34, 10, 0);
INSERT INTO order_details VALUES (19, 9.19999981, 5, 0);
INSERT INTO order_details VALUES (47, 9.5, 5, 0);
INSERT INTO order_details VALUES (19, 9.19999981, 12, 0);
INSERT INTO order_details VALUES (41, 9.64999962, 42, 0);
INSERT INTO order_details VALUES (53, 32.7999992, 120, 0);
INSERT INTO order_details VALUES (53, 32.7999992, 3, 0.0500000007);
INSERT INTO order_details VALUES (56, 38, 30, 0);
INSERT INTO order_details VALUES (10, 31, 18, 0);
INSERT INTO order_details VALUES (26, 31.2299995, 30, 0);
INSERT INTO order_details VALUES (45, 9.5, 110, 0);
INSERT INTO order_details VALUES (46, 12, 24, 0);
INSERT INTO order_details VALUES (2, 19, 30, 0.25);
INSERT INTO order_details VALUES (17, 39, 27, 0.25);
INSERT INTO order_details VALUES (47, 9.5, 50, 0.25);
INSERT INTO order_details VALUES (56, 38, 18, 0.25);
INSERT INTO order_details VALUES (58, 13.25, 12, 0.25);
INSERT INTO order_details VALUES (10, 31, 21, 0);
INSERT INTO order_details VALUES (71, 21.5, 30, 0);
INSERT INTO order_details VALUES (21, 10, 5, 0);
INSERT INTO order_details VALUES (51, 53, 7, 0);
INSERT INTO order_details VALUES (61, 28.5, 10, 0);
INSERT INTO order_details VALUES (21, 10, 32, 0.0500000007);
INSERT INTO order_details VALUES (54, 7.44999981, 15, 0);
INSERT INTO order_details VALUES (69, 36, 25, 0.0500000007);
INSERT INTO order_details VALUES (12, 38, 36, 0);
INSERT INTO order_details VALUES (16, 17.4500008, 20, 0);
INSERT INTO order_details VALUES (36, 19, 40, 0);
INSERT INTO order_details VALUES (62, 49.2999992, 20, 0);
INSERT INTO order_details VALUES (18, 62.5, 12, 0.25);
INSERT INTO order_details VALUES (30, 25.8899994, 3, 0.25);
INSERT INTO order_details VALUES (54, 7.44999981, 40, 0.25);
INSERT INTO order_details VALUES (35, 18, 21, 0);
INSERT INTO order_details VALUES (71, 21.5, 8, 0);
INSERT INTO order_details VALUES (44, 19.4500008, 50, 0.0500000007);
INSERT INTO order_details VALUES (2, 19, 3, 0);
INSERT INTO order_details VALUES (31, 12.5, 50, 0);
INSERT INTO order_details VALUES (68, 12.5, 45, 0);
INSERT INTO order_details VALUES (75, 7.75, 42, 0);
INSERT INTO order_details VALUES (26, 31.2299995, 15, 0);
INSERT INTO order_details VALUES (10, 31, 16, 0);
INSERT INTO order_details VALUES (61, 28.5, 5, 0);
INSERT INTO order_details VALUES (41, 9.64999962, 12, 0);
INSERT INTO order_details VALUES (52, 7, 4, 0);
INSERT INTO order_details VALUES (55, 24, 6, 0);
INSERT INTO order_details VALUES (4, 22, 25, 0);
INSERT INTO order_details VALUES (11, 21, 5, 0);
INSERT INTO order_details VALUES (17, 39, 20, 0.0500000007);
INSERT INTO order_details VALUES (56, 38, 10, 0.0500000007);
INSERT INTO order_details VALUES (59, 55, 10, 0.0500000007);
INSERT INTO order_details VALUES (30, 25.8899994, 15, 0);
INSERT INTO order_details VALUES (40, 18.3999996, 6, 0);
INSERT INTO order_details VALUES (55, 24, 12, 0);
INSERT INTO order_details VALUES (60, 34, 15, 0);
INSERT INTO order_details VALUES (1, 18, 50, 0);
INSERT INTO order_details VALUES (21, 10, 30, 0);
INSERT INTO order_details VALUES (50, 16.25, 40, 0);
INSERT INTO order_details VALUES (16, 17.4500008, 15, 0.0500000007);
INSERT INTO order_details VALUES (31, 12.5, 3, 0.0500000007);
INSERT INTO order_details VALUES (65, 21.0499992, 10, 0.0500000007);
INSERT INTO order_details VALUES (21, 10, 40, 0.0500000007);
INSERT INTO order_details VALUES (51, 53, 30, 0.0500000007);
INSERT INTO order_details VALUES (76, 18, 20, 0);
INSERT INTO order_details VALUES (14, 23.25, 16, 0);
INSERT INTO order_details VALUES (28, 45.5999985, 20, 0);
INSERT INTO order_details VALUES (52, 7, 25, 0);
INSERT INTO order_details VALUES (6, 25, 30, 0);
INSERT INTO order_details VALUES (30, 25.8899994, 15, 0);
INSERT INTO order_details VALUES (76, 18, 20, 0);
INSERT INTO order_details VALUES (61, 28.5, 20, 0.100000001);
INSERT INTO order_details VALUES (77, 13, 2, 0.100000001);
INSERT INTO order_details VALUES (65, 21.0499992, 40, 0);
INSERT INTO order_details VALUES (75, 7.75, 20, 0);
INSERT INTO order_details VALUES (13, 6, 4, 0);
INSERT INTO order_details VALUES (41, 9.64999962, 12, 0);
INSERT INTO order_details VALUES (16, 17.4500008, 3, 0);
INSERT INTO order_details VALUES (36, 19, 6, 0);
INSERT INTO order_details VALUES (52, 7, 18, 0);
INSERT INTO order_details VALUES (28, 45.5999985, 5, 0.200000003);
INSERT INTO order_details VALUES (35, 18, 35, 0.200000003);
INSERT INTO order_details VALUES (45, 9.5, 40, 0.200000003);
INSERT INTO order_details VALUES (56, 38, 14, 0.200000003);
INSERT INTO order_details VALUES (2, 19, 15, 0.200000003);
INSERT INTO order_details VALUES (3, 10, 20, 0);
INSERT INTO order_details VALUES (60, 34, 50, 0);
INSERT INTO order_details VALUES (72, 34.7999992, 35, 0);
INSERT INTO order_details VALUES (46, 12, 28, 0.0500000007);
INSERT INTO order_details VALUES (40, 18.3999996, 50, 0.200000003);
INSERT INTO order_details VALUES (18, 62.5, 24, 0);
INSERT INTO order_details VALUES (44, 19.4500008, 16, 0);
INSERT INTO order_details VALUES (59, 55, 45, 0);
INSERT INTO order_details VALUES (72, 34.7999992, 7, 0);
INSERT INTO order_details VALUES (13, 6, 6, 0);
INSERT INTO order_details VALUES (42, 14, 28, 0);
INSERT INTO order_details VALUES (62, 49.2999992, 9, 0);
INSERT INTO order_details VALUES (69, 36, 40, 0);
INSERT INTO order_details VALUES (31, 12.5, 8, 0);
INSERT INTO order_details VALUES (41, 9.64999962, 35, 0);
INSERT INTO order_details VALUES (63, 43.9000015, 9, 0);
INSERT INTO order_details VALUES (69, 36, 30, 0);
INSERT INTO order_details VALUES (23, 9, 44, 0);
INSERT INTO order_details VALUES (40, 18.3999996, 40, 0);
INSERT INTO order_details VALUES (56, 38, 28, 0);
INSERT INTO order_details VALUES (56, 38, 15, 0);
INSERT INTO order_details VALUES (59, 55, 6, 0);
INSERT INTO order_details VALUES (76, 18, 10, 0);
INSERT INTO order_details VALUES (14, 23.25, 5, 0.150000006);
INSERT INTO order_details VALUES (45, 9.5, 40, 0.150000006);
INSERT INTO order_details VALUES (59, 55, 25, 0.150000006);
INSERT INTO order_details VALUES (26, 31.2299995, 12, 0.100000001);
INSERT INTO order_details VALUES (30, 25.8899994, 30, 0);
INSERT INTO order_details VALUES (50, 16.25, 20, 0.100000001);
INSERT INTO order_details VALUES (73, 15, 15, 0);
INSERT INTO order_details VALUES (1, 18, 8, 0);
INSERT INTO order_details VALUES (69, 36, 3, 0);
INSERT INTO order_details VALUES (45, 9.5, 4, 0);
INSERT INTO order_details VALUES (74, 10, 5, 0);
INSERT INTO order_details VALUES (40, 18.3999996, 3, 0);
INSERT INTO order_details VALUES (47, 9.5, 30, 0.25);
INSERT INTO order_details VALUES (56, 38, 30, 0.25);
INSERT INTO order_details VALUES (57, 19.5, 14, 0.25);
INSERT INTO order_details VALUES (69, 36, 25, 0.25);
INSERT INTO order_details VALUES (18, 62.5, 21, 0.200000003);
INSERT INTO order_details VALUES (36, 19, 20, 0.200000003);
INSERT INTO order_details VALUES (68, 12.5, 6, 0.200000003);
INSERT INTO order_details VALUES (69, 36, 20, 0.200000003);
INSERT INTO order_details VALUES (34, 14, 30, 0);
INSERT INTO order_details VALUES (59, 55, 7, 0);
INSERT INTO order_details VALUES (62, 49.2999992, 30, 0);
INSERT INTO order_details VALUES (64, 33.25, 24, 0);
INSERT INTO order_details VALUES (26, 31.2299995, 20, 0);
INSERT INTO order_details VALUES (52, 7, 60, 0);
INSERT INTO order_details VALUES (70, 15, 40, 0);
INSERT INTO order_details VALUES (32, 32, 10, 0);
INSERT INTO order_details VALUES (25, 14, 12, 0.25);
INSERT INTO order_details VALUES (27, 43.9000015, 40, 0);
INSERT INTO order_details VALUES (43, 46, 30, 0.25);
INSERT INTO order_details VALUES (25, 14, 35, 0.25);
INSERT INTO order_details VALUES (75, 7.75, 18, 0);
INSERT INTO order_details VALUES (39, 18, 16, 0);
INSERT INTO order_details VALUES (47, 9.5, 30, 0);
INSERT INTO order_details VALUES (51, 53, 28, 0);
INSERT INTO order_details VALUES (56, 38, 60, 0);
INSERT INTO order_details VALUES (21, 10, 40, 0);
INSERT INTO order_details VALUES (22, 21, 6, 0);
INSERT INTO order_details VALUES (24, 4.5, 20, 0);
INSERT INTO order_details VALUES (3, 10, 20, 0.100000001);
INSERT INTO order_details VALUES (39, 18, 130, 0.100000001);
INSERT INTO order_details VALUES (65, 21.0499992, 80, 0.100000001);
INSERT INTO order_details VALUES (2, 19, 40, 0);
INSERT INTO order_details VALUES (7, 30, 35, 0);
INSERT INTO order_details VALUES (68, 12.5, 40, 0);
INSERT INTO order_details VALUES (42, 14, 2, 0);
INSERT INTO order_details VALUES (22, 21, 4, 0);
INSERT INTO order_details VALUES (31, 12.5, 50, 0);
INSERT INTO order_details VALUES (60, 34, 15, 0);
INSERT INTO order_details VALUES (71, 21.5, 12, 0);
INSERT INTO order_details VALUES (41, 9.64999962, 30, 0.0500000007);
INSERT INTO order_details VALUES (52, 7, 15, 0.0500000007);
INSERT INTO order_details VALUES (61, 28.5, 20, 0);
INSERT INTO order_details VALUES (62, 49.2999992, 15, 0);
INSERT INTO order_details VALUES (11, 21, 15, 0.25);
INSERT INTO order_details VALUES (71, 21.5, 16, 0);
INSERT INTO order_details VALUES (29, 123.790001, 18, 0);
INSERT INTO order_details VALUES (59, 55, 25, 0);
INSERT INTO order_details VALUES (17, 39, 33, 0);
INSERT INTO order_details VALUES (31, 12.5, 70, 0.200000003);
INSERT INTO order_details VALUES (75, 7.75, 7, 0.200000003);
INSERT INTO order_details VALUES (31, 12.5, 2, 0.25);
INSERT INTO order_details VALUES (66, 17, 50, 0);
INSERT INTO order_details VALUES (10, 31, 6, 0);
INSERT INTO order_details VALUES (67, 14, 3, 0);
INSERT INTO order_details VALUES (31, 12.5, 16, 0.0500000007);
INSERT INTO order_details VALUES (42, 14, 12, 0.0500000007);
INSERT INTO order_details VALUES (45, 9.5, 27, 0.0500000007);
INSERT INTO order_details VALUES (51, 53, 120, 0.0500000007);
INSERT INTO order_details VALUES (42, 14, 20, 0.200000003);
INSERT INTO order_details VALUES (41, 9.64999962, 10, 0);
INSERT INTO order_details VALUES (16, 17.4500008, 20, 0);
INSERT INTO order_details VALUES (62, 49.2999992, 20, 0);
INSERT INTO order_details VALUES (70, 15, 35, 0);
INSERT INTO order_details VALUES (77, 13, 15, 0);
INSERT INTO order_details VALUES (54, 7.44999981, 3, 0.200000003);
INSERT INTO order_details VALUES (56, 38, 20, 0.200000003);
INSERT INTO order_details VALUES (74, 10, 35, 0);
INSERT INTO order_details VALUES (31, 12.5, 1, 0);
INSERT INTO order_details VALUES (31, 12.5, 10, 0);
INSERT INTO order_details VALUES (38, 263.5, 5, 0);
INSERT INTO order_details VALUES (36, 19, 30, 0);
INSERT INTO order_details VALUES (39, 18, 2, 0.150000006);
INSERT INTO order_details VALUES (72, 34.7999992, 30, 0.150000006);
INSERT INTO order_details VALUES (10, 31, 10, 0);
INSERT INTO order_details VALUES (75, 7.75, 10, 0);
INSERT INTO order_details VALUES (8, 40, 30, 0.200000003);
INSERT INTO order_details VALUES (30, 25.8899994, 15, 0.200000003);
INSERT INTO order_details VALUES (75, 7.75, 42, 0.200000003);
INSERT INTO order_details VALUES (2, 19, 15, 0.0500000007);
INSERT INTO order_details VALUES (29, 123.790001, 20, 0.0500000007);
INSERT INTO order_details VALUES (19, 9.19999981, 50, 0.0500000007);
INSERT INTO order_details VALUES (75, 7.75, 40, 0.0500000007);
INSERT INTO order_details VALUES (18, 62.5, 30, 0);
INSERT INTO order_details VALUES (35, 18, 15, 0);
INSERT INTO order_details VALUES (63, 43.9000015, 30, 0);
INSERT INTO order_details VALUES (68, 12.5, 18, 0);
INSERT INTO order_details VALUES (7, 30, 3, 0.150000006);
INSERT INTO order_details VALUES (56, 38, 20, 0.150000006);
INSERT INTO order_details VALUES (29, 123.790001, 14, 0.0500000007);
INSERT INTO order_details VALUES (41, 9.64999962, 20, 0.0500000007);
INSERT INTO order_details VALUES (2, 19, 10, 0);
INSERT INTO order_details VALUES (54, 7.44999981, 3, 0);
INSERT INTO order_details VALUES (68, 12.5, 15, 0);
INSERT INTO order_details VALUES (41, 9.64999962, 14, 0);
INSERT INTO order_details VALUES (52, 7, 8, 0);
INSERT INTO order_details VALUES (14, 23.25, 15, 0.200000003);
INSERT INTO order_details VALUES (54, 7.44999981, 6, 0.200000003);
INSERT INTO order_details VALUES (16, 17.4500008, 65, 0);
INSERT INTO order_details VALUES (17, 39, 35, 0.25);
INSERT INTO order_details VALUES (26, 31.2299995, 21, 0.200000003);
INSERT INTO order_details VALUES (44, 19.4500008, 10, 0);
INSERT INTO order_details VALUES (64, 33.25, 35, 0.200000003);
INSERT INTO order_details VALUES (69, 36, 24, 0.200000003);
INSERT INTO order_details VALUES (11, 21, 20, 0);
INSERT INTO order_details VALUES (62, 49.2999992, 2, 0);
INSERT INTO order_details VALUES (72, 34.7999992, 10, 0);
INSERT INTO order_details VALUES (13, 6, 20, 0.150000006);
INSERT INTO order_details VALUES (24, 4.5, 20, 0.150000006);
INSERT INTO order_details VALUES (59, 55, 25, 0);
INSERT INTO order_details VALUES (11, 21, 50, 0.100000001);
INSERT INTO order_details VALUES (51, 53, 10, 0.100000001);
INSERT INTO order_details VALUES (54, 7.44999981, 7, 0.100000001);
INSERT INTO order_details VALUES (17, 39, 40, 0.25);
INSERT INTO order_details VALUES (29, 123.790001, 20, 0.25);
INSERT INTO order_details VALUES (30, 25.8899994, 25, 0.25);
INSERT INTO order_details VALUES (51, 53, 30, 0.25);
INSERT INTO order_details VALUES (55, 24, 60, 0.25);
INSERT INTO order_details VALUES (62, 49.2999992, 5, 0.25);
INSERT INTO order_details VALUES (19, 9.19999981, 24, 0.0500000007);
INSERT INTO order_details VALUES (25, 14, 15, 0.0500000007);
INSERT INTO order_details VALUES (59, 55, 15, 0.0500000007);
INSERT INTO order_details VALUES (10, 31, 36, 0);
INSERT INTO order_details VALUES (28, 45.5999985, 24, 0);
INSERT INTO order_details VALUES (49, 20, 4, 0.150000006);
INSERT INTO order_details VALUES (34, 14, 10, 0);
INSERT INTO order_details VALUES (38, 263.5, 10, 0);
INSERT INTO order_details VALUES (2, 19, 20, 0.25);
INSERT INTO order_details VALUES (65, 21.0499992, 2, 0);
INSERT INTO order_details VALUES (74, 10, 15, 0.25);
INSERT INTO order_details VALUES (40, 18.3999996, 1, 0);
INSERT INTO order_details VALUES (56, 38, 20, 0.150000006);
INSERT INTO order_details VALUES (76, 18, 50, 0.150000006);
INSERT INTO order_details VALUES (52, 7, 20, 0);
INSERT INTO order_details VALUES (13, 6, 7, 0);
INSERT INTO order_details VALUES (25, 14, 5, 0);
INSERT INTO order_details VALUES (70, 15, 5, 0);
INSERT INTO order_details VALUES (19, 9.19999981, 15, 0);
INSERT INTO order_details VALUES (23, 9, 18, 0);
INSERT INTO order_details VALUES (40, 18.3999996, 30, 0);
INSERT INTO order_details VALUES (31, 12.5, 16, 0.100000001);
INSERT INTO order_details VALUES (72, 34.7999992, 40, 0.100000001);
INSERT INTO order_details VALUES (77, 13, 20, 0);
INSERT INTO order_details VALUES (2, 19, 12, 0.200000003);
INSERT INTO order_details VALUES (46, 12, 35, 0);
INSERT INTO order_details VALUES (41, 9.64999962, 20, 0);
INSERT INTO order_details VALUES (43, 46, 20, 0.150000006);
INSERT INTO order_details VALUES (48, 12.75, 8, 0.150000006);
INSERT INTO order_details VALUES (61, 28.5, 30, 0.150000006);
INSERT INTO order_details VALUES (33, 2.5, 16, 0);
INSERT INTO order_details VALUES (38, 263.5, 30, 0.0500000007);
INSERT INTO order_details VALUES (62, 49.2999992, 20, 0.0500000007);
INSERT INTO order_details VALUES (26, 31.2299995, 40, 0.150000006);
INSERT INTO order_details VALUES (38, 263.5, 30, 0);
INSERT INTO order_details VALUES (40, 18.3999996, 60, 0.150000006);
INSERT INTO order_details VALUES (62, 49.2999992, 25, 0.150000006);
INSERT INTO order_details VALUES (32, 32, 20, 0);
INSERT INTO order_details VALUES (41, 9.64999962, 20, 0);
INSERT INTO order_details VALUES (43, 46, 7, 0);
INSERT INTO order_details VALUES (75, 7.75, 20, 0);
INSERT INTO order_details VALUES (56, 38, 30, 0);
INSERT INTO order_details VALUES (35, 18, 20, 0);
INSERT INTO order_details VALUES (51, 53, 6, 0);
INSERT INTO order_details VALUES (62, 49.2999992, 3, 0);
INSERT INTO order_details VALUES (70, 15, 6, 0);
INSERT INTO order_details VALUES (11, 21, 20, 0.100000001);
INSERT INTO order_details VALUES (57, 19.5, 15, 0);
INSERT INTO order_details VALUES (59, 55, 40, 0.100000001);
INSERT INTO order_details VALUES (77, 13, 15, 0.100000001);
INSERT INTO order_details VALUES (41, 9.64999962, 12, 0);
INSERT INTO order_details VALUES (70, 15, 9, 0);
INSERT INTO order_details VALUES (26, 31.2299995, 12, 0);
INSERT INTO order_details VALUES (53, 32.7999992, 20, 0);
INSERT INTO order_details VALUES (31, 12.5, 35, 0);
INSERT INTO order_details VALUES (57, 19.5, 15, 0);
INSERT INTO order_details VALUES (10, 31, 15, 0);
INSERT INTO order_details VALUES (39, 18, 21, 0);
INSERT INTO order_details VALUES (20, 81, 5, 0);
INSERT INTO order_details VALUES (38, 263.5, 2, 0);
INSERT INTO order_details VALUES (2, 19, 10, 0);
INSERT INTO order_details VALUES (8, 40, 20, 0);
INSERT INTO order_details VALUES (13, 6, 10, 0);
INSERT INTO order_details VALUES (60, 34, 21, 0);
INSERT INTO order_details VALUES (6, 25, 6, 0);
INSERT INTO order_details VALUES (39, 18, 28, 0);
INSERT INTO order_details VALUES (60, 34, 30, 0);
INSERT INTO order_details VALUES (68, 12.5, 24, 0);
INSERT INTO order_details VALUES (19, 9.19999981, 2, 0);
INSERT INTO order_details VALUES (35, 18, 8, 0);
INSERT INTO order_details VALUES (38, 263.5, 8, 0);
INSERT INTO order_details VALUES (43, 46, 9, 0);
INSERT INTO order_details VALUES (13, 6, 3, 0.200000003);
INSERT INTO order_details VALUES (25, 14, 10, 0.200000003);
INSERT INTO order_details VALUES (44, 19.4500008, 16, 0.200000003);
INSERT INTO order_details VALUES (64, 33.25, 3, 0);
INSERT INTO order_details VALUES (7, 30, 20, 0.100000001);
INSERT INTO order_details VALUES (31, 12.5, 9, 0.100000001);
INSERT INTO order_details VALUES (53, 32.7999992, 9, 0.100000001);
INSERT INTO order_details VALUES (29, 123.790001, 8, 0.0500000007);
INSERT INTO order_details VALUES (30, 25.8899994, 20, 0.0500000007);
INSERT INTO order_details VALUES (59, 55, 15, 0);
INSERT INTO order_details VALUES (77, 13, 2, 0.200000003);
INSERT INTO order_details VALUES (22, 21, 52, 0);
INSERT INTO order_details VALUES (35, 18, 6, 0);
INSERT INTO order_details VALUES (57, 19.5, 24, 0);
INSERT INTO order_details VALUES (60, 34, 60, 0);
INSERT INTO order_details VALUES (64, 33.25, 30, 0);
INSERT INTO order_details VALUES (13, 6, 6, 0);
INSERT INTO order_details VALUES (40, 18.3999996, 25, 0);
INSERT INTO order_details VALUES (47, 9.5, 40, 0.25);
INSERT INTO order_details VALUES (76, 18, 21, 0.25);
INSERT INTO order_details VALUES (1, 18, 4, 0.25);
INSERT INTO order_details VALUES (18, 62.5, 25, 0.25);
INSERT INTO order_details VALUES (36, 19, 50, 0.25);
INSERT INTO order_details VALUES (58, 13.25, 30, 0.100000001);
INSERT INTO order_details VALUES (72, 34.7999992, 15, 0.100000001);
INSERT INTO order_details VALUES (25, 14, 6, 0.200000003);
INSERT INTO order_details VALUES (39, 18, 10, 0.200000003);
INSERT INTO order_details VALUES (10, 31, 16, 0);
INSERT INTO order_details VALUES (56, 38, 30, 0);
INSERT INTO order_details VALUES (59, 55, 50, 0);
INSERT INTO order_details VALUES (77, 13, 15, 0);
INSERT INTO order_details VALUES (11, 21, 15, 0);
INSERT INTO order_details VALUES (43, 46, 5, 0);
INSERT INTO order_details VALUES (68, 12.5, 20, 0);
INSERT INTO order_details VALUES (70, 15, 12, 0);
INSERT INTO order_details VALUES (51, 53, 4, 0.25);
INSERT INTO order_details VALUES (22, 21, 35, 0);
INSERT INTO order_details VALUES (23, 9, 70, 0.100000001);
INSERT INTO order_details VALUES (35, 18, 25, 0.100000001);
INSERT INTO order_details VALUES (42, 14, 42, 0.100000001);
INSERT INTO order_details VALUES (58, 13.25, 60, 0.100000001);
INSERT INTO order_details VALUES (64, 33.25, 48, 0);
INSERT INTO order_details VALUES (4, 22, 21, 0);
INSERT INTO order_details VALUES (70, 15, 30, 0);
INSERT INTO order_details VALUES (74, 10, 20, 0);
INSERT INTO order_details VALUES (1, 18, 80, 0.200000003);
INSERT INTO order_details VALUES (19, 9.19999981, 12, 0.200000003);
INSERT INTO order_details VALUES (37, 26, 60, 0.200000003);
INSERT INTO order_details VALUES (45, 9.5, 36, 0.200000003);
INSERT INTO order_details VALUES (60, 34, 45, 0.200000003);
INSERT INTO order_details VALUES (71, 21.5, 55, 0.200000003);
INSERT INTO order_details VALUES (5, 21.3500004, 30, 0);
INSERT INTO order_details VALUES (9, 97, 3, 0);
INSERT INTO order_details VALUES (3, 10, 49, 0);
INSERT INTO order_details VALUES (26, 31.2299995, 18, 0.150000006);
INSERT INTO order_details VALUES (25, 14, 20, 0.150000006);
INSERT INTO order_details VALUES (33, 2.5, 4, 0.150000006);
INSERT INTO order_details VALUES (70, 15, 30, 0.150000006);
INSERT INTO order_details VALUES (2, 19, 5, 0.0500000007);
INSERT INTO order_details VALUES (25, 14, 10, 0.0500000007);
INSERT INTO order_details VALUES (57, 19.5, 10, 0.0500000007);
INSERT INTO order_details VALUES (59, 55, 42, 0.0500000007);
INSERT INTO order_details VALUES (2, 19, 15, 0);
INSERT INTO order_details VALUES (17, 39, 6, 0);
INSERT INTO order_details VALUES (62, 49.2999992, 50, 0);
INSERT INTO order_details VALUES (18, 62.5, 10, 0);
INSERT INTO order_details VALUES (10, 31, 100, 0.150000006);
INSERT INTO order_details VALUES (13, 6, 65, 0.150000006);
INSERT INTO order_details VALUES (16, 17.4500008, 50, 0);
INSERT INTO order_details VALUES (31, 12.5, 14, 0);
INSERT INTO order_details VALUES (56, 38, 24, 0);
INSERT INTO order_details VALUES (65, 21.0499992, 15, 0.150000006);
INSERT INTO order_details VALUES (2, 19, 20, 0);
INSERT INTO order_details VALUES (42, 14, 20, 0);
INSERT INTO order_details VALUES (3, 10, 30, 0);
INSERT INTO order_details VALUES (26, 31.2299995, 35, 0.25);
INSERT INTO order_details VALUES (29, 123.790001, 10, 0.25);
INSERT INTO order_details VALUES (7, 30, 5, 0);
INSERT INTO order_details VALUES (27, 43.9000015, 10, 0);
INSERT INTO order_details VALUES (70, 15, 4, 0);
INSERT INTO order_details VALUES (24, 4.5, 40, 0.25);
INSERT INTO order_details VALUES (54, 7.44999981, 35, 0.25);
INSERT INTO order_details VALUES (64, 33.25, 30, 0.25);
INSERT INTO order_details VALUES (51, 53, 3, 0);
INSERT INTO order_details VALUES (76, 18, 20, 0);
INSERT INTO order_details VALUES (17, 39, 42, 0);
INSERT INTO order_details VALUES (18, 62.5, 20, 0);
INSERT INTO order_details VALUES (21, 10, 40, 0);
INSERT INTO order_details VALUES (33, 2.5, 35, 0);
INSERT INTO order_details VALUES (62, 49.2999992, 3, 0);
INSERT INTO order_details VALUES (11, 21, 25, 0);
INSERT INTO order_details VALUES (52, 7, 8, 0);
INSERT INTO order_details VALUES (1, 18, 20, 0.150000006);
INSERT INTO order_details VALUES (58, 13.25, 12, 0.150000006);
INSERT INTO order_details VALUES (35, 18, 4, 0);
INSERT INTO order_details VALUES (67, 14, 15, 0);
INSERT INTO order_details VALUES (38, 263.5, 60, 0.0500000007);
INSERT INTO order_details VALUES (39, 18, 80, 0.0500000007);
INSERT INTO order_details VALUES (2, 19, 21, 0.25);
INSERT INTO order_details VALUES (24, 4.5, 6, 0.25);
INSERT INTO order_details VALUES (30, 25.8899994, 40, 0.25);
INSERT INTO order_details VALUES (53, 32.7999992, 3, 0);
INSERT INTO order_details VALUES (26, 31.2299995, 20, 0);
INSERT INTO order_details VALUES (35, 18, 30, 0);
INSERT INTO order_details VALUES (49, 20, 42, 0.100000001);
INSERT INTO order_details VALUES (1, 18, 40, 0);
INSERT INTO order_details VALUES (11, 21, 10, 0);
INSERT INTO order_details VALUES (23, 9, 50, 0);
INSERT INTO order_details VALUES (68, 12.5, 20, 0);
INSERT INTO order_details VALUES (35, 18, 3, 0);
INSERT INTO order_details VALUES (51, 53, 2, 0);
INSERT INTO order_details VALUES (6, 25, 50, 0.0500000007);
INSERT INTO order_details VALUES (16, 17.4500008, 12, 0.0500000007);
INSERT INTO order_details VALUES (17, 39, 16, 0.0500000007);
INSERT INTO order_details VALUES (55, 24, 10, 0.0500000007);
INSERT INTO order_details VALUES (62, 49.2999992, 20, 0.0500000007);
INSERT INTO order_details VALUES (64, 33.25, 15, 0.0500000007);
INSERT INTO order_details VALUES (65, 21.0499992, 21, 0.0500000007);
INSERT INTO order_details VALUES (21, 10, 20, 0);
INSERT INTO order_details VALUES (28, 45.5999985, 3, 0);
INSERT INTO order_details VALUES (10, 31, 10, 0);
INSERT INTO order_details VALUES (19, 9.19999981, 25, 0);
INSERT INTO order_details VALUES (47, 9.5, 21, 0.100000001);
INSERT INTO order_details VALUES (49, 20, 15, 0);
INSERT INTO order_details VALUES (46, 12, 21, 0);
INSERT INTO order_details VALUES (64, 33.25, 20, 0);
INSERT INTO order_details VALUES (16, 17.4500008, 30, 0.25);
INSERT INTO order_details VALUES (18, 62.5, 25, 0);
INSERT INTO order_details VALUES (20, 81, 20, 0.0500000007);
INSERT INTO order_details VALUES (40, 18.3999996, 12, 0);
INSERT INTO order_details VALUES (65, 21.0499992, 10, 0);
INSERT INTO order_details VALUES (76, 18, 10, 0);
INSERT INTO order_details VALUES (23, 9, 30, 0.200000003);
INSERT INTO order_details VALUES (61, 28.5, 30, 0.200000003);
INSERT INTO order_details VALUES (70, 15, 50, 0.200000003);
INSERT INTO order_details VALUES (73, 15, 10, 0);
INSERT INTO order_details VALUES (42, 14, 25, 0);
INSERT INTO order_details VALUES (49, 20, 20, 0.150000006);
INSERT INTO order_details VALUES (54, 7.44999981, 32, 0.150000006);
INSERT INTO order_details VALUES (24, 4.5, 8, 0);
INSERT INTO order_details VALUES (21, 10, 40, 0.0500000007);
INSERT INTO order_details VALUES (56, 38, 21, 0.0500000007);
INSERT INTO order_details VALUES (65, 21.0499992, 12, 0.0500000007);
INSERT INTO order_details VALUES (2, 19, 20, 0);
INSERT INTO order_details VALUES (24, 4.5, 12, 0);
INSERT INTO order_details VALUES (70, 15, 30, 0);
INSERT INTO order_details VALUES (77, 13, 25, 0);
INSERT INTO order_details VALUES (10, 31, 70, 0);
INSERT INTO order_details VALUES (31, 12.5, 35, 0);
INSERT INTO order_details VALUES (77, 13, 40, 0);
INSERT INTO order_details VALUES (25, 14, 5, 0);
INSERT INTO order_details VALUES (2, 19, 20, 0);
INSERT INTO order_details VALUES (68, 12.5, 18, 0);
INSERT INTO order_details VALUES (11, 21, 40, 0);
INSERT INTO order_details VALUES (38, 263.5, 40, 0);
INSERT INTO order_details VALUES (17, 39, 15, 0);
INSERT INTO order_details VALUES (34, 14, 10, 0);
INSERT INTO order_details VALUES (41, 9.64999962, 14, 0);
INSERT INTO order_details VALUES (30, 25.8899994, 15, 0.0500000007);
INSERT INTO order_details VALUES (59, 55, 40, 0.0500000007);
INSERT INTO order_details VALUES (8, 40, 30, 0);
INSERT INTO order_details VALUES (24, 4.5, 10, 0);
INSERT INTO order_details VALUES (29, 123.790001, 24, 0);
INSERT INTO order_details VALUES (30, 25.8899994, 35, 0);
INSERT INTO order_details VALUES (36, 19, 20, 0);
INSERT INTO order_details VALUES (13, 6, 28, 0.0500000007);
INSERT INTO order_details VALUES (69, 36, 50, 0.0500000007);
INSERT INTO order_details VALUES (75, 7.75, 120, 0.0500000007);
INSERT INTO order_details VALUES (24, 4.5, 110, 0);
INSERT INTO order_details VALUES (39, 18, 45, 0);
INSERT INTO order_details VALUES (40, 18.3999996, 91, 0);
INSERT INTO order_details VALUES (60, 34, 100, 0);
INSERT INTO order_details VALUES (45, 9.5, 15, 0);
INSERT INTO order_details VALUES (56, 38, 16, 0);
INSERT INTO order_details VALUES (29, 123.790001, 80, 0);
INSERT INTO order_details VALUES (30, 25.8899994, 36, 0);
INSERT INTO order_details VALUES (13, 6, 5, 0);
INSERT INTO order_details VALUES (39, 18, 8, 0.150000006);
INSERT INTO order_details VALUES (70, 15, 3, 0.25);
INSERT INTO order_details VALUES (41, 9.64999962, 30, 0);
INSERT INTO order_details VALUES (71, 21.5, 30, 0);
INSERT INTO order_details VALUES (55, 24, 30, 0.150000006);
INSERT INTO order_details VALUES (62, 49.2999992, 6, 0.150000006);
INSERT INTO order_details VALUES (13, 6, 40, 0);
INSERT INTO order_details VALUES (65, 21.0499992, 21, 0);
INSERT INTO order_details VALUES (68, 12.5, 20, 0);
INSERT INTO order_details VALUES (58, 13.25, 15, 0);
INSERT INTO order_details VALUES (62, 49.2999992, 35, 0);
INSERT INTO order_details VALUES (1, 18, 20, 0.0500000007);
INSERT INTO order_details VALUES (61, 28.5, 15, 0);
INSERT INTO order_details VALUES (75, 7.75, 14, 0);
INSERT INTO order_details VALUES (7, 30, 20, 0.0500000007);
INSERT INTO order_details VALUES (52, 7, 14, 0.0500000007);
INSERT INTO order_details VALUES (7, 30, 12, 0);
INSERT INTO order_details VALUES (16, 17.4500008, 15, 0);
INSERT INTO order_details VALUES (41, 9.64999962, 5, 0);
INSERT INTO order_details VALUES (19, 9.19999981, 12, 0);
INSERT INTO order_details VALUES (49, 20, 10, 0);
INSERT INTO order_details VALUES (61, 28.5, 5, 0);
INSERT INTO order_details VALUES (1, 18, 10, 0);
INSERT INTO order_details VALUES (17, 39, 12, 0);
INSERT INTO order_details VALUES (67, 14, 15, 0);
INSERT INTO order_details VALUES (11, 21, 40, 0.25);
INSERT INTO order_details VALUES (29, 123.790001, 60, 0.25);
INSERT INTO order_details VALUES (4, 22, 30, 0.25);
INSERT INTO order_details VALUES (33, 2.5, 40, 0.25);
INSERT INTO order_details VALUES (58, 13.25, 15, 0);
INSERT INTO order_details VALUES (71, 21.5, 25, 0);
INSERT INTO order_details VALUES (17, 39, 10, 0);
INSERT INTO order_details VALUES (33, 2.5, 30, 0);
INSERT INTO order_details VALUES (54, 7.44999981, 10, 0);
INSERT INTO order_details VALUES (16, 17.4500008, 6, 0);
INSERT INTO order_details VALUES (32, 32, 6, 0);
INSERT INTO order_details VALUES (57, 19.5, 20, 0);
INSERT INTO order_details VALUES (30, 25.8899994, 1, 0);
INSERT INTO order_details VALUES (60, 34, 10, 0);
INSERT INTO order_details VALUES (1, 18, 60, 0.25);
INSERT INTO order_details VALUES (60, 34, 25, 0.25);
INSERT INTO order_details VALUES (16, 17.4500008, 24, 0);
INSERT INTO order_details VALUES (25, 14, 24, 0);
INSERT INTO order_details VALUES (40, 18.3999996, 20, 0);
INSERT INTO order_details VALUES (50, 16.25, 24, 0);
INSERT INTO order_details VALUES (35, 18, 10, 0);
INSERT INTO order_details VALUES (63, 43.9000015, 40, 0);
INSERT INTO order_details VALUES (17, 39, 15, 0);
INSERT INTO order_details VALUES (24, 4.5, 35, 0);
INSERT INTO order_details VALUES (42, 14, 10, 0.200000003);
INSERT INTO order_details VALUES (43, 46, 10, 0.200000003);
INSERT INTO order_details VALUES (67, 14, 24, 0.200000003);
INSERT INTO order_details VALUES (10, 31, 20, 0.100000001);
INSERT INTO order_details VALUES (28, 45.5999985, 30, 0.100000001);
INSERT INTO order_details VALUES (75, 7.75, 6, 0);
INSERT INTO order_details VALUES (36, 19, 25, 0.150000006);
INSERT INTO order_details VALUES (52, 7, 12, 0.150000006);
INSERT INTO order_details VALUES (11, 21, 2, 0);
INSERT INTO order_details VALUES (13, 6, 10, 0);
INSERT INTO order_details VALUES (19, 9.19999981, 7, 0);
INSERT INTO order_details VALUES (72, 34.7999992, 10, 0);
INSERT INTO order_details VALUES (20, 81, 5, 0);
INSERT INTO order_details VALUES (52, 7, 5, 0);
INSERT INTO order_details VALUES (76, 18, 20, 0);
INSERT INTO order_details VALUES (47, 9.5, 5, 0);
INSERT INTO order_details VALUES (76, 18, 5, 0);
INSERT INTO order_details VALUES (21, 10, 60, 0);
INSERT INTO order_details VALUES (75, 7.75, 49, 0);
INSERT INTO order_details VALUES (77, 13, 15, 0);
INSERT INTO order_details VALUES (21, 10, 36, 0);
INSERT INTO order_details VALUES (27, 43.9000015, 25, 0);
INSERT INTO order_details VALUES (55, 24, 25, 0.200000003);
INSERT INTO order_details VALUES (58, 13.25, 30, 0.200000003);
INSERT INTO order_details VALUES (13, 6, 42, 0.150000006);
INSERT INTO order_details VALUES (57, 19.5, 30, 0);
INSERT INTO order_details VALUES (16, 17.4500008, 30, 0.100000001);
INSERT INTO order_details VALUES (62, 49.2999992, 14, 0.100000001);
INSERT INTO order_details VALUES (72, 34.7999992, 16, 0);
INSERT INTO order_details VALUES (75, 7.75, 20, 0.100000001);
INSERT INTO order_details VALUES (53, 32.7999992, 2, 0);
INSERT INTO order_details VALUES (61, 28.5, 30, 0);
INSERT INTO order_details VALUES (6, 25, 20, 0);
INSERT INTO order_details VALUES (1, 18, 21, 0);
INSERT INTO order_details VALUES (18, 62.5, 4, 0.25);
INSERT INTO order_details VALUES (23, 9, 8, 0.25);
INSERT INTO order_details VALUES (36, 19, 30, 0.200000003);
INSERT INTO order_details VALUES (28, 45.5999985, 8, 0);
INSERT INTO order_details VALUES (34, 14, 20, 0);
INSERT INTO order_details VALUES (13, 6, 20, 0.25);
INSERT INTO order_details VALUES (43, 46, 24, 0.25);
INSERT INTO order_details VALUES (60, 34, 49, 0.25);
INSERT INTO order_details VALUES (71, 21.5, 35, 0.25);
INSERT INTO order_details VALUES (2, 19, 10, 0.150000006);
INSERT INTO order_details VALUES (67, 14, 40, 0.150000006);
INSERT INTO order_details VALUES (7, 30, 8, 0);
INSERT INTO order_details VALUES (13, 6, 20, 0);
INSERT INTO order_details VALUES (31, 12.5, 44, 0.25);
INSERT INTO order_details VALUES (62, 49.2999992, 30, 0.25);
INSERT INTO order_details VALUES (68, 12.5, 80, 0.25);
INSERT INTO order_details VALUES (72, 34.7999992, 50, 0);
INSERT INTO order_details VALUES (49, 20, 28, 0);
INSERT INTO order_details VALUES (13, 6, 15, 0);
INSERT INTO order_details VALUES (22, 21, 21, 0);
INSERT INTO order_details VALUES (46, 12, 15, 0);
INSERT INTO order_details VALUES (11, 21, 5, 0.25);
INSERT INTO order_details VALUES (44, 19.4500008, 18, 0.25);
INSERT INTO order_details VALUES (56, 38, 18, 0);
INSERT INTO order_details VALUES (13, 6, 20, 0);
INSERT INTO order_details VALUES (31, 12.5, 10, 0);
INSERT INTO order_details VALUES (10, 31, 25, 0);
INSERT INTO order_details VALUES (24, 4.5, 25, 0);
INSERT INTO order_details VALUES (77, 13, 40, 0);
INSERT INTO order_details VALUES (59, 55, 4, 0);
INSERT INTO order_details VALUES (50, 16.25, 9, 0);
INSERT INTO order_details VALUES (51, 53, 40, 0);
INSERT INTO order_details VALUES (55, 24, 4, 0);
INSERT INTO order_details VALUES (6, 25, 12, 0);
INSERT INTO order_details VALUES (10, 31, 30, 0);
INSERT INTO order_details VALUES (17, 39, 6, 0);
INSERT INTO order_details VALUES (62, 49.2999992, 60, 0);
INSERT INTO order_details VALUES (4, 22, 5, 0);
INSERT INTO order_details VALUES (33, 2.5, 15, 0.0500000007);
INSERT INTO order_details VALUES (41, 9.64999962, 6, 0.0500000007);
INSERT INTO order_details VALUES (75, 7.75, 50, 0.0500000007);
INSERT INTO order_details VALUES (6, 25, 16, 0.0500000007);
INSERT INTO order_details VALUES (28, 45.5999985, 2, 0);
INSERT INTO order_details VALUES (20, 81, 50, 0.0500000007);
INSERT INTO order_details VALUES (31, 12.5, 50, 0.0500000007);
INSERT INTO order_details VALUES (16, 17.4500008, 28, 0.150000006);
INSERT INTO order_details VALUES (31, 12.5, 25, 0.150000006);
INSERT INTO order_details VALUES (45, 9.5, 30, 0);
INSERT INTO order_details VALUES (60, 34, 24, 0.150000006);
INSERT INTO order_details VALUES (75, 7.75, 12, 0.200000003);
INSERT INTO order_details VALUES (21, 10, 12, 0);
INSERT INTO order_details VALUES (47, 9.5, 14, 0);
INSERT INTO order_details VALUES (51, 53, 8, 0);
INSERT INTO order_details VALUES (30, 25.8899994, 30, 0);
INSERT INTO order_details VALUES (35, 18, 40, 0);
INSERT INTO order_details VALUES (64, 33.25, 8, 0);
INSERT INTO order_details VALUES (5, 21.3500004, 20, 0);
INSERT INTO order_details VALUES (7, 30, 6, 0);
INSERT INTO order_details VALUES (72, 34.7999992, 5, 0);
INSERT INTO order_details VALUES (75, 7.75, 20, 0.150000006);
INSERT INTO order_details VALUES (24, 4.5, 10, 0.25);
INSERT INTO order_details VALUES (41, 9.64999962, 24, 0);
INSERT INTO order_details VALUES (52, 7, 6, 0.0500000007);
INSERT INTO order_details VALUES (76, 18, 60, 0);
INSERT INTO order_details VALUES (7, 30, 45, 0);
INSERT INTO order_details VALUES (13, 6, 77, 0);
INSERT INTO order_details VALUES (53, 32.7999992, 20, 0);
INSERT INTO order_details VALUES (69, 36, 9, 0);
INSERT INTO order_details VALUES (76, 18, 44, 0);
INSERT INTO order_details VALUES (60, 34, 2, 0.150000006);
INSERT INTO order_details VALUES (18, 62.5, 6, 0);
INSERT INTO order_details VALUES (38, 263.5, 5, 0);
INSERT INTO order_details VALUES (69, 36, 10, 0);
INSERT INTO order_details VALUES (51, 53, 16, 0);
INSERT INTO order_details VALUES (37, 26, 8, 0);
INSERT INTO order_details VALUES (56, 38, 12, 0.150000006);
INSERT INTO order_details VALUES (62, 49.2999992, 12, 0.150000006);
INSERT INTO order_details VALUES (19, 9.19999981, 12, 0);
INSERT INTO order_details VALUES (49, 20, 40, 0);
INSERT INTO order_details VALUES (12, 38, 30, 0);
INSERT INTO order_details VALUES (24, 4.5, 30, 0);
INSERT INTO order_details VALUES (64, 33.25, 4, 0);
INSERT INTO order_details VALUES (46, 12, 9, 0);
INSERT INTO order_details VALUES (52, 7, 40, 0.200000003);
INSERT INTO order_details VALUES (29, 123.790001, 14, 0);
INSERT INTO order_details VALUES (17, 39, 6, 0);
INSERT INTO order_details VALUES (33, 2.5, 7, 0);
INSERT INTO order_details VALUES (26, 31.2299995, 5, 0);
INSERT INTO order_details VALUES (41, 9.64999962, 6, 0);
INSERT INTO order_details VALUES (75, 7.75, 10, 0);
INSERT INTO order_details VALUES (63, 43.9000015, 10, 0);
INSERT INTO order_details VALUES (8, 40, 16, 0);
INSERT INTO order_details VALUES (75, 7.75, 10, 0);
INSERT INTO order_details VALUES (28, 45.5999985, 20, 0);
INSERT INTO order_details VALUES (39, 18, 30, 0);
INSERT INTO order_details VALUES (47, 9.5, 30, 0);
INSERT INTO order_details VALUES (51, 53, 10, 0);
INSERT INTO order_details VALUES (63, 43.9000015, 20, 0);
INSERT INTO order_details VALUES (8, 40, 20, 0.150000006);
INSERT INTO order_details VALUES (21, 10, 40, 0.150000006);
INSERT INTO order_details VALUES (40, 18.3999996, 10, 0);
INSERT INTO order_details VALUES (44, 19.4500008, 6, 0.150000006);
INSERT INTO order_details VALUES (7, 30, 18, 0);
INSERT INTO order_details VALUES (12, 38, 20, 0);
INSERT INTO order_details VALUES (24, 4.5, 80, 0);
INSERT INTO order_details VALUES (27, 43.9000015, 30, 0);
INSERT INTO order_details VALUES (31, 12.5, 24, 0);
INSERT INTO order_details VALUES (63, 43.9000015, 35, 0);
INSERT INTO order_details VALUES (75, 7.75, 40, 0.200000003);
INSERT INTO order_details VALUES (38, 263.5, 60, 0);
INSERT INTO order_details VALUES (7, 30, 20, 0);
INSERT INTO order_details VALUES (43, 46, 9, 0);
INSERT INTO order_details VALUES (13, 6, 84, 0.150000006);
INSERT INTO order_details VALUES (57, 19.5, 15, 0);
INSERT INTO order_details VALUES (16, 17.4500008, 55, 0);
INSERT INTO order_details VALUES (24, 4.5, 20, 0);
INSERT INTO order_details VALUES (36, 19, 40, 0);
INSERT INTO order_details VALUES (16, 17.4500008, 36, 0.100000001);
INSERT INTO order_details VALUES (18, 62.5, 8, 0.100000001);
INSERT INTO order_details VALUES (32, 32, 35, 0.100000001);
INSERT INTO order_details VALUES (11, 21, 30, 0);
INSERT INTO order_details VALUES (20, 81, 15, 0);
INSERT INTO order_details VALUES (76, 18, 10, 0);
INSERT INTO order_details VALUES (77, 13, 15, 0);
INSERT INTO order_details VALUES (7, 30, 60, 0);
INSERT INTO order_details VALUES (43, 46, 6, 0);
INSERT INTO order_details VALUES (72, 34.7999992, 20, 0);
INSERT INTO order_details VALUES (7, 30, 60, 0);
INSERT INTO order_details VALUES (62, 49.2999992, 40, 0.100000001);
INSERT INTO order_details VALUES (6, 25, 40, 0);
INSERT INTO order_details VALUES (11, 21, 15, 0);
INSERT INTO order_details VALUES (41, 9.64999962, 4, 0);
INSERT INTO order_details VALUES (21, 10, 65, 0);
INSERT INTO order_details VALUES (34, 14, 60, 0.150000006);
INSERT INTO order_details VALUES (55, 24, 65, 0.150000006);
INSERT INTO order_details VALUES (61, 28.5, 66, 0.150000006);
INSERT INTO order_details VALUES (2, 19, 50, 0.200000003);
INSERT INTO order_details VALUES (70, 15, 20, 0.200000003);
INSERT INTO order_details VALUES (76, 18, 90, 0.200000003);
INSERT INTO order_details VALUES (72, 34.7999992, 2, 0);
INSERT INTO order_details VALUES (29, 123.790001, 50, 0.25);
INSERT INTO order_details VALUES (41, 9.64999962, 35, 0.25);
INSERT INTO order_details VALUES (59, 55, 18, 0.0500000007);
INSERT INTO order_details VALUES (51, 53, 20, 0);
INSERT INTO order_details VALUES (60, 34, 4, 0);
INSERT INTO order_details VALUES (42, 14, 40, 0);
INSERT INTO order_details VALUES (32, 32, 50, 0);
INSERT INTO order_details VALUES (46, 12, 20, 0.25);
INSERT INTO order_details VALUES (52, 7, 20, 0.25);
INSERT INTO order_details VALUES (24, 4.5, 12, 0);
INSERT INTO order_details VALUES (61, 28.5, 7, 0);
INSERT INTO order_details VALUES (74, 10, 20, 0);
INSERT INTO order_details VALUES (75, 7.75, 30, 0);
INSERT INTO order_details VALUES (41, 9.64999962, 20, 0.0500000007);
INSERT INTO order_details VALUES (51, 53, 15, 0.0500000007);
INSERT INTO order_details VALUES (77, 13, 21, 0.0500000007);
INSERT INTO order_details VALUES (4, 22, 25, 0.25);
INSERT INTO order_details VALUES (24, 4.5, 30, 0.25);
INSERT INTO order_details VALUES (77, 13, 30, 0);
INSERT INTO order_details VALUES (7, 30, 60, 0);
INSERT INTO order_details VALUES (22, 21, 25, 0);
INSERT INTO order_details VALUES (46, 12, 25, 0);
INSERT INTO order_details VALUES (55, 24, 6, 0);
INSERT INTO order_details VALUES (13, 6, 56, 0);
INSERT INTO order_details VALUES (35, 18, 15, 0.150000006);
INSERT INTO order_details VALUES (42, 14, 24, 0.150000006);
INSERT INTO order_details VALUES (55, 24, 40, 0);
INSERT INTO order_details VALUES (1, 18, 4, 0);
INSERT INTO order_details VALUES (40, 18.3999996, 10, 0);
INSERT INTO order_details VALUES (52, 7, 10, 0);
INSERT INTO order_details VALUES (26, 31.2299995, 6, 0);
INSERT INTO order_details VALUES (76, 18, 6, 0);
INSERT INTO order_details VALUES (1, 18, 2, 0);
INSERT INTO order_details VALUES (59, 55, 10, 0);
INSERT INTO order_details VALUES (1, 18, 8, 0);
INSERT INTO order_details VALUES (29, 123.790001, 2, 0.25);
INSERT INTO order_details VALUES (8, 40, 30, 0);
INSERT INTO order_details VALUES (29, 123.790001, 10, 0);
INSERT INTO order_details VALUES (42, 14, 14, 0);
INSERT INTO order_details VALUES (28, 45.5999985, 70, 0.0500000007);
INSERT INTO order_details VALUES (34, 14, 90, 0.0500000007);
INSERT INTO order_details VALUES (71, 21.5, 21, 0);
INSERT INTO order_details VALUES (24, 4.5, 12, 0);
INSERT INTO order_details VALUES (36, 19, 18, 0.25);
INSERT INTO order_details VALUES (60, 34, 9, 0);
INSERT INTO order_details VALUES (7, 30, 20, 0);
INSERT INTO order_details VALUES (24, 4.5, 10, 0);
INSERT INTO order_details VALUES (58, 13.25, 40, 0.0500000007);
INSERT INTO order_details VALUES (71, 21.5, 20, 0);
INSERT INTO order_details VALUES (19, 9.19999981, 50, 0.0500000007);
INSERT INTO order_details VALUES (60, 34, 36, 0.0500000007);
INSERT INTO order_details VALUES (71, 21.5, 60, 0.0500000007);
INSERT INTO order_details VALUES (23, 9, 10, 0);
INSERT INTO order_details VALUES (42, 14, 4, 0);
INSERT INTO order_details VALUES (45, 9.5, 20, 0);
INSERT INTO order_details VALUES (68, 12.5, 2, 0);
INSERT INTO order_details VALUES (41, 9.64999962, 28, 0.100000001);
INSERT INTO order_details VALUES (30, 25.8899994, 15, 0);
INSERT INTO order_details VALUES (77, 13, 18, 0);
INSERT INTO order_details VALUES (31, 12.5, 15, 0);
INSERT INTO order_details VALUES (36, 19, 16, 0);
INSERT INTO order_details VALUES (3, 10, 25, 0);
INSERT INTO order_details VALUES (59, 55, 110, 0);
INSERT INTO order_details VALUES (70, 15, 30, 0);
INSERT INTO order_details VALUES (12, 38, 20, 0);
INSERT INTO order_details VALUES (18, 62.5, 10, 0);
INSERT INTO order_details VALUES (56, 38, 5, 0);
INSERT INTO order_details VALUES (46, 12, 3, 0);
INSERT INTO order_details VALUES (49, 20, 2, 0);
INSERT INTO order_details VALUES (10, 31, 24, 0.150000006);
INSERT INTO order_details VALUES (2, 19, 11, 0.25);
INSERT INTO order_details VALUES (20, 81, 15, 0);
INSERT INTO order_details VALUES (26, 31.2299995, 63, 0);
INSERT INTO order_details VALUES (51, 53, 44, 0.25);
INSERT INTO order_details VALUES (72, 34.7999992, 35, 0);
INSERT INTO order_details VALUES (19, 9.19999981, 35, 0);
INSERT INTO order_details VALUES (69, 36, 30, 0);
INSERT INTO order_details VALUES (7, 30, 4, 0);
INSERT INTO order_details VALUES (43, 46, 30, 0);
INSERT INTO order_details VALUES (26, 31.2299995, 12, 0);
INSERT INTO order_details VALUES (33, 2.5, 30, 0);
INSERT INTO order_details VALUES (65, 21.0499992, 21, 0);
INSERT INTO order_details VALUES (71, 21.5, 50, 0);
INSERT INTO order_details VALUES (1, 18, 10, 0.100000001);
INSERT INTO order_details VALUES (13, 6, 20, 0.100000001);
INSERT INTO order_details VALUES (18, 62.5, 8, 0);
INSERT INTO order_details VALUES (51, 53, 10, 0);
INSERT INTO order_details VALUES (24, 4.5, 30, 0.25);
INSERT INTO order_details VALUES (62, 49.2999992, 21, 0.25);
INSERT INTO order_details VALUES (55, 24, 35, 0);
INSERT INTO order_details VALUES (59, 55, 24, 0);
INSERT INTO order_details VALUES (56, 38, 20, 0);
INSERT INTO order_details VALUES (63, 43.9000015, 12, 0);
INSERT INTO order_details VALUES (2, 19, 100, 0.25);
INSERT INTO order_details VALUES (5, 21.3500004, 70, 0);
INSERT INTO order_details VALUES (29, 123.790001, 60, 0.25);
INSERT INTO order_details VALUES (59, 55, 100, 0.25);
INSERT INTO order_details VALUES (1, 18, 45, 0);
INSERT INTO order_details VALUES (13, 6, 80, 0);
INSERT INTO order_details VALUES (24, 4.5, 21, 0);
INSERT INTO order_details VALUES (64, 33.25, 20, 0);
INSERT INTO order_details VALUES (71, 21.5, 16, 0);
INSERT INTO order_details VALUES (36, 19, 35, 0);
INSERT INTO order_details VALUES (38, 263.5, 25, 0);
INSERT INTO order_details VALUES (59, 55, 30, 0);
INSERT INTO order_details VALUES (53, 32.7999992, 70, 0.100000001);
INSERT INTO order_details VALUES (69, 36, 36, 0.100000001);
INSERT INTO order_details VALUES (21, 10, 15, 0.100000001);
INSERT INTO order_details VALUES (44, 19.4500008, 12, 0);
INSERT INTO order_details VALUES (61, 28.5, 6, 0);
INSERT INTO order_details VALUES (1, 18, 10, 0);
INSERT INTO order_details VALUES (35, 18, 60, 0);
INSERT INTO order_details VALUES (42, 14, 30, 0);
INSERT INTO order_details VALUES (54, 7.44999981, 10, 0);
INSERT INTO order_details VALUES (13, 6, 7, 0);
INSERT INTO order_details VALUES (59, 55, 30, 0);
INSERT INTO order_details VALUES (70, 15, 4, 0);
INSERT INTO order_details VALUES (40, 18.3999996, 5, 0.200000003);
INSERT INTO order_details VALUES (52, 7, 2, 0);
INSERT INTO order_details VALUES (71, 21.5, 30, 0);
INSERT INTO order_details VALUES (28, 45.5999985, 20, 0);
INSERT INTO order_details VALUES (35, 18, 24, 0);
INSERT INTO order_details VALUES (49, 20, 60, 0);
INSERT INTO order_details VALUES (57, 19.5, 28, 0);
INSERT INTO order_details VALUES (21, 10, 20, 0);
INSERT INTO order_details VALUES (2, 19, 30, 0.200000003);
INSERT INTO order_details VALUES (63, 43.9000015, 30, 0);
INSERT INTO order_details VALUES (44, 19.4500008, 15, 0);
INSERT INTO order_details VALUES (61, 28.5, 4, 0);
INSERT INTO order_details VALUES (11, 21, 10, 0);
INSERT INTO order_details VALUES (62, 49.2999992, 12, 0);
INSERT INTO order_details VALUES (33, 2.5, 15, 0);
INSERT INTO order_details VALUES (51, 53, 24, 0);
INSERT INTO order_details VALUES (12, 38, 20, 0.0500000007);
INSERT INTO order_details VALUES (32, 32, 15, 0.0500000007);
INSERT INTO order_details VALUES (35, 18, 18, 0.0500000007);
INSERT INTO order_details VALUES (1, 18, 25, 0.25);
INSERT INTO order_details VALUES (5, 21.3500004, 30, 0.25);
INSERT INTO order_details VALUES (68, 12.5, 42, 0);
INSERT INTO order_details VALUES (2, 19, 10, 0.200000003);
INSERT INTO order_details VALUES (12, 38, 4, 0.200000003);
INSERT INTO order_details VALUES (76, 18, 50, 0.100000001);
INSERT INTO order_details VALUES (24, 4.5, 10, 0.200000003);
INSERT INTO order_details VALUES (43, 46, 30, 0.200000003);
INSERT INTO order_details VALUES (61, 28.5, 10, 0.200000003);
INSERT INTO order_details VALUES (18, 62.5, 35, 0.200000003);
INSERT INTO order_details VALUES (32, 32, 20, 0);
INSERT INTO order_details VALUES (64, 33.25, 25, 0.200000003);
INSERT INTO order_details VALUES (33, 2.5, 10, 0);
INSERT INTO order_details VALUES (67, 14, 20, 0);
INSERT INTO order_details VALUES (24, 4.5, 15, 0);
INSERT INTO order_details VALUES (25, 14, 15, 0);
INSERT INTO order_details VALUES (51, 53, 20, 0);
INSERT INTO order_details VALUES (57, 19.5, 20, 0);
INSERT INTO order_details VALUES (7, 30, 40, 0);
INSERT INTO order_details VALUES (55, 24, 35, 0);
INSERT INTO order_details VALUES (60, 34, 50, 0);
INSERT INTO order_details VALUES (70, 15, 3, 0);
INSERT INTO order_details VALUES (21, 10, 3, 0);
INSERT INTO order_details VALUES (60, 34, 21, 0);
INSERT INTO order_details VALUES (61, 28.5, 4, 0);
INSERT INTO order_details VALUES (13, 6, 30, 0);
INSERT INTO order_details VALUES (17, 39, 12, 0);
INSERT INTO order_details VALUES (60, 34, 35, 0);
INSERT INTO order_details VALUES (60, 34, 4, 0);
INSERT INTO order_details VALUES (77, 13, 10, 0);
INSERT INTO order_details VALUES (60, 34, 15, 0);
INSERT INTO order_details VALUES (53, 32.7999992, 10, 0.200000003);
INSERT INTO order_details VALUES (70, 15, 12, 0.200000003);
INSERT INTO order_details VALUES (34, 14, 30, 0);
INSERT INTO order_details VALUES (40, 18.3999996, 40, 0.100000001);
INSERT INTO order_details VALUES (41, 9.64999962, 30, 0.100000001);
INSERT INTO order_details VALUES (17, 39, 77, 0.100000001);
INSERT INTO order_details VALUES (41, 9.64999962, 12, 0);
INSERT INTO order_details VALUES (53, 32.7999992, 25, 0.100000001);
INSERT INTO order_details VALUES (55, 24, 4, 0.100000001);
INSERT INTO order_details VALUES (68, 12.5, 55, 0);
INSERT INTO order_details VALUES (30, 25.8899994, 4, 0.25);
INSERT INTO order_details VALUES (54, 7.44999981, 20, 0.25);
INSERT INTO order_details VALUES (16, 17.4500008, 3, 0);
INSERT INTO order_details VALUES (19, 9.19999981, 42, 0);
INSERT INTO order_details VALUES (34, 14, 35, 0);
INSERT INTO order_details VALUES (41, 9.64999962, 9, 0);
INSERT INTO order_details VALUES (28, 45.5999985, 8, 0.150000006);
INSERT INTO order_details VALUES (43, 46, 36, 0.150000006);
INSERT INTO order_details VALUES (77, 13, 28, 0.150000006);
INSERT INTO order_details VALUES (39, 18, 20, 0);
INSERT INTO order_details VALUES (1, 18, 40, 0.150000006);
INSERT INTO order_details VALUES (2, 19, 20, 0.150000006);
INSERT INTO order_details VALUES (16, 17.4500008, 30, 0.150000006);
INSERT INTO order_details VALUES (31, 12.5, 20, 0);
INSERT INTO order_details VALUES (7, 30, 15, 0.0500000007);
INSERT INTO order_details VALUES (13, 6, 10, 0.0500000007);
INSERT INTO order_details VALUES (2, 19, 8, 0);
INSERT INTO order_details VALUES (41, 9.64999962, 40, 0);
INSERT INTO order_details VALUES (50, 16.25, 22, 0);
INSERT INTO order_details VALUES (64, 33.25, 130, 0);
INSERT INTO order_details VALUES (11, 21, 10, 0);
INSERT INTO order_details VALUES (24, 4.5, 20, 0);
INSERT INTO order_details VALUES (16, 17.4500008, 14, 0.0500000007);
INSERT INTO order_details VALUES (2, 19, 10, 0.150000006);
INSERT INTO order_details VALUES (46, 12, 30, 0.150000006);
INSERT INTO order_details VALUES (76, 18, 2, 0.150000006);
INSERT INTO order_details VALUES (6, 25, 20, 0.25);
INSERT INTO order_details VALUES (14, 23.25, 20, 0.25);
INSERT INTO order_details VALUES (19, 9.19999981, 10, 0.25);
INSERT INTO order_details VALUES (2, 19, 24, 0.200000003);
INSERT INTO order_details VALUES (3, 10, 4, 0);
INSERT INTO order_details VALUES (4, 22, 1, 0);
INSERT INTO order_details VALUES (6, 25, 1, 0.0199999996);
INSERT INTO order_details VALUES (7, 30, 1, 0.0500000007);
INSERT INTO order_details VALUES (8, 40, 2, 0.100000001);
INSERT INTO order_details VALUES (10, 31, 1, 0);
INSERT INTO order_details VALUES (12, 38, 2, 0.0500000007);
INSERT INTO order_details VALUES (13, 6, 4, 0);
INSERT INTO order_details VALUES (14, 23.25, 1, 0.0299999993);
INSERT INTO order_details VALUES (16, 17.4500008, 2, 0.0299999993);
INSERT INTO order_details VALUES (20, 81, 1, 0.0399999991);
INSERT INTO order_details VALUES (23, 9, 2, 0);
INSERT INTO order_details VALUES (32, 32, 1, 0);
INSERT INTO order_details VALUES (39, 18, 2, 0.0500000007);
INSERT INTO order_details VALUES (41, 9.64999962, 3, 0);
INSERT INTO order_details VALUES (46, 12, 3, 0.0199999996);
INSERT INTO order_details VALUES (52, 7, 2, 0);
INSERT INTO order_details VALUES (55, 24, 2, 0);
INSERT INTO order_details VALUES (60, 34, 2, 0.0599999987);
INSERT INTO order_details VALUES (64, 33.25, 2, 0.0299999993);
INSERT INTO order_details VALUES (66, 17, 1, 0);
INSERT INTO order_details VALUES (73, 15, 2, 0.00999999978);
INSERT INTO order_details VALUES (75, 7.75, 4, 0);
INSERT INTO order_details VALUES (77, 13, 2, 0);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO orders VALUES ('VINET', 5, '1996-07-04', '1996-08-01', '1996-07-16', 3, 32.3800011, 'Vins et alcools Chevalier', '59 rue de l''Abbaye', 'Reims', NULL, '51100', 'France');
INSERT INTO orders VALUES ('TOMSP', 6, '1996-07-05', '1996-08-16', '1996-07-10', 1, 11.6099997, 'Toms Spezialitäten', 'Luisenstr. 48', 'Münster', NULL, '44087', 'Germany');
INSERT INTO orders VALUES ('HANAR', 4, '1996-07-08', '1996-08-05', '1996-07-12', 2, 65.8300018, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO orders VALUES ('VICTE', 3, '1996-07-08', '1996-08-05', '1996-07-15', 1, 41.3400002, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France');
INSERT INTO orders VALUES ('SUPRD', 4, '1996-07-09', '1996-08-06', '1996-07-11', 2, 51.2999992, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO orders VALUES ('HANAR', 3, '1996-07-10', '1996-07-24', '1996-07-16', 2, 58.1699982, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO orders VALUES ('CHOPS', 5, '1996-07-11', '1996-08-08', '1996-07-23', 2, 22.9799995, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland');
INSERT INTO orders VALUES ('RICSU', 9, '1996-07-12', '1996-08-09', '1996-07-15', 3, 148.330002, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '1204', 'Switzerland');
INSERT INTO orders VALUES ('WELLI', 3, '1996-07-15', '1996-08-12', '1996-07-17', 2, 13.9700003, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO orders VALUES ('HILAA', 4, '1996-07-16', '1996-08-13', '1996-07-22', 3, 81.9100037, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO orders VALUES ('ERNSH', 1, '1996-07-17', '1996-08-14', '1996-07-23', 1, 140.509995, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES ('CENTC', 4, '1996-07-18', '1996-08-15', '1996-07-25', 3, 3.25, 'Centro comercial Moctezuma', 'Sierras de Granada 9993', 'México D.F.', NULL, '05022', 'Mexico');
INSERT INTO orders VALUES ('OTTIK', 4, '1996-07-19', '1996-08-16', '1996-07-29', 1, 55.0900002, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Germany');
INSERT INTO orders VALUES ('QUEDE', 4, '1996-07-19', '1996-08-16', '1996-07-30', 2, 3.04999995, 'Que Delícia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO orders VALUES ('RATTC', 8, '1996-07-22', '1996-08-19', '1996-07-25', 3, 48.2900009, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES ('ERNSH', 9, '1996-07-23', '1996-08-20', '1996-07-31', 3, 146.059998, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES ('FOLKO', 6, '1996-07-24', '1996-08-21', '1996-08-23', 3, 3.67000008, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES ('BLONP', 2, '1996-07-25', '1996-08-22', '1996-08-12', 1, 55.2799988, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'France');
INSERT INTO orders VALUES ('WARTH', 3, '1996-07-26', '1996-09-06', '1996-07-31', 3, 25.7299995, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO orders VALUES ('FRANK', 4, '1996-07-29', '1996-08-26', '1996-08-06', 1, 208.580002, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany');
INSERT INTO orders VALUES ('GROSR', 8, '1996-07-30', '1996-08-27', '1996-08-02', 3, 66.2900009, 'GROSELLA-Restaurante', '5ª Ave. Los Palos Grandes', 'Caracas', 'DF', '1081', 'Venezuela');
INSERT INTO orders VALUES ('WHITC', 5, '1996-07-31', '1996-08-14', '1996-08-09', 1, 4.55999994, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES ('WARTH', 1, '1996-08-01', '1996-08-29', '1996-08-02', 1, 136.539993, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO orders VALUES ('SPLIR', 6, '1996-08-01', '1996-08-29', '1996-08-30', 2, 4.53999996, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO orders VALUES ('RATTC', 6, '1996-08-02', '1996-08-30', '1996-08-06', 2, 98.0299988, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES ('QUICK', 3, '1996-08-05', '1996-09-02', '1996-08-12', 3, 76.0699997, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES ('VINET', 6, '1996-08-06', '1996-09-03', '1996-08-16', 1, 6.01000023, 'Vins et alcools Chevalier', '59 rue de l''Abbaye', 'Reims', NULL, '51100', 'France');
INSERT INTO orders VALUES ('MAGAA', 1, '1996-08-07', '1996-09-04', '1996-08-09', 1, 26.9300003, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy');
INSERT INTO orders VALUES ('TORTU', 8, '1996-08-08', '1996-08-22', '1996-08-14', 3, 13.8400002, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES ('MORGK', 2, '1996-08-09', '1996-09-06', '1996-08-13', 3, 125.769997, 'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig', NULL, '04179', 'Germany');
INSERT INTO orders VALUES ('BERGS', 8, '1996-08-12', '1996-09-09', '1996-08-16', 2, 92.6900024, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES ('LEHMS', 8, '1996-08-13', '1996-09-10', '1996-08-16', 2, 25.8299999, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO orders VALUES ('BERGS', 2, '1996-08-14', '1996-09-11', '1996-09-12', 1, 8.97999954, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES ('ROMEY', 4, '1996-08-14', '1996-08-28', '1996-08-21', 1, 2.94000006, 'Romero y tomillo', 'Gran Vía, 1', 'Madrid', NULL, '28001', 'Spain');
INSERT INTO orders VALUES ('ROMEY', 4, '1996-08-15', '1996-09-12', '1996-08-21', 1, 12.6899996, 'Romero y tomillo', 'Gran Vía, 1', 'Madrid', NULL, '28001', 'Spain');
INSERT INTO orders VALUES ('LILAS', 3, '1996-08-16', '1996-09-13', '1996-08-23', 3, 84.8099976, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO orders VALUES ('LEHMS', 4, '1996-08-19', '1996-09-16', '1996-08-27', 1, 76.5599976, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO orders VALUES ('QUICK', 1, '1996-08-20', '1996-09-17', '1996-08-26', 2, 76.8300018, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES ('QUICK', 8, '1996-08-21', '1996-09-18', '1996-08-30', 3, 229.240005, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES ('RICAR', 8, '1996-08-22', '1996-09-19', '1996-08-28', 3, 12.7600002, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO orders VALUES ('REGGC', 4, '1996-08-23', '1996-09-20', '1996-09-03', 1, 7.44999981, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO orders VALUES ('BSBEV', 7, '1996-08-26', '1996-09-23', '1996-08-28', 3, 22.7700005, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO orders VALUES ('COMMI', 8, '1996-08-27', '1996-09-24', '1996-09-03', 1, 79.6999969, 'Comércio Mineiro', 'Av. dos Lusíadas, 23', 'Sao Paulo', 'SP', '05432-043', 'Brazil');
INSERT INTO orders VALUES ('QUEDE', 6, '1996-08-27', '1996-09-24', '1996-09-04', 2, 6.4000001, 'Que Delícia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO orders VALUES ('TRADH', 1, '1996-08-28', '1996-09-25', '1996-09-02', 2, 1.35000002, 'Tradiçao Hipermercados', 'Av. Inês de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil');
INSERT INTO orders VALUES ('TORTU', 1, '1996-08-29', '1996-09-26', '1996-09-11', 3, 21.1800003, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES ('RATTC', 4, '1996-08-30', '1996-09-27', '1996-09-05', 2, 147.259995, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES ('VINET', 2, '1996-09-02', '1996-09-30', '1996-09-10', 2, 1.14999998, 'Vins et alcools Chevalier', '59 rue de l''Abbaye', 'Reims', NULL, '51100', 'France');
INSERT INTO orders VALUES ('LILAS', 6, '1996-09-03', '1996-10-01', '1996-09-11', 1, 0.119999997, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO orders VALUES ('BLONP', 5, '1996-09-04', '1996-10-16', '1996-09-10', 2, 5.73999977, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'France');
INSERT INTO orders VALUES ('HUNGO', 6, '1996-09-05', '1996-10-03', '1996-09-11', 2, 168.220001, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES ('RICAR', 4, '1996-09-06', '1996-10-04', '1996-09-13', 2, 29.7600002, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO orders VALUES ('MAGAA', 2, '1996-09-09', '1996-10-07', '1996-09-18', 2, 17.6800003, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy');
INSERT INTO orders VALUES ('WANDK', 8, '1996-09-09', '1996-10-07', '1996-09-17', 2, 45.0800018, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany');
INSERT INTO orders VALUES ('SUPRD', 4, '1996-09-10', '1996-10-08', '1996-10-09', 2, 6.26999998, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO orders VALUES ('GODOS', 7, '1996-09-11', '1996-10-09', '1996-09-18', 2, 107.830002, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain');
INSERT INTO orders VALUES ('TORTU', 1, '1996-09-12', '1996-10-10', '1996-09-17', 2, 63.7900009, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES ('OLDWO', 8, '1996-09-13', '1996-10-11', '1996-10-09', 3, 257.619995, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO orders VALUES ('ROMEY', 1, '1996-09-16', '1996-10-14', '1996-09-23', 3, 7.55999994, 'Romero y tomillo', 'Gran Vía, 1', 'Madrid', NULL, '28001', 'Spain');
INSERT INTO orders VALUES ('LONEP', 2, '1996-09-17', '1996-10-15', '1996-09-25', 2, 0.560000002, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO orders VALUES ('ANATR', 7, '1996-09-18', '1996-10-16', '1996-09-24', 3, 1.61000001, 'Ana Trujillo Emparedados y helados', 'Avda. de la Constitución 2222', 'México D.F.', NULL, '05021', 'Mexico');
INSERT INTO orders VALUES ('HUNGO', 3, '1996-09-19', '1996-10-17', '1996-10-23', 1, 47.2999992, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES ('THEBI', 8, '1996-09-20', '1996-10-18', '1996-09-27', 2, 17.5200005, 'The Big Cheese', '89 Jefferson Way Suite 2', 'Portland', 'OR', '97201', 'USA');
INSERT INTO orders VALUES ('DUMON', 1, '1996-09-20', '1996-10-04', '1996-09-26', 3, 24.6900005, 'Du monde entier', '67, rue des Cinquante Otages', 'Nantes', NULL, '44000', 'France');
INSERT INTO orders VALUES ('WANDK', 2, '1996-09-23', '1996-10-21', '1996-10-03', 2, 40.2599983, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany');
INSERT INTO orders VALUES ('QUICK', 2, '1996-09-24', '1996-10-22', '1996-10-04', 2, 1.96000004, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES ('RATTC', 1, '1996-09-25', '1996-10-23', '1996-10-04', 2, 74.1600037, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES ('ISLAT', 4, '1996-09-26', '1996-10-24', '1996-10-03', 2, 41.7599983, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO orders VALUES ('RATTC', 1, '1996-09-27', '1996-10-25', '1996-10-08', 3, 150.149994, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES ('LONEP', 6, '1996-09-30', '1996-10-28', '1996-10-10', 1, 12.6899996, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO orders VALUES ('ISLAT', 8, '1996-10-01', '1996-10-29', '1996-10-04', 2, 4.73000002, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO orders VALUES ('TORTU', 7, '1996-10-02', '1996-10-30', '1996-10-11', 3, 64.5, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES ('WARTH', 5, '1996-10-03', '1996-10-17', '1996-10-18', 3, 34.5699997, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO orders VALUES ('ISLAT', 3, '1996-10-03', '1996-10-31', '1996-10-11', 2, 3.43000007, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO orders VALUES ('PERIC', 7, '1996-10-04', '1996-11-01', '1996-10-23', 3, 0.400000006, 'Pericles Comidas clásicas', 'Calle Dr. Jorge Cash 321', 'México D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES ('KOENE', 4, '1996-10-07', '1996-11-04', '1996-10-14', 1, 4.88000011, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES ('SAVEA', 9, '1996-10-08', '1996-11-05', '1996-10-10', 1, 214.270004, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES ('KOENE', 1, '1996-10-09', '1996-10-23', '1996-10-14', 3, 64.8600006, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES ('BOLID', 4, '1996-10-10', '1996-11-07', '1996-10-14', 2, 77.9199982, 'Bólido Comidas preparadas', 'C/ Araquil, 67', 'Madrid', NULL, '28023', 'Spain');
INSERT INTO orders VALUES ('FOLKO', 2, '1996-10-11', '1996-11-08', '1996-10-14', 1, 63.3600006, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES ('FURIB', 4, '1996-10-14', '1996-11-11', '1996-10-17', 3, 87.0299988, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal');
INSERT INTO orders VALUES ('SPLIR', 4, '1996-10-15', '1996-11-26', '1996-10-23', 2, 191.669998, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO orders VALUES ('LILAS', 3, '1996-10-16', '1996-11-13', '1996-10-28', 1, 12.75, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO orders VALUES ('BONAP', 9, '1996-10-16', '1996-11-27', '1996-10-21', 1, 10.1899996, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES ('MEREP', 3, '1996-10-17', '1996-11-28', '1996-10-21', 2, 52.8400002, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES ('WARTH', 5, '1996-10-18', '1996-11-15', '1996-10-25', 3, 0.589999974, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO orders VALUES ('VICTE', 8, '1996-10-21', '1996-11-18', '1996-10-28', 2, 8.56000042, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France');
INSERT INTO orders VALUES ('HUNGO', 7, '1996-10-22', '1996-11-19', '1996-10-24', 2, 42.1100006, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES ('PRINI', 7, '1996-10-23', '1996-11-20', '1996-10-25', 2, 15.5100002, 'Princesa Isabel Vinhos', 'Estrada da saúde n. 58', 'Lisboa', NULL, '1756', 'Portugal');
INSERT INTO orders VALUES ('FRANK', 4, '1996-10-24', '1996-11-21', '1996-10-29', 3, 108.260002, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany');
INSERT INTO orders VALUES ('OLDWO', 4, '1996-10-25', '1996-11-22', '1996-10-29', 3, 84.2099991, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO orders VALUES ('MEREP', 2, '1996-10-28', '1996-11-25', '1996-11-04', 2, 15.6599998, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES ('BONAP', 1, '1996-10-29', '1996-11-26', '1996-11-08', 3, 166.309998, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES ('SIMOB', 7, '1996-10-29', '1996-11-26', '1996-11-05', 3, 26.7800007, 'Simons bistro', 'Vinbæltet 34', 'Kobenhavn', NULL, '1734', 'Denmark');
INSERT INTO orders VALUES ('FRANK', 4, '1996-10-30', '1996-11-13', '1996-11-04', 2, 54.8300018, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany');
INSERT INTO orders VALUES ('LEHMS', 4, '1996-10-31', '1996-11-28', '1996-11-06', 1, 110.370003, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO orders VALUES ('WHITC', 4, '1996-11-01', '1996-11-29', '1996-11-05', 2, 23.2900009, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES ('QUICK', 2, '1996-11-04', '1996-12-02', '1996-11-11', 2, 249.059998, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES ('RATTC', 3, '1996-11-05', '1996-12-17', '1996-11-08', 3, 142.080002, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES ('FAMIA', 4, '1996-11-06', '1996-12-04', '1996-11-08', 3, 3.0999999, 'Familia Arquibaldo', 'Rua Orós, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil');
INSERT INTO orders VALUES ('WANDK', 4, '1996-11-07', '1996-12-05', '1996-11-15', 2, 0.779999971, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany');
INSERT INTO orders VALUES ('SPLIR', 7, '1996-11-08', '1996-12-06', '1996-11-15', 1, 8.63000011, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO orders VALUES ('LAMAI', 6, '1996-11-11', '1996-12-09', '1996-12-03', 2, 64.1900024, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO orders VALUES ('ERNSH', 1, '1996-11-11', '1996-12-09', '1996-11-20', 1, 162.330002, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES ('FURIB', 3, '1996-11-12', '1996-11-26', '1996-11-18', 3, 1.29999995, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal');
INSERT INTO orders VALUES ('PICCO', 7, '1996-11-13', '1996-12-11', '1996-11-25', 3, 360.630005, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria');
INSERT INTO orders VALUES ('PERIC', 8, '1996-11-14', '1996-12-12', '1996-11-20', 3, 53.7999992, 'Pericles Comidas clásicas', 'Calle Dr. Jorge Cash 321', 'México D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES ('AROUT', 6, '1996-11-15', '1996-12-13', '1996-11-20', 1, 41.9500008, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES ('WANDK', 6, '1996-11-18', '1996-12-16', '1996-11-27', 2, 36.7099991, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany');
INSERT INTO orders VALUES ('LILAS', 1, '1996-11-19', '1996-12-17', '1996-12-02', 3, 34.8800011, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO orders VALUES ('LAMAI', 5, '1996-11-20', '1996-12-18', '1996-11-27', 1, 19.6399994, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO orders VALUES ('SEVES', 5, '1996-11-21', '1996-12-19', '1996-11-26', 3, 288.429993, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK');
INSERT INTO orders VALUES ('BLONP', 4, '1996-11-22', '1996-12-20', '1996-12-02', 3, 131.699997, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'France');
INSERT INTO orders VALUES ('QUICK', 1, '1996-11-22', '1996-12-20', '1996-12-03', 2, 183.169998, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES ('BONAP', 3, '1996-11-25', '1996-12-23', '1996-11-28', 1, 96.0400009, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES ('DRACD', 4, '1996-11-26', '1996-12-24', '1996-12-04', 3, 30.5400009, 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', NULL, '52066', 'Germany');
INSERT INTO orders VALUES ('EASTC', 1, '1996-11-26', '1997-01-07', '1996-12-04', 1, 71.9700012, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK');
INSERT INTO orders VALUES ('ANTON', 3, '1996-11-27', '1996-12-25', '1996-12-02', 2, 22, 'Antonio Moreno Taquería', 'Mataderos  2312', 'México D.F.', NULL, '05023', 'Mexico');
INSERT INTO orders VALUES ('GALED', 8, '1996-11-28', '1997-01-09', '1996-12-30', 2, 10.1400003, 'Galería del gastronómo', 'Rambla de Cataluña, 23', 'Barcelona', NULL, '8022', 'Spain');
INSERT INTO orders VALUES ('VAFFE', 7, '1996-11-28', '1996-12-26', '1996-12-02', 3, 13.5500002, 'Vaffeljernet', 'Smagsloget 45', 'Århus', NULL, '8200', 'Denmark');
INSERT INTO orders VALUES ('ERNSH', 2, '1996-11-29', '1996-12-27', '1996-12-02', 2, 101.949997, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES ('SPLIR', 8, '1996-12-02', '1996-12-30', '1996-12-09', 2, 195.679993, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO orders VALUES ('CHOPS', 6, '1996-12-03', '1996-12-31', '1996-12-27', 2, 1.16999996, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland');
INSERT INTO orders VALUES ('LAMAI', 1, '1996-12-03', '1996-12-31', '1996-12-24', 1, 0.449999988, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO orders VALUES ('QUEEN', 5, '1996-12-04', '1997-01-01', '1996-12-09', 2, 890.780029, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO orders VALUES ('HUNGO', 4, '1996-12-05', '1997-01-02', '1996-12-11', 3, 124.120003, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES ('WOLZA', 1, '1996-12-05', '1997-01-02', '1996-12-09', 3, 3.94000006, 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Poland');
INSERT INTO orders VALUES ('HUNGC', 3, '1996-12-06', '1997-01-03', '1996-12-09', 2, 20.1200008, 'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA');
INSERT INTO orders VALUES ('MEREP', 1, '1996-12-09', '1997-01-06', '1996-12-13', 2, 20.3899994, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES ('SEVES', 1, '1996-12-09', '1997-01-06', '1996-12-13', 3, 22.2099991, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK');
INSERT INTO orders VALUES ('FOLKO', 5, '1996-12-10', '1997-01-07', '1996-12-19', 3, 5.44000006, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES ('QUEDE', 2, '1996-12-11', '1997-01-08', '1996-12-13', 1, 45.0299988, 'Que Delícia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO orders VALUES ('HUNGO', 8, '1996-12-12', '1997-01-09', '1997-01-16', 3, 35.0299988, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES ('LILAS', 3, '1996-12-12', '1997-01-09', '1996-12-13', 3, 7.98999977, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO orders VALUES ('ERNSH', 4, '1996-12-13', '1997-01-10', '1996-12-16', 1, 94.7699966, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES ('AROUT', 8, '1996-12-16', '1997-01-13', '1996-12-18', 3, 34.2400017, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES ('BERGS', 3, '1996-12-16', '1997-01-13', '1996-12-20', 3, 168.639999, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES ('SPLIR', 1, '1996-12-17', '1997-01-14', '1996-12-23', 2, 30.9599991, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO orders VALUES ('FAMIA', 9, '1996-12-18', '1997-01-01', '1996-12-25', 3, 13.9899998, 'Familia Arquibaldo', 'Rua Orós, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil');
INSERT INTO orders VALUES ('SANTG', 1, '1996-12-18', '1997-01-15', '1996-12-20', 2, 93.6299973, 'Santé Gourmet', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Norway');
INSERT INTO orders VALUES ('SEVES', 2, '1996-12-19', '1997-01-16', '1996-12-20', 1, 34.8600006, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK');
INSERT INTO orders VALUES ('BOTTM', 4, '1996-12-20', '1997-01-17', '1996-12-24', 2, 47.4199982, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES ('ERNSH', 6, '1996-12-23', '1997-01-20', '1996-12-26', 1, 126.379997, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES ('DRACD', 3, '1996-12-23', '1997-01-20', '1996-12-31', 3, 5.44999981, 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', NULL, '52066', 'Germany');
INSERT INTO orders VALUES ('PICCO', 2, '1996-12-24', '1997-01-21', '1997-01-01', 3, 122.459999, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria');
INSERT INTO orders VALUES ('SAVEA', 1, '1996-12-25', '1997-01-22', '1997-01-03', 3, 126.559998, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES ('HUNGC', 1, '1996-12-25', '1997-01-22', '1997-01-03', 3, 30.3400002, 'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA');
INSERT INTO orders VALUES ('HILAA', 6, '1996-12-26', '1997-01-23', '1997-01-03', 1, 184.410004, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO orders VALUES ('FRANK', 1, '1996-12-27', '1997-01-10', '1997-01-06', 3, 135.350006, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany');
INSERT INTO orders VALUES ('PRINI', 5, '1996-12-27', '1997-01-24', '1997-01-02', 1, 60.2599983, 'Princesa Isabel Vinhos', 'Estrada da saúde n. 58', 'Lisboa', NULL, '1756', 'Portugal');
INSERT INTO orders VALUES ('SAVEA', 2, '1996-12-30', '1997-01-27', '1997-01-09', 3, 89.1600037, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES ('VAFFE', 8, '1996-12-31', '1997-01-14', '1997-01-08', 3, 27.3600006, 'Vaffeljernet', 'Smagsloget 45', 'Århus', NULL, '8200', 'Denmark');
INSERT INTO orders VALUES ('EASTC', 1, '1997-01-01', '1997-01-29', '1997-01-16', 3, 83.9300003, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK');
INSERT INTO orders VALUES ('RATTC', 1, '1997-01-01', '1997-01-29', '1997-01-10', 1, 12.5100002, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES ('ERNSH', 8, '1997-01-02', '1997-02-13', '1997-01-10', 2, 67.8799973, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES ('ERNSH', 4, '1997-01-03', '1997-01-31', '1997-01-09', 3, 73.7900009, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES ('MAGAA', 2, '1997-01-03', '1997-01-31', '1997-01-08', 1, 155.970001, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy');
INSERT INTO orders VALUES ('LINOD', 1, '1997-01-06', '1997-02-03', '1997-01-22', 1, 34.8199997, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO orders VALUES ('QUEEN', 7, '1997-01-07', '1997-02-18', '1997-01-13', 1, 108.040001, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO orders VALUES ('OTTIK', 2, '1997-01-07', '1997-02-04', '1997-01-30', 2, 91.4800034, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Germany');
INSERT INTO orders VALUES ('FOLIG', 8, '1997-01-08', '1997-02-05', '1997-01-14', 1, 11.2600002, 'Folies gourmandes', '184, chaussée de Tournai', 'Lille', NULL, '59000', 'France');
INSERT INTO orders VALUES ('OCEAN', 3, '1997-01-09', '1997-02-06', '1997-01-14', 1, 29.8299999, 'Océano Atlántico Ltda.', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO orders VALUES ('BOTTM', 3, '1997-01-10', '1997-02-07', '1997-01-15', 3, 2.4000001, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES ('BOTTM', 9, '1997-01-10', '1997-02-07', '1997-01-21', 3, 23.6499996, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES ('WARTH', 8, '1997-01-13', '1997-02-10', '1997-01-15', 2, 3.76999998, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO orders VALUES ('LAMAI', 3, '1997-01-14', '1997-02-11', '1997-01-16', 2, 95.6600037, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO orders VALUES ('FAMIA', 2, '1997-01-14', '1997-02-11', '1997-01-17', 3, 21.4799995, 'Familia Arquibaldo', 'Rua Orós, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil');
INSERT INTO orders VALUES ('HUNGC', 3, '1997-01-15', '1997-02-12', '1997-01-24', 1, 0.200000003, 'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA');
INSERT INTO orders VALUES ('WARTH', 8, '1997-01-16', '1997-02-13', '1997-01-27', 3, 22.7199993, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO orders VALUES ('SIMOB', 4, '1997-01-16', '1997-02-13', '1997-01-28', 3, 70.2900009, 'Simons bistro', 'Vinbæltet 34', 'Kobenhavn', NULL, '1734', 'Denmark');
INSERT INTO orders VALUES ('QUICK', 4, '1997-01-17', '1997-02-14', '1997-01-24', 1, 17.5499992, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES ('RICSU', 4, '1997-01-20', '1997-02-17', '1997-01-30', 2, 137.350006, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '1204', 'Switzerland');
INSERT INTO orders VALUES ('WELLI', 3, '1997-01-21', '1997-02-18', '1997-01-27', 1, 44.1199989, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO orders VALUES ('QUEDE', 8, '1997-01-21', '1997-03-04', '1997-01-27', 1, 99.2300034, 'Que Delícia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO orders VALUES ('FRANS', 2, '1997-01-22', '1997-02-19', '1997-01-31', 1, 3.01999998, 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italy');
INSERT INTO orders VALUES ('GOURL', 6, '1997-01-23', '1997-02-06', '1997-02-24', 3, 24.5, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO orders VALUES ('MEREP', 7, '1997-01-23', '1997-02-20', '1997-01-27', 2, 370.609985, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES ('LAMAI', 6, '1997-01-24', '1997-02-21', '1997-02-14', 2, 7.92999983, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO orders VALUES ('GALED', 4, '1997-01-27', '1997-02-24', '1997-02-06', 1, 18.6900005, 'Galería del gastronómo', 'Rambla de Cataluña, 23', 'Barcelona', NULL, '8022', 'Spain');
INSERT INTO orders VALUES ('PICCO', 4, '1997-01-27', '1997-02-24', '1997-03-03', 2, 31.2900009, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria');
INSERT INTO orders VALUES ('REGGC', 7, '1997-01-28', '1997-02-25', '1997-02-04', 1, 11.0900002, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO orders VALUES ('HUNGO', 3, '1997-01-29', '1997-03-12', '1997-02-07', 2, 56.6300011, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES ('ERNSH', 4, '1997-01-30', '1997-02-13', '1997-02-03', 1, 458.779999, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES ('BOTTM', 4, '1997-01-30', '1997-02-13', '1997-02-07', 2, 44.1699982, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES ('SPLIR', 3, '1997-01-31', '1997-02-14', '1997-02-07', 2, 4.34000015, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO orders VALUES ('PRINI', 3, '1997-02-03', '1997-03-03', '1997-03-04', 3, 73.8300018, 'Princesa Isabel Vinhos', 'Estrada da saúde n. 58', 'Lisboa', NULL, '1756', 'Portugal');
INSERT INTO orders VALUES ('FOLKO', 3, '1997-02-03', '1997-03-03', '1997-02-13', 2, 17.9200001, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES ('CONSH', 8, '1997-02-04', '1997-03-18', '1997-02-07', 2, 9.21000004, 'Consolidated Holdings', 'Berkeley Gardens 12  Brewery', 'London', NULL, 'WX1 6LT', 'UK');
INSERT INTO orders VALUES ('BLONP', 3, '1997-02-05', '1997-03-05', '1997-02-11', 2, 156.660004, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'France');
INSERT INTO orders VALUES ('WARTH', 8, '1997-02-05', '1997-03-05', '1997-02-12', 1, 19.9699993, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO orders VALUES ('TOMSP', 3, '1997-02-06', '1997-03-06', '1997-02-14', 2, 8.23999977, 'Toms Spezialitäten', 'Luisenstr. 48', 'Münster', NULL, '44087', 'Germany');
INSERT INTO orders VALUES ('MEREP', 6, '1997-02-07', '1997-03-07', '1997-02-10', 3, 4.07000017, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES ('SAVEA', 4, '1997-02-10', '1997-03-10', '1997-02-28', 2, 86.5299988, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES ('OLDWO', 3, '1997-02-10', '1997-03-24', '1997-03-14', 2, 73.0199966, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO orders VALUES ('ERNSH', 3, '1997-02-11', '1997-03-11', '1997-02-18', 2, 47.9399986, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES ('REGGC', 8, '1997-02-12', '1997-03-12', '1997-02-14', 1, 13.9499998, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO orders VALUES ('BERGS', 3, '1997-02-12', '1997-03-12', '1997-02-21', 3, 3.5, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES ('BERGS', 3, '1997-02-13', '1997-03-13', '1997-02-20', 1, 9.30000019, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES ('TOMSP', 6, '1997-02-14', '1997-03-14', '1997-02-19', 1, 14.6800003, 'Toms Spezialitäten', 'Luisenstr. 48', 'Münster', NULL, '44087', 'Germany');
INSERT INTO orders VALUES ('RICAR', 4, '1997-02-14', '1997-03-14', '1997-03-07', 2, 68.6600037, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO orders VALUES ('RANCH', 4, '1997-02-17', '1997-03-17', '1997-02-24', 2, 38.8199997, 'Rancho grande', 'Av. del Libertador 900', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO orders VALUES ('BLONP', 3, '1997-02-18', '1997-03-18', '1997-02-27', 2, 53.2999992, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'France');
INSERT INTO orders VALUES ('VICTE', 8, '1997-02-19', '1997-03-19', '1997-03-11', 2, 7.23000002, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France');
INSERT INTO orders VALUES ('QUICK', 4, '1997-02-19', '1997-03-05', '1997-03-12', 3, 189.089996, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES ('SAVEA', 8, '1997-02-20', '1997-03-20', '1997-02-26', 1, 140.259995, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES ('AROUT', 1, '1997-02-21', '1997-03-21', '1997-02-26', 2, 25.3600006, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES ('LAMAI', 4, '1997-02-21', '1997-03-21', '1997-02-25', 3, 2.74000001, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO orders VALUES ('WARTH', 8, '1997-02-24', '1997-04-07', '1997-03-03', 2, 180.449997, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO orders VALUES ('KOENE', 8, '1997-02-25', '1997-04-08', '1997-02-28', 2, 8.11999989, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES ('KOENE', 2, '1997-02-25', '1997-03-25', '1997-03-03', 1, 11.5699997, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES ('SUPRD', 7, '1997-02-26', '1997-03-26', '1997-03-04', 3, 147.059998, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO orders VALUES ('VICTE', 4, '1997-02-27', '1997-03-27', '1997-02-28', 2, 25.0900002, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France');
INSERT INTO orders VALUES ('FOLKO', 8, '1997-02-28', '1997-03-28', '1997-03-03', 1, 16.2700005, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES ('LILAS', 1, '1997-02-28', '1997-03-28', '1997-03-05', 3, 148.610001, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO orders VALUES ('CONSH', 2, '1997-03-03', '1997-03-31', '1997-03-18', 1, 6.17000008, 'Consolidated Holdings', 'Berkeley Gardens 12  Brewery', 'London', NULL, 'WX1 6LT', 'UK');
INSERT INTO orders VALUES ('SUPRD', 5, '1997-03-04', '1997-04-01', '1997-03-06', 3, 14.7799997, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO orders VALUES ('FURIB', 4, '1997-03-04', '1997-04-01', '1997-03-14', 2, 89, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal');
INSERT INTO orders VALUES ('VAFFE', 1, '1997-03-05', '1997-04-02', '1997-03-14', 3, 145.039993, 'Vaffeljernet', 'Smagsloget 45', 'Århus', NULL, '8200', 'Denmark');
INSERT INTO orders VALUES ('COMMI', 4, '1997-03-06', '1997-04-03', '1997-03-13', 1, 11.9300003, 'Comércio Mineiro', 'Av. dos Lusíadas, 23', 'Sao Paulo', 'SP', '05432-043', 'Brazil');
INSERT INTO orders VALUES ('MAGAA', 8, '1997-03-06', '1997-04-03', '1997-03-11', 2, 4.92999983, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy');
INSERT INTO orders VALUES ('KOENE', 3, '1997-03-07', '1997-04-04', '1997-03-12', 3, 44.1199989, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES ('WHITC', 1, '1997-03-10', '1997-04-07', '1997-03-14', 1, 60.1800003, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES ('BONAP', 4, '1997-03-11', '1997-04-08', '1997-03-14', 2, 64.5599976, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES ('BSBEV', 2, '1997-03-11', '1997-04-08', '1997-03-18', 3, 45.5900002, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO orders VALUES ('SEVES', 8, '1997-03-12', '1997-04-09', '1997-03-19', 1, 4.19999981, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK');
INSERT INTO orders VALUES ('ISLAT', 1, '1997-03-13', '1997-03-27', '1997-03-21', 3, 16.3700008, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO orders VALUES ('PERIC', 5, '1997-03-13', '1997-04-10', '1997-03-21', 2, 83.4899979, 'Pericles Comidas clásicas', 'Calle Dr. Jorge Cash 321', 'México D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES ('SUPRD', 9, '1997-03-14', '1997-04-11', '1997-04-04', 1, 68.5199966, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO orders VALUES ('HILAA', 8, '1997-03-17', '1997-04-14', '1997-03-24', 3, 4.40999985, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO orders VALUES ('PRINI', 5, '1997-03-17', '1997-04-14', '1997-03-25', 2, 13.0200005, 'Princesa Isabel Vinhos', 'Estrada da saúde n. 58', 'Lisboa', NULL, '1756', 'Portugal');
INSERT INTO orders VALUES ('VICTE', 2, '1997-03-18', '1997-04-01', '1997-03-26', 3, 4.80999994, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France');
INSERT INTO orders VALUES ('RATTC', 3, '1997-03-19', '1997-04-16', '1997-03-21', 3, 708.950012, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES ('FOLIG', 6, '1997-03-20', '1997-04-17', '1997-03-24', 2, 1.35000002, 'Folies gourmandes', '184, chaussée de Tournai', 'Lille', NULL, '59000', 'France');
INSERT INTO orders VALUES ('RICAR', 8, '1997-03-20', '1997-04-17', '1997-03-25', 2, 64.3300018, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO orders VALUES ('LAZYK', 1, '1997-03-21', '1997-04-18', '1997-04-10', 3, 7.48000002, 'Lazy K Kountry Store', '12 Orchestra Terrace', 'Walla Walla', 'WA', '99362', 'USA');
INSERT INTO orders VALUES ('WHITC', 7, '1997-03-24', '1997-04-21', '1997-04-25', 2, 15.2799997, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES ('BSBEV', 3, '1997-03-24', '1997-04-21', '1997-04-01', 3, 6.88000011, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO orders VALUES ('LINOD', 4, '1997-03-25', '1997-04-08', '1997-03-31', 2, 64.4499969, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO orders VALUES ('HILAA', 1, '1997-03-26', '1997-04-23', '1997-04-02', 2, 30.5300007, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO orders VALUES ('QUEEN', 2, '1997-03-26', '1997-04-23', '1997-03-28', 2, 71.0699997, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO orders VALUES ('FRANK', 8, '1997-03-27', '1997-04-24', '1997-04-02', 2, 4.92999983, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany');
INSERT INTO orders VALUES ('PICCO', 6, '1997-03-28', '1997-04-25', '1997-04-09', 2, 5.28999996, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria');
INSERT INTO orders VALUES ('HILAA', 7, '1997-03-31', '1997-04-28', '1997-04-03', 2, 210.190002, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO orders VALUES ('FURIB', 8, '1997-03-31', '1997-04-28', '1997-04-08', 3, 16.9599991, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal');
INSERT INTO orders VALUES ('BOTTM', 3, '1997-04-01', '1997-04-29', '1997-04-11', 1, 62.8899994, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES ('LAMAI', 4, '1997-04-02', '1997-04-30', '1997-04-10', 3, 10.6400003, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO orders VALUES ('COMMI', 4, '1997-04-02', '1997-04-30', '1997-04-09', 2, 65.9899979, 'Comércio Mineiro', 'Av. dos Lusíadas, 23', 'Sao Paulo', 'SP', '05432-043', 'Brazil');
INSERT INTO orders VALUES ('LAUGB', 3, '1997-04-03', '1997-05-01', '1997-04-11', 3, 4.6500001, 'Laughing Bacchus Wine Cellars', '2319 Elm St.', 'Vancouver', 'BC', 'V3F 2K1', 'Canada');
INSERT INTO orders VALUES ('TRADH', 7, '1997-04-04', '1997-05-02', '1997-04-07', 2, 46.7700005, 'Tradiçao Hipermercados', 'Av. Inês de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil');
INSERT INTO orders VALUES ('LEHMS', 7, '1997-04-04', '1997-05-02', '1997-04-07', 1, 36.2099991, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO orders VALUES ('HILAA', 8, '1997-04-07', '1997-05-05', '1997-04-11', 2, 29.75, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO orders VALUES ('LILAS', 4, '1997-04-08', '1997-05-06', '1997-04-16', 2, 102.019997, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO orders VALUES ('LAMAI', 6, '1997-04-09', '1997-05-07', '1997-04-17', 1, 42.6800003, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO orders VALUES ('BLAUS', 9, '1997-04-09', '1997-05-07', '1997-04-16', 3, 8.85000038, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany');
INSERT INTO orders VALUES ('PERIC', 2, '1997-04-10', '1997-05-08', '1997-04-29', 1, 69.3199997, 'Pericles Comidas clásicas', 'Calle Dr. Jorge Cash 321', 'México D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES ('HUNGO', 6, '1997-04-11', '1997-05-09', '1997-04-16', 2, 16.7399998, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES ('WHITC', 4, '1997-04-11', '1997-05-09', '1997-04-18', 3, 59.1300011, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES ('MEREP', 3, '1997-04-14', '1997-05-12', '1997-04-21', 3, 7.13000011, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES ('KOENE', 9, '1997-04-15', '1997-05-13', '1997-05-02', 2, 21.1900005, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES ('ANTON', 7, '1997-04-15', '1997-05-13', '1997-04-22', 1, 47.4500008, 'Antonio Moreno Taquería', 'Mataderos  2312', 'México D.F.', NULL, '05023', 'Mexico');
INSERT INTO orders VALUES ('OTTIK', 1, '1997-04-16', '1997-05-14', '1997-05-13', 2, 4.98999977, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Germany');
INSERT INTO orders VALUES ('BLAUS', 4, '1997-04-17', '1997-05-15', '1997-04-29', 1, 0.150000006, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany');
INSERT INTO orders VALUES ('SAVEA', 6, '1997-04-18', '1997-05-16', '1997-04-28', 3, 367.630005, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES ('BONAP', 4, '1997-04-18', '1997-05-16', '1997-04-21', 3, 350.640015, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES ('FAMIA', 7, '1997-04-21', '1997-05-19', '1997-04-24', 2, 3.52999997, 'Familia Arquibaldo', 'Rua Orós, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil');
INSERT INTO orders VALUES ('WANDK', 7, '1997-04-22', '1997-06-03', '1997-04-28', 1, 105.650002, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany');
INSERT INTO orders VALUES ('ERNSH', 3, '1997-04-22', '1997-05-20', '1997-05-16', 2, 789.950012, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES ('QUICK', 2, '1997-04-23', '1997-05-07', '1997-05-23', 1, 204.470001, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES ('HUNGO', 2, '1997-04-24', '1997-05-22', '1997-05-01', 3, 62.7799988, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES ('NORTS', 3, '1997-04-24', '1997-05-22', '1997-04-29', 3, 32.0699997, 'North/South', 'South House 300 Queensbridge', 'London', NULL, 'SW7 1RZ', 'UK');
INSERT INTO orders VALUES ('TORTU', 4, '1997-04-25', '1997-05-09', '1997-05-05', 2, 218.149994, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES ('CHOPS', 6, '1997-04-28', '1997-05-26', '1997-05-01', 3, 91.7600021, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland');
INSERT INTO orders VALUES ('SANTG', 7, '1997-04-29', '1997-05-27', '1997-05-01', 1, 13.3699999, 'Santé Gourmet', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Norway');
INSERT INTO orders VALUES ('CACTU', 8, '1997-04-29', '1997-05-27', '1997-05-02', 2, 17.2199993, 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO orders VALUES ('LEHMS', 4, '1997-04-30', '1997-05-28', '1997-05-06', 1, 45.3300018, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO orders VALUES ('SEVES', 7, '1997-05-01', '1997-05-29', '1997-05-30', 2, 77.6299973, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK');
INSERT INTO orders VALUES ('BERGS', 1, '1997-05-01', '1997-05-29', '1997-05-07', 2, 244.789993, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES ('BONAP', 1, '1997-05-02', '1997-05-30', '1997-05-23', 2, 11.0600004, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES ('WARTH', 4, '1997-05-05', '1997-06-02', '1997-05-15', 2, 58.5900002, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO orders VALUES ('QUICK', 7, '1997-05-05', '1997-06-02', '1997-05-07', 1, 41.9000015, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES ('GREAL', 6, '1997-05-06', '1997-05-20', '1997-05-09', 2, 3.3499999, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO orders VALUES ('MAISD', 5, '1997-05-07', '1997-06-04', '1997-05-09', 2, 66.6900024, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Belgium');
INSERT INTO orders VALUES ('PICCO', 3, '1997-05-08', '1997-06-05', '1997-05-12', 2, 339.220001, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria');
INSERT INTO orders VALUES ('OCEAN', 7, '1997-05-08', '1997-06-05', '1997-05-19', 1, 8.11999989, 'Océano Atlántico Ltda.', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO orders VALUES ('EASTC', 7, '1997-05-09', '1997-06-06', '1997-05-12', 3, 74.4599991, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK');
INSERT INTO orders VALUES ('FOLKO', 8, '1997-05-12', '1997-06-09', '1997-05-22', 1, 188.039993, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES ('LEHMS', 8, '1997-05-12', '1997-06-09', '1997-05-14', 2, 27.9400005, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO orders VALUES ('ANTON', 4, '1997-05-13', '1997-06-10', '1997-05-21', 1, 15.6400003, 'Antonio Moreno Taquería', 'Mataderos  2312', 'México D.F.', NULL, '05023', 'Mexico');
INSERT INTO orders VALUES ('LEHMS', 3, '1997-05-14', '1997-06-11', '1997-06-06', 2, 58.8800011, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO orders VALUES ('RICSU', 1, '1997-05-14', '1997-05-28', '1997-05-19', 1, 78.8499985, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '1204', 'Switzerland');
INSERT INTO orders VALUES ('BSBEV', 9, '1997-05-15', '1997-06-12', '1997-05-16', 3, 4.86999989, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO orders VALUES ('BSBEV', 6, '1997-05-16', '1997-06-13', '1997-05-23', 3, 12.3599997, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO orders VALUES ('QUICK', 3, '1997-05-19', '1997-06-16', '1997-06-13', 3, 1007.64001, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES ('HANAR', 2, '1997-05-19', '1997-06-16', '1997-05-29', 1, 68.6500015, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO orders VALUES ('KOENE', 1, '1997-05-20', '1997-06-17', '1997-05-26', 3, 10.9499998, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES ('LILAS', 8, '1997-05-21', '1997-06-18', '1997-05-23', 2, 48.1699982, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO orders VALUES ('LONEP', 4, '1997-05-21', '1997-06-18', '1997-05-30', 1, 24.9099998, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO orders VALUES ('LAZYK', 8, '1997-05-22', '1997-06-19', '1997-06-26', 2, 11.9200001, 'Lazy K Kountry Store', '12 Orchestra Terrace', 'Walla Walla', 'WA', '99362', 'USA');
INSERT INTO orders VALUES ('VICTE', 1, '1997-05-23', '1997-06-20', '1997-05-27', 3, 194.720001, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France');
INSERT INTO orders VALUES ('SEVES', 3, '1997-05-23', '1997-06-20', '1997-06-02', 2, 178.429993, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK');
INSERT INTO orders VALUES ('TOMSP', 3, '1997-05-26', '1997-06-23', '1997-06-02', 2, 1.42999995, 'Toms Spezialitäten', 'Luisenstr. 48', 'Münster', NULL, '44087', 'Germany');
INSERT INTO orders VALUES ('QUICK', 5, '1997-05-27', '1997-06-10', '1997-05-30', 1, 171.240005, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES ('GODOS', 7, '1997-05-28', '1997-06-25', '1997-06-06', 3, 4.32000017, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain');
INSERT INTO orders VALUES ('FURIB', 4, '1997-05-28', '1997-07-09', '1997-06-06', 3, 72.9499969, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal');
INSERT INTO orders VALUES ('HILAA', 2, '1997-05-29', '1997-06-26', '1997-06-05', 1, 83.2200012, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO orders VALUES ('WARTH', 2, '1997-05-30', '1997-06-27', '1997-06-03', 2, 149.490005, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO orders VALUES ('OTTIK', 4, '1997-05-30', '1997-06-27', '1997-06-05', 3, 120.970001, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Germany');
INSERT INTO orders VALUES ('SAVEA', 6, '1997-06-02', '1997-06-30', '1997-06-04', 3, 252.490005, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES ('SIMOB', 2, '1997-06-03', '1997-07-15', '1997-06-13', 1, 9.80000019, 'Simons bistro', 'Vinbæltet 34', 'Kobenhavn', NULL, '1734', 'Denmark');
INSERT INTO orders VALUES ('LEHMS', 9, '1997-06-03', '1997-06-17', '1997-06-06', 2, 96.7200012, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO orders VALUES ('AROUT', 1, '1997-06-04', '1997-07-02', '1997-06-10', 2, 72.9700012, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES ('BLONP', 6, '1997-06-05', '1997-07-03', '1997-06-13', 1, 8.05000019, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'France');
INSERT INTO orders VALUES ('FRANK', 8, '1997-06-06', '1997-07-04', '1997-06-09', 1, 36.6500015, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany');
INSERT INTO orders VALUES ('FOLKO', 2, '1997-06-06', '1997-07-04', '1997-06-09', 2, 242.210007, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES ('REGGC', 1, '1997-06-09', '1997-07-07', '1997-06-12', 1, 22.9500008, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO orders VALUES ('RICAR', 2, '1997-06-10', '1997-07-22', '1997-06-24', 2, 60.4300003, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO orders VALUES ('RATTC', 4, '1997-06-10', '1997-07-08', '1997-06-16', 3, 13.75, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES ('MEREP', 8, '1997-06-11', '1997-07-09', '1997-06-18', 2, 7.1500001, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES ('BLONP', 9, '1997-06-12', '1997-07-10', '1997-06-18', 1, 88.4000015, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'France');
INSERT INTO orders VALUES ('HUNGO', 1, '1997-06-12', '1997-07-10', '1997-06-17', 1, 33.9700012, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES ('GALED', 3, '1997-06-13', '1997-07-11', '1997-07-09', 3, 6.53999996, 'Galería del gastronómo', 'Rambla de Cataluña, 23', 'Barcelona', NULL, '8022', 'Spain');
INSERT INTO orders VALUES ('RATTC', 5, '1997-06-16', '1997-07-14', '1997-07-11', 1, 58.9799995, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES ('MEREP', 3, '1997-06-17', '1997-07-15', '1997-06-19', 3, 188.990005, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES ('ERNSH', 8, '1997-06-17', '1997-07-29', '1997-07-04', 3, 26.0599995, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES ('BERGS', 3, '1997-06-18', '1997-07-16', '1997-06-25', 2, 116.43, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES ('ANTON', 7, '1997-06-19', '1997-07-17', '1997-06-20', 3, 84.8399963, 'Antonio Moreno Taquería', 'Mataderos  2312', 'México D.F.', NULL, '05023', 'Mexico');
INSERT INTO orders VALUES ('TRAIH', 4, '1997-06-19', '1997-07-17', '1997-06-30', 2, 37.5999985, 'Trail''s Head Gourmet Provisioners', '722 DaVinci Blvd.', 'Kirkland', 'WA', '98034', 'USA');
INSERT INTO orders VALUES ('MORGK', 5, '1997-06-20', '1997-07-04', '1997-06-30', 1, 127.339996, 'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig', NULL, '04179', 'Germany');
INSERT INTO orders VALUES ('TORTU', 3, '1997-06-23', '1997-07-07', '1997-06-30', 3, 18.5599995, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES ('TRAIH', 9, '1997-06-23', '1997-08-04', '1997-06-30', 2, 25.4099998, 'Trail''s Head Gourmet Provisioners', '722 DaVinci Blvd.', 'Kirkland', 'WA', '98034', 'USA');
INSERT INTO orders VALUES ('BSBEV', 4, '1997-06-24', '1997-07-22', '1997-07-25', 3, 29.6000004, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO orders VALUES ('LETSS', 1, '1997-06-25', '1997-07-23', '1997-07-04', 2, 13.7299995, 'Let''s Stop N Shop', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA');
INSERT INTO orders VALUES ('OTTIK', 4, '1997-06-26', '1997-07-24', '1997-07-01', 3, 75.8899994, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Germany');
INSERT INTO orders VALUES ('FAMIA', 3, '1997-06-26', '1997-07-24', '1997-07-02', 1, 3.00999999, 'Familia Arquibaldo', 'Rua Orós, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil');
INSERT INTO orders VALUES ('BLAUS', 3, '1997-06-27', '1997-07-25', '1997-07-14', 2, 27.7099991, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany');
INSERT INTO orders VALUES ('WARTH', 2, '1997-06-30', '1997-07-28', '1997-07-04', 2, 7.28000021, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO orders VALUES ('BLONP', 4, '1997-06-30', '1997-07-28', '1997-07-04', 1, 59.1399994, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'France');
INSERT INTO orders VALUES ('WELLI', 7, '1997-07-01', '1997-07-29', '1997-07-10', 1, 13.4099998, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO orders VALUES ('REGGC', 9, '1997-07-02', '1997-07-30', '1997-07-09', 1, 0.479999989, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO orders VALUES ('QUEDE', 1, '1997-07-02', '1997-07-30', '1997-07-09', 1, 62.5200005, 'Que Delícia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO orders VALUES ('QUICK', 2, '1997-07-03', '1997-07-31', '1997-07-10', 3, 194.669998, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES ('GREAL', 8, '1997-07-04', '1997-08-01', '1997-07-14', 2, 4.42000008, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO orders VALUES ('MEREP', 4, '1997-07-07', '1997-08-04', '1997-07-14', 3, 44.7700005, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES ('VAFFE', 1, '1997-07-07', '1997-07-21', '1997-07-16', 1, 55.9199982, 'Vaffeljernet', 'Smagsloget 45', 'Århus', NULL, '8200', 'Denmark');
INSERT INTO orders VALUES ('LEHMS', 3, '1997-07-08', '1997-08-05', '1997-07-16', 1, 32.0999985, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO orders VALUES ('LEHMS', 7, '1997-07-09', '1997-08-06', '1997-08-13', 2, 174.199997, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO orders VALUES ('OLDWO', 3, '1997-07-09', '1997-08-06', '1997-07-16', 2, 5.23999977, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO orders VALUES ('ERNSH', 2, '1997-07-10', '1997-08-07', '1997-07-14', 1, 96.7799988, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES ('WHITC', 8, '1997-07-11', '1997-08-08', '1997-08-12', 1, 16.3400002, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES ('PICCO', 7, '1997-07-11', '1997-08-08', '1997-07-18', 3, 35.1199989, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria');
INSERT INTO orders VALUES ('RATTC', 1, '1997-07-14', '1997-08-11', '1997-07-18', 3, 44.4199982, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES ('BSBEV', 6, '1997-07-15', '1997-08-26', '1997-07-21', 3, 29.9799995, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO orders VALUES ('HUNGC', 4, '1997-07-16', '1997-08-13', '1997-07-21', 1, 45.1300011, 'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA');
INSERT INTO orders VALUES ('HILAA', 7, '1997-07-16', '1997-08-27', '1997-07-22', 1, 58.2999992, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO orders VALUES ('VAFFE', 8, '1997-07-17', '1997-08-14', '1997-07-22', 2, 2.92000008, 'Vaffeljernet', 'Smagsloget 45', 'Århus', NULL, '8200', 'Denmark');
INSERT INTO orders VALUES ('SAVEA', 8, '1997-07-18', '1997-08-15', '1997-08-08', 2, 48.7700005, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES ('FURIB', 1, '1997-07-18', '1997-08-15', '1997-07-29', 1, 7.46000004, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal');
INSERT INTO orders VALUES ('MEREP', 1, '1997-07-21', '1997-08-18', '1997-07-29', 2, 379.130005, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES ('TRADH', 4, '1997-07-22', '1997-08-19', '1997-07-31', 3, 79.4000015, 'Tradiçao Hipermercados', 'Av. Inês de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil');
INSERT INTO orders VALUES ('SAVEA', 5, '1997-07-22', '1997-08-19', '1997-07-25', 1, 200.240005, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES ('TOMSP', 4, '1997-07-23', '1997-08-20', '1997-08-01', 2, 27.7900009, 'Toms Spezialitäten', 'Luisenstr. 48', 'Münster', NULL, '44087', 'Germany');
INSERT INTO orders VALUES ('DUMON', 7, '1997-07-24', '1997-08-21', '1997-07-30', 2, 1.85000002, 'Du monde entier', '67, rue des Cinquante Otages', 'Nantes', NULL, '44000', 'France');
INSERT INTO orders VALUES ('LAMAI', 8, '1997-07-25', '1997-08-22', '1997-08-06', 1, 26.7800007, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO orders VALUES ('WOLZA', 6, '1997-07-25', '1997-08-22', '1997-08-01', 2, 80.6500015, 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Poland');
INSERT INTO orders VALUES ('SAVEA', 1, '1997-07-28', '1997-08-25', '1997-08-01', 2, 544.080017, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES ('HILAA', 4, '1997-07-29', '1997-08-26', '1997-08-01', 2, 8.10999966, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO orders VALUES ('BLAUS', 8, '1997-07-29', '1997-08-26', '1997-08-01', 3, 1.92999995, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany');
INSERT INTO orders VALUES ('WILMK', 2, '1997-07-30', '1997-08-27', '1997-08-06', 3, 0.75, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finland');
INSERT INTO orders VALUES ('GREAL', 1, '1997-07-31', '1997-08-28', '1997-08-05', 2, 116.529999, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO orders VALUES ('GREAL', 4, '1997-07-31', '1997-08-28', '1997-08-04', 2, 18.5300007, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO orders VALUES ('MEREP', 1, '1997-08-01', '1997-09-12', '1997-08-08', 1, 154.679993, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES ('MEREP', 3, '1997-08-04', '1997-09-01', '1997-08-07', 3, 91.0500031, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES ('LAUGB', 2, '1997-08-05', '1997-09-02', '1997-08-14', 3, 0.939999998, 'Laughing Bacchus Wine Cellars', '2319 Elm St.', 'Vancouver', 'BC', 'V3F 2K1', 'Canada');
INSERT INTO orders VALUES ('ISLAT', 4, '1997-08-05', '1997-09-02', '1997-08-11', 2, 23.7299995, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO orders VALUES ('RICAR', 4, '1997-08-06', '1997-09-03', '1997-08-11', 3, 50.9700012, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO orders VALUES ('FRANK', 8, '1997-08-07', '1997-09-04', '1997-08-12', 2, 97.1800003, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany');
INSERT INTO orders VALUES ('THECR', 4, '1997-08-07', '1997-09-04', '1997-08-19', 2, 94.8000031, 'The Cracker Box', '55 Grizzly Peak Rd.', 'Butte', 'MT', '59801', 'USA');
INSERT INTO orders VALUES ('ANATR', 3, '1997-08-08', '1997-09-05', '1997-08-14', 1, 43.9000015, 'Ana Trujillo Emparedados y helados', 'Avda. de la Constitución 2222', 'México D.F.', NULL, '05021', 'Mexico');
INSERT INTO orders VALUES ('BERGS', 1, '1997-08-11', '1997-09-08', '1997-08-20', 2, 138.690002, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES ('SAVEA', 8, '1997-08-11', '1997-09-22', '1997-08-21', 3, 107.459999, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES ('BLONP', 4, '1997-08-12', '1997-09-09', '1997-08-20', 3, 30.3600006, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'France');
INSERT INTO orders VALUES ('GODOS', 4, '1997-08-12', '1997-09-09', '1997-08-20', 3, 85.4599991, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain');
INSERT INTO orders VALUES ('KOENE', 1, '1997-08-13', '1997-09-10', '1997-08-19', 2, 32.3499985, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES ('LAMAI', 8, '1997-08-14', '1997-09-11', '1997-08-15', 1, 0.870000005, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO orders VALUES ('WANDK', 8, '1997-08-14', '1997-09-11', '1997-08-19', 1, 41.3800011, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany');
INSERT INTO orders VALUES ('ERNSH', 7, '1997-08-15', '1997-09-12', '1997-08-18', 3, 477.899994, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES ('FOLIG', 4, '1997-08-15', '1997-09-12', '1997-08-21', 3, 487.380005, 'Folies gourmandes', '184, chaussée de Tournai', 'Lille', NULL, '59000', 'France');
INSERT INTO orders VALUES ('MAGAA', 8, '1997-08-18', '1997-09-15', '1997-08-21', 3, 47.4599991, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy');
INSERT INTO orders VALUES ('WARTH', 4, '1997-08-19', '1997-09-16', '1997-08-26', 1, 1.14999998, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO orders VALUES ('QUEEN', 6, '1997-08-19', '1997-09-16', '1997-08-26', 1, 201.289993, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO orders VALUES ('LINOD', 3, '1997-08-20', '1997-09-17', '1997-09-01', 1, 158.440002, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO orders VALUES ('SANTG', 7, '1997-08-20', '1997-09-17', '1997-08-27', 3, 38.6399994, 'Santé Gourmet', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Norway');
INSERT INTO orders VALUES ('WANDK', 4, '1997-08-21', '1997-09-18', '1997-08-28', 1, 23.5499992, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany');
INSERT INTO orders VALUES ('HILAA', 4, '1997-08-22', '1997-09-19', '1997-08-26', 2, 179.610001, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO orders VALUES ('SIMOB', 7, '1997-08-22', '1997-09-19', '1997-09-05', 3, 41.8899994, 'Simons bistro', 'Vinbæltet 34', 'Kobenhavn', NULL, '1734', 'Denmark');
INSERT INTO orders VALUES ('ALFKI', 6, '1997-08-25', '1997-09-22', '1997-09-02', 1, 29.4599991, 'Alfreds Futterkiste', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany');
INSERT INTO orders VALUES ('WELLI', 3, '1997-08-25', '1997-09-22', '1997-09-01', 2, 0.140000001, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO orders VALUES ('HANAR', 4, '1997-08-26', '1997-09-23', '1997-09-02', 1, 12.4099998, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO orders VALUES ('HUNGO', 9, '1997-08-27', '1997-10-08', '1997-09-03', 3, 142.330002, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES ('QUEDE', 4, '1997-08-27', '1997-09-10', '1997-09-03', 2, 45.5400009, 'Que Delícia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO orders VALUES ('RICAR', 5, '1997-08-28', '1997-10-09', '1997-09-09', 2, 14.25, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO orders VALUES ('MAISD', 5, '1997-08-28', '1997-09-25', '1997-08-29', 3, 6.19999981, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Belgium');
INSERT INTO orders VALUES ('FAMIA', 5, '1997-08-29', '1997-09-26', '1997-09-03', 3, 176.809998, 'Familia Arquibaldo', 'Rua Orós, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil');
INSERT INTO orders VALUES ('WANDK', 8, '1997-09-01', '1997-09-29', '1997-09-11', 2, 20.6000004, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany');
INSERT INTO orders VALUES ('GOURL', 4, '1997-09-01', '1997-09-29', '1997-09-08', 2, 7.13999987, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO orders VALUES ('FRANK', 1, '1997-09-02', '1997-09-30', '1997-09-19', 1, 93.25, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany');
INSERT INTO orders VALUES ('BERGS', 5, '1997-09-02', '1997-09-30', '1997-09-11', 1, 55.2599983, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES ('REGGC', 1, '1997-09-03', '1997-10-01', '1997-09-11', 2, 4.40999985, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO orders VALUES ('GREAL', 6, '1997-09-04', '1997-10-02', '1997-09-10', 1, 57.1500015, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO orders VALUES ('SAVEA', 2, '1997-09-04', '1997-10-02', '1997-09-15', 2, 352.690002, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES ('QUICK', 4, '1997-09-05', '1997-10-03', '1997-09-08', 1, 364.149994, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES ('QUEEN', 7, '1997-09-05', '1997-10-03', '1997-09-10', 2, 105.809998, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO orders VALUES ('HUNGC', 8, '1997-09-08', '1997-10-06', '1997-10-15', 1, 111.290001, 'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA');
INSERT INTO orders VALUES ('HUNGO', 7, '1997-09-09', '1997-10-07', '1997-09-15', 3, 17.5499992, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES ('LONEP', 3, '1997-09-09', '1997-10-07', '1997-09-18', 2, 1.27999997, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO orders VALUES ('BONAP', 2, '1997-09-10', '1997-09-24', '1997-10-03', 2, 113.150002, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES ('FURIB', 1, '1997-09-10', '1997-10-08', '1997-09-19', 3, 1.26999998, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal');
INSERT INTO orders VALUES ('LONEP', 1, '1997-09-11', '1997-10-09', '1997-09-17', 2, 26.3099995, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO orders VALUES ('RICSU', 7, '1997-09-12', '1997-10-10', '1997-09-22', 2, 232.419998, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '1204', 'Switzerland');
INSERT INTO orders VALUES ('ERNSH', 7, '1997-09-12', '1997-10-10', '1997-09-19', 1, 78.0899963, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES ('WANDK', 1, '1997-09-15', '1997-10-13', '1997-09-23', 2, 47.2200012, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany');
INSERT INTO orders VALUES ('SIMOB', 2, '1997-09-15', '1997-10-13', '1997-09-22', 1, 24.3899994, 'Simons bistro', 'Vinbæltet 34', 'Kobenhavn', NULL, '1734', 'Denmark');
INSERT INTO orders VALUES ('FRANK', 4, '1997-09-16', '1997-10-14', '1997-09-18', 1, 203.479996, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany');
INSERT INTO orders VALUES ('FRANR', 1, '1997-09-17', '1997-10-15', '1997-09-24', 1, 30.3400002, 'France restauration', '54, rue Royale', 'Nantes', NULL, '44000', 'France');
INSERT INTO orders VALUES ('BERGS', 9, '1997-09-17', '1997-10-01', '1997-09-26', 2, 95.75, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES ('WILMK', 2, '1997-09-18', '1997-10-16', '1997-09-19', 1, 22.7600002, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finland');
INSERT INTO orders VALUES ('ISLAT', 4, '1997-09-18', '1997-10-16', '1997-09-30', 2, 0.899999976, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO orders VALUES ('FRANK', 5, '1997-09-19', '1997-10-17', '1997-09-23', 2, 31.8500004, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany');
INSERT INTO orders VALUES ('TORTU', 2, '1997-09-22', '1997-10-20', '1997-09-29', 2, 2.00999999, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES ('ANTON', 1, '1997-09-22', '1997-10-20', '1997-09-26', 3, 4.03000021, 'Antonio Moreno Taquería', 'Mataderos  2312', 'México D.F.', NULL, '05023', 'Mexico');
INSERT INTO orders VALUES ('SAVEA', 7, '1997-09-23', '1997-10-21', '1997-10-16', 3, 388.980011, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES ('BLONP', 8, '1997-09-23', '1997-10-21', '1997-09-30', 3, 27.9400005, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'France');
INSERT INTO orders VALUES ('OLDWO', 1, '1997-09-24', '1997-10-22', '1997-09-26', 1, 26.6100006, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO orders VALUES ('GREAL', 3, '1997-09-25', '1997-10-23', '1997-09-30', 3, 76.1299973, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO orders VALUES ('ANTON', 3, '1997-09-25', '1997-10-23', '1997-10-01', 2, 36.1300011, 'Antonio Moreno Taquería', 'Mataderos  2312', 'México D.F.', NULL, '05023', 'Mexico');
INSERT INTO orders VALUES ('DUMON', 2, '1997-09-26', '1997-10-24', '1997-10-01', 1, 4.4000001, 'Du monde entier', '67, rue des Cinquante Otages', 'Nantes', NULL, '44000', 'France');
INSERT INTO orders VALUES ('OTTIK', 3, '1997-09-26', '1997-10-24', '1997-09-30', 1, 145.630005, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Germany');
INSERT INTO orders VALUES ('GOURL', 4, '1997-09-29', '1997-10-13', '1997-10-03', 2, 33.75, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO orders VALUES ('PICCO', 2, '1997-09-30', '1997-10-28', '1997-10-08', 1, 96.5, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria');
INSERT INTO orders VALUES ('HUNGO', 9, '1997-09-30', '1997-10-28', '1997-10-30', 2, 296.429993, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES ('VAFFE', 4, '1997-10-01', '1997-10-15', '1997-10-07', 2, 299.089996, 'Vaffeljernet', 'Smagsloget 45', 'Århus', NULL, '8200', 'Denmark');
INSERT INTO orders VALUES ('BERGS', 1, '1997-10-01', '1997-10-29', '1997-10-07', 2, 13.4200001, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES ('HANAR', 1, '1997-10-02', '1997-10-30', '1997-10-03', 1, 15.8000002, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO orders VALUES ('QUICK', 2, '1997-10-03', '1997-11-14', '1997-10-22', 2, 810.049988, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES ('ALFKI', 4, '1997-10-03', '1997-10-31', '1997-10-13', 2, 61.0200005, 'Alfred''s Futterkiste', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany');
INSERT INTO orders VALUES ('WHITC', 3, '1997-10-06', '1997-10-20', '1997-10-10', 3, 139.339996, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES ('QUICK', 8, '1997-10-06', '1997-11-03', '1997-10-09', 3, 398.359985, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES ('WILMK', 7, '1997-10-07', '1997-11-18', '1997-10-14', 1, 16.7199993, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finland');
INSERT INTO orders VALUES ('WHITC', 8, '1997-10-08', '1997-11-19', '1997-10-14', 3, 102.550003, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES ('LINOD', 3, '1997-10-08', '1997-11-05', '1997-10-14', 1, 45.5200005, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO orders VALUES ('ERNSH', 4, '1997-10-09', '1997-11-06', '1997-10-17', 1, 272.470001, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES ('MORGK', 3, '1997-10-09', '1997-11-06', '1997-10-13', 3, 0.579999983, 'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig', NULL, '04179', 'Germany');
INSERT INTO orders VALUES ('SAVEA', 3, '1997-10-10', '1997-11-07', '1997-10-16', 1, 65.0999985, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES ('HUNGO', 6, '1997-10-13', '1997-10-27', '1997-10-15', 3, 220.309998, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES ('ALFKI', 4, '1997-10-13', '1997-11-24', '1997-10-21', 1, 23.9400005, 'Alfred''s Futterkiste', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany');
INSERT INTO orders VALUES ('FOLKO', 6, '1997-10-14', '1997-11-11', '1997-10-20', 2, 152.300003, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES ('QUEEN', 6, '1997-10-14', '1997-11-11', '1997-11-07', 1, 4.78000021, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO orders VALUES ('HILAA', 9, '1997-10-15', '1997-11-12', '1997-11-18', 2, 3.51999998, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO orders VALUES ('OLDWO', 8, '1997-10-16', '1997-11-13', '1997-10-21', 3, 135.630005, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO orders VALUES ('AROUT', 4, '1997-10-16', '1997-10-30', '1997-10-23', 3, 21.7399998, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES ('THEBI', 6, '1997-10-17', '1997-11-28', '1997-11-05', 2, 2.96000004, 'The Big Cheese', '89 Jefferson Way Suite 2', 'Portland', 'OR', '97201', 'USA');
INSERT INTO orders VALUES ('GOURL', 1, '1997-10-17', '1997-11-14', '1997-11-20', 3, 210.800003, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO orders VALUES ('FRANS', 1, '1997-10-20', '1997-11-17', '1997-10-23', 1, 4.98000002, 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italy');
INSERT INTO orders VALUES ('SAVEA', 5, '1997-10-21', '1997-12-02', '1997-10-29', 2, 52.4099998, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES ('HUNGO', 3, '1997-10-21', '1997-11-18', '1997-10-31', 1, 89.9300003, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES ('SAVEA', 1, '1997-10-22', '1997-11-19', '1997-10-24', 1, 167.050003, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES ('SAVEA', 5, '1997-10-22', '1997-11-19', '1997-10-27', 3, 24.4899998, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES ('BONAP', 3, '1997-10-23', '1997-11-06', '1997-10-29', 1, 63.2000008, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES ('RANCH', 4, '1997-10-24', '1997-11-21', '1997-10-27', 2, 22.5699997, 'Rancho grande', 'Av. del Libertador 900', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO orders VALUES ('FRANK', 1, '1997-10-24', '1997-11-21', '1997-10-29', 2, 59.25, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany');
INSERT INTO orders VALUES ('KOENE', 1, '1997-10-27', '1997-11-24', '1997-10-29', 3, 170.880005, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES ('LETSS', 8, '1997-10-27', '1997-11-24', '1997-11-05', 2, 51.4399986, 'Let''s Stop N Shop', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA');
INSERT INTO orders VALUES ('QUEDE', 8, '1997-10-28', '1997-11-11', '1997-11-05', 2, 9.52999973, 'Que Delícia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO orders VALUES ('QUICK', 5, '1997-10-29', '1997-11-26', '1997-10-31', 3, 48.9199982, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES ('SAVEA', 8, '1997-10-29', '1997-12-10', '1997-11-04', 1, 74.5800018, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES ('WHITC', 3, '1997-10-30', '1997-11-27', '1997-11-25', 1, 21.7199993, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES ('MEREP', 8, '1997-10-30', '1997-12-11', '1997-11-05', 2, 57.75, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES ('FAMIA', 4, '1997-10-31', '1997-11-28', '1997-11-05', 3, 10.8299999, 'Familia Arquibaldo', 'Rua Orós, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil');
INSERT INTO orders VALUES ('EASTC', 4, '1997-11-03', '1997-11-17', '1997-12-05', 1, 16.5599995, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK');
INSERT INTO orders VALUES ('REGGC', 2, '1997-11-03', '1997-12-01', '1997-12-05', 1, 89.9000015, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO orders VALUES ('QUEEN', 4, '1997-11-04', '1997-12-02', '1997-11-11', 2, 58.3300018, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO orders VALUES ('LINOD', 8, '1997-11-04', '1997-12-16', '1997-11-14', 3, 141.059998, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO orders VALUES ('BONAP', 5, '1997-11-05', '1997-12-03', '1997-11-14', 1, 20.1200008, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES ('CHOPS', 7, '1997-11-06', '1997-12-04', '1997-11-14', 1, 96.6500015, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland');
INSERT INTO orders VALUES ('BONAP', 3, '1997-11-06', '1997-12-04', '1997-11-07', 1, 16.9699993, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES ('BERGS', 1, '1997-11-07', '1997-12-05', '1997-11-10', 3, 110.110001, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES ('GOURL', 2, '1997-11-07', '1997-12-05', '1997-11-12', 3, 1.63, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO orders VALUES ('LETSS', 6, '1997-11-10', '1997-12-08', '1997-11-21', 2, 45.9700012, 'Let''s Stop N Shop', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA');
INSERT INTO orders VALUES ('HUNGO', 9, '1997-11-11', '1997-12-09', '1997-11-21', 2, 44.0999985, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES ('VINET', 2, '1997-11-11', '1997-12-09', '1997-11-18', 2, 7.78999996, 'Vins et alcools Chevalier', '59 rue de l''Abbaye', 'Reims', NULL, '51100', 'France');
INSERT INTO orders VALUES ('SPECD', 2, '1997-11-12', '1997-12-10', '1997-11-18', 1, 2.91000009, 'Spécialités du monde', '25, rue Lauriston', 'Paris', NULL, '75016', 'France');
INSERT INTO orders VALUES ('VINET', 3, '1997-11-12', '1997-12-10', '1997-11-17', 3, 11.0799999, 'Vins et alcools Chevalier', '59 rue de l''Abbaye', 'Reims', NULL, '51100', 'France');
INSERT INTO orders VALUES ('WHITC', 4, '1997-11-13', '1997-12-11', '1997-11-25', 2, 81.8799973, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES ('AROUT', 4, '1997-11-14', '1997-11-28', '1997-11-18', 3, 10.96, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES ('BOTTM', 3, '1997-11-14', '1997-12-12', '1997-11-18', 3, 243.729996, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES ('AROUT', 1, '1997-11-17', '1997-12-15', '1997-11-21', 2, 23.7199993, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES ('VAFFE', 6, '1997-11-17', '1997-12-15', '1997-11-24', 1, 69.1900024, 'Vaffeljernet', 'Smagsloget 45', 'Århus', NULL, '8200', 'Denmark');
INSERT INTO orders VALUES ('QUICK', 9, '1997-11-18', '1997-12-16', '1997-11-27', 1, 3.51999998, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES ('CHOPS', 1, '1997-11-19', '1997-12-17', '1997-11-21', 3, 31.4300003, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland');
INSERT INTO orders VALUES ('PICCO', 6, '1997-11-19', '1997-12-17', '1997-11-26', 1, 117.330002, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria');
INSERT INTO orders VALUES ('SAVEA', 3, '1997-11-20', '1997-12-18', '1997-11-28', 1, 232.550003, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES ('ISLAT', 4, '1997-11-20', '1997-12-18', '1997-12-19', 2, 61.5299988, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO orders VALUES ('WARTH', 9, '1997-11-21', '1997-12-19', '1997-11-24', 1, 79.3000031, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO orders VALUES ('RICSU', 3, '1997-11-24', '1997-12-22', '1997-12-03', 3, 130.789993, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '1204', 'Switzerland');
INSERT INTO orders VALUES ('NORTS', 2, '1997-11-24', '1997-12-22', '1997-11-28', 3, 1.38999999, 'North/South', 'South House 300 Queensbridge', 'London', NULL, 'SW7 1RZ', 'UK');
INSERT INTO orders VALUES ('FRANS', 3, '1997-11-25', '1997-12-23', '1997-11-27', 1, 7.69999981, 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italy');
INSERT INTO orders VALUES ('MAGAA', 6, '1997-11-25', '1997-12-23', '1997-11-27', 3, 2.38000011, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy');
INSERT INTO orders VALUES ('BONAP', 4, '1997-11-26', '1997-12-24', '1997-11-28', 2, 16.7099991, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES ('SPLIR', 8, '1997-11-27', '1997-12-25', '1997-12-02', 2, 73.2099991, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO orders VALUES ('SAVEA', 6, '1997-11-27', '1997-12-25', '1997-12-15', 1, 8.18999958, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES ('RICSU', 3, '1997-11-28', '1997-12-26', '1997-12-04', 3, 138.169998, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '1204', 'Switzerland');
INSERT INTO orders VALUES ('ANATR', 3, '1997-11-28', '1997-12-26', '1997-12-12', 3, 11.9899998, 'Ana Trujillo Emparedados y helados', 'Avda. de la Constitución 2222', 'México D.F.', NULL, '05021', 'Mexico');
INSERT INTO orders VALUES ('MAISD', 4, '1997-12-01', '1997-12-29', '1997-12-10', 1, 155.639999, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Belgium');
INSERT INTO orders VALUES ('RATTC', 5, '1997-12-02', '1997-12-30', '1997-12-08', 2, 18.6599998, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES ('FOLKO', 3, '1997-12-02', '1997-12-30', '1997-12-09', 1, 328.73999, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES ('FOLIG', 3, '1997-12-03', '1997-12-31', '1997-12-08', 3, 37.3499985, 'Folies gourmandes', '184, chaussée de Tournai', 'Lille', NULL, '59000', 'France');
INSERT INTO orders VALUES ('ERNSH', 6, '1997-12-03', '1997-12-31', '1997-12-08', 3, 145.449997, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES ('QUICK', 3, '1997-12-04', '1998-01-01', '1997-12-09', 3, 42.7400017, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES ('OTTIK', 4, '1997-12-05', '1998-01-02', '1997-12-09', 1, 157.550003, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Germany');
INSERT INTO orders VALUES ('SUPRD', 4, '1997-12-05', '1998-01-02', '1997-12-15', 3, 1.59000003, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO orders VALUES ('AROUT', 3, '1997-12-08', '1998-01-05', '1997-12-15', 2, 146.320007, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES ('VAFFE', 3, '1997-12-08', '1998-01-05', '1997-12-12', 1, 65.0599976, 'Vaffeljernet', 'Smagsloget 45', 'Århus', NULL, '8200', 'Denmark');
INSERT INTO orders VALUES ('HANAR', 8, '1997-12-09', '1998-01-06', '1997-12-17', 3, 5.32000017, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO orders VALUES ('ERNSH', 9, '1997-12-10', '1998-01-07', '1998-01-02', 2, 11.1899996, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES ('LEHMS', 3, '1997-12-10', '1998-01-07', '1997-12-19', 2, 91.2799988, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO orders VALUES ('ERNSH', 1, '1997-12-11', '1998-01-08', '1997-12-16', 3, 96.4300003, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES ('FOLKO', 4, '1997-12-11', '1997-12-25', '1997-12-12', 1, 48.2000008, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES ('THECR', 7, '1997-12-12', '1998-01-09', '1997-12-26', 1, 20.25, 'The Cracker Box', '55 Grizzly Peak Rd.', 'Butte', 'MT', '59801', 'USA');
INSERT INTO orders VALUES ('ERNSH', 1, '1997-12-15', '1998-01-12', '1997-12-18', 3, 351.529999, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES ('GOURL', 7, '1997-12-15', '1997-12-29', '1998-01-21', 2, 3.00999999, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO orders VALUES ('BERGS', 3, '1997-12-16', '1998-01-13', '1997-12-24', 1, 6.78999996, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES ('MORGK', 3, '1997-12-16', '1998-01-13', '1998-01-14', 2, 58.1300011, 'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig', NULL, '04179', 'Germany');
INSERT INTO orders VALUES ('LILAS', 2, '1997-12-16', '1997-12-30', '1997-12-25', 1, 42.1300011, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO orders VALUES ('WARTH', 2, '1997-12-17', '1998-01-14', '1997-12-19', 3, 73.1600037, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO orders VALUES ('CACTU', 9, '1997-12-17', '1998-01-14', '1997-12-22', 3, 1.10000002, 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO orders VALUES ('HANAR', 4, '1997-12-18', '1998-01-15', '1997-12-19', 2, 124.980003, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO orders VALUES ('MAGAA', 4, '1997-12-18', '1998-01-15', '1997-12-22', 3, 70.0899963, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy');
INSERT INTO orders VALUES ('GROSR', 1, '1997-12-18', '1998-01-15', '1997-12-24', 3, 1.50999999, 'GROSELLA-Restaurante', '5ª Ave. Los Palos Grandes', 'Caracas', 'DF', '1081', 'Venezuela');
INSERT INTO orders VALUES ('QUEEN', 8, '1997-12-19', '1998-01-16', '1997-12-23', 1, 110.870003, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO orders VALUES ('LAMAI', 2, '1997-12-19', '1998-01-02', '1997-12-26', 1, 249.929993, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO orders VALUES ('QUICK', 1, '1997-12-22', '1998-01-19', '1998-01-19', 2, 42.7000008, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES ('FOLIG', 1, '1997-12-22', '1998-01-19', '1997-12-31', 2, 100.599998, 'Folies gourmandes', '184, chaussée de Tournai', 'Lille', NULL, '59000', 'France');
INSERT INTO orders VALUES ('GOURL', 6, '1997-12-22', '1998-01-19', '1997-12-26', 1, 28.2299995, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO orders VALUES ('FRANK', 6, '1997-12-23', '1998-01-20', '1998-01-01', 2, 16.8500004, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany');
INSERT INTO orders VALUES ('WOLZA', 1, '1997-12-23', '1998-01-20', '1997-12-31', 3, 23.7900009, 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Poland');
INSERT INTO orders VALUES ('AROUT', 3, '1997-12-24', '1998-01-21', '1998-01-08', 3, 4.51999998, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES ('QUEDE', 6, '1997-12-24', '1998-01-21', '1998-01-02', 1, 21.4899998, 'Que Delícia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO orders VALUES ('ERNSH', 8, '1997-12-24', '1998-01-21', '1998-01-20', 2, 126.660004, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES ('HILAA', 3, '1997-12-25', '1998-01-22', '1998-01-14', 1, 26.5200005, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO orders VALUES ('DRACD', 7, '1997-12-25', '1998-01-22', '1998-01-05', 2, 33.3499985, 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', NULL, '52066', 'Germany');
INSERT INTO orders VALUES ('ISLAT', 2, '1997-12-26', '1998-01-23', '1998-01-05', 1, 2.32999992, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO orders VALUES ('KOENE', 9, '1997-12-26', '1998-02-06', '1998-01-05', 3, 30.7600002, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES ('SEVES', 1, '1997-12-26', '1998-01-23', '1998-01-05', 3, 137.440002, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK');
INSERT INTO orders VALUES ('BOLID', 4, '1997-12-29', '1998-01-26', '1997-12-31', 2, 97.0899963, 'Bólido Comidas preparadas', 'C/ Araquil, 67', 'Madrid', NULL, '28023', 'Spain');
INSERT INTO orders VALUES ('SIMOB', 4, '1997-12-29', '1998-01-26', '1998-01-02', 2, 257.26001, 'Simons bistro', 'Vinbæltet 34', 'Kobenhavn', NULL, '1734', 'Denmark');
INSERT INTO orders VALUES ('WELLI', 4, '1997-12-30', '1998-01-27', '1998-01-06', 1, 55.2299995, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO orders VALUES ('SEVES', 6, '1997-12-30', '1998-01-27', '1998-01-07', 2, 27.3299999, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK');
INSERT INTO orders VALUES ('THEBI', 2, '1997-12-30', '1998-01-27', '1998-01-09', 3, 237.339996, 'The Big Cheese', '89 Jefferson Way Suite 2', 'Portland', 'OR', '97201', 'USA');
INSERT INTO orders VALUES ('VICTE', 3, '1997-12-31', '1998-01-28', '1998-01-05', 2, 22.1100006, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France');
INSERT INTO orders VALUES ('FRANS', 4, '1997-12-31', '1998-01-28', '1998-01-30', 1, 1.36000001, 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italy');
INSERT INTO orders VALUES ('OLDWO', 2, '1998-01-01', '1998-01-29', '1998-01-09', 3, 45.5299988, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO orders VALUES ('WELLI', 7, '1998-01-01', '1998-01-29', '1998-01-07', 1, 4.86999989, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO orders VALUES ('LAUGB', 2, '1998-01-01', '1998-01-29', '1998-01-07', 3, 4.32999992, 'Laughing Bacchus Wine Cellars', '2319 Elm St.', 'Vancouver', 'BC', 'V3F 2K1', 'Canada');
INSERT INTO orders VALUES ('LINOD', 8, '1998-01-02', '1998-01-30', '1998-01-08', 1, 31.2199993, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO orders VALUES ('REGGC', 5, '1998-01-02', '1998-01-30', '1998-01-12', 1, 59.7799988, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO orders VALUES ('RICAR', 1, '1998-01-05', '1998-02-02', '1998-01-09', 1, 47.3800011, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO orders VALUES ('VICTE', 3, '1998-01-05', '1998-02-02', '1998-01-14', 3, 130.940002, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France');
INSERT INTO orders VALUES ('SAVEA', 2, '1998-01-05', '1998-02-02', '1998-01-14', 3, 14.6199999, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES ('GREAL', 4, '1998-01-06', '1998-02-03', '1998-02-04', 2, 719.780029, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO orders VALUES ('KOENE', 3, '1998-01-06', '1998-01-20', '1998-01-13', 2, 306.070007, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES ('MAGAA', 7, '1998-01-07', '1998-02-04', '1998-01-12', 3, 65.4800034, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy');
INSERT INTO orders VALUES ('CACTU', 2, '1998-01-07', '1998-02-04', '1998-01-16', 3, 19.7600002, 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO orders VALUES ('RATTC', 3, '1998-01-07', '1998-02-04', '1998-01-13', 2, 37.5200005, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES ('SPLIR', 1, '1998-01-08', '1998-02-05', '1998-01-15', 1, 36.6800003, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO orders VALUES ('TRAIH', 6, '1998-01-08', '1998-02-05', '1998-01-16', 3, 7, 'Trail''s Head Gourmet Provisioners', '722 DaVinci Blvd.', 'Kirkland', 'WA', '98034', 'USA');
INSERT INTO orders VALUES ('LILAS', 5, '1998-01-09', '1998-02-06', '1998-01-13', 2, 163.970001, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO orders VALUES ('FOLKO', 8, '1998-01-09', '1998-02-06', '1998-01-30', 1, 1.23000002, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES ('DRACD', 1, '1998-01-09', '1998-02-06', '1998-01-14', 1, 79.25, 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', NULL, '52066', 'Germany');
INSERT INTO orders VALUES ('BLONP', 6, '1998-01-12', '1998-02-09', '1998-02-06', 1, 7.09000015, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'France');
INSERT INTO orders VALUES ('BONAP', 1, '1998-01-12', '1998-01-26', '1998-02-06', 2, 63.5400009, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES ('RANCH', 9, '1998-01-13', '1998-01-27', '1998-02-04', 1, 90.8499985, 'Rancho grande', 'Av. del Libertador 900', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO orders VALUES ('ISLAT', 9, '1998-01-13', '1998-02-10', '1998-01-23', 1, 154.720001, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO orders VALUES ('TRADH', 4, '1998-01-13', '1998-02-24', '1998-01-21', 2, 81.8300018, 'Tradiçao Hipermercados', 'Av. Inês de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil');
INSERT INTO orders VALUES ('SANTG', 3, '1998-01-14', '1998-02-11', '1998-01-23', 2, 72.1900024, 'Santé Gourmet', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Norway');
INSERT INTO orders VALUES ('LAMAI', 2, '1998-01-14', '1998-02-11', '1998-01-19', 2, 43.2599983, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO orders VALUES ('OTTIK', 6, '1998-01-15', '1998-02-12', '1998-01-23', 2, 71.4899979, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Germany');
INSERT INTO orders VALUES ('TRADH', 1, '1998-01-15', '1998-02-12', '1998-01-19', 3, 29.7800007, 'Tradiçao Hipermercados', 'Av. Inês de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil');
INSERT INTO orders VALUES ('ALFKI', 1, '1998-01-15', '1998-02-12', '1998-01-21', 3, 69.5299988, 'Alfred''s Futterkiste', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany');
INSERT INTO orders VALUES ('ERNSH', 7, '1998-01-16', '1998-02-13', '1998-01-21', 1, 411.880005, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES ('BERGS', 9, '1998-01-16', '1998-02-13', '1998-01-23', 3, 13.3199997, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES ('LINOD', 3, '1998-01-19', '1998-02-16', '1998-01-23', 3, 59.2799988, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO orders VALUES ('TRADH', 3, '1998-01-19', '1998-02-16', '1998-01-22', 3, 35.4300003, 'Tradiçao Hipermercados', 'Av. Inês de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil');
INSERT INTO orders VALUES ('LINOD', 4, '1998-01-19', '1998-03-02', '1998-02-16', 2, 2.71000004, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO orders VALUES ('SUPRD', 5, '1998-01-20', '1998-02-17', '1998-01-29', 2, 424.299988, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO orders VALUES ('TORTU', 1, '1998-01-20', '1998-02-17', '1998-01-29', 3, 54.4199982, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES ('VICTE', 4, '1998-01-21', '1998-02-18', '1998-01-26', 2, 9.26000023, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France');
INSERT INTO orders VALUES ('PICCO', 8, '1998-01-21', '1998-02-18', '1998-01-26', 2, 25.2199993, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria');
INSERT INTO orders VALUES ('QUICK', 8, '1998-01-21', '1998-02-04', '1998-01-30', 1, 212.979996, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES ('SUPRD', 2, '1998-01-22', '1998-03-05', '1998-01-23', 3, 56.4599991, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO orders VALUES ('SAVEA', 4, '1998-01-22', '1998-02-05', '1998-02-10', 3, 487.570007, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES ('CONSH', 7, '1998-01-23', '1998-02-20', '1998-01-29', 2, 38.2400017, 'Consolidated Holdings', 'Berkeley Gardens 12  Brewery', 'London', NULL, 'WX1 6LT', 'UK');
INSERT INTO orders VALUES ('KOENE', 9, '1998-01-23', '1998-02-20', '1998-01-30', 2, 0.560000002, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES ('VICTE', 1, '1998-01-23', '1998-03-06', '1998-01-30', 1, 49.1899986, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France');
INSERT INTO orders VALUES ('RICAR', 5, '1998-01-26', '1998-02-23', '1998-02-02', 1, 160.550003, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO orders VALUES ('RATTC', 8, '1998-01-26', '1998-02-09', '1998-01-30', 1, 174.050003, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES ('BLAUS', 9, '1998-01-27', '1998-02-24', '1998-02-03', 2, 53.8300018, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany');
INSERT INTO orders VALUES ('ERNSH', 3, '1998-01-27', '1998-02-24', '1998-02-05', 2, 100.220001, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES ('OLDWO', 3, '1998-01-27', '1998-02-24', '1998-02-04', 1, 170.970001, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO orders VALUES ('ANTON', 3, '1998-01-28', '1998-02-25', '1998-02-10', 2, 58.4300003, 'Antonio Moreno Taquería', 'Mataderos  2312', 'México D.F.', NULL, '05023', 'Mexico');
INSERT INTO orders VALUES ('BERGS', 8, '1998-01-28', '1998-02-25', '1998-02-06', 2, 188.850006, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES ('LACOR', 2, '1998-01-29', '1998-02-26', '1998-02-03', 1, 52.5099983, 'La corne d''abondance', '67, avenue de l''Europe', 'Versailles', NULL, '78000', 'France');
INSERT INTO orders VALUES ('FRANK', 1, '1998-01-29', '1998-02-26', '1998-02-02', 2, 76.0999985, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany');
INSERT INTO orders VALUES ('FRANR', 3, '1998-01-29', '1998-02-26', '1998-02-04', 3, 19.2600002, 'France restauration', '54, rue Royale', 'Nantes', NULL, '44000', 'France');
INSERT INTO orders VALUES ('WHITC', 4, '1998-01-30', '1998-02-27', '1998-02-17', 2, 14.9300003, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES ('LEHMS', 8, '1998-01-30', '1998-03-13', '1998-02-02', 2, 53.2299995, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO orders VALUES ('HILAA', 4, '1998-02-02', '1998-03-02', '1998-02-17', 2, 30.2600002, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO orders VALUES ('AROUT', 4, '1998-02-02', '1998-03-02', '1998-02-09', 2, 3.03999996, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES ('QUICK', 2, '1998-02-02', '1998-02-16', '1998-02-12', 1, 348.140015, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES ('BERGS', 5, '1998-02-03', '1998-03-03', '1998-02-12', 1, 109.110001, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES ('LONEP', 6, '1998-02-03', '1998-03-17', '1998-02-11', 1, 1.92999995, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO orders VALUES ('QUEEN', 7, '1998-02-04', '1998-03-04', '1998-02-23', 2, 191.270004, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO orders VALUES ('SEVES', 5, '1998-02-04', '1998-03-04', '1998-02-09', 1, 143.279999, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK');
INSERT INTO orders VALUES ('WOLZA', 5, '1998-02-04', '1998-03-04', '1998-02-13', 3, 12.04, 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Poland');
INSERT INTO orders VALUES ('BONAP', 9, '1998-02-05', '1998-03-05', '1998-02-10', 2, 112.269997, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES ('GODOS', 5, '1998-02-05', '1998-03-05', '1998-02-09', 2, 175.320007, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain');
INSERT INTO orders VALUES ('WILMK', 4, '1998-02-06', '1998-03-06', '1998-02-09', 1, 0.819999993, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finland');
INSERT INTO orders VALUES ('GODOS', 5, '1998-02-06', '1998-03-06', '1998-02-11', 2, 19.5799999, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain');
INSERT INTO orders VALUES ('BERGS', 4, '1998-02-06', '1998-03-06', '1998-03-03', 2, 32.3699989, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES ('BONAP', 7, '1998-02-09', '1998-03-09', '1998-02-12', 3, 60.4199982, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES ('RICAR', 1, '1998-02-09', '1998-03-09', '1998-02-19', 1, 38.0600014, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO orders VALUES ('QUICK', 4, '1998-02-10', '1998-03-10', '1998-02-12', 1, 46.6899986, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES ('WILMK', 3, '1998-02-10', '1998-03-10', '1998-02-12', 3, 8.5, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finland');
INSERT INTO orders VALUES ('FOLKO', 7, '1998-02-10', '1998-03-24', '1998-02-18', 1, 88.0100021, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES ('CACTU', 4, '1998-02-11', '1998-03-11', '1998-02-18', 1, 2.83999991, 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO orders VALUES ('SAVEA', 4, '1998-02-11', '1998-03-11', '1998-02-20', 3, 23.1000004, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES ('LONEP', 8, '1998-02-12', '1998-03-12', '1998-02-20', 3, 0.529999971, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO orders VALUES ('LETSS', 4, '1998-02-12', '1998-03-12', '1998-02-13', 2, 90.9700012, 'Let''s Stop N Shop', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA');
INSERT INTO orders VALUES ('SUPRD', 6, '1998-02-12', '1998-03-12', '1998-02-18', 3, 5.63999987, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO orders VALUES ('HANAR', 1, '1998-02-13', '1998-03-13', '1998-03-02', 1, 4.98999977, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO orders VALUES ('GALED', 8, '1998-02-13', '1998-03-13', '1998-02-16', 3, 1.25, 'Galería del gastronómo', 'Rambla de Cataluña, 23', 'Barcelona', NULL, '8022', 'Spain');
INSERT INTO orders VALUES ('GODOS', 1, '1998-02-16', '1998-03-16', '1998-02-23', 2, 51.8699989, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain');
INSERT INTO orders VALUES ('RATTC', 9, '1998-02-16', '1998-03-16', '1998-02-23', 3, 280.609985, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES ('DUMON', 7, '1998-02-16', '1998-03-16', '1998-02-18', 1, 32.7599983, 'Du monde entier', '67, rue des Cinquante Otages', 'Nantes', NULL, '44000', 'France');
INSERT INTO orders VALUES ('LEHMS', 7, '1998-02-17', '1998-03-17', '1998-02-19', 2, 20.3700008, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO orders VALUES ('MAISD', 4, '1998-02-17', '1998-03-17', '1998-02-19', 2, 120.269997, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Belgium');
INSERT INTO orders VALUES ('KOENE', 9, '1998-02-18', '1998-03-18', '1998-02-20', 2, 77.7799988, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES ('SAVEA', 1, '1998-02-18', '1998-03-18', '1998-02-20', 1, 116.129997, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES ('ERNSH', 3, '1998-02-18', '1998-03-18', '1998-02-23', 1, 162.75, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES ('MAISD', 7, '1998-02-19', '1998-03-19', '1998-02-27', 3, 32.4500008, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Belgium');
INSERT INTO orders VALUES ('HUNGO', 3, '1998-02-19', '1998-03-19', '1998-02-25', 2, 603.539978, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES ('OCEAN', 4, '1998-02-20', '1998-03-20', '1998-03-06', 2, 1.26999998, 'Océano Atlántico Ltda.', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO orders VALUES ('LILAS', 5, '1998-02-20', '1998-03-20', '1998-02-26', 3, 1.21000004, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO orders VALUES ('WELLI', 1, '1998-02-20', '1998-03-20', '1998-03-04', 2, 1.65999997, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO orders VALUES ('HILAA', 4, '1998-02-23', '1998-03-23', '1998-02-26', 1, 62.0900002, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO orders VALUES ('FOLKO', 1, '1998-02-23', '1998-03-23', '1998-03-03', 1, 44.1500015, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES ('HANAR', 3, '1998-02-24', '1998-03-24', '1998-03-04', 3, 36.7099991, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO orders VALUES ('WHITC', 3, '1998-02-24', '1998-03-24', '1998-02-27', 3, 162.949997, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES ('WELLI', 9, '1998-02-24', '1998-03-24', '1998-03-06', 2, 13.7200003, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO orders VALUES ('WOLZA', 4, '1998-02-25', '1998-03-11', '1998-03-03', 3, 26.2900009, 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Poland');
INSERT INTO orders VALUES ('SPECD', 6, '1998-02-25', '1998-03-25', '1998-02-27', 3, 9.18999958, 'Spécialités du monde', '25, rue Lauriston', 'Paris', NULL, '75016', 'France');
INSERT INTO orders VALUES ('REGGC', 4, '1998-02-26', '1998-03-26', '1998-03-06', 2, 32.9599991, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO orders VALUES ('SANTG', 1, '1998-02-26', '1998-03-26', '1998-03-10', 2, 53.0499992, 'Santé Gourmet', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Norway');
INSERT INTO orders VALUES ('WILMK', 1, '1998-02-26', '1998-03-26', '1998-03-04', 3, 38.1100006, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finland');
INSERT INTO orders VALUES ('GODOS', 3, '1998-02-26', '1998-03-26', '1998-03-05', 1, 38.1899986, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain');
INSERT INTO orders VALUES ('HUNGO', 2, '1998-02-26', '1998-03-26', '1998-03-18', 2, 580.909973, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES ('QUEEN', 4, '1998-02-26', '1998-03-26', '1998-03-04', 1, 33.0499992, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO orders VALUES ('QUEEN', 6, '1998-02-27', '1998-03-27', '1998-03-02', 1, 21.1900005, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO orders VALUES ('TORTU', 2, '1998-02-27', '1998-03-27', '1998-03-02', 2, 3.50999999, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES ('RANCH', 1, '1998-02-27', '1998-03-27', '1998-03-09', 2, 63.7700005, 'Rancho grande', 'Av. del Libertador 900', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO orders VALUES ('ROMEY', 4, '1998-03-02', '1998-03-30', '1998-03-11', 2, 8.28999996, 'Romero y tomillo', 'Gran Vía, 1', 'Madrid', NULL, '28001', 'Spain');
INSERT INTO orders VALUES ('BOTTM', 3, '1998-03-02', '1998-03-30', '1998-03-11', 3, 48.8300018, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES ('LINOD', 2, '1998-03-02', '1998-03-30', '1998-03-04', 2, 19.7999992, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO orders VALUES ('AROUT', 4, '1998-03-03', '1998-03-31', '1998-03-09', 2, 29.6100006, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES ('VAFFE', 1, '1998-03-03', '1998-04-14', '1998-03-09', 1, 176.479996, 'Vaffeljernet', 'Smagsloget 45', 'Århus', NULL, '8200', 'Denmark');
INSERT INTO orders VALUES ('HANAR', 5, '1998-03-03', '1998-03-31', '1998-03-05', 3, 62.7400017, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO orders VALUES ('LAMAI', 7, '1998-03-03', '1998-04-14', '1998-03-13', 3, 68.2600021, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO orders VALUES ('BERGS', 3, '1998-03-04', '1998-04-01', '1998-04-08', 2, 151.520004, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES ('HANAR', 3, '1998-03-04', '1998-04-01', '1998-03-13', 1, 2.26999998, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO orders VALUES ('ANATR', 4, '1998-03-04', '1998-04-01', '1998-03-11', 3, 39.9199982, 'Ana Trujillo Emparedados y helados', 'Avda. de la Constitución 2222', 'México D.F.', NULL, '05021', 'Mexico');
INSERT INTO orders VALUES ('LACOR', 4, '1998-03-05', '1998-04-02', '1998-04-08', 1, 19.7900009, 'La corne d''abondance', '67, avenue de l''Europe', 'Versailles', NULL, '78000', 'France');
INSERT INTO orders VALUES ('GALED', 1, '1998-03-05', '1998-04-02', '1998-03-18', 1, 1.36000001, 'Galería del gastronómo', 'Rambla de Cataluña, 23', 'Barcelona', NULL, '8022', 'Spain');
INSERT INTO orders VALUES ('FRANK', 6, '1998-03-05', '1998-04-02', '1998-03-12', 1, 33.9300003, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany');
INSERT INTO orders VALUES ('SUPRD', 4, '1998-03-06', '1998-04-17', '1998-03-18', 3, 15.5500002, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO orders VALUES ('RICSU', 4, '1998-03-06', '1998-03-20', '1998-03-19', 2, 13.6000004, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '1204', 'Switzerland');
INSERT INTO orders VALUES ('BONAP', 8, '1998-03-06', '1998-04-03', '1998-03-24', 1, 134.639999, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES ('ISLAT', 6, '1998-03-06', '1998-04-03', '1998-03-16', 3, 54.1500015, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO orders VALUES ('LEHMS', 3, '1998-03-09', '1998-04-06', '1998-03-12', 3, 32.0099983, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO orders VALUES ('WELLI', 4, '1998-03-09', '1998-04-06', '1998-03-18', 3, 47.5900002, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO orders VALUES ('GREAL', 3, '1998-03-09', '1998-04-06', '1998-03-18', 2, 33.6800003, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO orders VALUES ('CACTU', 7, '1998-03-10', '1998-03-24', '1998-03-13', 3, 31.5100002, 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO orders VALUES ('QUICK', 3, '1998-03-10', '1998-04-07', '1998-03-16', 2, 31.8899994, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES ('MAGAA', 2, '1998-03-10', '1998-04-07', '1998-03-13', 2, 76.3300018, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy');
INSERT INTO orders VALUES ('BONAP', 8, '1998-03-11', '1998-04-08', '1998-03-23', 3, 19.7700005, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES ('SAVEA', 7, '1998-03-11', '1998-04-08', '1998-03-20', 2, 400.809998, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES ('REGGC', 9, '1998-03-11', '1998-04-08', '1998-03-18', 3, 17.9500008, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO orders VALUES ('BSBEV', 4, '1998-03-11', '1998-04-08', '1998-03-19', 2, 2.17000008, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO orders VALUES ('BOTTM', 6, '1998-03-12', '1998-03-26', '1998-03-13', 3, 52.9199982, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES ('MORGK', 4, '1998-03-12', '1998-04-09', '1998-03-18', 1, 10.2200003, 'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig', NULL, '04179', 'Germany');
INSERT INTO orders VALUES ('VAFFE', 1, '1998-03-12', '1998-04-09', '1998-03-19', 2, 27.2000008, 'Vaffeljernet', 'Smagsloget 45', 'Århus', NULL, '8200', 'Denmark');
INSERT INTO orders VALUES ('BSBEV', 3, '1998-03-13', '1998-04-10', '1998-03-16', 2, 3.25999999, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO orders VALUES ('GODOS', 3, '1998-03-13', '1998-04-10', '1998-03-19', 3, 23.3899994, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain');
INSERT INTO orders VALUES ('BOTTM', 2, '1998-03-13', '1998-04-10', '1998-03-17', 3, 74.4400024, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES ('MAGAA', 1, '1998-03-16', '1998-04-13', '1998-03-23', 2, 2.5, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy');
INSERT INTO orders VALUES ('RICSU', 9, '1998-03-16', '1998-04-27', '1998-04-07', 2, 30.8500004, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '1204', 'Switzerland');
INSERT INTO orders VALUES ('ALFKI', 1, '1998-03-16', '1998-04-27', '1998-03-24', 1, 40.4199982, 'Alfred''s Futterkiste', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany');
INSERT INTO orders VALUES ('AROUT', 9, '1998-03-16', '1998-03-30', '1998-03-25', 2, 23.7199993, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES ('LINOD', 5, '1998-03-17', '1998-04-28', '1998-03-20', 1, 27.9099998, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO orders VALUES ('FOLKO', 8, '1998-03-17', '1998-04-14', '1998-03-20', 2, 3.25999999, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES ('BLAUS', 6, '1998-03-17', '1998-04-28', '1998-03-20', 2, 44.6500015, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany');
INSERT INTO orders VALUES ('HILAA', 8, '1998-03-18', '1998-04-15', '1998-03-27', 3, 105.360001, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO orders VALUES ('OCEAN', 7, '1998-03-18', '1998-04-15', '1998-03-27', 2, 49.5600014, 'Océano Atlántico Ltda.', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO orders VALUES ('GOURL', 6, '1998-03-18', '1998-04-29', '1998-03-23', 2, 4.98000002, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO orders VALUES ('HILAA', 3, '1998-03-19', '1998-04-02', '1998-04-08', 1, 2.07999992, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO orders VALUES ('QUEEN', 8, '1998-03-19', '1998-04-16', '1998-03-30', 1, 104.470001, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO orders VALUES ('QUICK', 8, '1998-03-19', '1998-04-16', '1998-03-23', 2, 275.790009, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES ('FURIB', 9, '1998-03-19', '1998-04-16', '1998-03-26', 3, 2.70000005, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal');
INSERT INTO orders VALUES ('SPECD', 3, '1998-03-20', '1998-04-17', '1998-03-24', 2, 87.3799973, 'Spécialités du monde', '25, rue Lauriston', 'Paris', NULL, '75016', 'France');
INSERT INTO orders VALUES ('OLDWO', 6, '1998-03-20', '1998-04-17', '1998-03-30', 3, 144.380005, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO orders VALUES ('CHOPS', 4, '1998-03-20', '1998-04-17', '1998-04-08', 1, 27.1900005, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland');
INSERT INTO orders VALUES ('TOMSP', 2, '1998-03-23', '1998-04-20', '1998-04-02', 2, 62.2200012, 'Toms Spezialitäten', 'Luisenstr. 48', 'Münster', NULL, '44087', 'Germany');
INSERT INTO orders VALUES ('ERNSH', 1, '1998-03-23', '1998-04-20', '1998-04-01', 3, 74.5999985, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES ('COMMI', 1, '1998-03-23', '1998-04-20', '1998-03-30', 2, 0.209999993, 'Comércio Mineiro', 'Av. dos Lusíadas, 23', 'Sao Paulo', 'SP', '05432-043', 'Brazil');
INSERT INTO orders VALUES ('BOLID', 9, '1998-03-24', '1998-04-07', '1998-04-24', 1, 16.1599998, 'Bólido Comidas preparadas', 'C/ Araquil, 67', 'Madrid', NULL, '28023', 'Spain');
INSERT INTO orders VALUES ('FRANR', 2, '1998-03-24', '1998-04-21', '1998-04-02', 2, 121.82, 'France restauration', '54, rue Royale', 'Nantes', NULL, '44000', 'France');
INSERT INTO orders VALUES ('LACOR', 4, '1998-03-24', '1998-04-21', '1998-03-26', 2, 0.0199999996, 'La corne d''abondance', '67, avenue de l''Europe', 'Versailles', NULL, '78000', 'France');
INSERT INTO orders VALUES ('LACOR', 6, '1998-03-24', '1998-04-21', '1998-03-27', 2, 15.1700001, 'La corne d''abondance', '67, avenue de l''Europe', 'Versailles', NULL, '78000', 'France');
INSERT INTO orders VALUES ('SPLIR', 3, '1998-03-25', '1998-04-08', '1998-04-03', 3, 12.96, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO orders VALUES ('BOTTM', 1, '1998-03-25', '1998-04-22', '1998-03-27', 3, 32.2700005, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES ('HILAA', 1, '1998-03-25', '1998-05-06', '1998-04-03', 1, 37.9700012, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO orders VALUES ('FOLKO', 8, '1998-03-26', '1998-04-23', '1998-04-10', 3, 208.5, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES ('MAISD', 9, '1998-03-26', '1998-04-23', '1998-04-23', 2, 32.8199997, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Belgium');
INSERT INTO orders VALUES ('ERNSH', 8, '1998-03-26', '1998-04-23', '1998-03-31', 2, 353.070007, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES ('FOLKO', 4, '1998-03-27', '1998-05-08', '1998-04-17', 1, 1.25999999, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES ('HANAR', 1, '1998-03-27', '1998-04-24', '1998-04-02', 2, 193.369995, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO orders VALUES ('BOTTM', 2, '1998-03-27', '1998-04-24', '1998-04-08', 1, 14.0100002, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES ('SAVEA', 2, '1998-03-27', '1998-04-24', '1998-04-06', 2, 657.539978, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES ('SAVEA', 1, '1998-03-30', '1998-04-27', '1998-04-03', 3, 211.220001, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES ('HUNGO', 2, '1998-03-30', '1998-04-27', '1998-04-02', 1, 91.5100021, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES ('OCEAN', 8, '1998-03-30', '1998-04-27', '1998-04-21', 2, 217.860001, 'Océano Atlántico Ltda.', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO orders VALUES ('EASTC', 8, '1998-03-31', '1998-04-28', '1998-04-06', 1, 185.479996, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK');
INSERT INTO orders VALUES ('RATTC', 3, '1998-03-31', '1998-04-28', '1998-04-10', 2, 61.1399994, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES ('QUEDE', 2, '1998-03-31', '1998-04-28', '1998-04-02', 1, 34.7599983, 'Que Delícia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO orders VALUES ('ERNSH', 2, '1998-04-01', '1998-05-13', '1998-04-07', 3, 117.610001, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES ('QUICK', 1, '1998-04-01', '1998-04-29', '1998-04-07', 1, 38.5099983, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES ('THEBI', 1, '1998-04-01', '1998-04-29', '1998-04-03', 3, 4.26999998, 'The Big Cheese', '89 Jefferson Way Suite 2', 'Portland', 'OR', '97201', 'USA');
INSERT INTO orders VALUES ('FOLKO', 7, '1998-04-01', '1998-04-29', '1998-04-10', 3, 8.81000042, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES ('VAFFE', 2, '1998-04-02', '1998-04-16', '1998-04-09', 3, 65.5299988, 'Vaffeljernet', 'Smagsloget 45', 'Århus', NULL, '8200', 'Denmark');
INSERT INTO orders VALUES ('PERIC', 1, '1998-04-02', '1998-04-30', '1998-04-06', 3, 46, 'Pericles Comidas clásicas', 'Calle Dr. Jorge Cash 321', 'México D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES ('QUICK', 4, '1998-04-02', '1998-04-30', '1998-04-10', 2, 1.12, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES ('LILAS', 8, '1998-04-03', '1998-05-15', '1998-04-13', 2, 73.9100037, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO orders VALUES ('WOLZA', 8, '1998-04-03', '1998-04-17', '1998-04-17', 2, 20.3099995, 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Poland');
INSERT INTO orders VALUES ('OTTIK', 6, '1998-04-03', '1998-05-01', '1998-04-10', 2, 96.3499985, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Germany');
INSERT INTO orders VALUES ('RATTC', 2, '1998-04-06', '1998-05-04', '1998-04-14', 3, 55.1199989, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES ('FOLKO', 2, '1998-04-06', '1998-05-04', '1998-04-14', 2, 197.300003, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES ('SAVEA', 4, '1998-04-06', '1998-05-04', '1998-04-16', 1, 141.160004, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES ('THECR', 3, '1998-04-06', '1998-05-04', '1998-04-08', 3, 14.9099998, 'The Cracker Box', '55 Grizzly Peak Rd.', 'Butte', 'MT', '59801', 'USA');
INSERT INTO orders VALUES ('MAISD', 3, '1998-04-07', '1998-05-05', '1998-04-20', 1, 44.8400002, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Belgium');
INSERT INTO orders VALUES ('WILMK', 2, '1998-04-07', '1998-05-05', '1998-04-10', 1, 0.75, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finland');
INSERT INTO orders VALUES ('GREAL', 3, '1998-04-07', '1998-05-05', '1998-04-15', 2, 25.1900005, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO orders VALUES ('PRINI', 8, '1998-04-08', '1998-05-06', '1998-04-13', 2, 202.240005, 'Princesa Isabel Vinhos', 'Estrada da saúde n. 58', 'Lisboa', NULL, '1756', 'Portugal');
INSERT INTO orders VALUES ('ERNSH', 7, '1998-04-08', '1998-05-06', NULL, 3, 79.4599991, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES ('GODOS', 2, '1998-04-08', '1998-05-06', '1998-04-10', 1, 59.1100006, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain');
INSERT INTO orders VALUES ('REGGC', 2, '1998-04-09', '1998-05-07', '1998-04-21', 2, 28.7099991, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO orders VALUES ('ALFKI', 3, '1998-04-09', '1998-05-07', '1998-04-13', 1, 1.21000004, 'Alfred''s Futterkiste', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany');
INSERT INTO orders VALUES ('FRANK', 1, '1998-04-09', '1998-04-23', '1998-04-17', 3, 242.949997, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany');
INSERT INTO orders VALUES ('ROMEY', 2, '1998-04-09', '1998-05-07', '1998-04-10', 1, 32.9900017, 'Romero y tomillo', 'Gran Vía, 1', 'Madrid', NULL, '28001', 'Spain');
INSERT INTO orders VALUES ('LINOD', 2, '1998-04-10', '1998-05-08', '1998-04-15', 3, 23.6000004, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO orders VALUES ('SANTG', 2, '1998-04-10', '1998-04-24', '1998-04-20', 2, 4.61999989, 'Santé Gourmet', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Norway');
INSERT INTO orders VALUES ('AROUT', 9, '1998-04-10', '1998-05-08', '1998-04-13', 2, 33.7999992, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES ('ERNSH', 9, '1998-04-13', '1998-05-11', '1998-04-20', 2, 754.26001, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES ('LONEP', 4, '1998-04-13', '1998-05-11', '1998-04-16', 2, 11.6499996, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO orders VALUES ('RANCH', 6, '1998-04-13', '1998-05-11', NULL, 3, 3.17000008, 'Rancho grande', 'Av. del Libertador 900', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO orders VALUES ('OTTIK', 2, '1998-04-14', '1998-05-12', '1998-04-16', 2, 43.2999992, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Germany');
INSERT INTO orders VALUES ('QUICK', 3, '1998-04-14', '1998-05-12', '1998-04-21', 1, 297.179993, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES ('HANAR', 9, '1998-04-14', '1998-05-12', '1998-05-04', 2, 6.26999998, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO orders VALUES ('BSBEV', 1, '1998-04-14', '1998-04-28', '1998-04-24', 2, 123.830002, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO orders VALUES ('EASTC', 4, '1998-04-15', '1998-05-13', '1998-04-20', 1, 74.3600006, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK');
INSERT INTO orders VALUES ('WARTH', 6, '1998-04-15', '1998-05-13', '1998-04-24', 3, 29.1700001, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO orders VALUES ('FRANS', 4, '1998-04-15', '1998-05-13', '1998-04-28', 1, 47.0900002, 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italy');
INSERT INTO orders VALUES ('BOTTM', 1, '1998-04-16', '1998-05-14', '1998-04-20', 1, 52.5200005, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES ('KOENE', 2, '1998-04-16', '1998-05-14', '1998-04-22', 1, 29.5900002, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES ('CHOPS', 4, '1998-04-16', '1998-05-14', '1998-04-27', 1, 47.8400002, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland');
INSERT INTO orders VALUES ('SAVEA', 7, '1998-04-17', '1998-05-15', '1998-04-27', 2, 830.75, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES ('SAVEA', 6, '1998-04-17', '1998-05-15', '1998-04-24', 2, 227.220001, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES ('WHITC', 2, '1998-04-17', '1998-05-15', '1998-04-23', 3, 606.190002, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES ('RICSU', 7, '1998-04-17', '1998-05-15', '1998-04-23', 3, 84.7399979, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '1204', 'Switzerland');
INSERT INTO orders VALUES ('OLDWO', 8, '1998-04-20', '1998-06-01', '1998-04-27', 1, 40.3199997, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO orders VALUES ('SUPRD', 2, '1998-04-20', '1998-05-18', '1998-04-24', 2, 0.170000002, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO orders VALUES ('DRACD', 8, '1998-04-20', '1998-05-18', '1998-04-22', 3, 149.470001, 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', NULL, '52066', 'Germany');
INSERT INTO orders VALUES ('GODOS', 7, '1998-04-21', '1998-05-19', '1998-04-27', 1, 3.20000005, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain');
INSERT INTO orders VALUES ('SUPRD', 1, '1998-04-21', '1998-05-19', '1998-04-30', 2, 29.5900002, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO orders VALUES ('LINOD', 1, '1998-04-21', '1998-05-19', NULL, 2, 65, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO orders VALUES ('GREAL', 4, '1998-04-22', '1998-05-20', NULL, 3, 18.8400002, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO orders VALUES ('CHOPS', 3, '1998-04-22', '1998-05-20', '1998-04-28', 2, 48.2200012, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland');
INSERT INTO orders VALUES ('COMMI', 2, '1998-04-22', '1998-05-06', '1998-05-01', 1, 29.9899998, 'Comércio Mineiro', 'Av. dos Lusíadas, 23', 'Sao Paulo', 'SP', '05432-043', 'Brazil');
INSERT INTO orders VALUES ('SPECD', 5, '1998-04-22', '1998-05-20', '1998-04-29', 2, 8.80000019, 'Spécialités du monde', '25, rue Lauriston', 'Paris', NULL, '75016', 'France');
INSERT INTO orders VALUES ('WOLZA', 4, '1998-04-23', '1998-05-21', '1998-05-01', 1, 8.72000027, 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Poland');
INSERT INTO orders VALUES ('BOTTM', 6, '1998-04-23', '1998-05-21', NULL, 2, 70.5800018, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES ('WANDK', 8, '1998-04-23', '1998-05-21', '1998-04-24', 2, 71.6399994, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany');
INSERT INTO orders VALUES ('EASTC', 7, '1998-04-24', '1998-05-22', '1998-05-01', 3, 46.6199989, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK');
INSERT INTO orders VALUES ('BOTTM', 7, '1998-04-24', '1998-05-22', '1998-04-30', 3, 24.1200008, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES ('GOURL', 3, '1998-04-24', '1998-05-22', '1998-05-04', 1, 8.34000015, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO orders VALUES ('FOLKO', 8, '1998-04-27', '1998-05-25', '1998-05-05', 2, 59.4099998, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES ('LAMAI', 7, '1998-04-27', '1998-05-25', NULL, 3, 2.78999996, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO orders VALUES ('HANAR', 3, '1998-04-27', '1998-05-25', '1998-05-01', 1, 67.2600021, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO orders VALUES ('PICCO', 2, '1998-04-27', '1998-05-25', '1998-04-29', 2, 53.0499992, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria');
INSERT INTO orders VALUES ('CACTU', 8, '1998-04-28', '1998-05-26', NULL, 1, 0.330000013, 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO orders VALUES ('HILAA', 7, '1998-04-28', '1998-05-26', '1998-05-05', 2, 120.919998, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO orders VALUES ('EASTC', 8, '1998-04-28', '1998-05-12', '1998-05-01', 2, 278.959991, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK');
INSERT INTO orders VALUES ('NORTS', 3, '1998-04-29', '1998-05-27', '1998-05-01', 3, 4.13000011, 'North/South', 'South House 300 Queensbridge', 'London', NULL, 'SW7 1RZ', 'UK');
INSERT INTO orders VALUES ('BLAUS', 9, '1998-04-29', '1998-05-27', NULL, 3, 31.1399994, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany');
INSERT INTO orders VALUES ('RICAR', 2, '1998-04-29', '1998-06-10', NULL, 2, 85.8000031, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO orders VALUES ('FRANS', 2, '1998-04-30', '1998-05-28', '1998-05-04', 2, 10.9799995, 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italy');
INSERT INTO orders VALUES ('GREAL', 4, '1998-04-30', '1998-06-11', NULL, 3, 14.0100002, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO orders VALUES ('REGGC', 4, '1998-04-30', '1998-05-28', NULL, 2, 29.9300003, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO orders VALUES ('HUNGO', 3, '1998-04-30', '1998-05-28', '1998-05-06', 2, 81.7300034, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES ('SAVEA', 1, '1998-05-01', '1998-05-29', '1998-05-04', 1, 30.0900002, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES ('LILAS', 8, '1998-05-01', '1998-05-29', NULL, 1, 12.9099998, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO orders VALUES ('WHITC', 7, '1998-05-01', '1998-05-29', '1998-05-04', 2, 44.7200012, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES ('DRACD', 1, '1998-05-04', '1998-05-18', '1998-05-06', 2, 7.98000002, 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', NULL, '52066', 'Germany');
INSERT INTO orders VALUES ('QUEEN', 8, '1998-05-04', '1998-06-01', NULL, 2, 81.75, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO orders VALUES ('TORTU', 1, '1998-05-04', '1998-06-01', '1998-05-06', 2, 15.6700001, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES ('LEHMS', 2, '1998-05-05', '1998-06-02', NULL, 1, 136, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO orders VALUES ('LILAS', 1, '1998-05-05', '1998-06-02', NULL, 1, 0.930000007, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO orders VALUES ('ERNSH', 4, '1998-05-05', '1998-06-02', NULL, 2, 258.640015, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES ('PERIC', 2, '1998-05-05', '1998-06-02', NULL, 2, 24.9500008, 'Pericles Comidas clásicas', 'Calle Dr. Jorge Cash 321', 'México D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES ('SIMOB', 7, '1998-05-06', '1998-06-03', NULL, 2, 18.4400005, 'Simons bistro', 'Vinbæltet 34', 'Kobenhavn', NULL, '1734', 'Denmark');
INSERT INTO orders VALUES ('RICSU', 8, '1998-05-06', '1998-06-03', NULL, 2, 6.19000006, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '1204', 'Switzerland');
INSERT INTO orders VALUES ('BONAP', 4, '1998-05-06', '1998-06-03', NULL, 2, 38.2799988, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES ('RATTC', 1, '1998-05-06', '1998-06-03', NULL, 2, 8.52999973, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO products VALUES ('Chai', 8, 1, '10 boxes x 30 bags', 18, 39, 0, 10, 1);
INSERT INTO products VALUES ('Chang', 1, 1, '24 - 12 oz bottles', 19, 17, 40, 25, 1);
INSERT INTO products VALUES ('Aniseed Syrup', 1, 2, '12 - 550 ml bottles', 10, 13, 70, 25, 0);
INSERT INTO products VALUES ('Chef Anton''s Cajun Seasoning', 2, 2, '48 - 6 oz jars', 22, 53, 0, 0, 0);
INSERT INTO products VALUES ('Chef Anton''s Gumbo Mix', 2, 2, '36 boxes', 21.3500004, 0, 0, 0, 1);
INSERT INTO products VALUES ('Grandma''s Boysenberry Spread', 3, 2, '12 - 8 oz jars', 25, 120, 0, 25, 0);
INSERT INTO products VALUES ('Uncle Bob''s Organic Dried Pears', 3, 7, '12 - 1 lb pkgs.', 30, 15, 0, 10, 0);
INSERT INTO products VALUES ('Northwoods Cranberry Sauce', 3, 2, '12 - 12 oz jars', 40, 6, 0, 0, 0);
INSERT INTO products VALUES ('Mishi Kobe Niku', 4, 6, '18 - 500 g pkgs.', 97, 29, 0, 0, 1);
INSERT INTO products VALUES ('Ikura', 4, 8, '12 - 200 ml jars', 31, 31, 0, 0, 0);
INSERT INTO products VALUES ('Queso Cabrales', 5, 4, '1 kg pkg.', 21, 22, 30, 30, 0);
INSERT INTO products VALUES ('Queso Manchego La Pastora', 5, 4, '10 - 500 g pkgs.', 38, 86, 0, 0, 0);
INSERT INTO products VALUES ('Konbu', 6, 8, '2 kg box', 6, 24, 0, 5, 0);
INSERT INTO products VALUES ('Tofu', 6, 7, '40 - 100 g pkgs.', 23.25, 35, 0, 0, 0);
INSERT INTO products VALUES ('Genen Shouyu', 6, 2, '24 - 250 ml bottles', 13, 39, 0, 5, 0);
INSERT INTO products VALUES ('Pavlova', 7, 3, '32 - 500 g boxes', 17.4500008, 29, 0, 10, 0);
INSERT INTO products VALUES ('Alice Mutton', 7, 6, '20 - 1 kg tins', 39, 0, 0, 0, 1);
INSERT INTO products VALUES ('Carnarvon Tigers', 7, 8, '16 kg pkg.', 62.5, 42, 0, 0, 0);
INSERT INTO products VALUES ('Teatime Chocolate Biscuits', 8, 3, '10 boxes x 12 pieces', 9.19999981, 25, 0, 5, 0);
INSERT INTO products VALUES ('Sir Rodney''s Marmalade', 8, 3, '30 gift boxes', 81, 40, 0, 0, 0);
INSERT INTO products VALUES ('Sir Rodney''s Scones', 8, 3, '24 pkgs. x 4 pieces', 10, 3, 40, 5, 0);
INSERT INTO products VALUES ('Gustaf''s Knäckebröd', 9, 5, '24 - 500 g pkgs.', 21, 104, 0, 25, 0);
INSERT INTO products VALUES ('Tunnbröd', 9, 5, '12 - 250 g pkgs.', 9, 61, 0, 25, 0);
INSERT INTO products VALUES ('Guaraná Fantástica', 10, 1, '12 - 355 ml cans', 4.5, 20, 0, 0, 1);
INSERT INTO products VALUES ('NuNuCa Nuß-Nougat-Creme', 11, 3, '20 - 450 g glasses', 14, 76, 0, 30, 0);
INSERT INTO products VALUES ('Gumbär Gummibärchen', 11, 3, '100 - 250 g bags', 31.2299995, 15, 0, 0, 0);
INSERT INTO products VALUES ('Schoggi Schokolade', 11, 3, '100 - 100 g pieces', 43.9000015, 49, 0, 30, 0);
INSERT INTO products VALUES ('Rössle Sauerkraut', 12, 7, '25 - 825 g cans', 45.5999985, 26, 0, 0, 1);
INSERT INTO products VALUES ('Thüringer Rostbratwurst', 12, 6, '50 bags x 30 sausgs.', 123.790001, 0, 0, 0, 1);
INSERT INTO products VALUES ('Nord-Ost Matjeshering', 13, 8, '10 - 200 g glasses', 25.8899994, 10, 0, 15, 0);
INSERT INTO products VALUES ('Gorgonzola Telino', 14, 4, '12 - 100 g pkgs', 12.5, 0, 70, 20, 0);
INSERT INTO products VALUES ('Mascarpone Fabioli', 14, 4, '24 - 200 g pkgs.', 32, 9, 40, 25, 0);
INSERT INTO products VALUES ('Geitost', 15, 4, '500 g', 2.5, 112, 0, 20, 0);
INSERT INTO products VALUES ('Sasquatch Ale', 16, 1, '24 - 12 oz bottles', 14, 111, 0, 15, 0);
INSERT INTO products VALUES ('Steeleye Stout', 16, 1, '24 - 12 oz bottles', 18, 20, 0, 15, 0);
INSERT INTO products VALUES ('Inlagd Sill', 17, 8, '24 - 250 g  jars', 19, 112, 0, 20, 0);
INSERT INTO products VALUES ('Gravad lax', 17, 8, '12 - 500 g pkgs.', 26, 11, 50, 25, 0);
INSERT INTO products VALUES ('Côte de Blaye', 18, 1, '12 - 75 cl bottles', 263.5, 17, 0, 15, 0);
INSERT INTO products VALUES ('Chartreuse verte', 18, 1, '750 cc per bottle', 18, 69, 0, 5, 0);
INSERT INTO products VALUES ('Boston Crab Meat', 19, 8, '24 - 4 oz tins', 18.3999996, 123, 0, 30, 0);
INSERT INTO products VALUES ('Jack''s New England Clam Chowder', 19, 8, '12 - 12 oz cans', 9.64999962, 85, 0, 10, 0);
INSERT INTO products VALUES ('Singaporean Hokkien Fried Mee', 20, 5, '32 - 1 kg pkgs.', 14, 26, 0, 0, 1);
INSERT INTO products VALUES ('Ipoh Coffee', 20, 1, '16 - 500 g tins', 46, 17, 10, 25, 0);
INSERT INTO products VALUES ('Gula Malacca', 20, 2, '20 - 2 kg bags', 19.4500008, 27, 0, 15, 0);
INSERT INTO products VALUES ('Rogede sild', 21, 8, '1k pkg.', 9.5, 5, 70, 15, 0);
INSERT INTO products VALUES ('Spegesild', 21, 8, '4 - 450 g glasses', 12, 95, 0, 0, 0);
INSERT INTO products VALUES ('Zaanse koeken', 22, 3, '10 - 4 oz boxes', 9.5, 36, 0, 0, 0);
INSERT INTO products VALUES ('Chocolade', 22, 3, '10 pkgs.', 12.75, 15, 70, 25, 0);
INSERT INTO products VALUES ('Maxilaku', 23, 3, '24 - 50 g pkgs.', 20, 10, 60, 15, 0);
INSERT INTO products VALUES ('Valkoinen suklaa', 23, 3, '12 - 100 g bars', 16.25, 65, 0, 30, 0);
INSERT INTO products VALUES ('Manjimup Dried Apples', 24, 7, '50 - 300 g pkgs.', 53, 20, 0, 10, 0);
INSERT INTO products VALUES ('Filo Mix', 24, 5, '16 - 2 kg boxes', 7, 38, 0, 25, 0);
INSERT INTO products VALUES ('Perth Pasties', 24, 6, '48 pieces', 32.7999992, 0, 0, 0, 1);
INSERT INTO products VALUES ('Tourtière', 25, 6, '16 pies', 7.44999981, 21, 0, 10, 0);
INSERT INTO products VALUES ('Pâté chinois', 25, 6, '24 boxes x 2 pies', 24, 115, 0, 20, 0);
INSERT INTO products VALUES ('Gnocchi di nonna Alice', 26, 5, '24 - 250 g pkgs.', 38, 21, 10, 30, 0);
INSERT INTO products VALUES ('Ravioli Angelo', 26, 5, '24 - 250 g pkgs.', 19.5, 36, 0, 20, 0);
INSERT INTO products VALUES ('Escargots de Bourgogne', 27, 8, '24 pieces', 13.25, 62, 0, 20, 0);
INSERT INTO products VALUES ('Raclette Courdavault', 28, 4, '5 kg pkg.', 55, 79, 0, 0, 0);
INSERT INTO products VALUES ('Camembert Pierrot', 28, 4, '15 - 300 g rounds', 34, 19, 0, 0, 0);
INSERT INTO products VALUES ('Sirop d''érable', 29, 2, '24 - 500 ml bottles', 28.5, 113, 0, 25, 0);
INSERT INTO products VALUES ('Tarte au sucre', 29, 3, '48 pies', 49.2999992, 17, 0, 0, 0);
INSERT INTO products VALUES ('Vegie-spread', 7, 2, '15 - 625 g jars', 43.9000015, 24, 0, 5, 0);
INSERT INTO products VALUES ('Wimmers gute Semmelknödel', 12, 5, '20 bags x 4 pieces', 33.25, 22, 80, 30, 0);
INSERT INTO products VALUES ('Louisiana Fiery Hot Pepper Sauce', 2, 2, '32 - 8 oz bottles', 21.0499992, 76, 0, 0, 0);
INSERT INTO products VALUES ('Louisiana Hot Spiced Okra', 2, 2, '24 - 8 oz jars', 17, 4, 100, 20, 0);
INSERT INTO products VALUES ('Laughing Lumberjack Lager', 16, 1, '24 - 12 oz bottles', 14, 52, 0, 10, 0);
INSERT INTO products VALUES ('Scottish Longbreads', 8, 3, '10 boxes x 8 pieces', 12.5, 6, 10, 15, 0);
INSERT INTO products VALUES ('Gudbrandsdalsost', 15, 4, '10 kg pkg.', 36, 26, 0, 15, 0);
INSERT INTO products VALUES ('Outback Lager', 7, 1, '24 - 355 ml bottles', 15, 15, 10, 30, 0);
INSERT INTO products VALUES ('Flotemysost', 15, 4, '10 - 500 g pkgs.', 21.5, 26, 0, 0, 0);
INSERT INTO products VALUES ('Mozzarella di Giovanni', 14, 4, '24 - 200 g pkgs.', 34.7999992, 14, 0, 0, 0);
INSERT INTO products VALUES ('Röd Kaviar', 17, 8, '24 - 150 g jars', 15, 101, 0, 5, 0);
INSERT INTO products VALUES ('Longlife Tofu', 4, 7, '5 kg pkg.', 10, 4, 20, 5, 0);
INSERT INTO products VALUES ('Rhönbräu Klosterbier', 12, 1, '24 - 0.5 l bottles', 7.75, 125, 0, 25, 0);
INSERT INTO products VALUES ('Lakkalikööri', 23, 1, '500 ml', 18, 57, 0, 20, 0);
INSERT INTO products VALUES ('Original Frankfurter grüne Soße', 12, 2, '12 boxes', 13, 32, 0, 15, 0);


--
-- Data for Name: region; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO region VALUES ('Eastern');
INSERT INTO region VALUES ('Western');
INSERT INTO region VALUES ('Northern');
INSERT INTO region VALUES ('Southern');


--
-- Data for Name: shippers; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO shippers VALUES ('Speedy Express', '(503) 555-9831');
INSERT INTO shippers VALUES ('United Package', '(503) 555-3199');
INSERT INTO shippers VALUES ('Federal Shipping', '(503) 555-9931');
INSERT INTO shippers VALUES ('Alliance Shippers', '1-800-222-0451');
INSERT INTO shippers VALUES ('UPS', '1-800-782-7892');
INSERT INTO shippers VALUES ('DHL', '1-800-225-5345');



--
-- Data for Name: suppliers; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO suppliers VALUES ('Exotic Liquids', 'Charlotte Cooper', 'Purchasing Manager', '49 Gilbert St.', 'London', NULL, 'EC1 4SD', 'UK', '(171) 555-2222', NULL, NULL);
INSERT INTO suppliers VALUES ('New Orleans Cajun Delights', 'Shelley Burke', 'Order Administrator', 'P.O. Box 78934', 'New Orleans', 'LA', '70117', 'USA', '(100) 555-4822', NULL, '#CAJUN.HTM#');
INSERT INTO suppliers VALUES ('Grandma Kelly''s Homestead', 'Regina Murphy', 'Sales Representative', '707 Oxford Rd.', 'Ann Arbor', 'MI', '48104', 'USA', '(313) 555-5735', '(313) 555-3349', NULL);
INSERT INTO suppliers VALUES ('Tokyo Traders', 'Yoshi Nagase', 'Marketing Manager', '9-8 Sekimai Musashino-shi', 'Tokyo', NULL, '100', 'Japan', '(03) 3555-5011', NULL, NULL);
INSERT INTO suppliers VALUES ('Cooperativa de Quesos ''Las Cabras''', 'Antonio del Valle Saavedra', 'Export Administrator', 'Calle del Rosal 4', 'Oviedo', 'Asturias', '33007', 'Spain', '(98) 598 76 54', NULL, NULL);
INSERT INTO suppliers VALUES ('Mayumi''s', 'Mayumi Ohno', 'Marketing Representative', '92 Setsuko Chuo-ku', 'Osaka', NULL, '545', 'Japan', '(06) 431-7877', NULL, 'Mayumi''s (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/mayumi.htm#');
INSERT INTO suppliers VALUES ('Pavlova, Ltd.', 'Ian Devling', 'Marketing Manager', '74 Rose St. Moonie Ponds', 'Melbourne', 'Victoria', '3058', 'Australia', '(03) 444-2343', '(03) 444-6588', NULL);
INSERT INTO suppliers VALUES ('Specialty Biscuits, Ltd.', 'Peter Wilson', 'Sales Representative', '29 King''s Way', 'Manchester', NULL, 'M14 GSD', 'UK', '(161) 555-4448', NULL, NULL);
INSERT INTO suppliers VALUES ('PB Knäckebröd AB', 'Lars Peterson', 'Sales Agent', 'Kaloadagatan 13', 'Göteborg', NULL, 'S-345 67', 'Sweden', '031-987 65 43', '031-987 65 91', NULL);
INSERT INTO suppliers VALUES ('Refrescos Americanas LTDA', 'Carlos Diaz', 'Marketing Manager', 'Av. das Americanas 12.890', 'Sao Paulo', NULL, '5442', 'Brazil', '(11) 555 4640', NULL, NULL);
INSERT INTO suppliers VALUES ('Heli Süßwaren GmbH & Co. KG', 'Petra Winkler', 'Sales Manager', 'Tiergartenstraße 5', 'Berlin', NULL, '10785', 'Germany', '(010) 9984510', NULL, NULL);
INSERT INTO suppliers VALUES ('Plutzer Lebensmittelgroßmärkte AG', 'Martin Bein', 'International Marketing Mgr.', 'Bogenallee 51', 'Frankfurt', NULL, '60439', 'Germany', '(069) 992755', NULL, 'Plutzer (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/plutzer.htm#');
INSERT INTO suppliers VALUES ('Nord-Ost-Fisch Handelsgesellschaft mbH', 'Sven Petersen', 'Coordinator Foreign Markets', 'Frahmredder 112a', 'Cuxhaven', NULL, '27478', 'Germany', '(04721) 8713', '(04721) 8714', NULL);
INSERT INTO suppliers VALUES ('Formaggi Fortini s.r.l.', 'Elio Rossi', 'Sales Representative', 'Viale Dante, 75', 'Ravenna', NULL, '48100', 'Italy', '(0544) 60323', '(0544) 60603', '#FORMAGGI.HTM#');
INSERT INTO suppliers VALUES ('Norske Meierier', 'Beate Vileid', 'Marketing Manager', 'Hatlevegen 5', 'Sandvika', NULL, '1320', 'Norway', '(0)2-953010', NULL, NULL);
INSERT INTO suppliers VALUES ('Bigfoot Breweries', 'Cheryl Saylor', 'Regional Account Rep.', '3400 - 8th Avenue Suite 210', 'Bend', 'OR', '97101', 'USA', '(503) 555-9931', NULL, NULL);
INSERT INTO suppliers VALUES ('Svensk Sjöföda AB', 'Michael Björn', 'Sales Representative', 'Brovallavägen 231', 'Stockholm', NULL, 'S-123 45', 'Sweden', '08-123 45 67', NULL, NULL);
INSERT INTO suppliers VALUES ('Aux joyeux ecclésiastiques', 'Guylène Nodier', 'Sales Manager', '203, Rue des Francs-Bourgeois', 'Paris', NULL, '75004', 'France', '(1) 03.83.00.68', '(1) 03.83.00.62', NULL);
INSERT INTO suppliers VALUES ('New England Seafood Cannery', 'Robb Merchant', 'Wholesale Account Agent', 'Order Processing Dept. 2100 Paul Revere Blvd.', 'Boston', 'MA', '02134', 'USA', '(617) 555-3267', '(617) 555-3389', NULL);
INSERT INTO suppliers VALUES ('Leka Trading', 'Chandra Leka', 'Owner', '471 Serangoon Loop, Suite #402', 'Singapore', NULL, '0512', 'Singapore', '555-8787', NULL, NULL);
INSERT INTO suppliers VALUES ('Lyngbysild', 'Niels Petersen', 'Sales Manager', 'Lyngbysild Fiskebakken 10', 'Lyngby', NULL, '2800', 'Denmark', '43844108', '43844115', NULL);
INSERT INTO suppliers VALUES ('Zaanse Snoepfabriek', 'Dirk Luchte', 'Accounting Manager', 'Verkoop Rijnweg 22', 'Zaandam', NULL, '9999 ZZ', 'Netherlands', '(12345) 1212', '(12345) 1210', NULL);
INSERT INTO suppliers VALUES ('Karkki Oy', 'Anne Heikkonen', 'Product Manager', 'Valtakatu 12', 'Lappeenranta', NULL, '53120', 'Finland', '(953) 10956', NULL, NULL);
INSERT INTO suppliers VALUES ('G''day, Mate', 'Wendy Mackenzie', 'Sales Representative', '170 Prince Edward Parade Hunter''s Hill', 'Sydney', 'NSW', '2042', 'Australia', '(02) 555-5914', '(02) 555-4873', 'G''day Mate (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/gdaymate.htm#');
INSERT INTO suppliers VALUES ('Ma Maison', 'Jean-Guy Lauzon', 'Marketing Manager', '2960 Rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada', '(514) 555-9022', NULL, NULL);
INSERT INTO suppliers VALUES ('Pasta Buttini s.r.l.', 'Giovanni Giudici', 'Order Administrator', 'Via dei Gelsomini, 153', 'Salerno', NULL, '84100', 'Italy', '(089) 6547665', '(089) 6547667', NULL);
INSERT INTO suppliers VALUES ('Escargots Nouveaux', 'Marie Delamare', 'Sales Manager', '22, rue H. Voiron', 'Montceau', NULL, '71300', 'France', '85.57.00.07', NULL, NULL);
INSERT INTO suppliers VALUES ('Gai pâturage', 'Eliane Noz', 'Sales Representative', 'Bat. B 3, rue des Alpes', 'Annecy', NULL, '74000', 'France', '38.76.98.06', '38.76.98.58', NULL);
INSERT INTO suppliers VALUES ('Forêts d''érables', 'Chantal Goulet', 'Accounting Manager', '148 rue Chasseur', 'Ste-Hyacinthe', 'Québec', 'J2S 7S8', 'Canada', '(514) 555-2955', '(514) 555-2921', NULL);


--
-- Data for Name: territories; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO territories VALUES ('01581', 'Westboro', 1);
INSERT INTO territories VALUES ('01730', 'Bedford', 1);
INSERT INTO territories VALUES ('01833', 'Georgetow', 1);
INSERT INTO territories VALUES ('02116', 'Boston', 1);
INSERT INTO territories VALUES ('02139', 'Cambridge', 1);
INSERT INTO territories VALUES ('02184', 'Braintree', 1);
INSERT INTO territories VALUES ('02903', 'Providence', 1);
INSERT INTO territories VALUES ('03049', 'Hollis', 3);
INSERT INTO territories VALUES ('03801', 'Portsmouth', 3);
INSERT INTO territories VALUES ('06897', 'Wilton', 1);
INSERT INTO territories VALUES ('07960', 'Morristown', 1);
INSERT INTO territories VALUES ('08837', 'Edison', 1);
INSERT INTO territories VALUES ('10019', 'New York', 1);
INSERT INTO territories VALUES ('10038', 'New York', 1);
INSERT INTO territories VALUES ('11747', 'Mellvile', 1);
INSERT INTO territories VALUES ('14450', 'Fairport', 1);
INSERT INTO territories VALUES ('19428', 'Philadelphia', 3);
INSERT INTO territories VALUES ('19713', 'Neward', 1);
INSERT INTO territories VALUES ('20852', 'Rockville', 1);
INSERT INTO territories VALUES ('27403', 'Greensboro', 1);
INSERT INTO territories VALUES ('27511', 'Cary', 1);
INSERT INTO territories VALUES ('29202', 'Columbia', 4);
INSERT INTO territories VALUES ('30346', 'Atlanta', 4);
INSERT INTO territories VALUES ('31406', 'Savannah', 4);
INSERT INTO territories VALUES ('32859', 'Orlando', 4);
INSERT INTO territories VALUES ('33607', 'Tampa', 4);
INSERT INTO territories VALUES ('40222', 'Louisville', 1);
INSERT INTO territories VALUES ('44122', 'Beachwood', 3);
INSERT INTO territories VALUES ('45839', 'Findlay', 3);
INSERT INTO territories VALUES ('48075', 'Southfield', 3);
INSERT INTO territories VALUES ('48084', 'Troy', 3);
INSERT INTO territories VALUES ('48304', 'Bloomfield Hills', 3);
INSERT INTO territories VALUES ('53404', 'Racine', 3);
INSERT INTO territories VALUES ('55113', 'Roseville', 3);
INSERT INTO territories VALUES ('55439', 'Minneapolis', 3);
INSERT INTO territories VALUES ('60179', 'Hoffman Estates', 2);
INSERT INTO territories VALUES ('60601', 'Chicago', 2);
INSERT INTO territories VALUES ('72716', 'Bentonville', 4);
INSERT INTO territories VALUES ('75234', 'Dallas', 4);
INSERT INTO territories VALUES ('78759', 'Austin', 4);
INSERT INTO territories VALUES ('80202', 'Denver', 2);
INSERT INTO territories VALUES ('80909', 'Colorado Springs', 2);
INSERT INTO territories VALUES ('85014', 'Phoenix', 2);
INSERT INTO territories VALUES ('85251', 'Scottsdale', 2);
INSERT INTO territories VALUES ('90405', 'Santa Monica', 2);
INSERT INTO territories VALUES ('94025', 'Menlo Park', 2);
INSERT INTO territories VALUES ('94105', 'San Francisco', 2);
INSERT INTO territories VALUES ('95008', 'Campbell', 2);
INSERT INTO territories VALUES ('95054', 'Santa Clara', 2);
INSERT INTO territories VALUES ('95060', 'Santa Cruz', 2);
INSERT INTO territories VALUES ('98004', 'Bellevue', 2);
INSERT INTO territories VALUES ('98052', 'Redmond', 2);
INSERT INTO territories VALUES ('98104', 'Seattle', 2);


--
-- Data for Name: us_states; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO us_states VALUES ('Alabama', 'AL', 'south');
INSERT INTO us_states VALUES ('Alaska', 'AK', 'north');
INSERT INTO us_states VALUES ('Arizona', 'AZ', 'west');
INSERT INTO us_states VALUES ('Arkansas', 'AR', 'south');
INSERT INTO us_states VALUES ('California', 'CA', 'west');
INSERT INTO us_states VALUES ('Colorado', 'CO', 'west');
INSERT INTO us_states VALUES ('Connecticut', 'CT', 'east');
INSERT INTO us_states VALUES ('Delaware', 'DE', 'east');
INSERT INTO us_states VALUES ('District of Columbia', 'DC', 'east');
INSERT INTO us_states VALUES ('Florida', 'FL', 'south');
INSERT INTO us_states VALUES ('Georgia', 'GA', 'south');
INSERT INTO us_states VALUES ('Hawaii', 'HI', 'west');
INSERT INTO us_states VALUES ('Idaho', 'ID', 'midwest');
INSERT INTO us_states VALUES ('Illinois', 'IL', 'midwest');
INSERT INTO us_states VALUES ('Indiana', 'IN', 'midwest');
INSERT INTO us_states VALUES ('Iowa', 'IO', 'midwest');
INSERT INTO us_states VALUES ('Kansas', 'KS', 'midwest');
INSERT INTO us_states VALUES ('Kentucky', 'KY', 'south');
INSERT INTO us_states VALUES ('Louisiana', 'LA', 'south');
INSERT INTO us_states VALUES ('Maine', 'ME', 'north');
INSERT INTO us_states VALUES ('Maryland', 'MD', 'east');
INSERT INTO us_states VALUES ('Massachusetts', 'MA', 'north');
INSERT INTO us_states VALUES ('Michigan', 'MI', 'north');
INSERT INTO us_states VALUES ('Minnesota', 'MN', 'north');
INSERT INTO us_states VALUES ('Mississippi', 'MS', 'south');
INSERT INTO us_states VALUES ('Missouri', 'MO', 'south');
INSERT INTO us_states VALUES ('Montana', 'MT', 'west');
INSERT INTO us_states VALUES ('Nebraska', 'NE', 'midwest');
INSERT INTO us_states VALUES ('Nevada', 'NV', 'west');
INSERT INTO us_states VALUES ('New Hampshire', 'NH', 'east');
INSERT INTO us_states VALUES ('New Jersey', 'NJ', 'east');
INSERT INTO us_states VALUES ('New Mexico', 'NM', 'west');
INSERT INTO us_states VALUES ('New York', 'NY', 'east');
INSERT INTO us_states VALUES ('North Carolina', 'NC', 'east');
INSERT INTO us_states VALUES ('North Dakota', 'ND', 'midwest');
INSERT INTO us_states VALUES ('Ohio', 'OH', 'midwest');
INSERT INTO us_states VALUES ('Oklahoma', 'OK', 'midwest');
INSERT INTO us_states VALUES ('Oregon', 'OR', 'west');
INSERT INTO us_states VALUES ('Pennsylvania', 'PA', 'east');
INSERT INTO us_states VALUES ('Rhode Island', 'RI', 'east');
INSERT INTO us_states VALUES ('South Carolina', 'SC', 'east');
INSERT INTO us_states VALUES ('South Dakota', 'SD', 'midwest');
INSERT INTO us_states VALUES ('Tennessee', 'TN', 'midwest');
INSERT INTO us_states VALUES ('Texas', 'TX', 'west');
INSERT INTO us_states VALUES ('Utah', 'UT', 'west');
INSERT INTO us_states VALUES ('Vermont', 'VT', 'east');
INSERT INTO us_states VALUES ('Virginia', 'VA', 'east');
INSERT INTO us_states VALUES ('Washington', 'WA', 'west');
INSERT INTO us_states VALUES ('West Virginia', 'WV', 'south');
INSERT INTO us_states VALUES ('Wisconsin', 'WI', 'midwest');
INSERT INTO us_states VALUES ('Wyoming', 'WY', 'west');


--
-- Name: pk_categories; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT pk_categories PRIMARY KEY (category_id);


--
-- Name: pk_customer_customer_demo; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY customer_customer_demo
    ADD CONSTRAINT pk_customer_customer_demo PRIMARY KEY (customer_id, customer_type_id);


--
-- Name: pk_customer_demographics; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY customer_demographics
    ADD CONSTRAINT pk_customer_demographics PRIMARY KEY (customer_type_id);


--
-- Name: pk_customers; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY customers
    ADD CONSTRAINT pk_customers PRIMARY KEY (customer_id);


--
-- Name: pk_employees; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT pk_employees PRIMARY KEY (employee_id);


--
-- Name: pk_employee_territories; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY employee_territories
    ADD CONSTRAINT pk_employee_territories PRIMARY KEY (employee_id, territory_id);


--
-- Name: pk_order_details; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY order_details
    ADD CONSTRAINT pk_order_details PRIMARY KEY (order_id, product_id);


--
-- Name: pk_orders; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT pk_orders PRIMARY KEY (order_id);


--
-- Name: pk_products; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY products
    ADD CONSTRAINT pk_products PRIMARY KEY (product_id);


--
-- Name: pk_region; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY region
    ADD CONSTRAINT pk_region PRIMARY KEY (region_id);


--
-- Name: pk_shippers; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY shippers
    ADD CONSTRAINT pk_shippers PRIMARY KEY (shipper_id);


--
-- Name: pk_suppliers; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY suppliers
    ADD CONSTRAINT pk_suppliers PRIMARY KEY (supplier_id);


--
-- Name: pk_territories; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY territories
    ADD CONSTRAINT pk_territories PRIMARY KEY (territory_id);


--
-- Name: pk_usstates; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY us_states
    ADD CONSTRAINT pk_usstates PRIMARY KEY (state_id);


--
-- Name: fk_orders_customers; Type: Constraint; Schema: -; Owner: -
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT fk_orders_customers FOREIGN KEY (customer_id) REFERENCES customers;


--
-- Name: fk_orders_employees; Type: Constraint; Schema: -; Owner: -
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT fk_orders_employees FOREIGN KEY (employee_id) REFERENCES employees;


--
-- Name: fk_orders_shippers; Type: Constraint; Schema: -; Owner: -
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT fk_orders_shippers FOREIGN KEY (ship_via) REFERENCES shippers;


--
-- Name: fk_order_details_products; Type: Constraint; Schema: -; Owner: -
--

ALTER TABLE ONLY order_details
    ADD CONSTRAINT fk_order_details_products FOREIGN KEY (product_id) REFERENCES products;


--
-- Name: fk_order_details_orders; Type: Constraint; Schema: -; Owner: -
--

ALTER TABLE ONLY order_details
    ADD CONSTRAINT fk_order_details_orders FOREIGN KEY (order_id) REFERENCES orders;


--
-- Name: fk_products_categories; Type: Constraint; Schema: -; Owner: -
--

ALTER TABLE ONLY products
    ADD CONSTRAINT fk_products_categories FOREIGN KEY (category_id) REFERENCES categories;


--
-- Name: fk_products_suppliers; Type: Constraint; Schema: -; Owner: -
--

ALTER TABLE ONLY products
    ADD CONSTRAINT fk_products_suppliers FOREIGN KEY (supplier_id) REFERENCES suppliers;


--
-- Name: fk_territories_region; Type: Constraint; Schema: -; Owner: -
--

ALTER TABLE ONLY territories
    ADD CONSTRAINT fk_territories_region FOREIGN KEY (region_id) REFERENCES region;


--
-- Name: fk_employee_territories_territories; Type: Constraint; Schema: -; Owner: -
--

ALTER TABLE ONLY employee_territories
    ADD CONSTRAINT fk_employee_territories_territories FOREIGN KEY (territory_id) REFERENCES territories;


--
-- Name: fk_employee_territories_employees; Type: Constraint; Schema: -; Owner: -
--

ALTER TABLE ONLY employee_territories
    ADD CONSTRAINT fk_employee_territories_employees FOREIGN KEY (employee_id) REFERENCES employees;


--
-- Name: fk_customer_customer_demo_customer_demographics; Type: Constraint; Schema: -; Owner: -
--

ALTER TABLE ONLY customer_customer_demo
    ADD CONSTRAINT fk_customer_customer_demo_customer_demographics FOREIGN KEY (customer_type_id) REFERENCES customer_demographics;


--
-- Name: fk_customer_customer_demo_customers; Type: Constraint; Schema: -; Owner: -
--

ALTER TABLE ONLY customer_customer_demo
    ADD CONSTRAINT fk_customer_customer_demo_customers FOREIGN KEY (customer_id) REFERENCES customers;


--
-- Name: fk_employees_employees; Type: Constraint; Schema: -; Owner: -
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT fk_employees_employees FOREIGN KEY (reports_to) REFERENCES employees;

    
--
-- PostgreSQL database dump complete
--