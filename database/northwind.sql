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
    reports_to integer,
    photo_path character varying(255)
);


--
-- Name: employee_territories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE employee_territories (
    employee_id integer NOT NULL,
    territory_id character varying(20) NOT NULL
);




--
-- Name: order_details; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE order_details (
    order_id integer NOT NULL,
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
    ship_via integer,
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
    region_id integer NOT NULL
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

INSERT INTO categories VALUES (DEFAULT,'Beverages', 'Soft drinks, coffees, teas, beers, and ales', '\x');
INSERT INTO categories VALUES (DEFAULT,'Condiments', 'Sweet and savory sauces, relishes, spreads, and seasonings', '\x');
INSERT INTO categories VALUES (DEFAULT,'Confections', 'Desserts, candies, and sweet breads', '\x');
INSERT INTO categories VALUES (DEFAULT,'Dairy Products', 'Cheeses', '\x');
INSERT INTO categories VALUES (DEFAULT,'Grains/Cereals', 'Breads, crackers, pasta, and cereal', '\x');
INSERT INTO categories VALUES (DEFAULT,'Meat/Poultry', 'Prepared meats', '\x');
INSERT INTO categories VALUES (DEFAULT,'Produce', 'Dried fruit and bean curd', '\x');
INSERT INTO categories VALUES (DEFAULT,'Seafood', 'Seaweed and fish', '\x');


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
INSERT INTO customers VALUES ('ANATR', 'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Owner', 'Avda. de la Constituci??n 2222', 'M??xico D.F.', NULL, '05021', 'Mexico', '(5) 555-4729', '(5) 555-3745');
INSERT INTO customers VALUES ('ANTON', 'Antonio Moreno Taquer??a', 'Antonio Moreno', 'Owner', 'Mataderos  2312', 'M??xico D.F.', NULL, '05023', 'Mexico', '(5) 555-3932', NULL);
INSERT INTO customers VALUES ('AROUT', 'Around the Horn', 'Thomas Hardy', 'Sales Representative', '120 Hanover Sq.', 'London', NULL, 'WA1 1DP', 'UK', '(171) 555-7788', '(171) 555-6750');
INSERT INTO customers VALUES ('BERGS', 'Berglunds snabbk??p', 'Christina Berglund', 'Order Administrator', 'Berguvsv??gen  8', 'Lule??', NULL, 'S-958 22', 'Sweden', '0921-12 34 65', '0921-12 34 67');
INSERT INTO customers VALUES ('BLAUS', 'Blauer See Delikatessen', 'Hanna Moos', 'Sales Representative', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany', '0621-08460', '0621-08924');
INSERT INTO customers VALUES ('BLONP', 'Blondesddsl p??re et fils', 'Fr??d??rique Citeaux', 'Marketing Manager', '24, place Kl??ber', 'Strasbourg', NULL, '67000', 'France', '88.60.15.31', '88.60.15.32');
INSERT INTO customers VALUES ('BOLID', 'B??lido Comidas preparadas', 'Mart??n Sommer', 'Owner', 'C/ Araquil, 67', 'Madrid', NULL, '28023', 'Spain', '(91) 555 22 82', '(91) 555 91 99');
INSERT INTO customers VALUES ('BONAP', 'Bon app''', 'Laurence Lebihan', 'Owner', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France', '91.24.45.40', '91.24.45.41');
INSERT INTO customers VALUES ('BOTTM', 'Bottom-Dollar Markets', 'Elizabeth Lincoln', 'Accounting Manager', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada', '(604) 555-4729', '(604) 555-3745');
INSERT INTO customers VALUES ('BSBEV', 'B''s Beverages', 'Victoria Ashworth', 'Sales Representative', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK', '(171) 555-1212', NULL);
INSERT INTO customers VALUES ('CACTU', 'Cactus Comidas para llevar', 'Patricio Simpson', 'Sales Agent', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina', '(1) 135-5555', '(1) 135-4892');
INSERT INTO customers VALUES ('CENTC', 'Centro comercial Moctezuma', 'Francisco Chang', 'Marketing Manager', 'Sierras de Granada 9993', 'M??xico D.F.', NULL, '05022', 'Mexico', '(5) 555-3392', '(5) 555-7293');
INSERT INTO customers VALUES ('CHOPS', 'Chop-suey Chinese', 'Yang Wang', 'Owner', 'Hauptstr. 29', 'Bern', NULL, '3012', 'Switzerland', '0452-076545', NULL);
INSERT INTO customers VALUES ('COMMI', 'Com??rcio Mineiro', 'Pedro Afonso', 'Sales Associate', 'Av. dos Lus??adas, 23', 'Sao Paulo', 'SP', '05432-043', 'Brazil', '(11) 555-7647', NULL);
INSERT INTO customers VALUES ('CONSH', 'Consolidated Holdings', 'Elizabeth Brown', 'Sales Representative', 'Berkeley Gardens 12  Brewery', 'London', NULL, 'WX1 6LT', 'UK', '(171) 555-2282', '(171) 555-9199');
INSERT INTO customers VALUES ('DRACD', 'Drachenblut Delikatessen', 'Sven Ottlieb', 'Order Administrator', 'Walserweg 21', 'Aachen', NULL, '52066', 'Germany', '0241-039123', '0241-059428');
INSERT INTO customers VALUES ('DUMON', 'Du monde entier', 'Janine Labrune', 'Owner', '67, rue des Cinquante Otages', 'Nantes', NULL, '44000', 'France', '40.67.88.88', '40.67.89.89');
INSERT INTO customers VALUES ('EASTC', 'Eastern Connection', 'Ann Devon', 'Sales Agent', '35 King George', 'London', NULL, 'WX3 6FW', 'UK', '(171) 555-0297', '(171) 555-3373');
INSERT INTO customers VALUES ('ERNSH', 'Ernst Handel', 'Roland Mendel', 'Sales Manager', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria', '7675-3425', '7675-3426');
INSERT INTO customers VALUES ('FAMIA', 'Familia Arquibaldo', 'Aria Cruz', 'Marketing Assistant', 'Rua Or??s, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil', '(11) 555-9857', NULL);
INSERT INTO customers VALUES ('FISSA', 'FISSA Fabrica Inter. Salchichas S.A.', 'Diego Roel', 'Accounting Manager', 'C/ Moralzarzal, 86', 'Madrid', NULL, '28034', 'Spain', '(91) 555 94 44', '(91) 555 55 93');
INSERT INTO customers VALUES ('FOLIG', 'Folies gourmandes', 'Martine Ranc??', 'Assistant Sales Agent', '184, chauss??e de Tournai', 'Lille', NULL, '59000', 'France', '20.16.10.16', '20.16.10.17');
INSERT INTO customers VALUES ('FOLKO', 'Folk och f?? HB', 'Maria Larsson', 'Owner', '??kergatan 24', 'Br??cke', NULL, 'S-844 67', 'Sweden', '0695-34 67 21', NULL);
INSERT INTO customers VALUES ('FRANK', 'Frankenversand', 'Peter Franken', 'Marketing Manager', 'Berliner Platz 43', 'M??nchen', NULL, '80805', 'Germany', '089-0877310', '089-0877451');
INSERT INTO customers VALUES ('FRANR', 'France restauration', 'Carine Schmitt', 'Marketing Manager', '54, rue Royale', 'Nantes', NULL, '44000', 'France', '40.32.21.21', '40.32.21.20');
INSERT INTO customers VALUES ('FRANS', 'Franchi S.p.A.', 'Paolo Accorti', 'Sales Representative', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italy', '011-4988260', '011-4988261');
INSERT INTO customers VALUES ('FURIB', 'Furia Bacalhau e Frutos do Mar', 'Lino Rodriguez', 'Sales Manager', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal', '(1) 354-2534', '(1) 354-2535');
INSERT INTO customers VALUES ('GALED', 'Galer??a del gastr??nomo', 'Eduardo Saavedra', 'Marketing Manager', 'Rambla de Catalu??a, 23', 'Barcelona', NULL, '08022', 'Spain', '(93) 203 4560', '(93) 203 4561');
INSERT INTO customers VALUES ('GODOS', 'Godos Cocina T??pica', 'Jos?? Pedro Freyre', 'Sales Manager', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain', '(95) 555 82 82', NULL);
INSERT INTO customers VALUES ('GOURL', 'Gourmet Lanchonetes', 'Andr?? Fonseca', 'Sales Associate', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil', '(11) 555-9482', NULL);
INSERT INTO customers VALUES ('GREAL', 'Great Lakes Food Market', 'Howard Snyder', 'Marketing Manager', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA', '(503) 555-7555', NULL);
INSERT INTO customers VALUES ('GROSR', 'GROSELLA-Restaurante', 'Manuel Pereira', 'Owner', '5?? Ave. Los Palos Grandes', 'Caracas', 'DF', '1081', 'Venezuela', '(2) 283-2951', '(2) 283-3397');
INSERT INTO customers VALUES ('HANAR', 'Hanari Carnes', 'Mario Pontes', 'Accounting Manager', 'Rua do Pa??o, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil', '(21) 555-0091', '(21) 555-8765');
INSERT INTO customers VALUES ('HILAA', 'HILARION-Abastos', 'Carlos Hern??ndez', 'Sales Representative', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Crist??bal', 'T??chira', '5022', 'Venezuela', '(5) 555-1340', '(5) 555-1948');
INSERT INTO customers VALUES ('HUNGC', 'Hungry Coyote Import Store', 'Yoshi Latimer', 'Sales Representative', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA', '(503) 555-6874', '(503) 555-2376');
INSERT INTO customers VALUES ('HUNGO', 'Hungry Owl All-Night Grocers', 'Patricia McKenna', 'Sales Associate', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland', '2967 542', '2967 3333');
INSERT INTO customers VALUES ('ISLAT', 'Island Trading', 'Helen Bennett', 'Marketing Manager', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK', '(198) 555-8888', NULL);
INSERT INTO customers VALUES ('KOENE', 'K??niglich Essen', 'Philip Cramer', 'Sales Associate', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany', '0555-09876', NULL);
INSERT INTO customers VALUES ('LACOR', 'La corne d''abondance', 'Daniel Tonini', 'Sales Representative', '67, avenue de l''Europe', 'Versailles', NULL, '78000', 'France', '30.59.84.10', '30.59.85.11');
INSERT INTO customers VALUES ('LAMAI', 'La maison d''Asie', 'Annette Roulet', 'Sales Manager', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France', '61.77.61.10', '61.77.61.11');
INSERT INTO customers VALUES ('LAUGB', 'Laughing Bacchus Wine Cellars', 'Yoshi Tannamuri', 'Marketing Assistant', '1900 Oak St.', 'Vancouver', 'BC', 'V3F 2K1', 'Canada', '(604) 555-3392', '(604) 555-7293');
INSERT INTO customers VALUES ('LAZYK', 'Lazy K Kountry Store', 'John Steel', 'Marketing Manager', '12 Orchestra Terrace', 'Walla Walla', 'WA', '99362', 'USA', '(509) 555-7969', '(509) 555-6221');
INSERT INTO customers VALUES ('LEHMS', 'Lehmanns Marktstand', 'Renate Messner', 'Sales Representative', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany', '069-0245984', '069-0245874');
INSERT INTO customers VALUES ('LETSS', 'Let''s Stop N Shop', 'Jaime Yorres', 'Owner', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA', '(415) 555-5938', NULL);
INSERT INTO customers VALUES ('LILAS', 'LILA-Supermercado', 'Carlos Gonz??lez', 'Accounting Manager', 'Carrera 52 con Ave. Bol??var #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela', '(9) 331-6954', '(9) 331-7256');
INSERT INTO customers VALUES ('LINOD', 'LINO-Delicateses', 'Felipe Izquierdo', 'Owner', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela', '(8) 34-56-12', '(8) 34-93-93');
INSERT INTO customers VALUES ('LONEP', 'Lonesome Pine Restaurant', 'Fran Wilson', 'Sales Manager', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA', '(503) 555-9573', '(503) 555-9646');
INSERT INTO customers VALUES ('MAGAA', 'Magazzini Alimentari Riuniti', 'Giovanni Rovelli', 'Marketing Manager', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy', '035-640230', '035-640231');
INSERT INTO customers VALUES ('MAISD', 'Maison Dewey', 'Catherine Dewey', 'Sales Agent', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Belgium', '(02) 201 24 67', '(02) 201 24 68');
INSERT INTO customers VALUES ('MEREP', 'M??re Paillarde', 'Jean Fresni??re', 'Marketing Assistant', '43 rue St. Laurent', 'Montr??al', 'Qu??bec', 'H1J 1C3', 'Canada', '(514) 555-8054', '(514) 555-8055');
INSERT INTO customers VALUES ('MORGK', 'Morgenstern Gesundkost', 'Alexander Feuer', 'Marketing Assistant', 'Heerstr. 22', 'Leipzig', NULL, '04179', 'Germany', '0342-023176', NULL);
INSERT INTO customers VALUES ('NORTS', 'North/South', 'Simon Crowther', 'Sales Associate', 'South House 300 Queensbridge', 'London', NULL, 'SW7 1RZ', 'UK', '(171) 555-7733', '(171) 555-2530');
INSERT INTO customers VALUES ('OCEAN', 'Oc??ano Atl??ntico Ltda.', 'Yvonne Moncada', 'Sales Agent', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires', NULL, '1010', 'Argentina', '(1) 135-5333', '(1) 135-5535');
INSERT INTO customers VALUES ('OLDWO', 'Old World Delicatessen', 'Rene Phillips', 'Sales Representative', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA', '(907) 555-7584', '(907) 555-2880');
INSERT INTO customers VALUES ('OTTIK', 'Ottilies K??seladen', 'Henriette Pfalzheim', 'Owner', 'Mehrheimerstr. 369', 'K??ln', NULL, '50739', 'Germany', '0221-0644327', '0221-0765721');
INSERT INTO customers VALUES ('PARIS', 'Paris sp??cialit??s', 'Marie Bertrand', 'Owner', '265, boulevard Charonne', 'Paris', NULL, '75012', 'France', '(1) 42.34.22.66', '(1) 42.34.22.77');
INSERT INTO customers VALUES ('PERIC', 'Pericles Comidas cl??sicas', 'Guillermo Fern??ndez', 'Sales Representative', 'Calle Dr. Jorge Cash 321', 'M??xico D.F.', NULL, '05033', 'Mexico', '(5) 552-3745', '(5) 545-3745');
INSERT INTO customers VALUES ('PICCO', 'Piccolo und mehr', 'Georg Pipps', 'Sales Manager', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria', '6562-9722', '6562-9723');
INSERT INTO customers VALUES ('PRINI', 'Princesa Isabel Vinhos', 'Isabel de Castro', 'Sales Representative', 'Estrada da sa??de n. 58', 'Lisboa', NULL, '1756', 'Portugal', '(1) 356-5634', NULL);
INSERT INTO customers VALUES ('QUEDE', 'Que Del??cia', 'Bernardo Batista', 'Accounting Manager', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil', '(21) 555-4252', '(21) 555-4545');
INSERT INTO customers VALUES ('QUEEN', 'Queen Cozinha', 'L??cia Carvalho', 'Marketing Assistant', 'Alameda dos Can??rios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil', '(11) 555-1189', NULL);
INSERT INTO customers VALUES ('QUICK', 'QUICK-Stop', 'Horst Kloss', 'Accounting Manager', 'Taucherstra??e 10', 'Cunewalde', NULL, '01307', 'Germany', '0372-035188', NULL);
INSERT INTO customers VALUES ('RANCH', 'Rancho grande', 'Sergio Guti??rrez', 'Sales Representative', 'Av. del Libertador 900', 'Buenos Aires', NULL, '1010', 'Argentina', '(1) 123-5555', '(1) 123-5556');
INSERT INTO customers VALUES ('RATTC', 'Rattlesnake Canyon Grocery', 'Paula Wilson', 'Assistant Sales Representative', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA', '(505) 555-5939', '(505) 555-3620');
INSERT INTO customers VALUES ('REGGC', 'Reggiani Caseifici', 'Maurizio Moroni', 'Sales Associate', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy', '0522-556721', '0522-556722');
INSERT INTO customers VALUES ('RICAR', 'Ricardo Adocicados', 'Janete Limeira', 'Assistant Sales Agent', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil', '(21) 555-3412', NULL);
INSERT INTO customers VALUES ('RICSU', 'Richter Supermarkt', 'Michael Holz', 'Sales Manager', 'Grenzacherweg 237', 'Gen??ve', NULL, '1203', 'Switzerland', '0897-034214', NULL);
INSERT INTO customers VALUES ('ROMEY', 'Romero y tomillo', 'Alejandra Camino', 'Accounting Manager', 'Gran V??a, 1', 'Madrid', NULL, '28001', 'Spain', '(91) 745 6200', '(91) 745 6210');
INSERT INTO customers VALUES ('SANTG', 'Sant?? Gourmet', 'Jonas Bergulfsen', 'Owner', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Norway', '07-98 92 35', '07-98 92 47');
INSERT INTO customers VALUES ('SAVEA', 'Save-a-lot Markets', 'Jose Pavarotti', 'Sales Representative', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA', '(208) 555-8097', NULL);
INSERT INTO customers VALUES ('SEVES', 'Seven Seas Imports', 'Hari Kumar', 'Sales Manager', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK', '(171) 555-1717', '(171) 555-5646');
INSERT INTO customers VALUES ('SIMOB', 'Simons bistro', 'Jytte Petersen', 'Owner', 'Vinb??ltet 34', 'Kobenhavn', NULL, '1734', 'Denmark', '31 12 34 56', '31 13 35 57');
INSERT INTO customers VALUES ('SPECD', 'Sp??cialit??s du monde', 'Dominique Perrier', 'Marketing Manager', '25, rue Lauriston', 'Paris', NULL, '75016', 'France', '(1) 47.55.60.10', '(1) 47.55.60.20');
INSERT INTO customers VALUES ('SPLIR', 'Split Rail Beer & Ale', 'Art Braunschweiger', 'Sales Manager', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA', '(307) 555-4680', '(307) 555-6525');
INSERT INTO customers VALUES ('SUPRD', 'Supr??mes d??lices', 'Pascale Cartrain', 'Accounting Manager', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium', '(071) 23 67 22 20', '(071) 23 67 22 21');
INSERT INTO customers VALUES ('THEBI', 'The Big Cheese', 'Liz Nixon', 'Marketing Manager', '89 Jefferson Way Suite 2', 'Portland', 'OR', '97201', 'USA', '(503) 555-3612', NULL);
INSERT INTO customers VALUES ('THECR', 'The Cracker Box', 'Liu Wong', 'Marketing Assistant', '55 Grizzly Peak Rd.', 'Butte', 'MT', '59801', 'USA', '(406) 555-5834', '(406) 555-8083');
INSERT INTO customers VALUES ('TOMSP', 'Toms Spezialit??ten', 'Karin Josephs', 'Marketing Manager', 'Luisenstr. 48', 'M??nster', NULL, '44087', 'Germany', '0251-031259', '0251-035695');
INSERT INTO customers VALUES ('TORTU', 'Tortuga Restaurante', 'Miguel Angel Paolino', 'Owner', 'Avda. Azteca 123', 'M??xico D.F.', NULL, '05033', 'Mexico', '(5) 555-2933', NULL);
INSERT INTO customers VALUES ('TRADH', 'Tradi????o Hipermercados', 'Anabela Domingues', 'Sales Representative', 'Av. In??s de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil', '(11) 555-2167', '(11) 555-2168');
INSERT INTO customers VALUES ('TRAIH', 'Trail''s Head Gourmet Provisioners', 'Helvetius Nagy', 'Sales Associate', '722 DaVinci Blvd.', 'Kirkland', 'WA', '98034', 'USA', '(206) 555-8257', '(206) 555-2174');
INSERT INTO customers VALUES ('VAFFE', 'Vaffeljernet', 'Palle Ibsen', 'Sales Manager', 'Smagsloget 45', '??rhus', NULL, '8200', 'Denmark', '86 21 32 43', '86 22 33 44');
INSERT INTO customers VALUES ('VICTE', 'Victuailles en stock', 'Mary Saveley', 'Sales Agent', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France', '78.32.54.86', '78.32.54.87');
INSERT INTO customers VALUES ('VINET', 'Vins et alcools Chevalier', 'Paul Henriot', 'Accounting Manager', '59 rue de l''Abbaye', 'Reims', NULL, '51100', 'France', '26.47.15.10', '26.47.15.11');
INSERT INTO customers VALUES ('WANDK', 'Die Wandernde Kuh', 'Rita M??ller', 'Sales Representative', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany', '0711-020361', '0711-035428');
INSERT INTO customers VALUES ('WARTH', 'Wartian Herkku', 'Pirkko Koskitalo', 'Accounting Manager', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland', '981-443655', '981-443655');
INSERT INTO customers VALUES ('WELLI', 'Wellington Importadora', 'Paula Parente', 'Sales Manager', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil', '(14) 555-8122', NULL);
INSERT INTO customers VALUES ('WHITC', 'White Clover Markets', 'Karl Jablonski', 'Owner', '305 - 14th Ave. S. Suite 3B', 'Seattle', 'WA', '98128', 'USA', '(206) 555-4112', '(206) 555-4115');
INSERT INTO customers VALUES ('WILMK', 'Wilman Kala', 'Matti Karttunen', 'Owner/Marketing Assistant', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finland', '90-224 8858', '90-224 8858');
INSERT INTO customers VALUES ('WOLZA', 'Wolski  Zajazd', 'Zbyszek Piestrzeniewicz', 'Owner', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Poland', '(26) 642-7012', '(26) 642-7012');


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO employees VALUES (DEFAULT,'Davolio', 'Nancy', 'Sales Representative', 'Ms.', '1948-12-08', '1992-05-01', '507 - 20th Ave. E.\nApt. 2A', 'Seattle', 'WA', '98122', 'USA', '(206) 555-9857', '5467', '\x', 'Education includes a BA in psychology from Colorado State University in 1970.  She also completed The Art of the Cold Call.  Nancy is a member of Toastmasters International.', 2, 'http://accweb/emmployees/davolio.bmp');
INSERT INTO employees VALUES (DEFAULT,'Fuller', 'Andrew', 'Vice President, Sales', 'Dr.', '1952-02-19', '1992-08-14', '908 W. Capital Way', 'Tacoma', 'WA', '98401', 'USA', '(206) 555-9482', '3457', '\x', 'Andrew received his BTS commercial in 1974 and a Ph.D. in international marketing from the University of Dallas in 1981.  He is fluent in French and Italian and reads German.  He joined the company as a sales representative, was promoted to sales manager in January 1992 and to vice president of sales in March 1993.  Andrew is a member of the Sales Management Roundtable, the Seattle Chamber of Commerce, and the Pacific Rim Importers Association.', NULL, 'http://accweb/emmployees/fuller.bmp');
INSERT INTO employees VALUES (DEFAULT,'Leverling', 'Janet', 'Sales Representative', 'Ms.', '1963-08-30', '1992-04-01', '722 Moss Bay Blvd.', 'Kirkland', 'WA', '98033', 'USA', '(206) 555-3412', '3355', '\x', 'Janet has a BS degree in chemistry from Boston College (1984).  She has also completed a certificate program in food retailing management.  Janet was hired as a sales associate in 1991 and promoted to sales representative in February 1992.', 2, 'http://accweb/emmployees/leverling.bmp');
INSERT INTO employees VALUES (DEFAULT,'Peacock', 'Margaret', 'Sales Representative', 'Mrs.', '1937-09-19', '1993-05-03', '4110 Old Redmond Rd.', 'Redmond', 'WA', '98052', 'USA', '(206) 555-8122', '5176', '\x', 'Margaret holds a BA in English literature from Concordia College (1958) and an MA from the American Institute of Culinary Arts (1966).  She was assigned to the London office temporarily from July through November 1992.', 2, 'http://accweb/emmployees/peacock.bmp');
INSERT INTO employees VALUES (DEFAULT,'Buchanan', 'Steven', 'Sales Manager', 'Mr.', '1955-03-04', '1993-10-17', '14 Garrett Hill', 'London', NULL, 'SW1 8JR', 'UK', '(71) 555-4848', '3453', '\x', 'Steven Buchanan graduated from St. Andrews University, Scotland, with a BSC degree in 1976.  Upon joining the company as a sales representative in 1992, he spent 6 months in an orientation program at the Seattle office and then returned to his permanent post in London.  He was promoted to sales manager in March 1993.  Mr. Buchanan has completed the courses Successful Telemarketing and International Sales Management.  He is fluent in French.', 2, 'http://accweb/emmployees/buchanan.bmp');
INSERT INTO employees VALUES (DEFAULT,'Suyama', 'Michael', 'Sales Representative', 'Mr.', '1963-07-02', '1993-10-17', 'Coventry House\nMiner Rd.', 'London', NULL, 'EC2 7JR', 'UK', '(71) 555-7773', '428', '\x', 'Michael is a graduate of Sussex University (MA, economics, 1983) and the University of California at Los Angeles (MBA, marketing, 1986).  He has also taken the courses Multi-Cultural Selling and Time Management for the Sales Professional.  He is fluent in Japanese and can read and write French, Portuguese, and Spanish.', 5, 'http://accweb/emmployees/davolio.bmp');
INSERT INTO employees VALUES (DEFAULT,'King', 'Robert', 'Sales Representative', 'Mr.', '1960-05-29', '1994-01-02', 'Edgeham Hollow\nWinchester Way', 'London', NULL, 'RG1 9SP', 'UK', '(71) 555-5598', '465', '\x', 'Robert King served in the Peace Corps and traveled extensively before completing his degree in English at the University of Michigan in 1992, the year he joined the company.  After completing a course entitled Selling in Europe, he was transferred to the London office in March 1993.', 5, 'http://accweb/emmployees/davolio.bmp');
INSERT INTO employees VALUES (DEFAULT,'Callahan', 'Laura', 'Inside Sales Coordinator', 'Ms.', '1958-01-09', '1994-03-05', '4726 - 11th Ave. N.E.', 'Seattle', 'WA', '98105', 'USA', '(206) 555-1189', '2344', '\x', 'Laura received a BA in psychology from the University of Washington.  She has also completed a course in business French.  She reads and writes French.', 2, 'http://accweb/emmployees/davolio.bmp');
INSERT INTO employees VALUES (DEFAULT,'Dodsworth', 'Anne', 'Sales Representative', 'Ms.', '1966-01-27', '1994-11-15', '7 Houndstooth Rd.', 'London', NULL, 'WG2 7LT', 'UK', '(71) 555-4444', '452', '\x', 'Anne has a BA degree in English from St. Lawrence College.  She is fluent in French and German.', 5, 'http://accweb/emmployees/davolio.bmp');


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

INSERT INTO order_details VALUES (1, 11, 14, 12, 0);
INSERT INTO order_details VALUES (1, 42, 9.80000019, 10, 0);
INSERT INTO order_details VALUES (1, 72, 34.7999992, 5, 0);
INSERT INTO order_details VALUES (2, 14, 18.6000004, 9, 0);
INSERT INTO order_details VALUES (2, 51, 42.4000015, 40, 0);
INSERT INTO order_details VALUES (3, 41, 7.69999981, 10, 0);
INSERT INTO order_details VALUES (3, 51, 42.4000015, 35, 0.150000006);
INSERT INTO order_details VALUES (3, 65, 16.7999992, 15, 0.150000006);
INSERT INTO order_details VALUES (4, 22, 16.7999992, 6, 0.0500000007);
INSERT INTO order_details VALUES (4, 57, 15.6000004, 15, 0.0500000007);
INSERT INTO order_details VALUES (4, 65, 16.7999992, 20, 0);
INSERT INTO order_details VALUES (5, 20, 64.8000031, 40, 0.0500000007);
INSERT INTO order_details VALUES (5, 33, 2, 25, 0.0500000007);
INSERT INTO order_details VALUES (5, 60, 27.2000008, 40, 0);
INSERT INTO order_details VALUES (6, 31, 10, 20, 0);
INSERT INTO order_details VALUES (6, 39, 14.3999996, 42, 0);
INSERT INTO order_details VALUES (6, 49, 16, 40, 0);
INSERT INTO order_details VALUES (7, 24, 3.5999999, 15, 0.150000006);
INSERT INTO order_details VALUES (7, 55, 19.2000008, 21, 0.150000006);
INSERT INTO order_details VALUES (7, 74, 8, 21, 0);
INSERT INTO order_details VALUES (8, 2, 15.1999998, 20, 0);
INSERT INTO order_details VALUES (8, 16, 13.8999996, 35, 0);
INSERT INTO order_details VALUES (8, 36, 15.1999998, 25, 0);
INSERT INTO order_details VALUES (8, 59, 44, 30, 0);
INSERT INTO order_details VALUES (9, 53, 26.2000008, 15, 0);
INSERT INTO order_details VALUES (9, 77, 10.3999996, 12, 0);
INSERT INTO order_details VALUES (10, 27, 35.0999985, 25, 0);
INSERT INTO order_details VALUES (10, 39, 14.3999996, 6, 0);
INSERT INTO order_details VALUES (10, 77, 10.3999996, 15, 0);
INSERT INTO order_details VALUES (11, 2, 15.1999998, 50, 0.200000003);
INSERT INTO order_details VALUES (11, 5, 17, 65, 0.200000003);
INSERT INTO order_details VALUES (11, 32, 25.6000004, 6, 0.200000003);
INSERT INTO order_details VALUES (12, 21, 8, 10, 0);
INSERT INTO order_details VALUES (12, 37, 20.7999992, 1, 0);
INSERT INTO order_details VALUES (13, 41, 7.69999981, 16, 0.25);
INSERT INTO order_details VALUES (13, 57, 15.6000004, 50, 0);
INSERT INTO order_details VALUES (13, 62, 39.4000015, 15, 0.25);
INSERT INTO order_details VALUES (13, 70, 12, 21, 0.25);
INSERT INTO order_details VALUES (14, 21, 8, 20, 0);
INSERT INTO order_details VALUES (14, 35, 14.3999996, 20, 0);
INSERT INTO order_details VALUES (15, 5, 17, 12, 0.200000003);
INSERT INTO order_details VALUES (15, 7, 24, 15, 0);
INSERT INTO order_details VALUES (15, 56, 30.3999996, 2, 0);
INSERT INTO order_details VALUES (16, 16, 13.8999996, 60, 0.25);
INSERT INTO order_details VALUES (16, 24, 3.5999999, 28, 0);
INSERT INTO order_details VALUES (16, 30, 20.7000008, 60, 0.25);
INSERT INTO order_details VALUES (16, 74, 8, 36, 0.25);
INSERT INTO order_details VALUES (17, 2, 15.1999998, 35, 0);
INSERT INTO order_details VALUES (17, 41, 7.69999981, 25, 0.150000006);
INSERT INTO order_details VALUES (18, 17, 31.2000008, 30, 0);
INSERT INTO order_details VALUES (18, 70, 12, 20, 0);
INSERT INTO order_details VALUES (19, 12, 30.3999996, 12, 0.0500000007);
INSERT INTO order_details VALUES (20, 40, 14.6999998, 50, 0);
INSERT INTO order_details VALUES (20, 59, 44, 70, 0.150000006);
INSERT INTO order_details VALUES (20, 76, 14.3999996, 15, 0.150000006);
INSERT INTO order_details VALUES (21, 29, 99, 10, 0);
INSERT INTO order_details VALUES (21, 72, 27.7999992, 4, 0);
INSERT INTO order_details VALUES (22, 33, 2, 60, 0.0500000007);
INSERT INTO order_details VALUES (22, 72, 27.7999992, 20, 0.0500000007);
INSERT INTO order_details VALUES (23, 36, 15.1999998, 30, 0);
INSERT INTO order_details VALUES (23, 43, 36.7999992, 25, 0);
INSERT INTO order_details VALUES (24, 33, 2, 24, 0);
INSERT INTO order_details VALUES (25, 20, 64.8000031, 6, 0);
INSERT INTO order_details VALUES (25, 31, 10, 40, 0);
INSERT INTO order_details VALUES (25, 72, 27.7999992, 24, 0);
INSERT INTO order_details VALUES (26, 10, 24.7999992, 24, 0.0500000007);
INSERT INTO order_details VALUES (26, 31, 10, 15, 0.0500000007);
INSERT INTO order_details VALUES (26, 33, 2, 20, 0);
INSERT INTO order_details VALUES (26, 40, 14.6999998, 60, 0.0500000007);
INSERT INTO order_details VALUES (26, 76, 14.3999996, 33, 0.0500000007);
INSERT INTO order_details VALUES (27, 71, 17.2000008, 20, 0);
INSERT INTO order_details VALUES (27, 72, 27.7999992, 7, 0);
INSERT INTO order_details VALUES (28, 24, 3.5999999, 12, 0.0500000007);
INSERT INTO order_details VALUES (28, 59, 44, 6, 0.0500000007);
INSERT INTO order_details VALUES (29, 10, 24.7999992, 15, 0);
INSERT INTO order_details VALUES (29, 13, 4.80000019, 10, 0);
INSERT INTO order_details VALUES (30, 28, 36.4000015, 20, 0);
INSERT INTO order_details VALUES (30, 62, 39.4000015, 12, 0);
INSERT INTO order_details VALUES (31, 44, 15.5, 16, 0);
INSERT INTO order_details VALUES (31, 59, 44, 15, 0);
INSERT INTO order_details VALUES (31, 63, 35.0999985, 8, 0);
INSERT INTO order_details VALUES (31, 73, 12, 25, 0);
INSERT INTO order_details VALUES (32, 17, 31.2000008, 15, 0.25);
INSERT INTO order_details VALUES (33, 24, 3.5999999, 12, 0);
INSERT INTO order_details VALUES (33, 55, 19.2000008, 20, 0);
INSERT INTO order_details VALUES (33, 75, 6.19999981, 30, 0);
INSERT INTO order_details VALUES (34, 19, 7.30000019, 1, 0);
INSERT INTO order_details VALUES (34, 24, 3.5999999, 6, 0);
INSERT INTO order_details VALUES (34, 35, 14.3999996, 4, 0);
INSERT INTO order_details VALUES (35, 30, 20.7000008, 6, 0);
INSERT INTO order_details VALUES (35, 57, 15.6000004, 2, 0);
INSERT INTO order_details VALUES (36, 15, 12.3999996, 20, 0);
INSERT INTO order_details VALUES (36, 19, 7.30000019, 18, 0);
INSERT INTO order_details VALUES (36, 60, 27.2000008, 35, 0);
INSERT INTO order_details VALUES (36, 72, 27.7999992, 3, 0);
INSERT INTO order_details VALUES (37, 27, 35.0999985, 15, 0.25);
INSERT INTO order_details VALUES (37, 44, 15.5, 21, 0);
INSERT INTO order_details VALUES (37, 60, 27.2000008, 20, 0.25);
INSERT INTO order_details VALUES (37, 67, 11.1999998, 5, 0.25);
INSERT INTO order_details VALUES (38, 1, 14.3999996, 45, 0.200000003);
INSERT INTO order_details VALUES (38, 40, 14.6999998, 40, 0.200000003);
INSERT INTO order_details VALUES (38, 53, 26.2000008, 36, 0.200000003);
INSERT INTO order_details VALUES (39, 35, 14.3999996, 100, 0);
INSERT INTO order_details VALUES (39, 62, 39.4000015, 40, 0);
INSERT INTO order_details VALUES (40, 16, 13.8999996, 40, 0.150000006);
INSERT INTO order_details VALUES (40, 34, 11.1999998, 20, 0);
INSERT INTO order_details VALUES (40, 46, 9.60000038, 15, 0.150000006);
INSERT INTO order_details VALUES (41, 54, 5.9000001, 10, 0.100000001);
INSERT INTO order_details VALUES (41, 68, 10, 3, 0.100000001);
INSERT INTO order_details VALUES (42, 3, 8, 30, 0);
INSERT INTO order_details VALUES (42, 64, 26.6000004, 9, 0);
INSERT INTO order_details VALUES (43, 5, 17, 20, 0);
INSERT INTO order_details VALUES (43, 29, 99, 15, 0);
INSERT INTO order_details VALUES (43, 49, 16, 15, 0);
INSERT INTO order_details VALUES (43, 77, 10.3999996, 10, 0);
INSERT INTO order_details VALUES (44, 13, 4.80000019, 20, 0.100000001);
INSERT INTO order_details VALUES (44, 44, 15.5, 24, 0.100000001);
INSERT INTO order_details VALUES (44, 51, 42.4000015, 2, 0.100000001);
INSERT INTO order_details VALUES (45, 20, 64.8000031, 20, 0);
INSERT INTO order_details VALUES (46, 18, 50, 12, 0);
INSERT INTO order_details VALUES (46, 24, 3.5999999, 10, 0);
INSERT INTO order_details VALUES (46, 63, 35.0999985, 5, 0);
INSERT INTO order_details VALUES (46, 75, 6.19999981, 6, 0);
INSERT INTO order_details VALUES (47, 1, 14.3999996, 18, 0);
INSERT INTO order_details VALUES (47, 17, 31.2000008, 15, 0);
INSERT INTO order_details VALUES (47, 43, 36.7999992, 15, 0);
INSERT INTO order_details VALUES (47, 60, 27.2000008, 21, 0);
INSERT INTO order_details VALUES (47, 75, 6.19999981, 6, 0);
INSERT INTO order_details VALUES (48, 56, 30.3999996, 4, 0);
INSERT INTO order_details VALUES (49, 11, 16.7999992, 12, 0);
INSERT INTO order_details VALUES (49, 16, 13.8999996, 30, 0);
INSERT INTO order_details VALUES (49, 69, 28.7999992, 15, 0);
INSERT INTO order_details VALUES (50, 39, 14.3999996, 60, 0);
INSERT INTO order_details VALUES (50, 72, 27.7999992, 20, 0);
INSERT INTO order_details VALUES (51, 2, 15.1999998, 40, 0);
INSERT INTO order_details VALUES (51, 36, 15.1999998, 40, 0.25);
INSERT INTO order_details VALUES (51, 59, 44, 30, 0.25);
INSERT INTO order_details VALUES (51, 62, 39.4000015, 15, 0);
INSERT INTO order_details VALUES (52, 19, 7.30000019, 15, 0);
INSERT INTO order_details VALUES (52, 70, 12, 20, 0);
INSERT INTO order_details VALUES (53, 66, 13.6000004, 30, 0);
INSERT INTO order_details VALUES (53, 68, 10, 20, 0);
INSERT INTO order_details VALUES (54, 40, 14.6999998, 10, 0);
INSERT INTO order_details VALUES (54, 56, 30.3999996, 20, 0);
INSERT INTO order_details VALUES (55, 17, 31.2000008, 40, 0);
INSERT INTO order_details VALUES (55, 28, 36.4000015, 28, 0);
INSERT INTO order_details VALUES (55, 43, 36.7999992, 12, 0);
INSERT INTO order_details VALUES (56, 40, 14.6999998, 40, 0.100000001);
INSERT INTO order_details VALUES (56, 65, 16.7999992, 30, 0.100000001);
INSERT INTO order_details VALUES (56, 68, 10, 15, 0.100000001);
INSERT INTO order_details VALUES (57, 49, 16, 30, 0);
INSERT INTO order_details VALUES (57, 59, 44, 10, 0);
INSERT INTO order_details VALUES (57, 71, 17.2000008, 2, 0);
INSERT INTO order_details VALUES (58, 18, 50, 25, 0.100000001);
INSERT INTO order_details VALUES (58, 29, 99, 25, 0.100000001);
INSERT INTO order_details VALUES (58, 39, 14.3999996, 30, 0.100000001);
INSERT INTO order_details VALUES (59, 30, 20.7000008, 10, 0);
INSERT INTO order_details VALUES (59, 53, 26.2000008, 10, 0);
INSERT INTO order_details VALUES (59, 54, 5.9000001, 5, 0);
INSERT INTO order_details VALUES (60, 62, 39.4000015, 10, 0);
INSERT INTO order_details VALUES (60, 68, 10, 3, 0);
INSERT INTO order_details VALUES (61, 69, 28.7999992, 1, 0);
INSERT INTO order_details VALUES (61, 70, 12, 5, 0);
INSERT INTO order_details VALUES (62, 4, 17.6000004, 20, 0);
INSERT INTO order_details VALUES (62, 6, 20, 30, 0);
INSERT INTO order_details VALUES (62, 42, 11.1999998, 2, 0);
INSERT INTO order_details VALUES (62, 43, 36.7999992, 20, 0);
INSERT INTO order_details VALUES (62, 71, 17.2000008, 3, 0);
INSERT INTO order_details VALUES (63, 16, 13.8999996, 10, 0);
INSERT INTO order_details VALUES (63, 62, 39.4000015, 5, 0);
INSERT INTO order_details VALUES (64, 42, 11.1999998, 6, 0);
INSERT INTO order_details VALUES (64, 69, 28.7999992, 7, 0);
INSERT INTO order_details VALUES (65, 28, 36.4000015, 4, 0);
INSERT INTO order_details VALUES (65, 43, 36.7999992, 24, 0);
INSERT INTO order_details VALUES (65, 53, 26.2000008, 20, 0);
INSERT INTO order_details VALUES (65, 75, 6.19999981, 10, 0);
INSERT INTO order_details VALUES (66, 36, 15.1999998, 12, 0);
INSERT INTO order_details VALUES (67, 32, 25.6000004, 40, 0.100000001);
INSERT INTO order_details VALUES (67, 58, 10.6000004, 30, 0.100000001);
INSERT INTO order_details VALUES (67, 62, 39.4000015, 25, 0.100000001);
INSERT INTO order_details VALUES (68, 34, 11.1999998, 14, 0);
INSERT INTO order_details VALUES (68, 70, 12, 30, 0);
INSERT INTO order_details VALUES (69, 41, 7.69999981, 10, 0);
INSERT INTO order_details VALUES (69, 62, 39.4000015, 70, 0);
INSERT INTO order_details VALUES (70, 1, 14.3999996, 20, 0);
INSERT INTO order_details VALUES (71, 41, 7.69999981, 20, 0);
INSERT INTO order_details VALUES (71, 76, 14.3999996, 6, 0);
INSERT INTO order_details VALUES (72, 17, 31.2000008, 8, 0);
INSERT INTO order_details VALUES (72, 28, 36.4000015, 14, 0);
INSERT INTO order_details VALUES (72, 76, 14.3999996, 30, 0);
INSERT INTO order_details VALUES (73, 71, 17.2000008, 30, 0);
INSERT INTO order_details VALUES (74, 35, 14.3999996, 10, 0);
INSERT INTO order_details VALUES (75, 52, 5.5999999, 20, 0);
INSERT INTO order_details VALUES (76, 15, 12.3999996, 5, 0);
INSERT INTO order_details VALUES (76, 25, 11.1999998, 4, 0);
INSERT INTO order_details VALUES (76, 39, 14.3999996, 4, 0);
INSERT INTO order_details VALUES (77, 16, 13.8999996, 21, 0.150000006);
INSERT INTO order_details VALUES (77, 35, 14.3999996, 70, 0.150000006);
INSERT INTO order_details VALUES (77, 46, 9.60000038, 30, 0);
INSERT INTO order_details VALUES (77, 59, 44, 40, 0.150000006);
INSERT INTO order_details VALUES (77, 63, 35.0999985, 80, 0.150000006);
INSERT INTO order_details VALUES (78, 6, 20, 6, 0);
INSERT INTO order_details VALUES (78, 13, 4.80000019, 12, 0);
INSERT INTO order_details VALUES (78, 14, 18.6000004, 9, 0);
INSERT INTO order_details VALUES (78, 31, 10, 4, 0);
INSERT INTO order_details VALUES (78, 72, 27.7999992, 40, 0);
INSERT INTO order_details VALUES (79, 4, 17.6000004, 24, 0);
INSERT INTO order_details VALUES (79, 57, 15.6000004, 16, 0);
INSERT INTO order_details VALUES (79, 75, 6.19999981, 50, 0);
INSERT INTO order_details VALUES (80, 2, 15.1999998, 25, 0.200000003);
INSERT INTO order_details VALUES (80, 11, 16.7999992, 50, 0.200000003);
INSERT INTO order_details VALUES (80, 30, 20.7000008, 35, 0.200000003);
INSERT INTO order_details VALUES (80, 58, 10.6000004, 30, 0.200000003);
INSERT INTO order_details VALUES (81, 59, 44, 9, 0);
INSERT INTO order_details VALUES (81, 65, 16.7999992, 40, 0);
INSERT INTO order_details VALUES (81, 68, 10, 10, 0);
INSERT INTO order_details VALUES (82, 19, 7.30000019, 10, 0.0500000007);
INSERT INTO order_details VALUES (82, 30, 20.7000008, 8, 0.0500000007);
INSERT INTO order_details VALUES (82, 38, 210.800003, 20, 0.0500000007);
INSERT INTO order_details VALUES (82, 56, 30.3999996, 12, 0.0500000007);
INSERT INTO order_details VALUES (83, 26, 24.8999996, 50, 0.150000006);
INSERT INTO order_details VALUES (83, 72, 27.7999992, 25, 0.150000006);
INSERT INTO order_details VALUES (84, 54, 5.9000001, 15, 0);
INSERT INTO order_details VALUES (85, 18, 50, 40, 0.200000003);
INSERT INTO order_details VALUES (85, 42, 11.1999998, 10, 0.200000003);
INSERT INTO order_details VALUES (85, 47, 7.5999999, 16, 0.200000003);
INSERT INTO order_details VALUES (86, 14, 18.6000004, 10, 0);
INSERT INTO order_details VALUES (86, 21, 8, 10, 0.100000001);
INSERT INTO order_details VALUES (86, 71, 17.2000008, 40, 0.100000001);
INSERT INTO order_details VALUES (87, 52, 5.5999999, 8, 0);
INSERT INTO order_details VALUES (87, 68, 10, 10, 0);
INSERT INTO order_details VALUES (88, 2, 15.1999998, 7, 0.200000003);
INSERT INTO order_details VALUES (88, 31, 10, 25, 0.200000003);
INSERT INTO order_details VALUES (88, 32, 25.6000004, 6, 0.200000003);
INSERT INTO order_details VALUES (88, 51, 42.4000015, 48, 0.200000003);
INSERT INTO order_details VALUES (89, 4, 17.6000004, 18, 0.100000001);
INSERT INTO order_details VALUES (90, 23, 7.19999981, 40, 0);
INSERT INTO order_details VALUES (90, 26, 24.8999996, 24, 0);
INSERT INTO order_details VALUES (90, 36, 15.1999998, 20, 0);
INSERT INTO order_details VALUES (90, 37, 20.7999992, 28, 0);
INSERT INTO order_details VALUES (90, 72, 27.7999992, 25, 0);
INSERT INTO order_details VALUES (91, 17, 31.2000008, 20, 0);
INSERT INTO order_details VALUES (91, 30, 20.7000008, 15, 0);
INSERT INTO order_details VALUES (92, 4, 17.6000004, 10, 0);
INSERT INTO order_details VALUES (92, 17, 31.2000008, 70, 0.0500000007);
INSERT INTO order_details VALUES (92, 62, 39.4000015, 28, 0);
INSERT INTO order_details VALUES (93, 18, 50, 20, 0.0500000007);
INSERT INTO order_details VALUES (93, 41, 7.69999981, 12, 0.0500000007);
INSERT INTO order_details VALUES (93, 43, 36.7999992, 40, 0.0500000007);
INSERT INTO order_details VALUES (94, 33, 2, 8, 0);
INSERT INTO order_details VALUES (94, 59, 44, 9, 0.150000006);
INSERT INTO order_details VALUES (95, 2, 15.1999998, 24, 0.200000003);
INSERT INTO order_details VALUES (95, 31, 10, 56, 0.200000003);
INSERT INTO order_details VALUES (95, 36, 15.1999998, 40, 0.200000003);
INSERT INTO order_details VALUES (95, 55, 19.2000008, 40, 0.200000003);
INSERT INTO order_details VALUES (96, 64, 26.6000004, 50, 0);
INSERT INTO order_details VALUES (96, 68, 10, 4, 0.0500000007);
INSERT INTO order_details VALUES (96, 76, 14.3999996, 15, 0);
INSERT INTO order_details VALUES (97, 4, 17.6000004, 35, 0);
INSERT INTO order_details VALUES (97, 8, 32, 70, 0.25);
INSERT INTO order_details VALUES (98, 8, 32, 70, 0);
INSERT INTO order_details VALUES (98, 19, 7.30000019, 80, 0);
INSERT INTO order_details VALUES (98, 42, 11.1999998, 9, 0);
INSERT INTO order_details VALUES (99, 17, 31.2000008, 36, 0.100000001);
INSERT INTO order_details VALUES (99, 56, 30.3999996, 20, 0);
INSERT INTO order_details VALUES (100, 25, 11.1999998, 10, 0);
INSERT INTO order_details VALUES (100, 39, 14.3999996, 50, 0.150000006);
INSERT INTO order_details VALUES (100, 40, 14.6999998, 4, 0);
INSERT INTO order_details VALUES (100, 75, 6.19999981, 6, 0.150000006);
INSERT INTO order_details VALUES (101, 1, 14.3999996, 15, 0.150000006);
INSERT INTO order_details VALUES (101, 23, 7.19999981, 25, 0);
INSERT INTO order_details VALUES (102, 54, 5.9000001, 24, 0);
INSERT INTO order_details VALUES (103, 50, 13, 15, 0.100000001);
INSERT INTO order_details VALUES (103, 69, 28.7999992, 18, 0.100000001);
INSERT INTO order_details VALUES (104, 38, 210.800003, 20, 0.0500000007);
INSERT INTO order_details VALUES (104, 41, 7.69999981, 13, 0);
INSERT INTO order_details VALUES (104, 44, 15.5, 77, 0.0500000007);
INSERT INTO order_details VALUES (104, 65, 16.7999992, 10, 0.0500000007);
INSERT INTO order_details VALUES (105, 24, 3.5999999, 10, 0);
INSERT INTO order_details VALUES (105, 54, 5.9000001, 20, 0.150000006);
INSERT INTO order_details VALUES (106, 11, 16.7999992, 12, 0.200000003);
INSERT INTO order_details VALUES (106, 38, 210.800003, 50, 0.200000003);
INSERT INTO order_details VALUES (107, 1, 14.3999996, 12, 0);
INSERT INTO order_details VALUES (107, 29, 99, 4, 0);
INSERT INTO order_details VALUES (108, 24, 3.5999999, 25, 0);
INSERT INTO order_details VALUES (108, 57, 15.6000004, 25, 0);
INSERT INTO order_details VALUES (109, 31, 10, 30, 0);
INSERT INTO order_details VALUES (109, 55, 19.2000008, 12, 0);
INSERT INTO order_details VALUES (109, 69, 28.7999992, 20, 0);
INSERT INTO order_details VALUES (110, 10, 24.7999992, 30, 0.200000003);
INSERT INTO order_details VALUES (110, 26, 24.8999996, 16, 0);
INSERT INTO order_details VALUES (110, 60, 27.2000008, 8, 0.200000003);
INSERT INTO order_details VALUES (111, 24, 3.5999999, 10, 0.0500000007);
INSERT INTO order_details VALUES (111, 34, 11.1999998, 10, 0.0500000007);
INSERT INTO order_details VALUES (111, 36, 15.1999998, 20, 0.0500000007);
INSERT INTO order_details VALUES (112, 16, 13.8999996, 56, 0.0500000007);
INSERT INTO order_details VALUES (112, 31, 10, 70, 0.0500000007);
INSERT INTO order_details VALUES (112, 60, 27.2000008, 80, 0.0500000007);
INSERT INTO order_details VALUES (113, 28, 36.4000015, 30, 0);
INSERT INTO order_details VALUES (113, 29, 99, 35, 0);
INSERT INTO order_details VALUES (113, 38, 210.800003, 10, 0);
INSERT INTO order_details VALUES (113, 49, 16, 35, 0);
INSERT INTO order_details VALUES (113, 54, 5.9000001, 28, 0);
INSERT INTO order_details VALUES (114, 39, 14.3999996, 54, 0.100000001);
INSERT INTO order_details VALUES (114, 60, 27.2000008, 55, 0.100000001);
INSERT INTO order_details VALUES (115, 25, 11.1999998, 50, 0);
INSERT INTO order_details VALUES (115, 51, 42.4000015, 20, 0);
INSERT INTO order_details VALUES (115, 54, 5.9000001, 24, 0);
INSERT INTO order_details VALUES (116, 31, 10, 20, 0);
INSERT INTO order_details VALUES (116, 75, 6.19999981, 12, 0);
INSERT INTO order_details VALUES (116, 76, 14.3999996, 12, 0);
INSERT INTO order_details VALUES (117, 69, 28.7999992, 30, 0);
INSERT INTO order_details VALUES (117, 71, 17.2000008, 5, 0);
INSERT INTO order_details VALUES (118, 11, 16.7999992, 24, 0);
INSERT INTO order_details VALUES (119, 65, 16.7999992, 5, 0);
INSERT INTO order_details VALUES (119, 77, 10.3999996, 5, 0);
INSERT INTO order_details VALUES (120, 34, 11.1999998, 36, 0);
INSERT INTO order_details VALUES (120, 54, 5.9000001, 18, 0);
INSERT INTO order_details VALUES (120, 65, 16.7999992, 15, 0);
INSERT INTO order_details VALUES (120, 77, 10.3999996, 7, 0);
INSERT INTO order_details VALUES (121, 21, 8, 5, 0.100000001);
INSERT INTO order_details VALUES (121, 28, 36.4000015, 13, 0.100000001);
INSERT INTO order_details VALUES (121, 57, 15.6000004, 25, 0);
INSERT INTO order_details VALUES (121, 64, 26.6000004, 35, 0.100000001);
INSERT INTO order_details VALUES (122, 29, 99, 20, 0);
INSERT INTO order_details VALUES (122, 56, 30.3999996, 18, 0.25);
INSERT INTO order_details VALUES (123, 1, 14.3999996, 15, 0.150000006);
INSERT INTO order_details VALUES (123, 64, 26.6000004, 30, 0);
INSERT INTO order_details VALUES (123, 74, 8, 20, 0.150000006);
INSERT INTO order_details VALUES (124, 36, 15.1999998, 6, 0.200000003);
INSERT INTO order_details VALUES (125, 20, 64.8000031, 12, 0.25);
INSERT INTO order_details VALUES (125, 38, 210.800003, 40, 0.25);
INSERT INTO order_details VALUES (125, 60, 27.2000008, 70, 0.25);
INSERT INTO order_details VALUES (125, 72, 27.7999992, 42, 0.25);
INSERT INTO order_details VALUES (126, 58, 10.6000004, 80, 0.200000003);
INSERT INTO order_details VALUES (126, 71, 17.2000008, 50, 0.200000003);
INSERT INTO order_details VALUES (127, 31, 10, 30, 0);
INSERT INTO order_details VALUES (127, 58, 10.6000004, 15, 0);
INSERT INTO order_details VALUES (128, 14, 18.6000004, 15, 0);
INSERT INTO order_details VALUES (128, 54, 5.9000001, 10, 0);
INSERT INTO order_details VALUES (129, 31, 10, 42, 0.0500000007);
INSERT INTO order_details VALUES (130, 28, 36.4000015, 20, 0.150000006);
INSERT INTO order_details VALUES (130, 39, 14.3999996, 20, 0.150000006);
INSERT INTO order_details VALUES (131, 71, 17.2000008, 6, 0);
INSERT INTO order_details VALUES (132, 41, 7.69999981, 8, 0.100000001);
INSERT INTO order_details VALUES (132, 63, 35.0999985, 16, 0.100000001);
INSERT INTO order_details VALUES (132, 65, 16.7999992, 20, 0.100000001);
INSERT INTO order_details VALUES (133, 30, 20.7000008, 18, 0.100000001);
INSERT INTO order_details VALUES (133, 53, 26.2000008, 20, 0.100000001);
INSERT INTO order_details VALUES (133, 60, 27.2000008, 6, 0.100000001);
INSERT INTO order_details VALUES (133, 70, 12, 30, 0);
INSERT INTO order_details VALUES (134, 74, 8, 14, 0);
INSERT INTO order_details VALUES (135, 5, 17, 32, 0);
INSERT INTO order_details VALUES (135, 18, 50, 9, 0);
INSERT INTO order_details VALUES (135, 29, 99, 14, 0);
INSERT INTO order_details VALUES (135, 33, 2, 60, 0);
INSERT INTO order_details VALUES (135, 74, 8, 50, 0);
INSERT INTO order_details VALUES (136, 13, 4.80000019, 20, 0);
INSERT INTO order_details VALUES (136, 50, 13, 15, 0);
INSERT INTO order_details VALUES (136, 56, 30.3999996, 20, 0);
INSERT INTO order_details VALUES (137, 20, 64.8000031, 28, 0);
INSERT INTO order_details VALUES (137, 60, 27.2000008, 15, 0);
INSERT INTO order_details VALUES (138, 7, 24, 10, 0.200000003);
INSERT INTO order_details VALUES (138, 60, 27.2000008, 20, 0.200000003);
INSERT INTO order_details VALUES (138, 68, 10, 8, 0.200000003);
INSERT INTO order_details VALUES (139, 24, 3.5999999, 15, 0);
INSERT INTO order_details VALUES (139, 34, 11.1999998, 10, 0);
INSERT INTO order_details VALUES (140, 24, 3.5999999, 15, 0);
INSERT INTO order_details VALUES (140, 28, 36.4000015, 6, 0);
INSERT INTO order_details VALUES (140, 59, 44, 12, 0);
INSERT INTO order_details VALUES (140, 71, 17.2000008, 15, 0);
INSERT INTO order_details VALUES (141, 45, 7.5999999, 15, 0.200000003);
INSERT INTO order_details VALUES (141, 52, 5.5999999, 20, 0.200000003);
INSERT INTO order_details VALUES (141, 53, 26.2000008, 40, 0);
INSERT INTO order_details VALUES (142, 10, 24.7999992, 16, 0);
INSERT INTO order_details VALUES (142, 55, 19.2000008, 15, 0);
INSERT INTO order_details VALUES (142, 62, 39.4000015, 20, 0);
INSERT INTO order_details VALUES (142, 70, 12, 30, 0);
INSERT INTO order_details VALUES (143, 31, 10, 60, 0.100000001);
INSERT INTO order_details VALUES (143, 35, 14.3999996, 40, 0.100000001);
INSERT INTO order_details VALUES (143, 46, 9.60000038, 45, 0);
INSERT INTO order_details VALUES (143, 72, 27.7999992, 24, 0.100000001);
INSERT INTO order_details VALUES (144, 13, 4.80000019, 18, 0);
INSERT INTO order_details VALUES (145, 69, 28.7999992, 50, 0);
INSERT INTO order_details VALUES (146, 2, 15.1999998, 25, 0.25);
INSERT INTO order_details VALUES (146, 14, 18.6000004, 42, 0.25);
INSERT INTO order_details VALUES (146, 25, 11.1999998, 7, 0.25);
INSERT INTO order_details VALUES (146, 26, 24.8999996, 70, 0.25);
INSERT INTO order_details VALUES (146, 31, 10, 32, 0);
INSERT INTO order_details VALUES (147, 13, 4.80000019, 10, 0);
INSERT INTO order_details VALUES (147, 62, 39.4000015, 10, 0);
INSERT INTO order_details VALUES (148, 46, 9.60000038, 28, 0.100000001);
INSERT INTO order_details VALUES (148, 53, 26.2000008, 70, 0.100000001);
INSERT INTO order_details VALUES (148, 69, 28.7999992, 8, 0);
INSERT INTO order_details VALUES (149, 23, 7.19999981, 40, 0);
INSERT INTO order_details VALUES (149, 71, 17.2000008, 60, 0);
INSERT INTO order_details VALUES (149, 72, 27.7999992, 21, 0);
INSERT INTO order_details VALUES (150, 21, 8, 10, 0.150000006);
INSERT INTO order_details VALUES (150, 51, 42.4000015, 18, 0.150000006);
INSERT INTO order_details VALUES (151, 35, 14.3999996, 30, 0);
INSERT INTO order_details VALUES (151, 55, 19.2000008, 120, 0.100000001);
INSERT INTO order_details VALUES (152, 68, 10, 60, 0);
INSERT INTO order_details VALUES (152, 71, 17.2000008, 30, 0);
INSERT INTO order_details VALUES (152, 76, 14.3999996, 35, 0);
INSERT INTO order_details VALUES (152, 77, 10.3999996, 14, 0);
INSERT INTO order_details VALUES (153, 29, 99, 21, 0);
INSERT INTO order_details VALUES (153, 35, 14.3999996, 35, 0);
INSERT INTO order_details VALUES (153, 49, 16, 30, 0);
INSERT INTO order_details VALUES (154, 30, 20.7000008, 18, 0);
INSERT INTO order_details VALUES (154, 56, 30.3999996, 70, 0);
INSERT INTO order_details VALUES (154, 65, 16.7999992, 20, 0);
INSERT INTO order_details VALUES (154, 71, 17.2000008, 60, 0);
INSERT INTO order_details VALUES (155, 23, 7.19999981, 60, 0);
INSERT INTO order_details VALUES (155, 63, 35.0999985, 65, 0);
INSERT INTO order_details VALUES (156, 16, 13.8999996, 21, 0.150000006);
INSERT INTO order_details VALUES (156, 48, 10.1999998, 70, 0.150000006);
INSERT INTO order_details VALUES (157, 26, 24.8999996, 30, 0.0500000007);
INSERT INTO order_details VALUES (157, 42, 11.1999998, 40, 0.0500000007);
INSERT INTO order_details VALUES (157, 49, 16, 30, 0.0500000007);
INSERT INTO order_details VALUES (158, 3, 8, 50, 0);
INSERT INTO order_details VALUES (159, 1, 14.3999996, 10, 0);
INSERT INTO order_details VALUES (159, 21, 8, 30, 0.100000001);
INSERT INTO order_details VALUES (159, 28, 36.4000015, 42, 0.100000001);
INSERT INTO order_details VALUES (159, 36, 15.1999998, 5, 0.100000001);
INSERT INTO order_details VALUES (159, 40, 14.6999998, 2, 0.100000001);
INSERT INTO order_details VALUES (160, 11, 16.7999992, 30, 0);
INSERT INTO order_details VALUES (160, 69, 28.7999992, 15, 0);
INSERT INTO order_details VALUES (160, 71, 17.2000008, 15, 0);
INSERT INTO order_details VALUES (161, 37, 20.7999992, 10, 0);
INSERT INTO order_details VALUES (161, 54, 5.9000001, 6, 0);
INSERT INTO order_details VALUES (161, 62, 39.4000015, 35, 0);
INSERT INTO order_details VALUES (162, 14, 18.6000004, 12, 0);
INSERT INTO order_details VALUES (162, 21, 8, 12, 0);
INSERT INTO order_details VALUES (163, 33, 2, 49, 0);
INSERT INTO order_details VALUES (163, 59, 44, 16, 0);
INSERT INTO order_details VALUES (164, 41, 7.69999981, 25, 0.200000003);
INSERT INTO order_details VALUES (164, 44, 15.5, 40, 0.200000003);
INSERT INTO order_details VALUES (164, 59, 44, 9, 0.200000003);
INSERT INTO order_details VALUES (165, 14, 18.6000004, 20, 0.100000001);
INSERT INTO order_details VALUES (166, 1, 14.3999996, 24, 0);
INSERT INTO order_details VALUES (166, 62, 39.4000015, 40, 0);
INSERT INTO order_details VALUES (166, 76, 14.3999996, 14, 0);
INSERT INTO order_details VALUES (167, 19, 7.30000019, 18, 0.0500000007);
INSERT INTO order_details VALUES (167, 33, 2, 50, 0);
INSERT INTO order_details VALUES (168, 17, 31.2000008, 2, 0);
INSERT INTO order_details VALUES (168, 33, 2, 20, 0);
INSERT INTO order_details VALUES (169, 19, 7.30000019, 20, 0);
INSERT INTO order_details VALUES (169, 53, 26.2000008, 10, 0);
INSERT INTO order_details VALUES (169, 57, 15.6000004, 20, 0);
INSERT INTO order_details VALUES (170, 38, 210.800003, 50, 0);
INSERT INTO order_details VALUES (170, 46, 9.60000038, 2, 0.25);
INSERT INTO order_details VALUES (170, 68, 10, 36, 0.25);
INSERT INTO order_details VALUES (170, 77, 10.3999996, 35, 0);
INSERT INTO order_details VALUES (171, 2, 15.1999998, 60, 0);
INSERT INTO order_details VALUES (171, 47, 7.5999999, 55, 0);
INSERT INTO order_details VALUES (171, 61, 22.7999992, 16, 0);
INSERT INTO order_details VALUES (171, 74, 8, 15, 0);
INSERT INTO order_details VALUES (172, 60, 27.2000008, 60, 0.0500000007);
INSERT INTO order_details VALUES (172, 69, 28.7999992, 20, 0.0500000007);
INSERT INTO order_details VALUES (173, 9, 77.5999985, 20, 0.100000001);
INSERT INTO order_details VALUES (173, 13, 4.80000019, 2, 0.100000001);
INSERT INTO order_details VALUES (173, 70, 12, 8, 0.100000001);
INSERT INTO order_details VALUES (173, 73, 12, 20, 0.100000001);
INSERT INTO order_details VALUES (174, 19, 7.30000019, 4, 0.150000006);
INSERT INTO order_details VALUES (174, 26, 24.8999996, 30, 0);
INSERT INTO order_details VALUES (174, 53, 26.2000008, 15, 0.150000006);
INSERT INTO order_details VALUES (174, 77, 10.3999996, 10, 0.150000006);
INSERT INTO order_details VALUES (175, 26, 24.8999996, 2, 0);
INSERT INTO order_details VALUES (176, 31, 10, 14, 0);
INSERT INTO order_details VALUES (176, 59, 44, 20, 0);
INSERT INTO order_details VALUES (177, 35, 14.3999996, 60, 0.200000003);
INSERT INTO order_details VALUES (177, 38, 210.800003, 49, 0.200000003);
INSERT INTO order_details VALUES (177, 68, 10, 30, 0.200000003);
INSERT INTO order_details VALUES (178, 55, 19.2000008, 10, 0.25);
INSERT INTO order_details VALUES (178, 76, 14.3999996, 20, 0.25);
INSERT INTO order_details VALUES (179, 56, 30.3999996, 5, 0);
INSERT INTO order_details VALUES (179, 64, 26.6000004, 7, 0);
INSERT INTO order_details VALUES (180, 14, 18.6000004, 35, 0);
INSERT INTO order_details VALUES (181, 46, 9.60000038, 20, 0);
INSERT INTO order_details VALUES (182, 50, 13, 40, 0);
INSERT INTO order_details VALUES (182, 63, 35.0999985, 35, 0.25);
INSERT INTO order_details VALUES (183, 17, 31.2000008, 45, 0.200000003);
INSERT INTO order_details VALUES (183, 21, 8, 50, 0);
INSERT INTO order_details VALUES (183, 56, 30.3999996, 30, 0);
INSERT INTO order_details VALUES (183, 59, 44, 70, 0.200000003);
INSERT INTO order_details VALUES (184, 17, 31.2000008, 50, 0.25);
INSERT INTO order_details VALUES (184, 40, 14.6999998, 50, 0.25);
INSERT INTO order_details VALUES (184, 47, 7.5999999, 30, 0.25);
INSERT INTO order_details VALUES (185, 26, 24.8999996, 10, 0);
INSERT INTO order_details VALUES (185, 54, 5.9000001, 40, 0);
INSERT INTO order_details VALUES (186, 56, 30.3999996, 28, 0);
INSERT INTO order_details VALUES (187, 11, 16.7999992, 6, 0);
INSERT INTO order_details VALUES (187, 76, 14.3999996, 18, 0.150000006);
INSERT INTO order_details VALUES (188, 2, 15.1999998, 10, 0);
INSERT INTO order_details VALUES (188, 22, 16.7999992, 12, 0);
INSERT INTO order_details VALUES (188, 72, 27.7999992, 10, 0);
INSERT INTO order_details VALUES (189, 46, 9.60000038, 5, 0);
INSERT INTO order_details VALUES (189, 56, 30.3999996, 40, 0.100000001);
INSERT INTO order_details VALUES (189, 64, 26.6000004, 30, 0.100000001);
INSERT INTO order_details VALUES (189, 75, 6.19999981, 24, 0.100000001);
INSERT INTO order_details VALUES (190, 53, 26.2000008, 15, 0);
INSERT INTO order_details VALUES (191, 19, 7.30000019, 15, 0.200000003);
INSERT INTO order_details VALUES (191, 34, 11.1999998, 20, 0.200000003);
INSERT INTO order_details VALUES (191, 57, 15.6000004, 15, 0.200000003);
INSERT INTO order_details VALUES (192, 12, 30.3999996, 15, 0);
INSERT INTO order_details VALUES (192, 16, 13.8999996, 16, 0);
INSERT INTO order_details VALUES (192, 64, 26.6000004, 6, 0);
INSERT INTO order_details VALUES (192, 74, 8, 30, 0);
INSERT INTO order_details VALUES (193, 2, 15.1999998, 45, 0.150000006);
INSERT INTO order_details VALUES (193, 16, 13.8999996, 49, 0.150000006);
INSERT INTO order_details VALUES (193, 29, 99, 24, 0.150000006);
INSERT INTO order_details VALUES (193, 61, 22.7999992, 90, 0.150000006);
INSERT INTO order_details VALUES (194, 27, 35.0999985, 50, 0);
INSERT INTO order_details VALUES (195, 11, 16.7999992, 30, 0);
INSERT INTO order_details VALUES (195, 54, 5.9000001, 80, 0);
INSERT INTO order_details VALUES (195, 66, 13.6000004, 60, 0);
INSERT INTO order_details VALUES (196, 11, 16.7999992, 6, 0.200000003);
INSERT INTO order_details VALUES (196, 28, 36.4000015, 12, 0);
INSERT INTO order_details VALUES (197, 17, 31.2000008, 10, 0);
INSERT INTO order_details VALUES (197, 26, 24.8999996, 15, 0);
INSERT INTO order_details VALUES (197, 35, 14.3999996, 8, 0);
INSERT INTO order_details VALUES (197, 41, 7.69999981, 30, 0);
INSERT INTO order_details VALUES (198, 39, 14.3999996, 6, 0);
INSERT INTO order_details VALUES (198, 54, 5.9000001, 15, 0);
INSERT INTO order_details VALUES (199, 19, 7.30000019, 12, 0.100000001);
INSERT INTO order_details VALUES (199, 24, 3.5999999, 20, 0.100000001);
INSERT INTO order_details VALUES (199, 31, 10, 3, 0.100000001);
INSERT INTO order_details VALUES (199, 52, 5.5999999, 15, 0.100000001);
INSERT INTO order_details VALUES (200, 19, 7.30000019, 40, 0);
INSERT INTO order_details VALUES (200, 65, 16.7999992, 35, 0);
INSERT INTO order_details VALUES (200, 71, 17.2000008, 2, 0);
INSERT INTO order_details VALUES (201, 26, 24.8999996, 6, 0);
INSERT INTO order_details VALUES (201, 40, 14.6999998, 20, 0);
INSERT INTO order_details VALUES (202, 10, 24.7999992, 14, 0);
INSERT INTO order_details VALUES (202, 52, 5.5999999, 20, 0);
INSERT INTO order_details VALUES (202, 62, 39.4000015, 35, 0);
INSERT INTO order_details VALUES (203, 10, 24.7999992, 20, 0.200000003);
INSERT INTO order_details VALUES (203, 54, 5.9000001, 6, 0.200000003);
INSERT INTO order_details VALUES (204, 55, 19.2000008, 120, 0.100000001);
INSERT INTO order_details VALUES (204, 64, 26.6000004, 35, 0.100000001);
INSERT INTO order_details VALUES (204, 65, 16.7999992, 28, 0.100000001);
INSERT INTO order_details VALUES (204, 77, 10.3999996, 55, 0.100000001);
INSERT INTO order_details VALUES (205, 28, 36.4000015, 15, 0);
INSERT INTO order_details VALUES (205, 44, 15.5, 100, 0.0500000007);
INSERT INTO order_details VALUES (206, 48, 10.1999998, 15, 0.100000001);
INSERT INTO order_details VALUES (206, 70, 12, 25, 0.100000001);
INSERT INTO order_details VALUES (207, 16, 13.8999996, 20, 0.200000003);
INSERT INTO order_details VALUES (207, 33, 2, 20, 0.200000003);
INSERT INTO order_details VALUES (207, 46, 9.60000038, 10, 0.200000003);
INSERT INTO order_details VALUES (208, 39, 14.3999996, 20, 0);
INSERT INTO order_details VALUES (208, 53, 26.2000008, 50, 0);
INSERT INTO order_details VALUES (208, 61, 22.7999992, 25, 0);
INSERT INTO order_details VALUES (208, 71, 17.2000008, 30, 0);
INSERT INTO order_details VALUES (209, 21, 8, 40, 0.150000006);
INSERT INTO order_details VALUES (209, 49, 16, 21, 0.150000006);
INSERT INTO order_details VALUES (210, 59, 44, 36, 0);
INSERT INTO order_details VALUES (211, 26, 24.8999996, 30, 0);
INSERT INTO order_details VALUES (211, 28, 36.4000015, 30, 0);
INSERT INTO order_details VALUES (211, 43, 36.7999992, 20, 0);
INSERT INTO order_details VALUES (211, 56, 30.3999996, 15, 0);
INSERT INTO order_details VALUES (211, 71, 17.2000008, 50, 0);
INSERT INTO order_details VALUES (212, 7, 24, 16, 0.0500000007);
INSERT INTO order_details VALUES (212, 46, 9.60000038, 20, 0.0500000007);
INSERT INTO order_details VALUES (212, 72, 27.7999992, 40, 0);
INSERT INTO order_details VALUES (213, 68, 10, 21, 0.25);
INSERT INTO order_details VALUES (213, 75, 6.19999981, 4, 0.25);
INSERT INTO order_details VALUES (214, 21, 8, 40, 0.25);
INSERT INTO order_details VALUES (214, 30, 20.7000008, 28, 0.25);
INSERT INTO order_details VALUES (214, 55, 19.2000008, 60, 0.25);
INSERT INTO order_details VALUES (215, 13, 4.80000019, 1, 0);
INSERT INTO order_details VALUES (215, 23, 7.19999981, 21, 0);
INSERT INTO order_details VALUES (216, 19, 7.30000019, 21, 0);
INSERT INTO order_details VALUES (216, 42, 11.1999998, 50, 0);
INSERT INTO order_details VALUES (217, 4, 17.6000004, 16, 0.200000003);
INSERT INTO order_details VALUES (217, 43, 36.7999992, 3, 0);
INSERT INTO order_details VALUES (217, 56, 30.3999996, 30, 0.200000003);
INSERT INTO order_details VALUES (217, 60, 27.2000008, 20, 0);
INSERT INTO order_details VALUES (218, 24, 3.5999999, 25, 0);
INSERT INTO order_details VALUES (218, 29, 99, 18, 0.100000001);
INSERT INTO order_details VALUES (218, 40, 14.6999998, 20, 0);
INSERT INTO order_details VALUES (218, 45, 7.5999999, 30, 0.100000001);
INSERT INTO order_details VALUES (218, 50, 13, 25, 0);
INSERT INTO order_details VALUES (219, 11, 16.7999992, 10, 0);
INSERT INTO order_details VALUES (219, 46, 9.60000038, 5, 0);
INSERT INTO order_details VALUES (220, 24, 3.5999999, 28, 0);
INSERT INTO order_details VALUES (220, 25, 11.1999998, 12, 0);
INSERT INTO order_details VALUES (221, 30, 20.7000008, 8, 0);
INSERT INTO order_details VALUES (221, 43, 36.7999992, 15, 0);
INSERT INTO order_details VALUES (222, 2, 15.1999998, 40, 0.150000006);
INSERT INTO order_details VALUES (222, 16, 13.8999996, 35, 0.150000006);
INSERT INTO order_details VALUES (222, 44, 15.5, 2, 0.150000006);
INSERT INTO order_details VALUES (223, 18, 50, 30, 0);
INSERT INTO order_details VALUES (223, 23, 7.19999981, 15, 0);
INSERT INTO order_details VALUES (223, 64, 26.6000004, 8, 0);
INSERT INTO order_details VALUES (224, 7, 24, 30, 0);
INSERT INTO order_details VALUES (224, 56, 30.3999996, 20, 0);
INSERT INTO order_details VALUES (225, 24, 3.5999999, 80, 0.0500000007);
INSERT INTO order_details VALUES (225, 51, 42.4000015, 18, 0);
INSERT INTO order_details VALUES (226, 33, 2, 12, 0);
INSERT INTO order_details VALUES (226, 71, 17.2000008, 12, 0);
INSERT INTO order_details VALUES (227, 14, 18.6000004, 12, 0);
INSERT INTO order_details VALUES (227, 28, 36.4000015, 18, 0);
INSERT INTO order_details VALUES (227, 40, 14.6999998, 21, 0);
INSERT INTO order_details VALUES (227, 75, 6.19999981, 10, 0);
INSERT INTO order_details VALUES (228, 31, 10, 35, 0.150000006);
INSERT INTO order_details VALUES (228, 66, 13.6000004, 60, 0.150000006);
INSERT INTO order_details VALUES (228, 76, 14.3999996, 42, 0.150000006);
INSERT INTO order_details VALUES (229, 55, 19.2000008, 2, 0.0500000007);
INSERT INTO order_details VALUES (229, 70, 12, 12, 0);
INSERT INTO order_details VALUES (230, 1, 14.3999996, 15, 0);
INSERT INTO order_details VALUES (230, 21, 8, 21, 0.25);
INSERT INTO order_details VALUES (230, 39, 14.3999996, 20, 0.25);
INSERT INTO order_details VALUES (231, 10, 24.7999992, 20, 0.0500000007);
INSERT INTO order_details VALUES (232, 38, 210.800003, 30, 0);
INSERT INTO order_details VALUES (232, 53, 26.2000008, 28, 0);
INSERT INTO order_details VALUES (232, 59, 44, 60, 0);
INSERT INTO order_details VALUES (232, 64, 26.6000004, 30, 0);
INSERT INTO order_details VALUES (233, 47, 7.5999999, 30, 0);
INSERT INTO order_details VALUES (233, 59, 44, 12, 0);
INSERT INTO order_details VALUES (234, 49, 16, 24, 0);
INSERT INTO order_details VALUES (234, 60, 27.2000008, 40, 0);
INSERT INTO order_details VALUES (235, 40, 14.6999998, 10, 0);
INSERT INTO order_details VALUES (236, 34, 11.1999998, 35, 0.0500000007);
INSERT INTO order_details VALUES (236, 77, 10.3999996, 30, 0.0500000007);
INSERT INTO order_details VALUES (237, 21, 8, 14, 0);
INSERT INTO order_details VALUES (237, 40, 14.6999998, 10, 0);
INSERT INTO order_details VALUES (237, 51, 42.4000015, 3, 0);
INSERT INTO order_details VALUES (238, 2, 15.1999998, 20, 0.100000001);
INSERT INTO order_details VALUES (238, 3, 8, 20, 0.100000001);
INSERT INTO order_details VALUES (238, 55, 19.2000008, 30, 0.100000001);
INSERT INTO order_details VALUES (238, 70, 12, 60, 0.100000001);
INSERT INTO order_details VALUES (239, 11, 16.7999992, 5, 0);
INSERT INTO order_details VALUES (239, 51, 42.4000015, 25, 0);
INSERT INTO order_details VALUES (239, 74, 8, 16, 0);
INSERT INTO order_details VALUES (240, 19, 7.30000019, 5, 0);
INSERT INTO order_details VALUES (240, 26, 24.8999996, 30, 0);
INSERT INTO order_details VALUES (240, 54, 5.9000001, 24, 0.25);
INSERT INTO order_details VALUES (241, 59, 44, 30, 0);
INSERT INTO order_details VALUES (241, 73, 12, 20, 0.200000003);
INSERT INTO order_details VALUES (242, 11, 16.7999992, 15, 0.25);
INSERT INTO order_details VALUES (242, 16, 13.8999996, 18, 0);
INSERT INTO order_details VALUES (243, 59, 44, 60, 0);
INSERT INTO order_details VALUES (243, 68, 10, 30, 0);
INSERT INTO order_details VALUES (243, 75, 6.19999981, 36, 0);
INSERT INTO order_details VALUES (244, 44, 15.5, 15, 0.150000006);
INSERT INTO order_details VALUES (244, 77, 10.3999996, 7, 0.150000006);
INSERT INTO order_details VALUES (245, 25, 11.1999998, 60, 0.0500000007);
INSERT INTO order_details VALUES (245, 42, 11.1999998, 20, 0.0500000007);
INSERT INTO order_details VALUES (246, 65, 16.7999992, 15, 0.100000001);
INSERT INTO order_details VALUES (246, 66, 13.6000004, 10, 0.100000001);
INSERT INTO order_details VALUES (246, 69, 28.7999992, 10, 0.100000001);
INSERT INTO order_details VALUES (247, 56, 30.3999996, 30, 0);
INSERT INTO order_details VALUES (248, 23, 7.19999981, 10, 0);
INSERT INTO order_details VALUES (248, 41, 7.69999981, 20, 0);
INSERT INTO order_details VALUES (248, 77, 10.3999996, 5, 0);
INSERT INTO order_details VALUES (249, 31, 10, 20, 0.0500000007);
INSERT INTO order_details VALUES (250, 56, 30.3999996, 14, 0);
INSERT INTO order_details VALUES (250, 72, 27.7999992, 25, 0);
INSERT INTO order_details VALUES (250, 77, 10.3999996, 25, 0);
INSERT INTO order_details VALUES (251, 24, 4.5, 14, 0);
INSERT INTO order_details VALUES (251, 40, 18.3999996, 5, 0);
INSERT INTO order_details VALUES (251, 42, 14, 30, 0);
INSERT INTO order_details VALUES (252, 28, 45.5999985, 20, 0);
INSERT INTO order_details VALUES (252, 49, 20, 25, 0);
INSERT INTO order_details VALUES (253, 15, 15.5, 12, 0.0500000007);
INSERT INTO order_details VALUES (253, 28, 45.5999985, 8, 0.0500000007);
INSERT INTO order_details VALUES (254, 54, 7.44999981, 20, 0);
INSERT INTO order_details VALUES (255, 45, 9.5, 21, 0);
INSERT INTO order_details VALUES (255, 53, 32.7999992, 6, 0);
INSERT INTO order_details VALUES (255, 67, 14, 30, 0);
INSERT INTO order_details VALUES (256, 14, 23.25, 70, 0);
INSERT INTO order_details VALUES (256, 65, 21.0499992, 20, 0);
INSERT INTO order_details VALUES (257, 2, 19, 12, 0);
INSERT INTO order_details VALUES (257, 21, 10, 12, 0);
INSERT INTO order_details VALUES (257, 53, 32.7999992, 10, 0);
INSERT INTO order_details VALUES (257, 61, 28.5, 25, 0);
INSERT INTO order_details VALUES (258, 62, 49.2999992, 3, 0);
INSERT INTO order_details VALUES (259, 25, 14, 18, 0.100000001);
INSERT INTO order_details VALUES (259, 70, 15, 14, 0.100000001);
INSERT INTO order_details VALUES (260, 43, 46, 15, 0.150000006);
INSERT INTO order_details VALUES (260, 48, 12.75, 15, 0.150000006);
INSERT INTO order_details VALUES (261, 13, 6, 10, 0);
INSERT INTO order_details VALUES (261, 39, 18, 10, 0);
INSERT INTO order_details VALUES (262, 28, 45.5999985, 3, 0);
INSERT INTO order_details VALUES (263, 29, 123.790001, 36, 0);
INSERT INTO order_details VALUES (263, 75, 7.75, 36, 0.100000001);
INSERT INTO order_details VALUES (264, 4, 22, 50, 0.150000006);
INSERT INTO order_details VALUES (264, 7, 30, 50, 0.150000006);
INSERT INTO order_details VALUES (264, 8, 40, 10, 0.150000006);
INSERT INTO order_details VALUES (265, 24, 4.5, 10, 0.150000006);
INSERT INTO order_details VALUES (265, 46, 12, 9, 0.150000006);
INSERT INTO order_details VALUES (265, 47, 9.5, 6, 0.150000006);
INSERT INTO order_details VALUES (265, 60, 34, 12, 0.150000006);
INSERT INTO order_details VALUES (266, 21, 10, 40, 0.200000003);
INSERT INTO order_details VALUES (266, 32, 32, 50, 0.200000003);
INSERT INTO order_details VALUES (266, 61, 28.5, 15, 0.200000003);
INSERT INTO order_details VALUES (267, 20, 81, 39, 0);
INSERT INTO order_details VALUES (267, 28, 45.5999985, 35, 0);
INSERT INTO order_details VALUES (267, 56, 38, 70, 0);
INSERT INTO order_details VALUES (267, 65, 21.0499992, 39, 0);
INSERT INTO order_details VALUES (267, 75, 7.75, 50, 0);
INSERT INTO order_details VALUES (268, 9, 97, 16, 0.150000006);
INSERT INTO order_details VALUES (268, 16, 17.4500008, 50, 0);
INSERT INTO order_details VALUES (268, 27, 43.9000015, 120, 0);
INSERT INTO order_details VALUES (268, 33, 2.5, 16, 0.150000006);
INSERT INTO order_details VALUES (268, 60, 34, 84, 0.150000006);
INSERT INTO order_details VALUES (269, 18, 62.5, 25, 0.100000001);
INSERT INTO order_details VALUES (269, 41, 9.64999962, 80, 0.100000001);
INSERT INTO order_details VALUES (269, 42, 14, 20, 0);
INSERT INTO order_details VALUES (270, 52, 7, 6, 0);
INSERT INTO order_details VALUES (270, 59, 55, 4, 0);
INSERT INTO order_details VALUES (270, 70, 15, 6, 0);
INSERT INTO order_details VALUES (271, 24, 4.5, 5, 0);
INSERT INTO order_details VALUES (271, 38, 263.5, 15, 0);
INSERT INTO order_details VALUES (271, 44, 19.4500008, 9, 0);
INSERT INTO order_details VALUES (272, 10, 31, 16, 0.0500000007);
INSERT INTO order_details VALUES (272, 56, 38, 40, 0);
INSERT INTO order_details VALUES (272, 60, 34, 10, 0.0500000007);
INSERT INTO order_details VALUES (273, 24, 4.5, 8, 0);
INSERT INTO order_details VALUES (273, 53, 32.7999992, 5, 0);
INSERT INTO order_details VALUES (274, 35, 18, 3, 0);
INSERT INTO order_details VALUES (274, 41, 9.64999962, 10, 0);
INSERT INTO order_details VALUES (274, 68, 12.5, 6, 0);
INSERT INTO order_details VALUES (275, 1, 18, 40, 0.200000003);
INSERT INTO order_details VALUES (275, 8, 40, 24, 0);
INSERT INTO order_details VALUES (275, 30, 25.8899994, 20, 0.200000003);
INSERT INTO order_details VALUES (275, 40, 18.3999996, 25, 0.200000003);
INSERT INTO order_details VALUES (276, 17, 39, 25, 0.100000001);
INSERT INTO order_details VALUES (276, 20, 81, 15, 0.100000001);
INSERT INTO order_details VALUES (276, 37, 26, 18, 0.100000001);
INSERT INTO order_details VALUES (276, 41, 9.64999962, 6, 0.100000001);
INSERT INTO order_details VALUES (277, 10, 31, 2, 0);
INSERT INTO order_details VALUES (277, 30, 25.8899994, 10, 0);
INSERT INTO order_details VALUES (277, 43, 46, 60, 0);
INSERT INTO order_details VALUES (277, 54, 7.44999981, 15, 0);
INSERT INTO order_details VALUES (278, 36, 19, 30, 0);
INSERT INTO order_details VALUES (278, 40, 18.3999996, 15, 0.100000001);
INSERT INTO order_details VALUES (279, 1, 18, 8, 0.150000006);
INSERT INTO order_details VALUES (279, 13, 6, 10, 0);
INSERT INTO order_details VALUES (279, 56, 38, 30, 0.150000006);
INSERT INTO order_details VALUES (280, 4, 22, 50, 0.100000001);
INSERT INTO order_details VALUES (280, 36, 19, 30, 0.100000001);
INSERT INTO order_details VALUES (281, 11, 21, 3, 0);
INSERT INTO order_details VALUES (281, 33, 2.5, 8, 0.200000003);
INSERT INTO order_details VALUES (281, 72, 34.7999992, 9, 0);
INSERT INTO order_details VALUES (282, 55, 24, 14, 0);
INSERT INTO order_details VALUES (282, 68, 12.5, 20, 0);
INSERT INTO order_details VALUES (282, 69, 36, 10, 0);
INSERT INTO order_details VALUES (283, 17, 39, 40, 0);
INSERT INTO order_details VALUES (283, 43, 46, 25, 0);
INSERT INTO order_details VALUES (283, 61, 28.5, 20, 0);
INSERT INTO order_details VALUES (283, 76, 18, 50, 0);
INSERT INTO order_details VALUES (284, 59, 55, 2, 0);
INSERT INTO order_details VALUES (285, 30, 25.8899994, 15, 0);
INSERT INTO order_details VALUES (285, 66, 17, 24, 0);
INSERT INTO order_details VALUES (286, 4, 22, 50, 0.0500000007);
INSERT INTO order_details VALUES (286, 72, 34.7999992, 24, 0);
INSERT INTO order_details VALUES (286, 73, 15, 24, 0.0500000007);
INSERT INTO order_details VALUES (287, 30, 25.8899994, 10, 0);
INSERT INTO order_details VALUES (287, 40, 18.3999996, 10, 0.200000003);
INSERT INTO order_details VALUES (287, 54, 7.44999981, 10, 0.200000003);
INSERT INTO order_details VALUES (288, 11, 21, 50, 0.100000001);
INSERT INTO order_details VALUES (288, 40, 18.3999996, 10, 0.100000001);
INSERT INTO order_details VALUES (288, 57, 19.5, 5, 0.100000001);
INSERT INTO order_details VALUES (288, 59, 55, 15, 0.100000001);
INSERT INTO order_details VALUES (289, 12, 38, 15, 0.25);
INSERT INTO order_details VALUES (289, 31, 12.5, 20, 0);
INSERT INTO order_details VALUES (289, 33, 2.5, 30, 0);
INSERT INTO order_details VALUES (289, 60, 34, 35, 0.25);
INSERT INTO order_details VALUES (290, 31, 12.5, 30, 0);
INSERT INTO order_details VALUES (290, 51, 53, 6, 0);
INSERT INTO order_details VALUES (290, 58, 13.25, 20, 0);
INSERT INTO order_details VALUES (290, 72, 34.7999992, 21, 0);
INSERT INTO order_details VALUES (290, 73, 15, 9, 0);
INSERT INTO order_details VALUES (291, 70, 15, 7, 0);
INSERT INTO order_details VALUES (291, 72, 34.7999992, 1, 0);
INSERT INTO order_details VALUES (292, 13, 6, 8, 0);
INSERT INTO order_details VALUES (292, 21, 10, 15, 0);
INSERT INTO order_details VALUES (292, 33, 2.5, 15, 0);
INSERT INTO order_details VALUES (292, 49, 20, 6, 0);
INSERT INTO order_details VALUES (293, 3, 10, 60, 0);
INSERT INTO order_details VALUES (293, 26, 31.2299995, 40, 0);
INSERT INTO order_details VALUES (293, 38, 263.5, 30, 0);
INSERT INTO order_details VALUES (293, 68, 12.5, 35, 0);
INSERT INTO order_details VALUES (294, 24, 4.5, 35, 0.100000001);
INSERT INTO order_details VALUES (294, 38, 263.5, 4, 0.100000001);
INSERT INTO order_details VALUES (294, 65, 21.0499992, 36, 0.100000001);
INSERT INTO order_details VALUES (294, 71, 21.5, 9, 0.100000001);
INSERT INTO order_details VALUES (295, 11, 21, 15, 0.0500000007);
INSERT INTO order_details VALUES (295, 54, 7.44999981, 24, 0.0500000007);
INSERT INTO order_details VALUES (296, 12, 38, 30, 0.150000006);
INSERT INTO order_details VALUES (296, 23, 9, 70, 0.150000006);
INSERT INTO order_details VALUES (297, 28, 45.5999985, 7, 0);
INSERT INTO order_details VALUES (297, 67, 14, 7, 0);
INSERT INTO order_details VALUES (298, 11, 21, 10, 0);
INSERT INTO order_details VALUES (299, 7, 30, 10, 0);
INSERT INTO order_details VALUES (299, 35, 18, 30, 0);
INSERT INTO order_details VALUES (299, 62, 49.2999992, 40, 0);
INSERT INTO order_details VALUES (300, 32, 32, 24, 0.150000006);
INSERT INTO order_details VALUES (300, 36, 19, 60, 0);
INSERT INTO order_details VALUES (301, 34, 14, 10, 0.25);
INSERT INTO order_details VALUES (301, 41, 9.64999962, 14, 0);
INSERT INTO order_details VALUES (302, 31, 12.5, 55, 0.150000006);
INSERT INTO order_details VALUES (302, 45, 9.5, 100, 0.150000006);
INSERT INTO order_details VALUES (302, 51, 53, 48, 0.150000006);
INSERT INTO order_details VALUES (303, 17, 39, 8, 0.100000001);
INSERT INTO order_details VALUES (303, 19, 9.19999981, 10, 0);
INSERT INTO order_details VALUES (303, 21, 10, 6, 0.100000001);
INSERT INTO order_details VALUES (303, 61, 28.5, 10, 0.100000001);
INSERT INTO order_details VALUES (304, 16, 17.4500008, 40, 0.150000006);
INSERT INTO order_details VALUES (304, 35, 18, 20, 0.150000006);
INSERT INTO order_details VALUES (304, 44, 19.4500008, 40, 0);
INSERT INTO order_details VALUES (305, 69, 36, 18, 0);
INSERT INTO order_details VALUES (305, 75, 7.75, 30, 0);
INSERT INTO order_details VALUES (306, 11, 21, 15, 0);
INSERT INTO order_details VALUES (306, 16, 17.4500008, 14, 0);
INSERT INTO order_details VALUES (306, 22, 21, 24, 0);
INSERT INTO order_details VALUES (306, 31, 12.5, 30, 0);
INSERT INTO order_details VALUES (306, 35, 18, 6, 0);
INSERT INTO order_details VALUES (307, 16, 17.4500008, 30, 0.0500000007);
INSERT INTO order_details VALUES (307, 23, 9, 20, 0.0500000007);
INSERT INTO order_details VALUES (307, 62, 49.2999992, 20, 0.0500000007);
INSERT INTO order_details VALUES (307, 77, 13, 10, 0.0500000007);
INSERT INTO order_details VALUES (308, 14, 23.25, 30, 0.200000003);
INSERT INTO order_details VALUES (308, 19, 9.19999981, 35, 0.200000003);
INSERT INTO order_details VALUES (308, 24, 4.5, 18, 0.200000003);
INSERT INTO order_details VALUES (308, 51, 53, 20, 0.200000003);
INSERT INTO order_details VALUES (308, 56, 38, 40, 0.200000003);
INSERT INTO order_details VALUES (309, 72, 34.7999992, 24, 0);
INSERT INTO order_details VALUES (310, 64, 33.25, 30, 0);
INSERT INTO order_details VALUES (310, 75, 7.75, 20, 0);
INSERT INTO order_details VALUES (311, 47, 9.5, 25, 0);
INSERT INTO order_details VALUES (311, 51, 53, 20, 0);
INSERT INTO order_details VALUES (311, 52, 7, 30, 0);
INSERT INTO order_details VALUES (311, 53, 32.7999992, 18, 0);
INSERT INTO order_details VALUES (311, 73, 15, 3, 0);
INSERT INTO order_details VALUES (312, 41, 9.64999962, 12, 0.0500000007);
INSERT INTO order_details VALUES (312, 55, 24, 18, 0.0500000007);
INSERT INTO order_details VALUES (313, 30, 25.8899994, 20, 0);
INSERT INTO order_details VALUES (313, 62, 49.2999992, 15, 0.25);
INSERT INTO order_details VALUES (314, 44, 19.4500008, 10, 0);
INSERT INTO order_details VALUES (314, 51, 53, 50, 0);
INSERT INTO order_details VALUES (315, 33, 2.5, 20, 0.100000001);
INSERT INTO order_details VALUES (315, 62, 49.2999992, 10, 0.100000001);
INSERT INTO order_details VALUES (316, 36, 19, 25, 0);
INSERT INTO order_details VALUES (316, 52, 7, 70, 0);
INSERT INTO order_details VALUES (317, 17, 39, 16, 0.0500000007);
INSERT INTO order_details VALUES (317, 31, 12.5, 6, 0.0500000007);
INSERT INTO order_details VALUES (317, 55, 24, 25, 0.0500000007);
INSERT INTO order_details VALUES (318, 24, 4.5, 25, 0.100000001);
INSERT INTO order_details VALUES (318, 64, 33.25, 18, 0.100000001);
INSERT INTO order_details VALUES (319, 11, 21, 35, 0.150000006);
INSERT INTO order_details VALUES (319, 18, 62.5, 18, 0.150000006);
INSERT INTO order_details VALUES (319, 76, 18, 10, 0);
INSERT INTO order_details VALUES (320, 31, 12.5, 60, 0.200000003);
INSERT INTO order_details VALUES (320, 51, 53, 3, 0);
INSERT INTO order_details VALUES (320, 59, 55, 40, 0.200000003);
INSERT INTO order_details VALUES (321, 10, 31, 5, 0);
INSERT INTO order_details VALUES (322, 31, 12.5, 35, 0.200000003);
INSERT INTO order_details VALUES (322, 76, 18, 30, 0);
INSERT INTO order_details VALUES (323, 11, 21, 15, 0.0500000007);
INSERT INTO order_details VALUES (323, 56, 38, 60, 0.0500000007);
INSERT INTO order_details VALUES (324, 14, 23.25, 11, 0.150000006);
INSERT INTO order_details VALUES (324, 42, 14, 28, 0.150000006);
INSERT INTO order_details VALUES (325, 16, 17.4500008, 12, 0.100000001);
INSERT INTO order_details VALUES (325, 32, 32, 10, 0.100000001);
INSERT INTO order_details VALUES (325, 40, 18.3999996, 50, 0);
INSERT INTO order_details VALUES (325, 75, 7.75, 15, 0.100000001);
INSERT INTO order_details VALUES (326, 17, 39, 18, 0);
INSERT INTO order_details VALUES (326, 34, 14, 40, 0);
INSERT INTO order_details VALUES (326, 53, 32.7999992, 25, 0);
INSERT INTO order_details VALUES (327, 33, 2.5, 14, 0);
INSERT INTO order_details VALUES (327, 40, 18.3999996, 2, 0);
INSERT INTO order_details VALUES (327, 62, 49.2999992, 10, 0);
INSERT INTO order_details VALUES (327, 64, 33.25, 6, 0);
INSERT INTO order_details VALUES (328, 59, 55, 12, 0);
INSERT INTO order_details VALUES (328, 63, 43.9000015, 6, 0);
INSERT INTO order_details VALUES (328, 72, 34.7999992, 30, 0);
INSERT INTO order_details VALUES (328, 76, 18, 10, 0);
INSERT INTO order_details VALUES (329, 1, 18, 10, 0);
INSERT INTO order_details VALUES (329, 31, 12.5, 20, 0);
INSERT INTO order_details VALUES (329, 44, 19.4500008, 21, 0);
INSERT INTO order_details VALUES (330, 39, 18, 10, 0);
INSERT INTO order_details VALUES (330, 75, 7.75, 20, 0);
INSERT INTO order_details VALUES (330, 77, 13, 18, 0);
INSERT INTO order_details VALUES (331, 35, 18, 20, 0);
INSERT INTO order_details VALUES (331, 57, 19.5, 6, 0);
INSERT INTO order_details VALUES (332, 15, 15.5, 10, 0);
INSERT INTO order_details VALUES (332, 75, 7.75, 21, 0);
INSERT INTO order_details VALUES (333, 14, 23.25, 15, 0.0500000007);
INSERT INTO order_details VALUES (333, 41, 9.64999962, 9, 0.0500000007);
INSERT INTO order_details VALUES (333, 65, 21.0499992, 30, 0.0500000007);
INSERT INTO order_details VALUES (334, 75, 7.75, 50, 0.200000003);
INSERT INTO order_details VALUES (335, 57, 19.5, 4, 0);
INSERT INTO order_details VALUES (335, 76, 18, 14, 0);
INSERT INTO order_details VALUES (336, 29, 123.790001, 10, 0);
INSERT INTO order_details VALUES (336, 60, 34, 24, 0.150000006);
INSERT INTO order_details VALUES (336, 69, 36, 10, 0.150000006);
INSERT INTO order_details VALUES (337, 31, 12.5, 50, 0.0500000007);
INSERT INTO order_details VALUES (338, 47, 9.5, 15, 0);
INSERT INTO order_details VALUES (339, 52, 7, 4, 0.150000006);
INSERT INTO order_details VALUES (340, 26, 31.2299995, 6, 0);
INSERT INTO order_details VALUES (340, 35, 18, 20, 0);
INSERT INTO order_details VALUES (340, 77, 13, 20, 0);
INSERT INTO order_details VALUES (341, 18, 62.5, 40, 0.200000003);
INSERT INTO order_details VALUES (341, 42, 14, 100, 0.200000003);
INSERT INTO order_details VALUES (342, 35, 18, 4, 0);
INSERT INTO order_details VALUES (343, 1, 18, 20, 0);
INSERT INTO order_details VALUES (343, 77, 13, 60, 0.0500000007);
INSERT INTO order_details VALUES (344, 3, 10, 14, 0);
INSERT INTO order_details VALUES (344, 7, 30, 10, 0);
INSERT INTO order_details VALUES (344, 54, 7.44999981, 50, 0);
INSERT INTO order_details VALUES (345, 15, 15.5, 25, 0.0500000007);
INSERT INTO order_details VALUES (345, 26, 31.2299995, 5, 0.0500000007);
INSERT INTO order_details VALUES (346, 20, 81, 21, 0.200000003);
INSERT INTO order_details VALUES (346, 69, 36, 20, 0.200000003);
INSERT INTO order_details VALUES (346, 76, 18, 4, 0.200000003);
INSERT INTO order_details VALUES (347, 52, 7, 24, 0);
INSERT INTO order_details VALUES (347, 58, 13.25, 30, 0);
INSERT INTO order_details VALUES (348, 35, 18, 30, 0.25);
INSERT INTO order_details VALUES (348, 61, 28.5, 120, 0.25);
INSERT INTO order_details VALUES (348, 69, 36, 65, 0.25);
INSERT INTO order_details VALUES (349, 56, 38, 5, 0.200000003);
INSERT INTO order_details VALUES (349, 63, 43.9000015, 24, 0.200000003);
INSERT INTO order_details VALUES (349, 75, 7.75, 30, 0.200000003);
INSERT INTO order_details VALUES (350, 24, 4.5, 35, 0.200000003);
INSERT INTO order_details VALUES (350, 57, 19.5, 20, 0);
INSERT INTO order_details VALUES (350, 65, 21.0499992, 12, 0.200000003);
INSERT INTO order_details VALUES (351, 27, 43.9000015, 50, 0);
INSERT INTO order_details VALUES (351, 71, 21.5, 9, 0);
INSERT INTO order_details VALUES (352, 62, 49.2999992, 10, 0);
INSERT INTO order_details VALUES (353, 54, 7.44999981, 4, 0);
INSERT INTO order_details VALUES (353, 73, 15, 30, 0);
INSERT INTO order_details VALUES (354, 13, 6, 60, 0);
INSERT INTO order_details VALUES (354, 59, 55, 35, 0);
INSERT INTO order_details VALUES (355, 77, 13, 5, 0.25);
INSERT INTO order_details VALUES (356, 22, 21, 48, 0);
INSERT INTO order_details VALUES (356, 49, 20, 25, 0.0500000007);
INSERT INTO order_details VALUES (357, 48, 12.75, 6, 0.100000001);
INSERT INTO order_details VALUES (357, 76, 18, 10, 0.100000001);
INSERT INTO order_details VALUES (358, 16, 17.4500008, 30, 0.0500000007);
INSERT INTO order_details VALUES (358, 59, 55, 20, 0.0500000007);
INSERT INTO order_details VALUES (358, 60, 34, 70, 0.0500000007);
INSERT INTO order_details VALUES (358, 71, 21.5, 15, 0.0500000007);
INSERT INTO order_details VALUES (359, 4, 22, 20, 0.200000003);
INSERT INTO order_details VALUES (359, 55, 24, 20, 0.200000003);
INSERT INTO order_details VALUES (359, 62, 49.2999992, 10, 0.200000003);
INSERT INTO order_details VALUES (360, 7, 30, 45, 0);
INSERT INTO order_details VALUES (360, 17, 39, 100, 0);
INSERT INTO order_details VALUES (360, 33, 2.5, 14, 0);
INSERT INTO order_details VALUES (360, 40, 18.3999996, 42, 0);
INSERT INTO order_details VALUES (360, 72, 34.7999992, 12, 0);
INSERT INTO order_details VALUES (361, 56, 38, 28, 0);
INSERT INTO order_details VALUES (362, 1, 18, 3, 0);
INSERT INTO order_details VALUES (362, 10, 31, 10, 0);
INSERT INTO order_details VALUES (362, 21, 10, 6, 0);
INSERT INTO order_details VALUES (363, 36, 19, 21, 0.25);
INSERT INTO order_details VALUES (364, 1, 18, 6, 0);
INSERT INTO order_details VALUES (364, 2, 19, 10, 0);
INSERT INTO order_details VALUES (364, 60, 34, 15, 0);
INSERT INTO order_details VALUES (365, 10, 31, 70, 0);
INSERT INTO order_details VALUES (365, 36, 19, 55, 0);
INSERT INTO order_details VALUES (365, 49, 20, 18, 0);
INSERT INTO order_details VALUES (365, 60, 34, 40, 0);
INSERT INTO order_details VALUES (365, 76, 18, 80, 0);
INSERT INTO order_details VALUES (366, 13, 6, 8, 0.100000001);
INSERT INTO order_details VALUES (366, 75, 7.75, 40, 0);
INSERT INTO order_details VALUES (367, 11, 21, 14, 0);
INSERT INTO order_details VALUES (367, 21, 10, 8, 0);
INSERT INTO order_details VALUES (367, 39, 18, 5, 0);
INSERT INTO order_details VALUES (368, 55, 24, 5, 0);
INSERT INTO order_details VALUES (369, 38, 263.5, 15, 0.0500000007);
INSERT INTO order_details VALUES (369, 56, 38, 14, 0);
INSERT INTO order_details VALUES (369, 70, 15, 15, 0.0500000007);
INSERT INTO order_details VALUES (369, 71, 21.5, 15, 0.0500000007);
INSERT INTO order_details VALUES (370, 59, 55, 30, 0.150000006);
INSERT INTO order_details VALUES (371, 6, 25, 70, 0);
INSERT INTO order_details VALUES (371, 56, 38, 20, 0);
INSERT INTO order_details VALUES (371, 68, 12.5, 15, 0);
INSERT INTO order_details VALUES (372, 21, 10, 42, 0);
INSERT INTO order_details VALUES (372, 22, 21, 40, 0);
INSERT INTO order_details VALUES (373, 24, 4.5, 5, 0);
INSERT INTO order_details VALUES (373, 52, 7, 5, 0);
INSERT INTO order_details VALUES (374, 19, 9.19999981, 5, 0);
INSERT INTO order_details VALUES (374, 23, 9, 10, 0);
INSERT INTO order_details VALUES (374, 70, 15, 20, 0);
INSERT INTO order_details VALUES (374, 71, 21.5, 15, 0);
INSERT INTO order_details VALUES (375, 2, 19, 20, 0);
INSERT INTO order_details VALUES (375, 68, 12.5, 18, 0.200000003);
INSERT INTO order_details VALUES (376, 14, 23.25, 21, 0);
INSERT INTO order_details VALUES (376, 19, 9.19999981, 15, 0.100000001);
INSERT INTO order_details VALUES (376, 21, 10, 25, 0.100000001);
INSERT INTO order_details VALUES (376, 24, 4.5, 3, 0);
INSERT INTO order_details VALUES (376, 35, 18, 30, 0.100000001);
INSERT INTO order_details VALUES (377, 28, 45.5999985, 10, 0);
INSERT INTO order_details VALUES (377, 29, 123.790001, 6, 0);
INSERT INTO order_details VALUES (377, 44, 19.4500008, 10, 0);
INSERT INTO order_details VALUES (378, 14, 23.25, 3, 0);
INSERT INTO order_details VALUES (378, 42, 14, 5, 0);
INSERT INTO order_details VALUES (378, 60, 34, 10, 0);
INSERT INTO order_details VALUES (379, 53, 32.7999992, 12, 0);
INSERT INTO order_details VALUES (379, 60, 34, 20, 0);
INSERT INTO order_details VALUES (379, 71, 21.5, 20, 0);
INSERT INTO order_details VALUES (380, 62, 49.2999992, 15, 0);
INSERT INTO order_details VALUES (380, 73, 15, 35, 0.150000006);
INSERT INTO order_details VALUES (381, 1, 18, 25, 0);
INSERT INTO order_details VALUES (382, 29, 123.790001, 20, 0);
INSERT INTO order_details VALUES (382, 64, 33.25, 9, 0);
INSERT INTO order_details VALUES (383, 55, 24, 12, 0.0500000007);
INSERT INTO order_details VALUES (383, 76, 18, 35, 0);
INSERT INTO order_details VALUES (384, 75, 7.75, 8, 0.100000001);
INSERT INTO order_details VALUES (385, 2, 19, 30, 0.0500000007);
INSERT INTO order_details VALUES (385, 33, 2.5, 20, 0.0500000007);
INSERT INTO order_details VALUES (386, 12, 38, 36, 0.150000006);
INSERT INTO order_details VALUES (386, 13, 6, 13, 0.150000006);
INSERT INTO order_details VALUES (386, 26, 31.2299995, 35, 0.150000006);
INSERT INTO order_details VALUES (386, 62, 49.2999992, 80, 0.150000006);
INSERT INTO order_details VALUES (387, 7, 30, 35, 0);
INSERT INTO order_details VALUES (387, 18, 62.5, 50, 0);
INSERT INTO order_details VALUES (387, 51, 53, 15, 0);
INSERT INTO order_details VALUES (387, 75, 7.75, 2, 0);
INSERT INTO order_details VALUES (388, 4, 22, 10, 0.100000001);
INSERT INTO order_details VALUES (388, 5, 21.3500004, 15, 0.100000001);
INSERT INTO order_details VALUES (388, 22, 21, 40, 0);
INSERT INTO order_details VALUES (389, 4, 22, 25, 0);
INSERT INTO order_details VALUES (389, 58, 13.25, 6, 0);
INSERT INTO order_details VALUES (390, 11, 21, 10, 0);
INSERT INTO order_details VALUES (390, 50, 16.25, 25, 0.0500000007);
INSERT INTO order_details VALUES (390, 56, 38, 60, 0.0500000007);
INSERT INTO order_details VALUES (391, 45, 9.5, 20, 0);
INSERT INTO order_details VALUES (391, 65, 21.0499992, 21, 0);
INSERT INTO order_details VALUES (391, 72, 34.7999992, 60, 0);
INSERT INTO order_details VALUES (392, 18, 62.5, 8, 0);
INSERT INTO order_details VALUES (393, 69, 36, 20, 0.25);
INSERT INTO order_details VALUES (393, 70, 15, 15, 0.25);
INSERT INTO order_details VALUES (394, 2, 19, 50, 0);
INSERT INTO order_details VALUES (394, 40, 18.3999996, 60, 0);
INSERT INTO order_details VALUES (395, 21, 10, 30, 0.200000003);
INSERT INTO order_details VALUES (395, 61, 28.5, 20, 0.200000003);
INSERT INTO order_details VALUES (396, 28, 45.5999985, 15, 0.25);
INSERT INTO order_details VALUES (396, 39, 18, 21, 0.25);
INSERT INTO order_details VALUES (396, 46, 12, 2, 0.25);
INSERT INTO order_details VALUES (397, 18, 62.5, 4, 0.100000001);
INSERT INTO order_details VALUES (397, 43, 46, 20, 0);
INSERT INTO order_details VALUES (397, 46, 12, 21, 0.100000001);
INSERT INTO order_details VALUES (398, 18, 62.5, 20, 0);
INSERT INTO order_details VALUES (398, 36, 19, 15, 0);
INSERT INTO order_details VALUES (399, 1, 18, 15, 0.25);
INSERT INTO order_details VALUES (399, 10, 31, 18, 0.25);
INSERT INTO order_details VALUES (399, 71, 21.5, 30, 0.25);
INSERT INTO order_details VALUES (399, 77, 13, 35, 0.25);
INSERT INTO order_details VALUES (400, 19, 9.19999981, 30, 0);
INSERT INTO order_details VALUES (400, 39, 18, 20, 0);
INSERT INTO order_details VALUES (401, 22, 21, 15, 0);
INSERT INTO order_details VALUES (401, 24, 4.5, 15, 0.150000006);
INSERT INTO order_details VALUES (402, 28, 45.5999985, 20, 0);
INSERT INTO order_details VALUES (402, 72, 34.7999992, 15, 0);
INSERT INTO order_details VALUES (403, 30, 25.8899994, 30, 0);
INSERT INTO order_details VALUES (403, 53, 32.7999992, 25, 0.0500000007);
INSERT INTO order_details VALUES (403, 54, 7.44999981, 30, 0);
INSERT INTO order_details VALUES (404, 19, 9.19999981, 12, 0.25);
INSERT INTO order_details VALUES (404, 22, 21, 20, 0.25);
INSERT INTO order_details VALUES (405, 30, 25.8899994, 2, 0.25);
INSERT INTO order_details VALUES (405, 42, 14, 20, 0);
INSERT INTO order_details VALUES (406, 16, 17.4500008, 30, 0.100000001);
INSERT INTO order_details VALUES (406, 60, 34, 20, 0.100000001);
INSERT INTO order_details VALUES (407, 4, 22, 12, 0.100000001);
INSERT INTO order_details VALUES (407, 39, 18, 20, 0.100000001);
INSERT INTO order_details VALUES (407, 54, 7.44999981, 6, 0.100000001);
INSERT INTO order_details VALUES (408, 41, 9.64999962, 20, 0.200000003);
INSERT INTO order_details VALUES (409, 14, 23.25, 3, 0.100000001);
INSERT INTO order_details VALUES (409, 44, 19.4500008, 28, 0.100000001);
INSERT INTO order_details VALUES (409, 47, 9.5, 6, 0.100000001);
INSERT INTO order_details VALUES (410, 15, 15.5, 50, 0);
INSERT INTO order_details VALUES (410, 41, 9.64999962, 24, 0);
INSERT INTO order_details VALUES (410, 46, 12, 45, 0);
INSERT INTO order_details VALUES (410, 47, 9.5, 10, 0);
INSERT INTO order_details VALUES (410, 56, 38, 45, 0);
INSERT INTO order_details VALUES (410, 60, 34, 30, 0);
INSERT INTO order_details VALUES (411, 21, 10, 60, 0);
INSERT INTO order_details VALUES (411, 40, 18.3999996, 70, 0.0500000007);
INSERT INTO order_details VALUES (411, 60, 34, 55, 0.0500000007);
INSERT INTO order_details VALUES (411, 77, 13, 70, 0.0500000007);
INSERT INTO order_details VALUES (412, 31, 12.5, 20, 0.0500000007);
INSERT INTO order_details VALUES (412, 40, 18.3999996, 24, 0.0500000007);
INSERT INTO order_details VALUES (412, 70, 15, 40, 0.0500000007);
INSERT INTO order_details VALUES (413, 20, 81, 21, 0);
INSERT INTO order_details VALUES (414, 39, 18, 3, 0.200000003);
INSERT INTO order_details VALUES (414, 58, 13.25, 49, 0.200000003);
INSERT INTO order_details VALUES (415, 68, 12.5, 10, 0);
INSERT INTO order_details VALUES (416, 40, 18.3999996, 30, 0.0500000007);
INSERT INTO order_details VALUES (416, 42, 14, 30, 0.0500000007);
INSERT INTO order_details VALUES (416, 51, 53, 20, 0.0500000007);
INSERT INTO order_details VALUES (417, 10, 31, 24, 0.150000006);
INSERT INTO order_details VALUES (417, 56, 38, 12, 0.150000006);
INSERT INTO order_details VALUES (417, 65, 21.0499992, 15, 0.150000006);
INSERT INTO order_details VALUES (418, 51, 53, 20, 0);
INSERT INTO order_details VALUES (418, 59, 55, 1, 0);
INSERT INTO order_details VALUES (418, 76, 18, 10, 0);
INSERT INTO order_details VALUES (419, 29, 123.790001, 36, 0);
INSERT INTO order_details VALUES (419, 65, 21.0499992, 10, 0);
INSERT INTO order_details VALUES (420, 69, 36, 45, 0.200000003);
INSERT INTO order_details VALUES (420, 71, 21.5, 14, 0.200000003);
INSERT INTO order_details VALUES (421, 31, 12.5, 8, 0.100000001);
INSERT INTO order_details VALUES (421, 55, 24, 4, 0.100000001);
INSERT INTO order_details VALUES (421, 64, 33.25, 15, 0.100000001);
INSERT INTO order_details VALUES (422, 36, 19, 30, 0);
INSERT INTO order_details VALUES (423, 23, 9, 32, 0);
INSERT INTO order_details VALUES (423, 46, 12, 60, 0);
INSERT INTO order_details VALUES (423, 67, 14, 25, 0);
INSERT INTO order_details VALUES (423, 73, 15, 50, 0);
INSERT INTO order_details VALUES (423, 75, 7.75, 25, 0);
INSERT INTO order_details VALUES (424, 16, 17.4500008, 10, 0);
INSERT INTO order_details VALUES (424, 62, 49.2999992, 10, 0);
INSERT INTO order_details VALUES (424, 65, 21.0499992, 12, 0);
INSERT INTO order_details VALUES (425, 38, 263.5, 15, 0.100000001);
INSERT INTO order_details VALUES (425, 71, 21.5, 12, 0);
INSERT INTO order_details VALUES (426, 16, 17.4500008, 3, 0);
INSERT INTO order_details VALUES (426, 42, 14, 6, 0);
INSERT INTO order_details VALUES (426, 43, 46, 6, 0);
INSERT INTO order_details VALUES (427, 23, 9, 5, 0);
INSERT INTO order_details VALUES (428, 14, 23.25, 30, 0);
INSERT INTO order_details VALUES (428, 53, 32.7999992, 10, 0);
INSERT INTO order_details VALUES (428, 58, 13.25, 30, 0);
INSERT INTO order_details VALUES (429, 10, 31, 2, 0);
INSERT INTO order_details VALUES (429, 19, 9.19999981, 7, 0);
INSERT INTO order_details VALUES (429, 44, 19.4500008, 21, 0);
INSERT INTO order_details VALUES (430, 26, 31.2299995, 30, 0.150000006);
INSERT INTO order_details VALUES (430, 33, 2.5, 8, 0.150000006);
INSERT INTO order_details VALUES (431, 12, 38, 100, 0);
INSERT INTO order_details VALUES (431, 33, 2.5, 30, 0);
INSERT INTO order_details VALUES (431, 41, 9.64999962, 120, 0);
INSERT INTO order_details VALUES (431, 54, 7.44999981, 30, 0);
INSERT INTO order_details VALUES (432, 59, 55, 12, 0);
INSERT INTO order_details VALUES (433, 16, 17.4500008, 50, 0.25);
INSERT INTO order_details VALUES (433, 31, 12.5, 20, 0.25);
INSERT INTO order_details VALUES (433, 42, 14, 40, 0.25);
INSERT INTO order_details VALUES (434, 19, 9.19999981, 30, 0.100000001);
INSERT INTO order_details VALUES (434, 21, 10, 12, 0.100000001);
INSERT INTO order_details VALUES (434, 64, 33.25, 28, 0);
INSERT INTO order_details VALUES (435, 33, 2.5, 30, 0);
INSERT INTO order_details VALUES (435, 66, 17, 4, 0);
INSERT INTO order_details VALUES (435, 75, 7.75, 30, 0);
INSERT INTO order_details VALUES (436, 52, 7, 9, 0);
INSERT INTO order_details VALUES (437, 40, 18.3999996, 20, 0);
INSERT INTO order_details VALUES (437, 47, 9.5, 40, 0);
INSERT INTO order_details VALUES (437, 60, 34, 30, 0);
INSERT INTO order_details VALUES (438, 10, 31, 20, 0);
INSERT INTO order_details VALUES (438, 41, 9.64999962, 4, 0);
INSERT INTO order_details VALUES (438, 47, 9.5, 15, 0);
INSERT INTO order_details VALUES (439, 17, 39, 30, 0.200000003);
INSERT INTO order_details VALUES (439, 26, 31.2299995, 15, 0);
INSERT INTO order_details VALUES (440, 9, 97, 50, 0.25);
INSERT INTO order_details VALUES (440, 29, 123.790001, 10, 0);
INSERT INTO order_details VALUES (440, 36, 19, 6, 0.25);
INSERT INTO order_details VALUES (441, 10, 31, 18, 0.100000001);
INSERT INTO order_details VALUES (441, 28, 45.5999985, 60, 0.100000001);
INSERT INTO order_details VALUES (441, 34, 14, 14, 0);
INSERT INTO order_details VALUES (442, 1, 18, 35, 0.25);
INSERT INTO order_details VALUES (443, 56, 38, 20, 0.25);
INSERT INTO order_details VALUES (443, 77, 13, 30, 0.25);
INSERT INTO order_details VALUES (444, 1, 18, 30, 0);
INSERT INTO order_details VALUES (444, 29, 123.790001, 40, 0);
INSERT INTO order_details VALUES (444, 43, 46, 40, 0);
INSERT INTO order_details VALUES (444, 44, 19.4500008, 24, 0);
INSERT INTO order_details VALUES (444, 62, 49.2999992, 48, 0);
INSERT INTO order_details VALUES (445, 63, 43.9000015, 20, 0);
INSERT INTO order_details VALUES (446, 9, 97, 6, 0);
INSERT INTO order_details VALUES (446, 54, 7.44999981, 60, 0.150000006);
INSERT INTO order_details VALUES (446, 69, 36, 30, 0.150000006);
INSERT INTO order_details VALUES (446, 73, 15, 15, 0.150000006);
INSERT INTO order_details VALUES (447, 7, 30, 90, 0);
INSERT INTO order_details VALUES (447, 59, 55, 25, 0);
INSERT INTO order_details VALUES (447, 70, 15, 50, 0);
INSERT INTO order_details VALUES (448, 8, 40, 10, 0);
INSERT INTO order_details VALUES (448, 12, 38, 4, 0);
INSERT INTO order_details VALUES (448, 24, 4.5, 20, 0);
INSERT INTO order_details VALUES (449, 17, 39, 20, 0);
INSERT INTO order_details VALUES (449, 46, 12, 18, 0);
INSERT INTO order_details VALUES (450, 19, 9.19999981, 7, 0.25);
INSERT INTO order_details VALUES (450, 35, 18, 9, 0.25);
INSERT INTO order_details VALUES (450, 58, 13.25, 30, 0.25);
INSERT INTO order_details VALUES (450, 70, 15, 30, 0.25);
INSERT INTO order_details VALUES (451, 11, 21, 15, 0);
INSERT INTO order_details VALUES (451, 17, 39, 8, 0.0500000007);
INSERT INTO order_details VALUES (451, 29, 123.790001, 12, 0.0500000007);
INSERT INTO order_details VALUES (451, 65, 21.0499992, 65, 0.0500000007);
INSERT INTO order_details VALUES (451, 70, 15, 8, 0.0500000007);
INSERT INTO order_details VALUES (452, 47, 9.5, 12, 0);
INSERT INTO order_details VALUES (453, 1, 18, 5, 0.200000003);
INSERT INTO order_details VALUES (453, 34, 14, 12, 0.200000003);
INSERT INTO order_details VALUES (453, 68, 12.5, 40, 0.200000003);
INSERT INTO order_details VALUES (453, 71, 21.5, 60, 0.200000003);
INSERT INTO order_details VALUES (454, 59, 55, 42, 0.150000006);
INSERT INTO order_details VALUES (454, 71, 21.5, 20, 0.150000006);
INSERT INTO order_details VALUES (454, 76, 18, 35, 0.150000006);
INSERT INTO order_details VALUES (455, 3, 10, 6, 0);
INSERT INTO order_details VALUES (455, 76, 18, 15, 0);
INSERT INTO order_details VALUES (456, 2, 19, 5, 0);
INSERT INTO order_details VALUES (456, 59, 55, 35, 0);
INSERT INTO order_details VALUES (456, 73, 15, 35, 0);
INSERT INTO order_details VALUES (457, 4, 22, 6, 0);
INSERT INTO order_details VALUES (457, 24, 4.5, 35, 0);
INSERT INTO order_details VALUES (457, 48, 12.75, 24, 0);
INSERT INTO order_details VALUES (458, 31, 12.5, 20, 0);
INSERT INTO order_details VALUES (458, 32, 32, 4, 0);
INSERT INTO order_details VALUES (459, 16, 17.4500008, 20, 0);
INSERT INTO order_details VALUES (459, 43, 46, 24, 0);
INSERT INTO order_details VALUES (459, 59, 55, 8, 0);
INSERT INTO order_details VALUES (460, 55, 24, 21, 0);
INSERT INTO order_details VALUES (460, 57, 19.5, 40, 0);
INSERT INTO order_details VALUES (460, 70, 15, 28, 0.150000006);
INSERT INTO order_details VALUES (461, 5, 21.3500004, 4, 0);
INSERT INTO order_details VALUES (461, 36, 19, 5, 0);
INSERT INTO order_details VALUES (462, 8, 40, 40, 0);
INSERT INTO order_details VALUES (462, 51, 53, 28, 0);
INSERT INTO order_details VALUES (462, 60, 34, 10, 0);
INSERT INTO order_details VALUES (463, 19, 9.19999981, 5, 0);
INSERT INTO order_details VALUES (463, 47, 9.5, 5, 0);
INSERT INTO order_details VALUES (464, 19, 9.19999981, 12, 0);
INSERT INTO order_details VALUES (464, 41, 9.64999962, 42, 0);
INSERT INTO order_details VALUES (464, 53, 32.7999992, 120, 0);
INSERT INTO order_details VALUES (465, 53, 32.7999992, 3, 0.0500000007);
INSERT INTO order_details VALUES (465, 56, 38, 30, 0);
INSERT INTO order_details VALUES (466, 10, 31, 18, 0);
INSERT INTO order_details VALUES (466, 26, 31.2299995, 30, 0);
INSERT INTO order_details VALUES (466, 45, 9.5, 110, 0);
INSERT INTO order_details VALUES (466, 46, 12, 24, 0);
INSERT INTO order_details VALUES (467, 2, 19, 30, 0.25);
INSERT INTO order_details VALUES (467, 17, 39, 27, 0.25);
INSERT INTO order_details VALUES (467, 47, 9.5, 50, 0.25);
INSERT INTO order_details VALUES (467, 56, 38, 18, 0.25);
INSERT INTO order_details VALUES (467, 58, 13.25, 12, 0.25);
INSERT INTO order_details VALUES (468, 10, 31, 21, 0);
INSERT INTO order_details VALUES (468, 71, 21.5, 30, 0);
INSERT INTO order_details VALUES (469, 21, 10, 5, 0);
INSERT INTO order_details VALUES (469, 51, 53, 7, 0);
INSERT INTO order_details VALUES (469, 61, 28.5, 10, 0);
INSERT INTO order_details VALUES (470, 21, 10, 32, 0.0500000007);
INSERT INTO order_details VALUES (470, 54, 7.44999981, 15, 0);
INSERT INTO order_details VALUES (470, 69, 36, 25, 0.0500000007);
INSERT INTO order_details VALUES (471, 12, 38, 36, 0);
INSERT INTO order_details VALUES (471, 16, 17.4500008, 20, 0);
INSERT INTO order_details VALUES (471, 36, 19, 40, 0);
INSERT INTO order_details VALUES (471, 62, 49.2999992, 20, 0);
INSERT INTO order_details VALUES (472, 18, 62.5, 12, 0.25);
INSERT INTO order_details VALUES (472, 30, 25.8899994, 3, 0.25);
INSERT INTO order_details VALUES (472, 54, 7.44999981, 40, 0.25);
INSERT INTO order_details VALUES (473, 35, 18, 21, 0);
INSERT INTO order_details VALUES (473, 71, 21.5, 8, 0);
INSERT INTO order_details VALUES (474, 44, 19.4500008, 50, 0.0500000007);
INSERT INTO order_details VALUES (475, 2, 19, 3, 0);
INSERT INTO order_details VALUES (475, 31, 12.5, 50, 0);
INSERT INTO order_details VALUES (475, 68, 12.5, 45, 0);
INSERT INTO order_details VALUES (475, 75, 7.75, 42, 0);
INSERT INTO order_details VALUES (476, 26, 31.2299995, 15, 0);
INSERT INTO order_details VALUES (477, 10, 31, 16, 0);
INSERT INTO order_details VALUES (477, 61, 28.5, 5, 0);
INSERT INTO order_details VALUES (478, 41, 9.64999962, 12, 0);
INSERT INTO order_details VALUES (478, 52, 7, 4, 0);
INSERT INTO order_details VALUES (478, 55, 24, 6, 0);
INSERT INTO order_details VALUES (479, 4, 22, 25, 0);
INSERT INTO order_details VALUES (479, 11, 21, 5, 0);
INSERT INTO order_details VALUES (480, 17, 39, 20, 0.0500000007);
INSERT INTO order_details VALUES (480, 56, 38, 10, 0.0500000007);
INSERT INTO order_details VALUES (480, 59, 55, 10, 0.0500000007);
INSERT INTO order_details VALUES (481, 30, 25.8899994, 15, 0);
INSERT INTO order_details VALUES (481, 40, 18.3999996, 6, 0);
INSERT INTO order_details VALUES (481, 55, 24, 12, 0);
INSERT INTO order_details VALUES (481, 60, 34, 15, 0);
INSERT INTO order_details VALUES (482, 1, 18, 50, 0);
INSERT INTO order_details VALUES (482, 21, 10, 30, 0);
INSERT INTO order_details VALUES (482, 50, 16.25, 40, 0);
INSERT INTO order_details VALUES (483, 16, 17.4500008, 15, 0.0500000007);
INSERT INTO order_details VALUES (483, 31, 12.5, 3, 0.0500000007);
INSERT INTO order_details VALUES (483, 65, 21.0499992, 10, 0.0500000007);
INSERT INTO order_details VALUES (484, 21, 10, 40, 0.0500000007);
INSERT INTO order_details VALUES (484, 51, 53, 30, 0.0500000007);
INSERT INTO order_details VALUES (485, 76, 18, 20, 0);
INSERT INTO order_details VALUES (486, 14, 23.25, 16, 0);
INSERT INTO order_details VALUES (486, 28, 45.5999985, 20, 0);
INSERT INTO order_details VALUES (486, 52, 7, 25, 0);
INSERT INTO order_details VALUES (487, 6, 25, 30, 0);
INSERT INTO order_details VALUES (487, 30, 25.8899994, 15, 0);
INSERT INTO order_details VALUES (487, 76, 18, 20, 0);
INSERT INTO order_details VALUES (488, 61, 28.5, 20, 0.100000001);
INSERT INTO order_details VALUES (488, 77, 13, 2, 0.100000001);
INSERT INTO order_details VALUES (489, 65, 21.0499992, 40, 0);
INSERT INTO order_details VALUES (489, 75, 7.75, 20, 0);
INSERT INTO order_details VALUES (490, 13, 6, 4, 0);
INSERT INTO order_details VALUES (490, 41, 9.64999962, 12, 0);
INSERT INTO order_details VALUES (491, 16, 17.4500008, 3, 0);
INSERT INTO order_details VALUES (492, 36, 19, 6, 0);
INSERT INTO order_details VALUES (492, 52, 7, 18, 0);
INSERT INTO order_details VALUES (493, 28, 45.5999985, 5, 0.200000003);
INSERT INTO order_details VALUES (493, 35, 18, 35, 0.200000003);
INSERT INTO order_details VALUES (493, 45, 9.5, 40, 0.200000003);
INSERT INTO order_details VALUES (493, 56, 38, 14, 0.200000003);
INSERT INTO order_details VALUES (494, 2, 19, 15, 0.200000003);
INSERT INTO order_details VALUES (495, 3, 10, 20, 0);
INSERT INTO order_details VALUES (495, 60, 34, 50, 0);
INSERT INTO order_details VALUES (495, 72, 34.7999992, 35, 0);
INSERT INTO order_details VALUES (496, 46, 12, 28, 0.0500000007);
INSERT INTO order_details VALUES (497, 40, 18.3999996, 50, 0.200000003);
INSERT INTO order_details VALUES (498, 18, 62.5, 24, 0);
INSERT INTO order_details VALUES (498, 44, 19.4500008, 16, 0);
INSERT INTO order_details VALUES (498, 59, 55, 45, 0);
INSERT INTO order_details VALUES (498, 72, 34.7999992, 7, 0);
INSERT INTO order_details VALUES (499, 13, 6, 6, 0);
INSERT INTO order_details VALUES (499, 42, 14, 28, 0);
INSERT INTO order_details VALUES (499, 62, 49.2999992, 9, 0);
INSERT INTO order_details VALUES (499, 69, 36, 40, 0);
INSERT INTO order_details VALUES (500, 31, 12.5, 8, 0);
INSERT INTO order_details VALUES (500, 41, 9.64999962, 35, 0);
INSERT INTO order_details VALUES (500, 63, 43.9000015, 9, 0);
INSERT INTO order_details VALUES (500, 69, 36, 30, 0);
INSERT INTO order_details VALUES (501, 23, 9, 44, 0);
INSERT INTO order_details VALUES (501, 40, 18.3999996, 40, 0);
INSERT INTO order_details VALUES (501, 56, 38, 28, 0);
INSERT INTO order_details VALUES (502, 56, 38, 15, 0);
INSERT INTO order_details VALUES (502, 59, 55, 6, 0);
INSERT INTO order_details VALUES (502, 76, 18, 10, 0);
INSERT INTO order_details VALUES (503, 14, 23.25, 5, 0.150000006);
INSERT INTO order_details VALUES (503, 45, 9.5, 40, 0.150000006);
INSERT INTO order_details VALUES (503, 59, 55, 25, 0.150000006);
INSERT INTO order_details VALUES (504, 26, 31.2299995, 12, 0.100000001);
INSERT INTO order_details VALUES (504, 30, 25.8899994, 30, 0);
INSERT INTO order_details VALUES (504, 50, 16.25, 20, 0.100000001);
INSERT INTO order_details VALUES (504, 73, 15, 15, 0);
INSERT INTO order_details VALUES (505, 1, 18, 8, 0);
INSERT INTO order_details VALUES (505, 69, 36, 3, 0);
INSERT INTO order_details VALUES (506, 45, 9.5, 4, 0);
INSERT INTO order_details VALUES (506, 74, 10, 5, 0);
INSERT INTO order_details VALUES (507, 40, 18.3999996, 3, 0);
INSERT INTO order_details VALUES (508, 47, 9.5, 30, 0.25);
INSERT INTO order_details VALUES (508, 56, 38, 30, 0.25);
INSERT INTO order_details VALUES (508, 57, 19.5, 14, 0.25);
INSERT INTO order_details VALUES (508, 69, 36, 25, 0.25);
INSERT INTO order_details VALUES (509, 18, 62.5, 21, 0.200000003);
INSERT INTO order_details VALUES (509, 36, 19, 20, 0.200000003);
INSERT INTO order_details VALUES (509, 68, 12.5, 6, 0.200000003);
INSERT INTO order_details VALUES (509, 69, 36, 20, 0.200000003);
INSERT INTO order_details VALUES (510, 34, 14, 30, 0);
INSERT INTO order_details VALUES (510, 59, 55, 7, 0);
INSERT INTO order_details VALUES (510, 62, 49.2999992, 30, 0);
INSERT INTO order_details VALUES (510, 64, 33.25, 24, 0);
INSERT INTO order_details VALUES (511, 26, 31.2299995, 20, 0);
INSERT INTO order_details VALUES (511, 52, 7, 60, 0);
INSERT INTO order_details VALUES (511, 70, 15, 40, 0);
INSERT INTO order_details VALUES (512, 32, 32, 10, 0);
INSERT INTO order_details VALUES (513, 25, 14, 12, 0.25);
INSERT INTO order_details VALUES (513, 27, 43.9000015, 40, 0);
INSERT INTO order_details VALUES (513, 43, 46, 30, 0.25);
INSERT INTO order_details VALUES (514, 25, 14, 35, 0.25);
INSERT INTO order_details VALUES (514, 75, 7.75, 18, 0);
INSERT INTO order_details VALUES (515, 39, 18, 16, 0);
INSERT INTO order_details VALUES (515, 47, 9.5, 30, 0);
INSERT INTO order_details VALUES (515, 51, 53, 28, 0);
INSERT INTO order_details VALUES (515, 56, 38, 60, 0);
INSERT INTO order_details VALUES (516, 21, 10, 40, 0);
INSERT INTO order_details VALUES (516, 22, 21, 6, 0);
INSERT INTO order_details VALUES (516, 24, 4.5, 20, 0);
INSERT INTO order_details VALUES (517, 3, 10, 20, 0.100000001);
INSERT INTO order_details VALUES (517, 39, 18, 130, 0.100000001);
INSERT INTO order_details VALUES (518, 65, 21.0499992, 80, 0.100000001);
INSERT INTO order_details VALUES (519, 2, 19, 40, 0);
INSERT INTO order_details VALUES (519, 7, 30, 35, 0);
INSERT INTO order_details VALUES (519, 68, 12.5, 40, 0);
INSERT INTO order_details VALUES (520, 42, 14, 2, 0);
INSERT INTO order_details VALUES (521, 22, 21, 4, 0);
INSERT INTO order_details VALUES (521, 31, 12.5, 50, 0);
INSERT INTO order_details VALUES (521, 60, 34, 15, 0);
INSERT INTO order_details VALUES (521, 71, 21.5, 12, 0);
INSERT INTO order_details VALUES (522, 41, 9.64999962, 30, 0.0500000007);
INSERT INTO order_details VALUES (522, 52, 7, 15, 0.0500000007);
INSERT INTO order_details VALUES (522, 61, 28.5, 20, 0);
INSERT INTO order_details VALUES (522, 62, 49.2999992, 15, 0);
INSERT INTO order_details VALUES (523, 11, 21, 15, 0.25);
INSERT INTO order_details VALUES (524, 71, 21.5, 16, 0);
INSERT INTO order_details VALUES (525, 29, 123.790001, 18, 0);
INSERT INTO order_details VALUES (525, 59, 55, 25, 0);
INSERT INTO order_details VALUES (526, 17, 39, 33, 0);
INSERT INTO order_details VALUES (526, 31, 12.5, 70, 0.200000003);
INSERT INTO order_details VALUES (526, 75, 7.75, 7, 0.200000003);
INSERT INTO order_details VALUES (527, 31, 12.5, 2, 0.25);
INSERT INTO order_details VALUES (527, 66, 17, 50, 0);
INSERT INTO order_details VALUES (528, 10, 31, 6, 0);
INSERT INTO order_details VALUES (528, 67, 14, 3, 0);
INSERT INTO order_details VALUES (529, 31, 12.5, 16, 0.0500000007);
INSERT INTO order_details VALUES (529, 42, 14, 12, 0.0500000007);
INSERT INTO order_details VALUES (529, 45, 9.5, 27, 0.0500000007);
INSERT INTO order_details VALUES (529, 51, 53, 120, 0.0500000007);
INSERT INTO order_details VALUES (530, 42, 14, 20, 0.200000003);
INSERT INTO order_details VALUES (531, 41, 9.64999962, 10, 0);
INSERT INTO order_details VALUES (532, 16, 17.4500008, 20, 0);
INSERT INTO order_details VALUES (532, 62, 49.2999992, 20, 0);
INSERT INTO order_details VALUES (533, 70, 15, 35, 0);
INSERT INTO order_details VALUES (533, 77, 13, 15, 0);
INSERT INTO order_details VALUES (534, 54, 7.44999981, 3, 0.200000003);
INSERT INTO order_details VALUES (534, 56, 38, 20, 0.200000003);
INSERT INTO order_details VALUES (534, 74, 10, 35, 0);
INSERT INTO order_details VALUES (535, 31, 12.5, 1, 0);
INSERT INTO order_details VALUES (536, 31, 12.5, 10, 0);
INSERT INTO order_details VALUES (536, 38, 263.5, 5, 0);
INSERT INTO order_details VALUES (537, 36, 19, 30, 0);
INSERT INTO order_details VALUES (537, 39, 18, 2, 0.150000006);
INSERT INTO order_details VALUES (537, 72, 34.7999992, 30, 0.150000006);
INSERT INTO order_details VALUES (538, 10, 31, 10, 0);
INSERT INTO order_details VALUES (538, 75, 7.75, 10, 0);
INSERT INTO order_details VALUES (539, 8, 40, 30, 0.200000003);
INSERT INTO order_details VALUES (539, 30, 25.8899994, 15, 0.200000003);
INSERT INTO order_details VALUES (539, 75, 7.75, 42, 0.200000003);
INSERT INTO order_details VALUES (540, 2, 19, 15, 0.0500000007);
INSERT INTO order_details VALUES (540, 29, 123.790001, 20, 0.0500000007);
INSERT INTO order_details VALUES (541, 19, 9.19999981, 50, 0.0500000007);
INSERT INTO order_details VALUES (541, 75, 7.75, 40, 0.0500000007);
INSERT INTO order_details VALUES (542, 18, 62.5, 30, 0);
INSERT INTO order_details VALUES (542, 35, 18, 15, 0);
INSERT INTO order_details VALUES (542, 63, 43.9000015, 30, 0);
INSERT INTO order_details VALUES (542, 68, 12.5, 18, 0);
INSERT INTO order_details VALUES (543, 7, 30, 3, 0.150000006);
INSERT INTO order_details VALUES (543, 56, 38, 20, 0.150000006);
INSERT INTO order_details VALUES (544, 29, 123.790001, 14, 0.0500000007);
INSERT INTO order_details VALUES (544, 41, 9.64999962, 20, 0.0500000007);
INSERT INTO order_details VALUES (545, 2, 19, 10, 0);
INSERT INTO order_details VALUES (545, 54, 7.44999981, 3, 0);
INSERT INTO order_details VALUES (545, 68, 12.5, 15, 0);
INSERT INTO order_details VALUES (546, 41, 9.64999962, 14, 0);
INSERT INTO order_details VALUES (546, 52, 7, 8, 0);
INSERT INTO order_details VALUES (547, 14, 23.25, 15, 0.200000003);
INSERT INTO order_details VALUES (547, 54, 7.44999981, 6, 0.200000003);
INSERT INTO order_details VALUES (548, 16, 17.4500008, 65, 0);
INSERT INTO order_details VALUES (548, 17, 39, 35, 0.25);
INSERT INTO order_details VALUES (549, 26, 31.2299995, 21, 0.200000003);
INSERT INTO order_details VALUES (549, 44, 19.4500008, 10, 0);
INSERT INTO order_details VALUES (549, 64, 33.25, 35, 0.200000003);
INSERT INTO order_details VALUES (549, 69, 36, 24, 0.200000003);
INSERT INTO order_details VALUES (550, 11, 21, 20, 0);
INSERT INTO order_details VALUES (551, 62, 49.2999992, 2, 0);
INSERT INTO order_details VALUES (551, 72, 34.7999992, 10, 0);
INSERT INTO order_details VALUES (552, 13, 6, 20, 0.150000006);
INSERT INTO order_details VALUES (552, 24, 4.5, 20, 0.150000006);
INSERT INTO order_details VALUES (552, 59, 55, 25, 0);
INSERT INTO order_details VALUES (553, 11, 21, 50, 0.100000001);
INSERT INTO order_details VALUES (553, 51, 53, 10, 0.100000001);
INSERT INTO order_details VALUES (553, 54, 7.44999981, 7, 0.100000001);
INSERT INTO order_details VALUES (554, 17, 39, 40, 0.25);
INSERT INTO order_details VALUES (554, 29, 123.790001, 20, 0.25);
INSERT INTO order_details VALUES (555, 30, 25.8899994, 25, 0.25);
INSERT INTO order_details VALUES (555, 51, 53, 30, 0.25);
INSERT INTO order_details VALUES (555, 55, 24, 60, 0.25);
INSERT INTO order_details VALUES (555, 62, 49.2999992, 5, 0.25);
INSERT INTO order_details VALUES (556, 19, 9.19999981, 24, 0.0500000007);
INSERT INTO order_details VALUES (556, 25, 14, 15, 0.0500000007);
INSERT INTO order_details VALUES (556, 59, 55, 15, 0.0500000007);
INSERT INTO order_details VALUES (557, 10, 31, 36, 0);
INSERT INTO order_details VALUES (557, 28, 45.5999985, 24, 0);
INSERT INTO order_details VALUES (557, 49, 20, 4, 0.150000006);
INSERT INTO order_details VALUES (558, 34, 14, 10, 0);
INSERT INTO order_details VALUES (558, 38, 263.5, 10, 0);
INSERT INTO order_details VALUES (559, 2, 19, 20, 0.25);
INSERT INTO order_details VALUES (559, 65, 21.0499992, 2, 0);
INSERT INTO order_details VALUES (559, 74, 10, 15, 0.25);
INSERT INTO order_details VALUES (560, 40, 18.3999996, 1, 0);
INSERT INTO order_details VALUES (561, 56, 38, 20, 0.150000006);
INSERT INTO order_details VALUES (561, 76, 18, 50, 0.150000006);
INSERT INTO order_details VALUES (562, 52, 7, 20, 0);
INSERT INTO order_details VALUES (563, 13, 6, 7, 0);
INSERT INTO order_details VALUES (563, 25, 14, 5, 0);
INSERT INTO order_details VALUES (563, 70, 15, 5, 0);
INSERT INTO order_details VALUES (564, 19, 9.19999981, 15, 0);
INSERT INTO order_details VALUES (564, 23, 9, 18, 0);
INSERT INTO order_details VALUES (564, 40, 18.3999996, 30, 0);
INSERT INTO order_details VALUES (565, 31, 12.5, 16, 0.100000001);
INSERT INTO order_details VALUES (565, 72, 34.7999992, 40, 0.100000001);
INSERT INTO order_details VALUES (565, 77, 13, 20, 0);
INSERT INTO order_details VALUES (566, 2, 19, 12, 0.200000003);
INSERT INTO order_details VALUES (566, 46, 12, 35, 0);
INSERT INTO order_details VALUES (567, 41, 9.64999962, 20, 0);
INSERT INTO order_details VALUES (567, 43, 46, 20, 0.150000006);
INSERT INTO order_details VALUES (567, 48, 12.75, 8, 0.150000006);
INSERT INTO order_details VALUES (567, 61, 28.5, 30, 0.150000006);
INSERT INTO order_details VALUES (568, 33, 2.5, 16, 0);
INSERT INTO order_details VALUES (569, 38, 263.5, 30, 0.0500000007);
INSERT INTO order_details VALUES (569, 62, 49.2999992, 20, 0.0500000007);
INSERT INTO order_details VALUES (570, 26, 31.2299995, 40, 0.150000006);
INSERT INTO order_details VALUES (570, 38, 263.5, 30, 0);
INSERT INTO order_details VALUES (570, 40, 18.3999996, 60, 0.150000006);
INSERT INTO order_details VALUES (570, 62, 49.2999992, 25, 0.150000006);
INSERT INTO order_details VALUES (571, 32, 32, 20, 0);
INSERT INTO order_details VALUES (571, 41, 9.64999962, 20, 0);
INSERT INTO order_details VALUES (572, 43, 46, 7, 0);
INSERT INTO order_details VALUES (572, 75, 7.75, 20, 0);
INSERT INTO order_details VALUES (573, 56, 38, 30, 0);
INSERT INTO order_details VALUES (574, 35, 18, 20, 0);
INSERT INTO order_details VALUES (574, 51, 53, 6, 0);
INSERT INTO order_details VALUES (575, 62, 49.2999992, 3, 0);
INSERT INTO order_details VALUES (575, 70, 15, 6, 0);
INSERT INTO order_details VALUES (576, 11, 21, 20, 0.100000001);
INSERT INTO order_details VALUES (576, 57, 19.5, 15, 0);
INSERT INTO order_details VALUES (576, 59, 55, 40, 0.100000001);
INSERT INTO order_details VALUES (576, 77, 13, 15, 0.100000001);
INSERT INTO order_details VALUES (577, 41, 9.64999962, 12, 0);
INSERT INTO order_details VALUES (577, 70, 15, 9, 0);
INSERT INTO order_details VALUES (578, 26, 31.2299995, 12, 0);
INSERT INTO order_details VALUES (578, 53, 32.7999992, 20, 0);
INSERT INTO order_details VALUES (579, 31, 12.5, 35, 0);
INSERT INTO order_details VALUES (579, 57, 19.5, 15, 0);
INSERT INTO order_details VALUES (580, 10, 31, 15, 0);
INSERT INTO order_details VALUES (580, 39, 18, 21, 0);
INSERT INTO order_details VALUES (581, 20, 81, 5, 0);
INSERT INTO order_details VALUES (581, 38, 263.5, 2, 0);
INSERT INTO order_details VALUES (582, 2, 19, 10, 0);
INSERT INTO order_details VALUES (582, 8, 40, 20, 0);
INSERT INTO order_details VALUES (582, 13, 6, 10, 0);
INSERT INTO order_details VALUES (582, 60, 34, 21, 0);
INSERT INTO order_details VALUES (583, 6, 25, 6, 0);
INSERT INTO order_details VALUES (583, 39, 18, 28, 0);
INSERT INTO order_details VALUES (583, 60, 34, 30, 0);
INSERT INTO order_details VALUES (583, 68, 12.5, 24, 0);
INSERT INTO order_details VALUES (584, 19, 9.19999981, 2, 0);
INSERT INTO order_details VALUES (584, 35, 18, 8, 0);
INSERT INTO order_details VALUES (584, 38, 263.5, 8, 0);
INSERT INTO order_details VALUES (584, 43, 46, 9, 0);
INSERT INTO order_details VALUES (585, 13, 6, 3, 0.200000003);
INSERT INTO order_details VALUES (585, 25, 14, 10, 0.200000003);
INSERT INTO order_details VALUES (585, 44, 19.4500008, 16, 0.200000003);
INSERT INTO order_details VALUES (585, 64, 33.25, 3, 0);
INSERT INTO order_details VALUES (586, 7, 30, 20, 0.100000001);
INSERT INTO order_details VALUES (586, 31, 12.5, 9, 0.100000001);
INSERT INTO order_details VALUES (586, 53, 32.7999992, 9, 0.100000001);
INSERT INTO order_details VALUES (587, 29, 123.790001, 8, 0.0500000007);
INSERT INTO order_details VALUES (587, 30, 25.8899994, 20, 0.0500000007);
INSERT INTO order_details VALUES (588, 59, 55, 15, 0);
INSERT INTO order_details VALUES (588, 77, 13, 2, 0.200000003);
INSERT INTO order_details VALUES (589, 22, 21, 52, 0);
INSERT INTO order_details VALUES (589, 35, 18, 6, 0);
INSERT INTO order_details VALUES (589, 57, 19.5, 24, 0);
INSERT INTO order_details VALUES (589, 60, 34, 60, 0);
INSERT INTO order_details VALUES (589, 64, 33.25, 30, 0);
INSERT INTO order_details VALUES (590, 13, 6, 6, 0);
INSERT INTO order_details VALUES (590, 40, 18.3999996, 25, 0);
INSERT INTO order_details VALUES (590, 47, 9.5, 40, 0.25);
INSERT INTO order_details VALUES (590, 76, 18, 21, 0.25);
INSERT INTO order_details VALUES (591, 1, 18, 4, 0.25);
INSERT INTO order_details VALUES (591, 18, 62.5, 25, 0.25);
INSERT INTO order_details VALUES (591, 36, 19, 50, 0.25);
INSERT INTO order_details VALUES (592, 58, 13.25, 30, 0.100000001);
INSERT INTO order_details VALUES (592, 72, 34.7999992, 15, 0.100000001);
INSERT INTO order_details VALUES (593, 25, 14, 6, 0.200000003);
INSERT INTO order_details VALUES (593, 39, 18, 10, 0.200000003);
INSERT INTO order_details VALUES (594, 10, 31, 16, 0);
INSERT INTO order_details VALUES (594, 56, 38, 30, 0);
INSERT INTO order_details VALUES (594, 59, 55, 50, 0);
INSERT INTO order_details VALUES (594, 77, 13, 15, 0);
INSERT INTO order_details VALUES (595, 11, 21, 15, 0);
INSERT INTO order_details VALUES (595, 43, 46, 5, 0);
INSERT INTO order_details VALUES (595, 68, 12.5, 20, 0);
INSERT INTO order_details VALUES (595, 70, 15, 12, 0);
INSERT INTO order_details VALUES (596, 51, 53, 4, 0.25);
INSERT INTO order_details VALUES (597, 22, 21, 35, 0);
INSERT INTO order_details VALUES (598, 23, 9, 70, 0.100000001);
INSERT INTO order_details VALUES (598, 35, 18, 25, 0.100000001);
INSERT INTO order_details VALUES (598, 42, 14, 42, 0.100000001);
INSERT INTO order_details VALUES (598, 58, 13.25, 60, 0.100000001);
INSERT INTO order_details VALUES (598, 64, 33.25, 48, 0);
INSERT INTO order_details VALUES (599, 4, 22, 21, 0);
INSERT INTO order_details VALUES (599, 70, 15, 30, 0);
INSERT INTO order_details VALUES (599, 74, 10, 20, 0);
INSERT INTO order_details VALUES (600, 1, 18, 80, 0.200000003);
INSERT INTO order_details VALUES (600, 19, 9.19999981, 12, 0.200000003);
INSERT INTO order_details VALUES (600, 37, 26, 60, 0.200000003);
INSERT INTO order_details VALUES (600, 45, 9.5, 36, 0.200000003);
INSERT INTO order_details VALUES (600, 60, 34, 45, 0.200000003);
INSERT INTO order_details VALUES (600, 71, 21.5, 55, 0.200000003);
INSERT INTO order_details VALUES (601, 5, 21.3500004, 30, 0);
INSERT INTO order_details VALUES (601, 9, 97, 3, 0);
INSERT INTO order_details VALUES (602, 3, 10, 49, 0);
INSERT INTO order_details VALUES (602, 26, 31.2299995, 18, 0.150000006);
INSERT INTO order_details VALUES (603, 25, 14, 20, 0.150000006);
INSERT INTO order_details VALUES (603, 33, 2.5, 4, 0.150000006);
INSERT INTO order_details VALUES (603, 70, 15, 30, 0.150000006);
INSERT INTO order_details VALUES (604, 2, 19, 5, 0.0500000007);
INSERT INTO order_details VALUES (604, 25, 14, 10, 0.0500000007);
INSERT INTO order_details VALUES (604, 57, 19.5, 10, 0.0500000007);
INSERT INTO order_details VALUES (604, 59, 55, 42, 0.0500000007);
INSERT INTO order_details VALUES (605, 2, 19, 15, 0);
INSERT INTO order_details VALUES (605, 17, 39, 6, 0);
INSERT INTO order_details VALUES (605, 62, 49.2999992, 50, 0);
INSERT INTO order_details VALUES (606, 18, 62.5, 10, 0);
INSERT INTO order_details VALUES (607, 10, 31, 100, 0.150000006);
INSERT INTO order_details VALUES (607, 13, 6, 65, 0.150000006);
INSERT INTO order_details VALUES (608, 16, 17.4500008, 50, 0);
INSERT INTO order_details VALUES (608, 31, 12.5, 14, 0);
INSERT INTO order_details VALUES (608, 56, 38, 24, 0);
INSERT INTO order_details VALUES (608, 65, 21.0499992, 15, 0.150000006);
INSERT INTO order_details VALUES (609, 2, 19, 20, 0);
INSERT INTO order_details VALUES (609, 42, 14, 20, 0);
INSERT INTO order_details VALUES (610, 3, 10, 30, 0);
INSERT INTO order_details VALUES (610, 26, 31.2299995, 35, 0.25);
INSERT INTO order_details VALUES (610, 29, 123.790001, 10, 0.25);
INSERT INTO order_details VALUES (611, 7, 30, 5, 0);
INSERT INTO order_details VALUES (611, 27, 43.9000015, 10, 0);
INSERT INTO order_details VALUES (611, 70, 15, 4, 0);
INSERT INTO order_details VALUES (612, 24, 4.5, 40, 0.25);
INSERT INTO order_details VALUES (612, 54, 7.44999981, 35, 0.25);
INSERT INTO order_details VALUES (612, 64, 33.25, 30, 0.25);
INSERT INTO order_details VALUES (613, 51, 53, 3, 0);
INSERT INTO order_details VALUES (613, 76, 18, 20, 0);
INSERT INTO order_details VALUES (614, 17, 39, 42, 0);
INSERT INTO order_details VALUES (614, 18, 62.5, 20, 0);
INSERT INTO order_details VALUES (614, 21, 10, 40, 0);
INSERT INTO order_details VALUES (614, 33, 2.5, 35, 0);
INSERT INTO order_details VALUES (614, 62, 49.2999992, 3, 0);
INSERT INTO order_details VALUES (615, 11, 21, 25, 0);
INSERT INTO order_details VALUES (615, 52, 7, 8, 0);
INSERT INTO order_details VALUES (616, 1, 18, 20, 0.150000006);
INSERT INTO order_details VALUES (616, 58, 13.25, 12, 0.150000006);
INSERT INTO order_details VALUES (617, 35, 18, 4, 0);
INSERT INTO order_details VALUES (617, 67, 14, 15, 0);
INSERT INTO order_details VALUES (618, 38, 263.5, 60, 0.0500000007);
INSERT INTO order_details VALUES (618, 39, 18, 80, 0.0500000007);
INSERT INTO order_details VALUES (619, 2, 19, 21, 0.25);
INSERT INTO order_details VALUES (619, 24, 4.5, 6, 0.25);
INSERT INTO order_details VALUES (619, 30, 25.8899994, 40, 0.25);
INSERT INTO order_details VALUES (620, 53, 32.7999992, 3, 0);
INSERT INTO order_details VALUES (621, 26, 31.2299995, 20, 0);
INSERT INTO order_details VALUES (621, 35, 18, 30, 0);
INSERT INTO order_details VALUES (621, 49, 20, 42, 0.100000001);
INSERT INTO order_details VALUES (622, 1, 18, 40, 0);
INSERT INTO order_details VALUES (622, 11, 21, 10, 0);
INSERT INTO order_details VALUES (622, 23, 9, 50, 0);
INSERT INTO order_details VALUES (622, 68, 12.5, 20, 0);
INSERT INTO order_details VALUES (623, 35, 18, 3, 0);
INSERT INTO order_details VALUES (623, 51, 53, 2, 0);
INSERT INTO order_details VALUES (624, 6, 25, 50, 0.0500000007);
INSERT INTO order_details VALUES (624, 16, 17.4500008, 12, 0.0500000007);
INSERT INTO order_details VALUES (624, 17, 39, 16, 0.0500000007);
INSERT INTO order_details VALUES (625, 55, 24, 10, 0.0500000007);
INSERT INTO order_details VALUES (625, 62, 49.2999992, 20, 0.0500000007);
INSERT INTO order_details VALUES (625, 64, 33.25, 15, 0.0500000007);
INSERT INTO order_details VALUES (625, 65, 21.0499992, 21, 0.0500000007);
INSERT INTO order_details VALUES (626, 21, 10, 20, 0);
INSERT INTO order_details VALUES (626, 28, 45.5999985, 3, 0);
INSERT INTO order_details VALUES (627, 10, 31, 10, 0);
INSERT INTO order_details VALUES (628, 19, 9.19999981, 25, 0);
INSERT INTO order_details VALUES (628, 47, 9.5, 21, 0.100000001);
INSERT INTO order_details VALUES (628, 49, 20, 15, 0);
INSERT INTO order_details VALUES (629, 46, 12, 21, 0);
INSERT INTO order_details VALUES (629, 64, 33.25, 20, 0);
INSERT INTO order_details VALUES (630, 16, 17.4500008, 30, 0.25);
INSERT INTO order_details VALUES (630, 18, 62.5, 25, 0);
INSERT INTO order_details VALUES (631, 20, 81, 20, 0.0500000007);
INSERT INTO order_details VALUES (632, 40, 18.3999996, 12, 0);
INSERT INTO order_details VALUES (632, 65, 21.0499992, 10, 0);
INSERT INTO order_details VALUES (632, 76, 18, 10, 0);
INSERT INTO order_details VALUES (633, 23, 9, 30, 0.200000003);
INSERT INTO order_details VALUES (633, 61, 28.5, 30, 0.200000003);
INSERT INTO order_details VALUES (633, 70, 15, 50, 0.200000003);
INSERT INTO order_details VALUES (634, 73, 15, 10, 0);
INSERT INTO order_details VALUES (635, 42, 14, 25, 0);
INSERT INTO order_details VALUES (635, 49, 20, 20, 0.150000006);
INSERT INTO order_details VALUES (635, 54, 7.44999981, 32, 0.150000006);
INSERT INTO order_details VALUES (636, 24, 4.5, 8, 0);
INSERT INTO order_details VALUES (637, 21, 10, 40, 0.0500000007);
INSERT INTO order_details VALUES (637, 56, 38, 21, 0.0500000007);
INSERT INTO order_details VALUES (637, 65, 21.0499992, 12, 0.0500000007);
INSERT INTO order_details VALUES (638, 2, 19, 20, 0);
INSERT INTO order_details VALUES (638, 24, 4.5, 12, 0);
INSERT INTO order_details VALUES (638, 70, 15, 30, 0);
INSERT INTO order_details VALUES (638, 77, 13, 25, 0);
INSERT INTO order_details VALUES (639, 10, 31, 70, 0);
INSERT INTO order_details VALUES (639, 31, 12.5, 35, 0);
INSERT INTO order_details VALUES (639, 77, 13, 40, 0);
INSERT INTO order_details VALUES (640, 25, 14, 5, 0);
INSERT INTO order_details VALUES (641, 2, 19, 20, 0);
INSERT INTO order_details VALUES (641, 68, 12.5, 18, 0);
INSERT INTO order_details VALUES (642, 11, 21, 40, 0);
INSERT INTO order_details VALUES (642, 38, 263.5, 40, 0);
INSERT INTO order_details VALUES (643, 17, 39, 15, 0);
INSERT INTO order_details VALUES (643, 34, 14, 10, 0);
INSERT INTO order_details VALUES (643, 41, 9.64999962, 14, 0);
INSERT INTO order_details VALUES (644, 30, 25.8899994, 15, 0.0500000007);
INSERT INTO order_details VALUES (645, 59, 55, 40, 0.0500000007);
INSERT INTO order_details VALUES (646, 8, 40, 30, 0);
INSERT INTO order_details VALUES (646, 24, 4.5, 10, 0);
INSERT INTO order_details VALUES (646, 29, 123.790001, 24, 0);
INSERT INTO order_details VALUES (646, 30, 25.8899994, 35, 0);
INSERT INTO order_details VALUES (646, 36, 19, 20, 0);
INSERT INTO order_details VALUES (647, 13, 6, 28, 0.0500000007);
INSERT INTO order_details VALUES (647, 69, 36, 50, 0.0500000007);
INSERT INTO order_details VALUES (647, 75, 7.75, 120, 0.0500000007);
INSERT INTO order_details VALUES (648, 24, 4.5, 110, 0);
INSERT INTO order_details VALUES (648, 39, 18, 45, 0);
INSERT INTO order_details VALUES (648, 40, 18.3999996, 91, 0);
INSERT INTO order_details VALUES (648, 60, 34, 100, 0);
INSERT INTO order_details VALUES (649, 45, 9.5, 15, 0);
INSERT INTO order_details VALUES (649, 56, 38, 16, 0);
INSERT INTO order_details VALUES (650, 29, 123.790001, 80, 0);
INSERT INTO order_details VALUES (650, 30, 25.8899994, 36, 0);
INSERT INTO order_details VALUES (651, 13, 6, 5, 0);
INSERT INTO order_details VALUES (652, 39, 18, 8, 0.150000006);
INSERT INTO order_details VALUES (653, 70, 15, 3, 0.25);
INSERT INTO order_details VALUES (654, 41, 9.64999962, 30, 0);
INSERT INTO order_details VALUES (654, 71, 21.5, 30, 0);
INSERT INTO order_details VALUES (655, 55, 24, 30, 0.150000006);
INSERT INTO order_details VALUES (655, 62, 49.2999992, 6, 0.150000006);
INSERT INTO order_details VALUES (656, 13, 6, 40, 0);
INSERT INTO order_details VALUES (656, 65, 21.0499992, 21, 0);
INSERT INTO order_details VALUES (656, 68, 12.5, 20, 0);
INSERT INTO order_details VALUES (657, 58, 13.25, 15, 0);
INSERT INTO order_details VALUES (657, 62, 49.2999992, 35, 0);
INSERT INTO order_details VALUES (658, 1, 18, 20, 0.0500000007);
INSERT INTO order_details VALUES (659, 61, 28.5, 15, 0);
INSERT INTO order_details VALUES (660, 75, 7.75, 14, 0);
INSERT INTO order_details VALUES (661, 7, 30, 20, 0.0500000007);
INSERT INTO order_details VALUES (661, 52, 7, 14, 0.0500000007);
INSERT INTO order_details VALUES (662, 7, 30, 12, 0);
INSERT INTO order_details VALUES (662, 16, 17.4500008, 15, 0);
INSERT INTO order_details VALUES (662, 41, 9.64999962, 5, 0);
INSERT INTO order_details VALUES (663, 19, 9.19999981, 12, 0);
INSERT INTO order_details VALUES (663, 49, 20, 10, 0);
INSERT INTO order_details VALUES (663, 61, 28.5, 5, 0);
INSERT INTO order_details VALUES (664, 1, 18, 10, 0);
INSERT INTO order_details VALUES (664, 17, 39, 12, 0);
INSERT INTO order_details VALUES (664, 67, 14, 15, 0);
INSERT INTO order_details VALUES (665, 11, 21, 40, 0.25);
INSERT INTO order_details VALUES (665, 29, 123.790001, 60, 0.25);
INSERT INTO order_details VALUES (666, 4, 22, 30, 0.25);
INSERT INTO order_details VALUES (666, 33, 2.5, 40, 0.25);
INSERT INTO order_details VALUES (666, 58, 13.25, 15, 0);
INSERT INTO order_details VALUES (667, 71, 21.5, 25, 0);
INSERT INTO order_details VALUES (668, 17, 39, 10, 0);
INSERT INTO order_details VALUES (668, 33, 2.5, 30, 0);
INSERT INTO order_details VALUES (668, 54, 7.44999981, 10, 0);
INSERT INTO order_details VALUES (669, 16, 17.4500008, 6, 0);
INSERT INTO order_details VALUES (669, 32, 32, 6, 0);
INSERT INTO order_details VALUES (669, 57, 19.5, 20, 0);
INSERT INTO order_details VALUES (670, 30, 25.8899994, 1, 0);
INSERT INTO order_details VALUES (670, 60, 34, 10, 0);
INSERT INTO order_details VALUES (671, 1, 18, 60, 0.25);
INSERT INTO order_details VALUES (671, 60, 34, 25, 0.25);
INSERT INTO order_details VALUES (672, 16, 17.4500008, 24, 0);
INSERT INTO order_details VALUES (672, 25, 14, 24, 0);
INSERT INTO order_details VALUES (672, 40, 18.3999996, 20, 0);
INSERT INTO order_details VALUES (673, 50, 16.25, 24, 0);
INSERT INTO order_details VALUES (674, 35, 18, 10, 0);
INSERT INTO order_details VALUES (674, 63, 43.9000015, 40, 0);
INSERT INTO order_details VALUES (675, 17, 39, 15, 0);
INSERT INTO order_details VALUES (675, 24, 4.5, 35, 0);
INSERT INTO order_details VALUES (676, 42, 14, 10, 0.200000003);
INSERT INTO order_details VALUES (676, 43, 46, 10, 0.200000003);
INSERT INTO order_details VALUES (676, 67, 14, 24, 0.200000003);
INSERT INTO order_details VALUES (677, 10, 31, 20, 0.100000001);
INSERT INTO order_details VALUES (677, 28, 45.5999985, 30, 0.100000001);
INSERT INTO order_details VALUES (677, 75, 7.75, 6, 0);
INSERT INTO order_details VALUES (678, 36, 19, 25, 0.150000006);
INSERT INTO order_details VALUES (678, 52, 7, 12, 0.150000006);
INSERT INTO order_details VALUES (679, 11, 21, 2, 0);
INSERT INTO order_details VALUES (679, 13, 6, 10, 0);
INSERT INTO order_details VALUES (679, 19, 9.19999981, 7, 0);
INSERT INTO order_details VALUES (679, 72, 34.7999992, 10, 0);
INSERT INTO order_details VALUES (680, 20, 81, 5, 0);
INSERT INTO order_details VALUES (680, 52, 7, 5, 0);
INSERT INTO order_details VALUES (680, 76, 18, 20, 0);
INSERT INTO order_details VALUES (681, 47, 9.5, 5, 0);
INSERT INTO order_details VALUES (681, 76, 18, 5, 0);
INSERT INTO order_details VALUES (682, 21, 10, 60, 0);
INSERT INTO order_details VALUES (682, 75, 7.75, 49, 0);
INSERT INTO order_details VALUES (682, 77, 13, 15, 0);
INSERT INTO order_details VALUES (683, 21, 10, 36, 0);
INSERT INTO order_details VALUES (683, 27, 43.9000015, 25, 0);
INSERT INTO order_details VALUES (683, 55, 24, 25, 0.200000003);
INSERT INTO order_details VALUES (683, 58, 13.25, 30, 0.200000003);
INSERT INTO order_details VALUES (684, 13, 6, 42, 0.150000006);
INSERT INTO order_details VALUES (684, 57, 19.5, 30, 0);
INSERT INTO order_details VALUES (685, 16, 17.4500008, 30, 0.100000001);
INSERT INTO order_details VALUES (685, 62, 49.2999992, 14, 0.100000001);
INSERT INTO order_details VALUES (685, 72, 34.7999992, 16, 0);
INSERT INTO order_details VALUES (685, 75, 7.75, 20, 0.100000001);
INSERT INTO order_details VALUES (686, 53, 32.7999992, 2, 0);
INSERT INTO order_details VALUES (686, 61, 28.5, 30, 0);
INSERT INTO order_details VALUES (687, 6, 25, 20, 0);
INSERT INTO order_details VALUES (688, 1, 18, 21, 0);
INSERT INTO order_details VALUES (688, 18, 62.5, 4, 0.25);
INSERT INTO order_details VALUES (688, 23, 9, 8, 0.25);
INSERT INTO order_details VALUES (689, 36, 19, 30, 0.200000003);
INSERT INTO order_details VALUES (690, 28, 45.5999985, 8, 0);
INSERT INTO order_details VALUES (690, 34, 14, 20, 0);
INSERT INTO order_details VALUES (691, 13, 6, 20, 0.25);
INSERT INTO order_details VALUES (691, 43, 46, 24, 0.25);
INSERT INTO order_details VALUES (691, 60, 34, 49, 0.25);
INSERT INTO order_details VALUES (691, 71, 21.5, 35, 0.25);
INSERT INTO order_details VALUES (692, 2, 19, 10, 0.150000006);
INSERT INTO order_details VALUES (692, 67, 14, 40, 0.150000006);
INSERT INTO order_details VALUES (693, 7, 30, 8, 0);
INSERT INTO order_details VALUES (693, 13, 6, 20, 0);
INSERT INTO order_details VALUES (694, 31, 12.5, 44, 0.25);
INSERT INTO order_details VALUES (694, 62, 49.2999992, 30, 0.25);
INSERT INTO order_details VALUES (694, 68, 12.5, 80, 0.25);
INSERT INTO order_details VALUES (694, 72, 34.7999992, 50, 0);
INSERT INTO order_details VALUES (695, 49, 20, 28, 0);
INSERT INTO order_details VALUES (696, 13, 6, 15, 0);
INSERT INTO order_details VALUES (696, 22, 21, 21, 0);
INSERT INTO order_details VALUES (696, 46, 12, 15, 0);
INSERT INTO order_details VALUES (697, 11, 21, 5, 0.25);
INSERT INTO order_details VALUES (697, 44, 19.4500008, 18, 0.25);
INSERT INTO order_details VALUES (697, 56, 38, 18, 0);
INSERT INTO order_details VALUES (698, 13, 6, 20, 0);
INSERT INTO order_details VALUES (698, 31, 12.5, 10, 0);
INSERT INTO order_details VALUES (699, 10, 31, 25, 0);
INSERT INTO order_details VALUES (699, 24, 4.5, 25, 0);
INSERT INTO order_details VALUES (699, 77, 13, 40, 0);
INSERT INTO order_details VALUES (700, 59, 55, 4, 0);
INSERT INTO order_details VALUES (701, 50, 16.25, 9, 0);
INSERT INTO order_details VALUES (701, 51, 53, 40, 0);
INSERT INTO order_details VALUES (701, 55, 24, 4, 0);
INSERT INTO order_details VALUES (702, 6, 25, 12, 0);
INSERT INTO order_details VALUES (702, 10, 31, 30, 0);
INSERT INTO order_details VALUES (702, 17, 39, 6, 0);
INSERT INTO order_details VALUES (702, 62, 49.2999992, 60, 0);
INSERT INTO order_details VALUES (703, 4, 22, 5, 0);
INSERT INTO order_details VALUES (704, 33, 2.5, 15, 0.0500000007);
INSERT INTO order_details VALUES (704, 41, 9.64999962, 6, 0.0500000007);
INSERT INTO order_details VALUES (704, 75, 7.75, 50, 0.0500000007);
INSERT INTO order_details VALUES (705, 6, 25, 16, 0.0500000007);
INSERT INTO order_details VALUES (705, 28, 45.5999985, 2, 0);
INSERT INTO order_details VALUES (706, 20, 81, 50, 0.0500000007);
INSERT INTO order_details VALUES (706, 31, 12.5, 50, 0.0500000007);
INSERT INTO order_details VALUES (707, 16, 17.4500008, 28, 0.150000006);
INSERT INTO order_details VALUES (707, 31, 12.5, 25, 0.150000006);
INSERT INTO order_details VALUES (707, 45, 9.5, 30, 0);
INSERT INTO order_details VALUES (707, 60, 34, 24, 0.150000006);
INSERT INTO order_details VALUES (708, 75, 7.75, 12, 0.200000003);
INSERT INTO order_details VALUES (709, 21, 10, 12, 0);
INSERT INTO order_details VALUES (709, 47, 9.5, 14, 0);
INSERT INTO order_details VALUES (709, 51, 53, 8, 0);
INSERT INTO order_details VALUES (710, 30, 25.8899994, 30, 0);
INSERT INTO order_details VALUES (710, 35, 18, 40, 0);
INSERT INTO order_details VALUES (710, 64, 33.25, 8, 0);
INSERT INTO order_details VALUES (711, 5, 21.3500004, 20, 0);
INSERT INTO order_details VALUES (711, 7, 30, 6, 0);
INSERT INTO order_details VALUES (711, 72, 34.7999992, 5, 0);
INSERT INTO order_details VALUES (712, 75, 7.75, 20, 0.150000006);
INSERT INTO order_details VALUES (713, 24, 4.5, 10, 0.25);
INSERT INTO order_details VALUES (713, 41, 9.64999962, 24, 0);
INSERT INTO order_details VALUES (714, 52, 7, 6, 0.0500000007);
INSERT INTO order_details VALUES (714, 76, 18, 60, 0);
INSERT INTO order_details VALUES (715, 7, 30, 45, 0);
INSERT INTO order_details VALUES (715, 13, 6, 77, 0);
INSERT INTO order_details VALUES (715, 53, 32.7999992, 20, 0);
INSERT INTO order_details VALUES (715, 69, 36, 9, 0);
INSERT INTO order_details VALUES (715, 76, 18, 44, 0);
INSERT INTO order_details VALUES (716, 60, 34, 2, 0.150000006);
INSERT INTO order_details VALUES (717, 18, 62.5, 6, 0);
INSERT INTO order_details VALUES (717, 38, 263.5, 5, 0);
INSERT INTO order_details VALUES (717, 69, 36, 10, 0);
INSERT INTO order_details VALUES (718, 51, 53, 16, 0);
INSERT INTO order_details VALUES (719, 37, 26, 8, 0);
INSERT INTO order_details VALUES (719, 56, 38, 12, 0.150000006);
INSERT INTO order_details VALUES (719, 62, 49.2999992, 12, 0.150000006);
INSERT INTO order_details VALUES (720, 19, 9.19999981, 12, 0);
INSERT INTO order_details VALUES (720, 49, 20, 40, 0);
INSERT INTO order_details VALUES (721, 12, 38, 30, 0);
INSERT INTO order_details VALUES (721, 24, 4.5, 30, 0);
INSERT INTO order_details VALUES (721, 64, 33.25, 4, 0);
INSERT INTO order_details VALUES (722, 46, 12, 9, 0);
INSERT INTO order_details VALUES (723, 52, 7, 40, 0.200000003);
INSERT INTO order_details VALUES (724, 29, 123.790001, 14, 0);
INSERT INTO order_details VALUES (725, 17, 39, 6, 0);
INSERT INTO order_details VALUES (725, 33, 2.5, 7, 0);
INSERT INTO order_details VALUES (726, 26, 31.2299995, 5, 0);
INSERT INTO order_details VALUES (726, 41, 9.64999962, 6, 0);
INSERT INTO order_details VALUES (726, 75, 7.75, 10, 0);
INSERT INTO order_details VALUES (727, 63, 43.9000015, 10, 0);
INSERT INTO order_details VALUES (728, 8, 40, 16, 0);
INSERT INTO order_details VALUES (728, 75, 7.75, 10, 0);
INSERT INTO order_details VALUES (729, 28, 45.5999985, 20, 0);
INSERT INTO order_details VALUES (730, 39, 18, 30, 0);
INSERT INTO order_details VALUES (730, 47, 9.5, 30, 0);
INSERT INTO order_details VALUES (730, 51, 53, 10, 0);
INSERT INTO order_details VALUES (730, 63, 43.9000015, 20, 0);
INSERT INTO order_details VALUES (731, 8, 40, 20, 0.150000006);
INSERT INTO order_details VALUES (731, 21, 10, 40, 0.150000006);
INSERT INTO order_details VALUES (731, 40, 18.3999996, 10, 0);
INSERT INTO order_details VALUES (731, 44, 19.4500008, 6, 0.150000006);
INSERT INTO order_details VALUES (732, 7, 30, 18, 0);
INSERT INTO order_details VALUES (732, 12, 38, 20, 0);
INSERT INTO order_details VALUES (732, 24, 4.5, 80, 0);
INSERT INTO order_details VALUES (732, 27, 43.9000015, 30, 0);
INSERT INTO order_details VALUES (732, 31, 12.5, 24, 0);
INSERT INTO order_details VALUES (732, 63, 43.9000015, 35, 0);
INSERT INTO order_details VALUES (733, 75, 7.75, 40, 0.200000003);
INSERT INTO order_details VALUES (734, 38, 263.5, 60, 0);
INSERT INTO order_details VALUES (735, 7, 30, 20, 0);
INSERT INTO order_details VALUES (735, 43, 46, 9, 0);
INSERT INTO order_details VALUES (736, 13, 6, 84, 0.150000006);
INSERT INTO order_details VALUES (736, 57, 19.5, 15, 0);
INSERT INTO order_details VALUES (737, 16, 17.4500008, 55, 0);
INSERT INTO order_details VALUES (737, 24, 4.5, 20, 0);
INSERT INTO order_details VALUES (737, 36, 19, 40, 0);
INSERT INTO order_details VALUES (738, 16, 17.4500008, 36, 0.100000001);
INSERT INTO order_details VALUES (738, 18, 62.5, 8, 0.100000001);
INSERT INTO order_details VALUES (738, 32, 32, 35, 0.100000001);
INSERT INTO order_details VALUES (739, 11, 21, 30, 0);
INSERT INTO order_details VALUES (739, 20, 81, 15, 0);
INSERT INTO order_details VALUES (739, 76, 18, 10, 0);
INSERT INTO order_details VALUES (739, 77, 13, 15, 0);
INSERT INTO order_details VALUES (740, 7, 30, 60, 0);
INSERT INTO order_details VALUES (740, 43, 46, 6, 0);
INSERT INTO order_details VALUES (740, 72, 34.7999992, 20, 0);
INSERT INTO order_details VALUES (741, 7, 30, 60, 0);
INSERT INTO order_details VALUES (741, 62, 49.2999992, 40, 0.100000001);
INSERT INTO order_details VALUES (742, 6, 25, 40, 0);
INSERT INTO order_details VALUES (742, 11, 21, 15, 0);
INSERT INTO order_details VALUES (742, 41, 9.64999962, 4, 0);
INSERT INTO order_details VALUES (743, 21, 10, 65, 0);
INSERT INTO order_details VALUES (743, 34, 14, 60, 0.150000006);
INSERT INTO order_details VALUES (743, 55, 24, 65, 0.150000006);
INSERT INTO order_details VALUES (743, 61, 28.5, 66, 0.150000006);
INSERT INTO order_details VALUES (744, 2, 19, 50, 0.200000003);
INSERT INTO order_details VALUES (744, 70, 15, 20, 0.200000003);
INSERT INTO order_details VALUES (744, 76, 18, 90, 0.200000003);
INSERT INTO order_details VALUES (745, 72, 34.7999992, 2, 0);
INSERT INTO order_details VALUES (746, 29, 123.790001, 50, 0.25);
INSERT INTO order_details VALUES (746, 41, 9.64999962, 35, 0.25);
INSERT INTO order_details VALUES (747, 59, 55, 18, 0.0500000007);
INSERT INTO order_details VALUES (748, 51, 53, 20, 0);
INSERT INTO order_details VALUES (748, 60, 34, 4, 0);
INSERT INTO order_details VALUES (749, 42, 14, 40, 0);
INSERT INTO order_details VALUES (750, 32, 32, 50, 0);
INSERT INTO order_details VALUES (750, 46, 12, 20, 0.25);
INSERT INTO order_details VALUES (750, 52, 7, 20, 0.25);
INSERT INTO order_details VALUES (751, 24, 4.5, 12, 0);
INSERT INTO order_details VALUES (751, 61, 28.5, 7, 0);
INSERT INTO order_details VALUES (751, 74, 10, 20, 0);
INSERT INTO order_details VALUES (751, 75, 7.75, 30, 0);
INSERT INTO order_details VALUES (752, 41, 9.64999962, 20, 0.0500000007);
INSERT INTO order_details VALUES (752, 51, 53, 15, 0.0500000007);
INSERT INTO order_details VALUES (752, 77, 13, 21, 0.0500000007);
INSERT INTO order_details VALUES (753, 4, 22, 25, 0.25);
INSERT INTO order_details VALUES (753, 24, 4.5, 30, 0.25);
INSERT INTO order_details VALUES (753, 77, 13, 30, 0);
INSERT INTO order_details VALUES (754, 7, 30, 60, 0);
INSERT INTO order_details VALUES (754, 22, 21, 25, 0);
INSERT INTO order_details VALUES (754, 46, 12, 25, 0);
INSERT INTO order_details VALUES (754, 55, 24, 6, 0);
INSERT INTO order_details VALUES (755, 13, 6, 56, 0);
INSERT INTO order_details VALUES (755, 35, 18, 15, 0.150000006);
INSERT INTO order_details VALUES (755, 42, 14, 24, 0.150000006);
INSERT INTO order_details VALUES (755, 55, 24, 40, 0);
INSERT INTO order_details VALUES (756, 1, 18, 4, 0);
INSERT INTO order_details VALUES (756, 40, 18.3999996, 10, 0);
INSERT INTO order_details VALUES (756, 52, 7, 10, 0);
INSERT INTO order_details VALUES (757, 26, 31.2299995, 6, 0);
INSERT INTO order_details VALUES (757, 76, 18, 6, 0);
INSERT INTO order_details VALUES (758, 1, 18, 2, 0);
INSERT INTO order_details VALUES (758, 59, 55, 10, 0);
INSERT INTO order_details VALUES (759, 1, 18, 8, 0);
INSERT INTO order_details VALUES (759, 29, 123.790001, 2, 0.25);
INSERT INTO order_details VALUES (760, 8, 40, 30, 0);
INSERT INTO order_details VALUES (760, 29, 123.790001, 10, 0);
INSERT INTO order_details VALUES (760, 42, 14, 14, 0);
INSERT INTO order_details VALUES (761, 28, 45.5999985, 70, 0.0500000007);
INSERT INTO order_details VALUES (761, 34, 14, 90, 0.0500000007);
INSERT INTO order_details VALUES (761, 71, 21.5, 21, 0);
INSERT INTO order_details VALUES (762, 24, 4.5, 12, 0);
INSERT INTO order_details VALUES (762, 36, 19, 18, 0.25);
INSERT INTO order_details VALUES (762, 60, 34, 9, 0);
INSERT INTO order_details VALUES (763, 7, 30, 20, 0);
INSERT INTO order_details VALUES (763, 24, 4.5, 10, 0);
INSERT INTO order_details VALUES (764, 58, 13.25, 40, 0.0500000007);
INSERT INTO order_details VALUES (764, 71, 21.5, 20, 0);
INSERT INTO order_details VALUES (765, 19, 9.19999981, 50, 0.0500000007);
INSERT INTO order_details VALUES (765, 60, 34, 36, 0.0500000007);
INSERT INTO order_details VALUES (765, 71, 21.5, 60, 0.0500000007);
INSERT INTO order_details VALUES (766, 23, 9, 10, 0);
INSERT INTO order_details VALUES (766, 42, 14, 4, 0);
INSERT INTO order_details VALUES (766, 45, 9.5, 20, 0);
INSERT INTO order_details VALUES (766, 68, 12.5, 2, 0);
INSERT INTO order_details VALUES (767, 41, 9.64999962, 28, 0.100000001);
INSERT INTO order_details VALUES (768, 30, 25.8899994, 15, 0);
INSERT INTO order_details VALUES (768, 77, 13, 18, 0);
INSERT INTO order_details VALUES (769, 31, 12.5, 15, 0);
INSERT INTO order_details VALUES (769, 36, 19, 16, 0);
INSERT INTO order_details VALUES (770, 3, 10, 25, 0);
INSERT INTO order_details VALUES (770, 59, 55, 110, 0);
INSERT INTO order_details VALUES (770, 70, 15, 30, 0);
INSERT INTO order_details VALUES (771, 12, 38, 20, 0);
INSERT INTO order_details VALUES (771, 18, 62.5, 10, 0);
INSERT INTO order_details VALUES (771, 56, 38, 5, 0);
INSERT INTO order_details VALUES (772, 46, 12, 3, 0);
INSERT INTO order_details VALUES (772, 49, 20, 2, 0);
INSERT INTO order_details VALUES (773, 10, 31, 24, 0.150000006);
INSERT INTO order_details VALUES (774, 2, 19, 11, 0.25);
INSERT INTO order_details VALUES (774, 20, 81, 15, 0);
INSERT INTO order_details VALUES (774, 26, 31.2299995, 63, 0);
INSERT INTO order_details VALUES (774, 51, 53, 44, 0.25);
INSERT INTO order_details VALUES (774, 72, 34.7999992, 35, 0);
INSERT INTO order_details VALUES (775, 19, 9.19999981, 35, 0);
INSERT INTO order_details VALUES (775, 69, 36, 30, 0);
INSERT INTO order_details VALUES (776, 7, 30, 4, 0);
INSERT INTO order_details VALUES (776, 43, 46, 30, 0);
INSERT INTO order_details VALUES (777, 26, 31.2299995, 12, 0);
INSERT INTO order_details VALUES (777, 33, 2.5, 30, 0);
INSERT INTO order_details VALUES (777, 65, 21.0499992, 21, 0);
INSERT INTO order_details VALUES (777, 71, 21.5, 50, 0);
INSERT INTO order_details VALUES (778, 1, 18, 10, 0.100000001);
INSERT INTO order_details VALUES (778, 13, 6, 20, 0.100000001);
INSERT INTO order_details VALUES (779, 18, 62.5, 8, 0);
INSERT INTO order_details VALUES (779, 51, 53, 10, 0);
INSERT INTO order_details VALUES (780, 24, 4.5, 30, 0.25);
INSERT INTO order_details VALUES (780, 62, 49.2999992, 21, 0.25);
INSERT INTO order_details VALUES (781, 55, 24, 35, 0);
INSERT INTO order_details VALUES (781, 59, 55, 24, 0);
INSERT INTO order_details VALUES (782, 56, 38, 20, 0);
INSERT INTO order_details VALUES (782, 63, 43.9000015, 12, 0);
INSERT INTO order_details VALUES (783, 2, 19, 100, 0.25);
INSERT INTO order_details VALUES (783, 5, 21.3500004, 70, 0);
INSERT INTO order_details VALUES (783, 29, 123.790001, 60, 0.25);
INSERT INTO order_details VALUES (783, 59, 55, 100, 0.25);
INSERT INTO order_details VALUES (784, 1, 18, 45, 0);
INSERT INTO order_details VALUES (784, 13, 6, 80, 0);
INSERT INTO order_details VALUES (784, 24, 4.5, 21, 0);
INSERT INTO order_details VALUES (784, 64, 33.25, 20, 0);
INSERT INTO order_details VALUES (784, 71, 21.5, 16, 0);
INSERT INTO order_details VALUES (785, 36, 19, 35, 0);
INSERT INTO order_details VALUES (785, 38, 263.5, 25, 0);
INSERT INTO order_details VALUES (785, 59, 55, 30, 0);
INSERT INTO order_details VALUES (786, 53, 32.7999992, 70, 0.100000001);
INSERT INTO order_details VALUES (786, 69, 36, 36, 0.100000001);
INSERT INTO order_details VALUES (787, 21, 10, 15, 0.100000001);
INSERT INTO order_details VALUES (787, 44, 19.4500008, 12, 0);
INSERT INTO order_details VALUES (787, 61, 28.5, 6, 0);
INSERT INTO order_details VALUES (788, 1, 18, 10, 0);
INSERT INTO order_details VALUES (788, 35, 18, 60, 0);
INSERT INTO order_details VALUES (788, 42, 14, 30, 0);
INSERT INTO order_details VALUES (788, 54, 7.44999981, 10, 0);
INSERT INTO order_details VALUES (789, 13, 6, 7, 0);
INSERT INTO order_details VALUES (789, 59, 55, 30, 0);
INSERT INTO order_details VALUES (790, 70, 15, 4, 0);
INSERT INTO order_details VALUES (791, 40, 18.3999996, 5, 0.200000003);
INSERT INTO order_details VALUES (791, 52, 7, 2, 0);
INSERT INTO order_details VALUES (791, 71, 21.5, 30, 0);
INSERT INTO order_details VALUES (792, 28, 45.5999985, 20, 0);
INSERT INTO order_details VALUES (792, 35, 18, 24, 0);
INSERT INTO order_details VALUES (792, 49, 20, 60, 0);
INSERT INTO order_details VALUES (792, 57, 19.5, 28, 0);
INSERT INTO order_details VALUES (793, 21, 10, 20, 0);
INSERT INTO order_details VALUES (794, 2, 19, 30, 0.200000003);
INSERT INTO order_details VALUES (794, 63, 43.9000015, 30, 0);
INSERT INTO order_details VALUES (795, 44, 19.4500008, 15, 0);
INSERT INTO order_details VALUES (795, 61, 28.5, 4, 0);
INSERT INTO order_details VALUES (796, 11, 21, 10, 0);
INSERT INTO order_details VALUES (797, 62, 49.2999992, 12, 0);
INSERT INTO order_details VALUES (798, 33, 2.5, 15, 0);
INSERT INTO order_details VALUES (798, 51, 53, 24, 0);
INSERT INTO order_details VALUES (799, 12, 38, 20, 0.0500000007);
INSERT INTO order_details VALUES (799, 32, 32, 15, 0.0500000007);
INSERT INTO order_details VALUES (799, 35, 18, 18, 0.0500000007);
INSERT INTO order_details VALUES (800, 1, 18, 25, 0.25);
INSERT INTO order_details VALUES (800, 5, 21.3500004, 30, 0.25);
INSERT INTO order_details VALUES (801, 68, 12.5, 42, 0);
INSERT INTO order_details VALUES (802, 2, 19, 10, 0.200000003);
INSERT INTO order_details VALUES (802, 12, 38, 4, 0.200000003);
INSERT INTO order_details VALUES (803, 76, 18, 50, 0.100000001);
INSERT INTO order_details VALUES (804, 24, 4.5, 10, 0.200000003);
INSERT INTO order_details VALUES (805, 43, 46, 30, 0.200000003);
INSERT INTO order_details VALUES (805, 61, 28.5, 10, 0.200000003);
INSERT INTO order_details VALUES (806, 18, 62.5, 35, 0.200000003);
INSERT INTO order_details VALUES (806, 32, 32, 20, 0);
INSERT INTO order_details VALUES (806, 64, 33.25, 25, 0.200000003);
INSERT INTO order_details VALUES (807, 33, 2.5, 10, 0);
INSERT INTO order_details VALUES (807, 67, 14, 20, 0);
INSERT INTO order_details VALUES (808, 24, 4.5, 15, 0);
INSERT INTO order_details VALUES (808, 25, 14, 15, 0);
INSERT INTO order_details VALUES (808, 51, 53, 20, 0);
INSERT INTO order_details VALUES (808, 57, 19.5, 20, 0);
INSERT INTO order_details VALUES (809, 7, 30, 40, 0);
INSERT INTO order_details VALUES (809, 55, 24, 35, 0);
INSERT INTO order_details VALUES (809, 60, 34, 50, 0);
INSERT INTO order_details VALUES (810, 70, 15, 3, 0);
INSERT INTO order_details VALUES (811, 21, 10, 3, 0);
INSERT INTO order_details VALUES (811, 60, 34, 21, 0);
INSERT INTO order_details VALUES (811, 61, 28.5, 4, 0);
INSERT INTO order_details VALUES (812, 13, 6, 30, 0);
INSERT INTO order_details VALUES (812, 17, 39, 12, 0);
INSERT INTO order_details VALUES (812, 60, 34, 35, 0);
INSERT INTO order_details VALUES (813, 60, 34, 4, 0);
INSERT INTO order_details VALUES (813, 77, 13, 10, 0);
INSERT INTO order_details VALUES (814, 60, 34, 15, 0);
INSERT INTO order_details VALUES (815, 53, 32.7999992, 10, 0.200000003);
INSERT INTO order_details VALUES (815, 70, 15, 12, 0.200000003);
INSERT INTO order_details VALUES (816, 34, 14, 30, 0);
INSERT INTO order_details VALUES (816, 40, 18.3999996, 40, 0.100000001);
INSERT INTO order_details VALUES (816, 41, 9.64999962, 30, 0.100000001);
INSERT INTO order_details VALUES (817, 17, 39, 77, 0.100000001);
INSERT INTO order_details VALUES (817, 41, 9.64999962, 12, 0);
INSERT INTO order_details VALUES (817, 53, 32.7999992, 25, 0.100000001);
INSERT INTO order_details VALUES (817, 55, 24, 4, 0.100000001);
INSERT INTO order_details VALUES (817, 68, 12.5, 55, 0);
INSERT INTO order_details VALUES (818, 30, 25.8899994, 4, 0.25);
INSERT INTO order_details VALUES (818, 54, 7.44999981, 20, 0.25);
INSERT INTO order_details VALUES (819, 16, 17.4500008, 3, 0);
INSERT INTO order_details VALUES (819, 19, 9.19999981, 42, 0);
INSERT INTO order_details VALUES (819, 34, 14, 35, 0);
INSERT INTO order_details VALUES (820, 41, 9.64999962, 9, 0);
INSERT INTO order_details VALUES (821, 28, 45.5999985, 8, 0.150000006);
INSERT INTO order_details VALUES (821, 43, 46, 36, 0.150000006);
INSERT INTO order_details VALUES (821, 77, 13, 28, 0.150000006);
INSERT INTO order_details VALUES (822, 39, 18, 20, 0);
INSERT INTO order_details VALUES (823, 1, 18, 40, 0.150000006);
INSERT INTO order_details VALUES (823, 2, 19, 20, 0.150000006);
INSERT INTO order_details VALUES (823, 16, 17.4500008, 30, 0.150000006);
INSERT INTO order_details VALUES (823, 31, 12.5, 20, 0);
INSERT INTO order_details VALUES (824, 7, 30, 15, 0.0500000007);
INSERT INTO order_details VALUES (824, 13, 6, 10, 0.0500000007);
INSERT INTO order_details VALUES (825, 2, 19, 8, 0);
INSERT INTO order_details VALUES (825, 41, 9.64999962, 40, 0);
INSERT INTO order_details VALUES (825, 50, 16.25, 22, 0);
INSERT INTO order_details VALUES (825, 64, 33.25, 130, 0);
INSERT INTO order_details VALUES (826, 11, 21, 10, 0);
INSERT INTO order_details VALUES (826, 24, 4.5, 20, 0);
INSERT INTO order_details VALUES (827, 16, 17.4500008, 14, 0.0500000007);
INSERT INTO order_details VALUES (828, 2, 19, 10, 0.150000006);
INSERT INTO order_details VALUES (828, 46, 12, 30, 0.150000006);
INSERT INTO order_details VALUES (828, 76, 18, 2, 0.150000006);
INSERT INTO order_details VALUES (829, 6, 25, 20, 0.25);
INSERT INTO order_details VALUES (829, 14, 23.25, 20, 0.25);
INSERT INTO order_details VALUES (829, 19, 9.19999981, 10, 0.25);
INSERT INTO order_details VALUES (830, 2, 19, 24, 0.200000003);
INSERT INTO order_details VALUES (830, 3, 10, 4, 0);
INSERT INTO order_details VALUES (830, 4, 22, 1, 0);
INSERT INTO order_details VALUES (830, 6, 25, 1, 0.0199999996);
INSERT INTO order_details VALUES (830, 7, 30, 1, 0.0500000007);
INSERT INTO order_details VALUES (830, 8, 40, 2, 0.100000001);
INSERT INTO order_details VALUES (830, 10, 31, 1, 0);
INSERT INTO order_details VALUES (830, 12, 38, 2, 0.0500000007);
INSERT INTO order_details VALUES (830, 13, 6, 4, 0);
INSERT INTO order_details VALUES (830, 14, 23.25, 1, 0.0299999993);
INSERT INTO order_details VALUES (830, 16, 17.4500008, 2, 0.0299999993);
INSERT INTO order_details VALUES (830, 20, 81, 1, 0.0399999991);
INSERT INTO order_details VALUES (830, 23, 9, 2, 0);
INSERT INTO order_details VALUES (830, 32, 32, 1, 0);
INSERT INTO order_details VALUES (830, 39, 18, 2, 0.0500000007);
INSERT INTO order_details VALUES (830, 41, 9.64999962, 3, 0);
INSERT INTO order_details VALUES (830, 46, 12, 3, 0.0199999996);
INSERT INTO order_details VALUES (830, 52, 7, 2, 0);
INSERT INTO order_details VALUES (830, 55, 24, 2, 0);
INSERT INTO order_details VALUES (830, 60, 34, 2, 0.0599999987);
INSERT INTO order_details VALUES (830, 64, 33.25, 2, 0.0299999993);
INSERT INTO order_details VALUES (830, 66, 17, 1, 0);
INSERT INTO order_details VALUES (830, 73, 15, 2, 0.00999999978);
INSERT INTO order_details VALUES (830, 75, 7.75, 4, 0);
INSERT INTO order_details VALUES (830, 77, 13, 2, 0);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO orders VALUES (DEFAULT,'VINET', 5, '1996-07-04', '1996-08-01', '1996-07-16', 3, 32.3800011, 'Vins et alcools Chevalier', '59 rue de l''Abbaye', 'Reims', NULL, '51100', 'France');
INSERT INTO orders VALUES (DEFAULT,'TOMSP', 6, '1996-07-05', '1996-08-16', '1996-07-10', 1, 11.6099997, 'Toms Spezialit??ten', 'Luisenstr. 48', 'M??nster', NULL, '44087', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'HANAR', 4, '1996-07-08', '1996-08-05', '1996-07-12', 2, 65.8300018, 'Hanari Carnes', 'Rua do Pa??o, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'VICTE', 3, '1996-07-08', '1996-08-05', '1996-07-15', 1, 41.3400002, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France');
INSERT INTO orders VALUES (DEFAULT,'SUPRD', 4, '1996-07-09', '1996-08-06', '1996-07-11', 2, 51.2999992, 'Supr??mes d??lices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO orders VALUES (DEFAULT,'HANAR', 3, '1996-07-10', '1996-07-24', '1996-07-16', 2, 58.1699982, 'Hanari Carnes', 'Rua do Pa??o, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'CHOPS', 5, '1996-07-11', '1996-08-08', '1996-07-23', 2, 22.9799995, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland');
INSERT INTO orders VALUES (DEFAULT,'RICSU', 9, '1996-07-12', '1996-08-09', '1996-07-15', 3, 148.330002, 'Richter Supermarkt', 'Starenweg 5', 'Gen??ve', NULL, '1204', 'Switzerland');
INSERT INTO orders VALUES (DEFAULT,'WELLI', 3, '1996-07-15', '1996-08-12', '1996-07-17', 2, 13.9700003, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'HILAA', 4, '1996-07-16', '1996-08-13', '1996-07-22', 3, 81.9100037, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Crist??bal', 'T??chira', '5022', 'Venezuela');
INSERT INTO orders VALUES (DEFAULT,'ERNSH', 1, '1996-07-17', '1996-08-14', '1996-07-23', 1, 140.509995, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (DEFAULT,'CENTC', 4, '1996-07-18', '1996-08-15', '1996-07-25', 3, 3.25, 'Centro comercial Moctezuma', 'Sierras de Granada 9993', 'M??xico D.F.', NULL, '05022', 'Mexico');
INSERT INTO orders VALUES (DEFAULT,'OTTIK', 4, '1996-07-19', '1996-08-16', '1996-07-29', 1, 55.0900002, 'Ottilies K??seladen', 'Mehrheimerstr. 369', 'K??ln', NULL, '50739', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'QUEDE', 4, '1996-07-19', '1996-08-16', '1996-07-30', 2, 3.04999995, 'Que Del??cia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'RATTC', 8, '1996-07-22', '1996-08-19', '1996-07-25', 3, 48.2900009, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES (DEFAULT,'ERNSH', 9, '1996-07-23', '1996-08-20', '1996-07-31', 3, 146.059998, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (DEFAULT,'FOLKO', 6, '1996-07-24', '1996-08-21', '1996-08-23', 3, 3.67000008, 'Folk och f?? HB', '??kergatan 24', 'Br??cke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (DEFAULT,'BLONP', 2, '1996-07-25', '1996-08-22', '1996-08-12', 1, 55.2799988, 'Blondel p??re et fils', '24, place Kl??ber', 'Strasbourg', NULL, '67000', 'France');
INSERT INTO orders VALUES (DEFAULT,'WARTH', 3, '1996-07-26', '1996-09-06', '1996-07-31', 3, 25.7299995, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO orders VALUES (DEFAULT,'FRANK', 4, '1996-07-29', '1996-08-26', '1996-08-06', 1, 208.580002, 'Frankenversand', 'Berliner Platz 43', 'M??nchen', NULL, '80805', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'GROSR', 8, '1996-07-30', '1996-08-27', '1996-08-02', 3, 66.2900009, 'GROSELLA-Restaurante', '5?? Ave. Los Palos Grandes', 'Caracas', 'DF', '1081', 'Venezuela');
INSERT INTO orders VALUES (DEFAULT,'WHITC', 5, '1996-07-31', '1996-08-14', '1996-08-09', 1, 4.55999994, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES (DEFAULT,'WARTH', 1, '1996-08-01', '1996-08-29', '1996-08-02', 1, 136.539993, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO orders VALUES (DEFAULT,'SPLIR', 6, '1996-08-01', '1996-08-29', '1996-08-30', 2, 4.53999996, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO orders VALUES (DEFAULT,'RATTC', 6, '1996-08-02', '1996-08-30', '1996-08-06', 2, 98.0299988, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES (DEFAULT,'QUICK', 3, '1996-08-05', '1996-09-02', '1996-08-12', 3, 76.0699997, 'QUICK-Stop', 'Taucherstra??e 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'VINET', 6, '1996-08-06', '1996-09-03', '1996-08-16', 1, 6.01000023, 'Vins et alcools Chevalier', '59 rue de l''Abbaye', 'Reims', NULL, '51100', 'France');
INSERT INTO orders VALUES (DEFAULT,'MAGAA', 1, '1996-08-07', '1996-09-04', '1996-08-09', 1, 26.9300003, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy');
INSERT INTO orders VALUES (DEFAULT,'TORTU', 8, '1996-08-08', '1996-08-22', '1996-08-14', 3, 13.8400002, 'Tortuga Restaurante', 'Avda. Azteca 123', 'M??xico D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES (DEFAULT,'MORGK', 2, '1996-08-09', '1996-09-06', '1996-08-13', 3, 125.769997, 'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig', NULL, '04179', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'BERGS', 8, '1996-08-12', '1996-09-09', '1996-08-16', 2, 92.6900024, 'Berglunds snabbk??p', 'Berguvsv??gen  8', 'Lule??', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (DEFAULT,'LEHMS', 8, '1996-08-13', '1996-09-10', '1996-08-16', 2, 25.8299999, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'BERGS', 2, '1996-08-14', '1996-09-11', '1996-09-12', 1, 8.97999954, 'Berglunds snabbk??p', 'Berguvsv??gen  8', 'Lule??', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (DEFAULT,'ROMEY', 4, '1996-08-14', '1996-08-28', '1996-08-21', 1, 2.94000006, 'Romero y tomillo', 'Gran V??a, 1', 'Madrid', NULL, '28001', 'Spain');
INSERT INTO orders VALUES (DEFAULT,'ROMEY', 4, '1996-08-15', '1996-09-12', '1996-08-21', 1, 12.6899996, 'Romero y tomillo', 'Gran V??a, 1', 'Madrid', NULL, '28001', 'Spain');
INSERT INTO orders VALUES (DEFAULT,'LILAS', 3, '1996-08-16', '1996-09-13', '1996-08-23', 3, 84.8099976, 'LILA-Supermercado', 'Carrera 52 con Ave. Bol??var #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO orders VALUES (DEFAULT,'LEHMS', 4, '1996-08-19', '1996-09-16', '1996-08-27', 1, 76.5599976, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'QUICK', 1, '1996-08-20', '1996-09-17', '1996-08-26', 2, 76.8300018, 'QUICK-Stop', 'Taucherstra??e 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'QUICK', 8, '1996-08-21', '1996-09-18', '1996-08-30', 3, 229.240005, 'QUICK-Stop', 'Taucherstra??e 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'RICAR', 8, '1996-08-22', '1996-09-19', '1996-08-28', 3, 12.7600002, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'REGGC', 4, '1996-08-23', '1996-09-20', '1996-09-03', 1, 7.44999981, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO orders VALUES (DEFAULT,'BSBEV', 7, '1996-08-26', '1996-09-23', '1996-08-28', 3, 22.7700005, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO orders VALUES (DEFAULT,'COMMI', 8, '1996-08-27', '1996-09-24', '1996-09-03', 1, 79.6999969, 'Com??rcio Mineiro', 'Av. dos Lus??adas, 23', 'Sao Paulo', 'SP', '05432-043', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'QUEDE', 6, '1996-08-27', '1996-09-24', '1996-09-04', 2, 6.4000001, 'Que Del??cia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'TRADH', 1, '1996-08-28', '1996-09-25', '1996-09-02', 2, 1.35000002, 'Tradi??ao Hipermercados', 'Av. In??s de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'TORTU', 1, '1996-08-29', '1996-09-26', '1996-09-11', 3, 21.1800003, 'Tortuga Restaurante', 'Avda. Azteca 123', 'M??xico D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES (DEFAULT,'RATTC', 4, '1996-08-30', '1996-09-27', '1996-09-05', 2, 147.259995, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES (DEFAULT,'VINET', 2, '1996-09-02', '1996-09-30', '1996-09-10', 2, 1.14999998, 'Vins et alcools Chevalier', '59 rue de l''Abbaye', 'Reims', NULL, '51100', 'France');
INSERT INTO orders VALUES (DEFAULT,'LILAS', 6, '1996-09-03', '1996-10-01', '1996-09-11', 1, 0.119999997, 'LILA-Supermercado', 'Carrera 52 con Ave. Bol??var #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO orders VALUES (DEFAULT,'BLONP', 5, '1996-09-04', '1996-10-16', '1996-09-10', 2, 5.73999977, 'Blondel p??re et fils', '24, place Kl??ber', 'Strasbourg', NULL, '67000', 'France');
INSERT INTO orders VALUES (DEFAULT,'HUNGO', 6, '1996-09-05', '1996-10-03', '1996-09-11', 2, 168.220001, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (DEFAULT,'RICAR', 4, '1996-09-06', '1996-10-04', '1996-09-13', 2, 29.7600002, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'MAGAA', 2, '1996-09-09', '1996-10-07', '1996-09-18', 2, 17.6800003, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy');
INSERT INTO orders VALUES (DEFAULT,'WANDK', 8, '1996-09-09', '1996-10-07', '1996-09-17', 2, 45.0800018, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'SUPRD', 4, '1996-09-10', '1996-10-08', '1996-10-09', 2, 6.26999998, 'Supr??mes d??lices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO orders VALUES (DEFAULT,'GODOS', 7, '1996-09-11', '1996-10-09', '1996-09-18', 2, 107.830002, 'Godos Cocina T??pica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain');
INSERT INTO orders VALUES (DEFAULT,'TORTU', 1, '1996-09-12', '1996-10-10', '1996-09-17', 2, 63.7900009, 'Tortuga Restaurante', 'Avda. Azteca 123', 'M??xico D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES (DEFAULT,'OLDWO', 8, '1996-09-13', '1996-10-11', '1996-10-09', 3, 257.619995, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO orders VALUES (DEFAULT,'ROMEY', 1, '1996-09-16', '1996-10-14', '1996-09-23', 3, 7.55999994, 'Romero y tomillo', 'Gran V??a, 1', 'Madrid', NULL, '28001', 'Spain');
INSERT INTO orders VALUES (DEFAULT,'LONEP', 2, '1996-09-17', '1996-10-15', '1996-09-25', 2, 0.560000002, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO orders VALUES (DEFAULT,'ANATR', 7, '1996-09-18', '1996-10-16', '1996-09-24', 3, 1.61000001, 'Ana Trujillo Emparedados y helados', 'Avda. de la Constituci??n 2222', 'M??xico D.F.', NULL, '05021', 'Mexico');
INSERT INTO orders VALUES (DEFAULT,'HUNGO', 3, '1996-09-19', '1996-10-17', '1996-10-23', 1, 47.2999992, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (DEFAULT,'THEBI', 8, '1996-09-20', '1996-10-18', '1996-09-27', 2, 17.5200005, 'The Big Cheese', '89 Jefferson Way Suite 2', 'Portland', 'OR', '97201', 'USA');
INSERT INTO orders VALUES (DEFAULT,'DUMON', 1, '1996-09-20', '1996-10-04', '1996-09-26', 3, 24.6900005, 'Du monde entier', '67, rue des Cinquante Otages', 'Nantes', NULL, '44000', 'France');
INSERT INTO orders VALUES (DEFAULT,'WANDK', 2, '1996-09-23', '1996-10-21', '1996-10-03', 2, 40.2599983, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'QUICK', 2, '1996-09-24', '1996-10-22', '1996-10-04', 2, 1.96000004, 'QUICK-Stop', 'Taucherstra??e 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'RATTC', 1, '1996-09-25', '1996-10-23', '1996-10-04', 2, 74.1600037, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES (DEFAULT,'ISLAT', 4, '1996-09-26', '1996-10-24', '1996-10-03', 2, 41.7599983, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO orders VALUES (DEFAULT,'RATTC', 1, '1996-09-27', '1996-10-25', '1996-10-08', 3, 150.149994, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES (DEFAULT,'LONEP', 6, '1996-09-30', '1996-10-28', '1996-10-10', 1, 12.6899996, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO orders VALUES (DEFAULT,'ISLAT', 8, '1996-10-01', '1996-10-29', '1996-10-04', 2, 4.73000002, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO orders VALUES (DEFAULT,'TORTU', 7, '1996-10-02', '1996-10-30', '1996-10-11', 3, 64.5, 'Tortuga Restaurante', 'Avda. Azteca 123', 'M??xico D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES (DEFAULT,'WARTH', 5, '1996-10-03', '1996-10-17', '1996-10-18', 3, 34.5699997, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO orders VALUES (DEFAULT,'ISLAT', 3, '1996-10-03', '1996-10-31', '1996-10-11', 2, 3.43000007, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO orders VALUES (DEFAULT,'PERIC', 7, '1996-10-04', '1996-11-01', '1996-10-23', 3, 0.400000006, 'Pericles Comidas cl??sicas', 'Calle Dr. Jorge Cash 321', 'M??xico D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES (DEFAULT,'KOENE', 4, '1996-10-07', '1996-11-04', '1996-10-14', 1, 4.88000011, 'K??niglich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'SAVEA', 9, '1996-10-08', '1996-11-05', '1996-10-10', 1, 214.270004, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (DEFAULT,'KOENE', 1, '1996-10-09', '1996-10-23', '1996-10-14', 3, 64.8600006, 'K??niglich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'BOLID', 4, '1996-10-10', '1996-11-07', '1996-10-14', 2, 77.9199982, 'B??lido Comidas preparadas', 'C/ Araquil, 67', 'Madrid', NULL, '28023', 'Spain');
INSERT INTO orders VALUES (DEFAULT,'FOLKO', 2, '1996-10-11', '1996-11-08', '1996-10-14', 1, 63.3600006, 'Folk och f?? HB', '??kergatan 24', 'Br??cke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (DEFAULT,'FURIB', 4, '1996-10-14', '1996-11-11', '1996-10-17', 3, 87.0299988, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal');
INSERT INTO orders VALUES (DEFAULT,'SPLIR', 4, '1996-10-15', '1996-11-26', '1996-10-23', 2, 191.669998, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO orders VALUES (DEFAULT,'LILAS', 3, '1996-10-16', '1996-11-13', '1996-10-28', 1, 12.75, 'LILA-Supermercado', 'Carrera 52 con Ave. Bol??var #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO orders VALUES (DEFAULT,'BONAP', 9, '1996-10-16', '1996-11-27', '1996-10-21', 1, 10.1899996, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES (DEFAULT,'MEREP', 3, '1996-10-17', '1996-11-28', '1996-10-21', 2, 52.8400002, 'M??re Paillarde', '43 rue St. Laurent', 'Montr??al', 'Qu??bec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES (DEFAULT,'WARTH', 5, '1996-10-18', '1996-11-15', '1996-10-25', 3, 0.589999974, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO orders VALUES (DEFAULT,'VICTE', 8, '1996-10-21', '1996-11-18', '1996-10-28', 2, 8.56000042, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France');
INSERT INTO orders VALUES (DEFAULT,'HUNGO', 7, '1996-10-22', '1996-11-19', '1996-10-24', 2, 42.1100006, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (DEFAULT,'PRINI', 7, '1996-10-23', '1996-11-20', '1996-10-25', 2, 15.5100002, 'Princesa Isabel Vinhos', 'Estrada da sa??de n. 58', 'Lisboa', NULL, '1756', 'Portugal');
INSERT INTO orders VALUES (DEFAULT,'FRANK', 4, '1996-10-24', '1996-11-21', '1996-10-29', 3, 108.260002, 'Frankenversand', 'Berliner Platz 43', 'M??nchen', NULL, '80805', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'OLDWO', 4, '1996-10-25', '1996-11-22', '1996-10-29', 3, 84.2099991, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO orders VALUES (DEFAULT,'MEREP', 2, '1996-10-28', '1996-11-25', '1996-11-04', 2, 15.6599998, 'M??re Paillarde', '43 rue St. Laurent', 'Montr??al', 'Qu??bec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES (DEFAULT,'BONAP', 1, '1996-10-29', '1996-11-26', '1996-11-08', 3, 166.309998, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES (DEFAULT,'SIMOB', 7, '1996-10-29', '1996-11-26', '1996-11-05', 3, 26.7800007, 'Simons bistro', 'Vinb??ltet 34', 'Kobenhavn', NULL, '1734', 'Denmark');
INSERT INTO orders VALUES (DEFAULT,'FRANK', 4, '1996-10-30', '1996-11-13', '1996-11-04', 2, 54.8300018, 'Frankenversand', 'Berliner Platz 43', 'M??nchen', NULL, '80805', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'LEHMS', 4, '1996-10-31', '1996-11-28', '1996-11-06', 1, 110.370003, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'WHITC', 4, '1996-11-01', '1996-11-29', '1996-11-05', 2, 23.2900009, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES (DEFAULT,'QUICK', 2, '1996-11-04', '1996-12-02', '1996-11-11', 2, 249.059998, 'QUICK-Stop', 'Taucherstra??e 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'RATTC', 3, '1996-11-05', '1996-12-17', '1996-11-08', 3, 142.080002, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES (DEFAULT,'FAMIA', 4, '1996-11-06', '1996-12-04', '1996-11-08', 3, 3.0999999, 'Familia Arquibaldo', 'Rua Or??s, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'WANDK', 4, '1996-11-07', '1996-12-05', '1996-11-15', 2, 0.779999971, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'SPLIR', 7, '1996-11-08', '1996-12-06', '1996-11-15', 1, 8.63000011, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO orders VALUES (DEFAULT,'LAMAI', 6, '1996-11-11', '1996-12-09', '1996-12-03', 2, 64.1900024, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO orders VALUES (DEFAULT,'ERNSH', 1, '1996-11-11', '1996-12-09', '1996-11-20', 1, 162.330002, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (DEFAULT,'FURIB', 3, '1996-11-12', '1996-11-26', '1996-11-18', 3, 1.29999995, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal');
INSERT INTO orders VALUES (DEFAULT,'PICCO', 7, '1996-11-13', '1996-12-11', '1996-11-25', 3, 360.630005, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria');
INSERT INTO orders VALUES (DEFAULT,'PERIC', 8, '1996-11-14', '1996-12-12', '1996-11-20', 3, 53.7999992, 'Pericles Comidas cl??sicas', 'Calle Dr. Jorge Cash 321', 'M??xico D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES (DEFAULT,'AROUT', 6, '1996-11-15', '1996-12-13', '1996-11-20', 1, 41.9500008, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES (DEFAULT,'WANDK', 6, '1996-11-18', '1996-12-16', '1996-11-27', 2, 36.7099991, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'LILAS', 1, '1996-11-19', '1996-12-17', '1996-12-02', 3, 34.8800011, 'LILA-Supermercado', 'Carrera 52 con Ave. Bol??var #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO orders VALUES (DEFAULT,'LAMAI', 5, '1996-11-20', '1996-12-18', '1996-11-27', 1, 19.6399994, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO orders VALUES (DEFAULT,'SEVES', 5, '1996-11-21', '1996-12-19', '1996-11-26', 3, 288.429993, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK');
INSERT INTO orders VALUES (DEFAULT,'BLONP', 4, '1996-11-22', '1996-12-20', '1996-12-02', 3, 131.699997, 'Blondel p??re et fils', '24, place Kl??ber', 'Strasbourg', NULL, '67000', 'France');
INSERT INTO orders VALUES (DEFAULT,'QUICK', 1, '1996-11-22', '1996-12-20', '1996-12-03', 2, 183.169998, 'QUICK-Stop', 'Taucherstra??e 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'BONAP', 3, '1996-11-25', '1996-12-23', '1996-11-28', 1, 96.0400009, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES (DEFAULT,'DRACD', 4, '1996-11-26', '1996-12-24', '1996-12-04', 3, 30.5400009, 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', NULL, '52066', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'EASTC', 1, '1996-11-26', '1997-01-07', '1996-12-04', 1, 71.9700012, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK');
INSERT INTO orders VALUES (DEFAULT,'ANTON', 3, '1996-11-27', '1996-12-25', '1996-12-02', 2, 22, 'Antonio Moreno Taquer??a', 'Mataderos  2312', 'M??xico D.F.', NULL, '05023', 'Mexico');
INSERT INTO orders VALUES (DEFAULT,'GALED', 8, '1996-11-28', '1997-01-09', '1996-12-30', 2, 10.1400003, 'Galer??a del gastron??mo', 'Rambla de Catalu??a, 23', 'Barcelona', NULL, '8022', 'Spain');
INSERT INTO orders VALUES (DEFAULT,'VAFFE', 7, '1996-11-28', '1996-12-26', '1996-12-02', 3, 13.5500002, 'Vaffeljernet', 'Smagsloget 45', '??rhus', NULL, '8200', 'Denmark');
INSERT INTO orders VALUES (DEFAULT,'ERNSH', 2, '1996-11-29', '1996-12-27', '1996-12-02', 2, 101.949997, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (DEFAULT,'SPLIR', 8, '1996-12-02', '1996-12-30', '1996-12-09', 2, 195.679993, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO orders VALUES (DEFAULT,'CHOPS', 6, '1996-12-03', '1996-12-31', '1996-12-27', 2, 1.16999996, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland');
INSERT INTO orders VALUES (DEFAULT,'LAMAI', 1, '1996-12-03', '1996-12-31', '1996-12-24', 1, 0.449999988, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO orders VALUES (DEFAULT,'QUEEN', 5, '1996-12-04', '1997-01-01', '1996-12-09', 2, 890.780029, 'Queen Cozinha', 'Alameda dos Can??rios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'HUNGO', 4, '1996-12-05', '1997-01-02', '1996-12-11', 3, 124.120003, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (DEFAULT,'WOLZA', 1, '1996-12-05', '1997-01-02', '1996-12-09', 3, 3.94000006, 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Poland');
INSERT INTO orders VALUES (DEFAULT,'HUNGC', 3, '1996-12-06', '1997-01-03', '1996-12-09', 2, 20.1200008, 'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA');
INSERT INTO orders VALUES (DEFAULT,'MEREP', 1, '1996-12-09', '1997-01-06', '1996-12-13', 2, 20.3899994, 'M??re Paillarde', '43 rue St. Laurent', 'Montr??al', 'Qu??bec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES (DEFAULT,'SEVES', 1, '1996-12-09', '1997-01-06', '1996-12-13', 3, 22.2099991, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK');
INSERT INTO orders VALUES (DEFAULT,'FOLKO', 5, '1996-12-10', '1997-01-07', '1996-12-19', 3, 5.44000006, 'Folk och f?? HB', '??kergatan 24', 'Br??cke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (DEFAULT,'QUEDE', 2, '1996-12-11', '1997-01-08', '1996-12-13', 1, 45.0299988, 'Que Del??cia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'HUNGO', 8, '1996-12-12', '1997-01-09', '1997-01-16', 3, 35.0299988, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (DEFAULT,'LILAS', 3, '1996-12-12', '1997-01-09', '1996-12-13', 3, 7.98999977, 'LILA-Supermercado', 'Carrera 52 con Ave. Bol??var #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO orders VALUES (DEFAULT,'ERNSH', 4, '1996-12-13', '1997-01-10', '1996-12-16', 1, 94.7699966, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (DEFAULT,'AROUT', 8, '1996-12-16', '1997-01-13', '1996-12-18', 3, 34.2400017, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES (DEFAULT,'BERGS', 3, '1996-12-16', '1997-01-13', '1996-12-20', 3, 168.639999, 'Berglunds snabbk??p', 'Berguvsv??gen  8', 'Lule??', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (DEFAULT,'SPLIR', 1, '1996-12-17', '1997-01-14', '1996-12-23', 2, 30.9599991, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO orders VALUES (DEFAULT,'FAMIA', 9, '1996-12-18', '1997-01-01', '1996-12-25', 3, 13.9899998, 'Familia Arquibaldo', 'Rua Or??s, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'SANTG', 1, '1996-12-18', '1997-01-15', '1996-12-20', 2, 93.6299973, 'Sant?? Gourmet', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Norway');
INSERT INTO orders VALUES (DEFAULT,'SEVES', 2, '1996-12-19', '1997-01-16', '1996-12-20', 1, 34.8600006, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK');
INSERT INTO orders VALUES (DEFAULT,'BOTTM', 4, '1996-12-20', '1997-01-17', '1996-12-24', 2, 47.4199982, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES (DEFAULT,'ERNSH', 6, '1996-12-23', '1997-01-20', '1996-12-26', 1, 126.379997, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (DEFAULT,'DRACD', 3, '1996-12-23', '1997-01-20', '1996-12-31', 3, 5.44999981, 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', NULL, '52066', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'PICCO', 2, '1996-12-24', '1997-01-21', '1997-01-01', 3, 122.459999, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria');
INSERT INTO orders VALUES (DEFAULT,'SAVEA', 1, '1996-12-25', '1997-01-22', '1997-01-03', 3, 126.559998, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (DEFAULT,'HUNGC', 1, '1996-12-25', '1997-01-22', '1997-01-03', 3, 30.3400002, 'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA');
INSERT INTO orders VALUES (DEFAULT,'HILAA', 6, '1996-12-26', '1997-01-23', '1997-01-03', 1, 184.410004, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Crist??bal', 'T??chira', '5022', 'Venezuela');
INSERT INTO orders VALUES (DEFAULT,'FRANK', 1, '1996-12-27', '1997-01-10', '1997-01-06', 3, 135.350006, 'Frankenversand', 'Berliner Platz 43', 'M??nchen', NULL, '80805', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'PRINI', 5, '1996-12-27', '1997-01-24', '1997-01-02', 1, 60.2599983, 'Princesa Isabel Vinhos', 'Estrada da sa??de n. 58', 'Lisboa', NULL, '1756', 'Portugal');
INSERT INTO orders VALUES (DEFAULT,'SAVEA', 2, '1996-12-30', '1997-01-27', '1997-01-09', 3, 89.1600037, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (DEFAULT,'VAFFE', 8, '1996-12-31', '1997-01-14', '1997-01-08', 3, 27.3600006, 'Vaffeljernet', 'Smagsloget 45', '??rhus', NULL, '8200', 'Denmark');
INSERT INTO orders VALUES (DEFAULT,'EASTC', 1, '1997-01-01', '1997-01-29', '1997-01-16', 3, 83.9300003, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK');
INSERT INTO orders VALUES (DEFAULT,'RATTC', 1, '1997-01-01', '1997-01-29', '1997-01-10', 1, 12.5100002, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES (DEFAULT,'ERNSH', 8, '1997-01-02', '1997-02-13', '1997-01-10', 2, 67.8799973, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (DEFAULT,'ERNSH', 4, '1997-01-03', '1997-01-31', '1997-01-09', 3, 73.7900009, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (DEFAULT,'MAGAA', 2, '1997-01-03', '1997-01-31', '1997-01-08', 1, 155.970001, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy');
INSERT INTO orders VALUES (DEFAULT,'LINOD', 1, '1997-01-06', '1997-02-03', '1997-01-22', 1, 34.8199997, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO orders VALUES (DEFAULT,'QUEEN', 7, '1997-01-07', '1997-02-18', '1997-01-13', 1, 108.040001, 'Queen Cozinha', 'Alameda dos Can??rios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'OTTIK', 2, '1997-01-07', '1997-02-04', '1997-01-30', 2, 91.4800034, 'Ottilies K??seladen', 'Mehrheimerstr. 369', 'K??ln', NULL, '50739', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'FOLIG', 8, '1997-01-08', '1997-02-05', '1997-01-14', 1, 11.2600002, 'Folies gourmandes', '184, chauss??e de Tournai', 'Lille', NULL, '59000', 'France');
INSERT INTO orders VALUES (DEFAULT,'OCEAN', 3, '1997-01-09', '1997-02-06', '1997-01-14', 1, 29.8299999, 'Oc??ano Atl??ntico Ltda.', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO orders VALUES (DEFAULT,'BOTTM', 3, '1997-01-10', '1997-02-07', '1997-01-15', 3, 2.4000001, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES (DEFAULT,'BOTTM', 9, '1997-01-10', '1997-02-07', '1997-01-21', 3, 23.6499996, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES (DEFAULT,'WARTH', 8, '1997-01-13', '1997-02-10', '1997-01-15', 2, 3.76999998, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO orders VALUES (DEFAULT,'LAMAI', 3, '1997-01-14', '1997-02-11', '1997-01-16', 2, 95.6600037, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO orders VALUES (DEFAULT,'FAMIA', 2, '1997-01-14', '1997-02-11', '1997-01-17', 3, 21.4799995, 'Familia Arquibaldo', 'Rua Or??s, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'HUNGC', 3, '1997-01-15', '1997-02-12', '1997-01-24', 1, 0.200000003, 'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA');
INSERT INTO orders VALUES (DEFAULT,'WARTH', 8, '1997-01-16', '1997-02-13', '1997-01-27', 3, 22.7199993, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO orders VALUES (DEFAULT,'SIMOB', 4, '1997-01-16', '1997-02-13', '1997-01-28', 3, 70.2900009, 'Simons bistro', 'Vinb??ltet 34', 'Kobenhavn', NULL, '1734', 'Denmark');
INSERT INTO orders VALUES (DEFAULT,'QUICK', 4, '1997-01-17', '1997-02-14', '1997-01-24', 1, 17.5499992, 'QUICK-Stop', 'Taucherstra??e 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'RICSU', 4, '1997-01-20', '1997-02-17', '1997-01-30', 2, 137.350006, 'Richter Supermarkt', 'Starenweg 5', 'Gen??ve', NULL, '1204', 'Switzerland');
INSERT INTO orders VALUES (DEFAULT,'WELLI', 3, '1997-01-21', '1997-02-18', '1997-01-27', 1, 44.1199989, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'QUEDE', 8, '1997-01-21', '1997-03-04', '1997-01-27', 1, 99.2300034, 'Que Del??cia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'FRANS', 2, '1997-01-22', '1997-02-19', '1997-01-31', 1, 3.01999998, 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italy');
INSERT INTO orders VALUES (DEFAULT,'GOURL', 6, '1997-01-23', '1997-02-06', '1997-02-24', 3, 24.5, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'MEREP', 7, '1997-01-23', '1997-02-20', '1997-01-27', 2, 370.609985, 'M??re Paillarde', '43 rue St. Laurent', 'Montr??al', 'Qu??bec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES (DEFAULT,'LAMAI', 6, '1997-01-24', '1997-02-21', '1997-02-14', 2, 7.92999983, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO orders VALUES (DEFAULT,'GALED', 4, '1997-01-27', '1997-02-24', '1997-02-06', 1, 18.6900005, 'Galer??a del gastron??mo', 'Rambla de Catalu??a, 23', 'Barcelona', NULL, '8022', 'Spain');
INSERT INTO orders VALUES (DEFAULT,'PICCO', 4, '1997-01-27', '1997-02-24', '1997-03-03', 2, 31.2900009, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria');
INSERT INTO orders VALUES (DEFAULT,'REGGC', 7, '1997-01-28', '1997-02-25', '1997-02-04', 1, 11.0900002, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO orders VALUES (DEFAULT,'HUNGO', 3, '1997-01-29', '1997-03-12', '1997-02-07', 2, 56.6300011, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (DEFAULT,'ERNSH', 4, '1997-01-30', '1997-02-13', '1997-02-03', 1, 458.779999, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (DEFAULT,'BOTTM', 4, '1997-01-30', '1997-02-13', '1997-02-07', 2, 44.1699982, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES (DEFAULT,'SPLIR', 3, '1997-01-31', '1997-02-14', '1997-02-07', 2, 4.34000015, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO orders VALUES (DEFAULT,'PRINI', 3, '1997-02-03', '1997-03-03', '1997-03-04', 3, 73.8300018, 'Princesa Isabel Vinhos', 'Estrada da sa??de n. 58', 'Lisboa', NULL, '1756', 'Portugal');
INSERT INTO orders VALUES (DEFAULT,'FOLKO', 3, '1997-02-03', '1997-03-03', '1997-02-13', 2, 17.9200001, 'Folk och f?? HB', '??kergatan 24', 'Br??cke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (DEFAULT,'CONSH', 8, '1997-02-04', '1997-03-18', '1997-02-07', 2, 9.21000004, 'Consolidated Holdings', 'Berkeley Gardens 12  Brewery', 'London', NULL, 'WX1 6LT', 'UK');
INSERT INTO orders VALUES (DEFAULT,'BLONP', 3, '1997-02-05', '1997-03-05', '1997-02-11', 2, 156.660004, 'Blondel p??re et fils', '24, place Kl??ber', 'Strasbourg', NULL, '67000', 'France');
INSERT INTO orders VALUES (DEFAULT,'WARTH', 8, '1997-02-05', '1997-03-05', '1997-02-12', 1, 19.9699993, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO orders VALUES (DEFAULT,'TOMSP', 3, '1997-02-06', '1997-03-06', '1997-02-14', 2, 8.23999977, 'Toms Spezialit??ten', 'Luisenstr. 48', 'M??nster', NULL, '44087', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'MEREP', 6, '1997-02-07', '1997-03-07', '1997-02-10', 3, 4.07000017, 'M??re Paillarde', '43 rue St. Laurent', 'Montr??al', 'Qu??bec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES (DEFAULT,'SAVEA', 4, '1997-02-10', '1997-03-10', '1997-02-28', 2, 86.5299988, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (DEFAULT,'OLDWO', 3, '1997-02-10', '1997-03-24', '1997-03-14', 2, 73.0199966, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO orders VALUES (DEFAULT,'ERNSH', 3, '1997-02-11', '1997-03-11', '1997-02-18', 2, 47.9399986, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (DEFAULT,'REGGC', 8, '1997-02-12', '1997-03-12', '1997-02-14', 1, 13.9499998, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO orders VALUES (DEFAULT,'BERGS', 3, '1997-02-12', '1997-03-12', '1997-02-21', 3, 3.5, 'Berglunds snabbk??p', 'Berguvsv??gen  8', 'Lule??', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (DEFAULT,'BERGS', 3, '1997-02-13', '1997-03-13', '1997-02-20', 1, 9.30000019, 'Berglunds snabbk??p', 'Berguvsv??gen  8', 'Lule??', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (DEFAULT,'TOMSP', 6, '1997-02-14', '1997-03-14', '1997-02-19', 1, 14.6800003, 'Toms Spezialit??ten', 'Luisenstr. 48', 'M??nster', NULL, '44087', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'RICAR', 4, '1997-02-14', '1997-03-14', '1997-03-07', 2, 68.6600037, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'RANCH', 4, '1997-02-17', '1997-03-17', '1997-02-24', 2, 38.8199997, 'Rancho grande', 'Av. del Libertador 900', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO orders VALUES (DEFAULT,'BLONP', 3, '1997-02-18', '1997-03-18', '1997-02-27', 2, 53.2999992, 'Blondel p??re et fils', '24, place Kl??ber', 'Strasbourg', NULL, '67000', 'France');
INSERT INTO orders VALUES (DEFAULT,'VICTE', 8, '1997-02-19', '1997-03-19', '1997-03-11', 2, 7.23000002, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France');
INSERT INTO orders VALUES (DEFAULT,'QUICK', 4, '1997-02-19', '1997-03-05', '1997-03-12', 3, 189.089996, 'QUICK-Stop', 'Taucherstra??e 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'SAVEA', 8, '1997-02-20', '1997-03-20', '1997-02-26', 1, 140.259995, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (DEFAULT,'AROUT', 1, '1997-02-21', '1997-03-21', '1997-02-26', 2, 25.3600006, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES (DEFAULT,'LAMAI', 4, '1997-02-21', '1997-03-21', '1997-02-25', 3, 2.74000001, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO orders VALUES (DEFAULT,'WARTH', 8, '1997-02-24', '1997-04-07', '1997-03-03', 2, 180.449997, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO orders VALUES (DEFAULT,'KOENE', 8, '1997-02-25', '1997-04-08', '1997-02-28', 2, 8.11999989, 'K??niglich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'KOENE', 2, '1997-02-25', '1997-03-25', '1997-03-03', 1, 11.5699997, 'K??niglich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'SUPRD', 7, '1997-02-26', '1997-03-26', '1997-03-04', 3, 147.059998, 'Supr??mes d??lices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO orders VALUES (DEFAULT,'VICTE', 4, '1997-02-27', '1997-03-27', '1997-02-28', 2, 25.0900002, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France');
INSERT INTO orders VALUES (DEFAULT,'FOLKO', 8, '1997-02-28', '1997-03-28', '1997-03-03', 1, 16.2700005, 'Folk och f?? HB', '??kergatan 24', 'Br??cke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (DEFAULT,'LILAS', 1, '1997-02-28', '1997-03-28', '1997-03-05', 3, 148.610001, 'LILA-Supermercado', 'Carrera 52 con Ave. Bol??var #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO orders VALUES (DEFAULT,'CONSH', 2, '1997-03-03', '1997-03-31', '1997-03-18', 1, 6.17000008, 'Consolidated Holdings', 'Berkeley Gardens 12  Brewery', 'London', NULL, 'WX1 6LT', 'UK');
INSERT INTO orders VALUES (DEFAULT,'SUPRD', 5, '1997-03-04', '1997-04-01', '1997-03-06', 3, 14.7799997, 'Supr??mes d??lices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO orders VALUES (DEFAULT,'FURIB', 4, '1997-03-04', '1997-04-01', '1997-03-14', 2, 89, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal');
INSERT INTO orders VALUES (DEFAULT,'VAFFE', 1, '1997-03-05', '1997-04-02', '1997-03-14', 3, 145.039993, 'Vaffeljernet', 'Smagsloget 45', '??rhus', NULL, '8200', 'Denmark');
INSERT INTO orders VALUES (DEFAULT,'COMMI', 4, '1997-03-06', '1997-04-03', '1997-03-13', 1, 11.9300003, 'Com??rcio Mineiro', 'Av. dos Lus??adas, 23', 'Sao Paulo', 'SP', '05432-043', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'MAGAA', 8, '1997-03-06', '1997-04-03', '1997-03-11', 2, 4.92999983, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy');
INSERT INTO orders VALUES (DEFAULT,'KOENE', 3, '1997-03-07', '1997-04-04', '1997-03-12', 3, 44.1199989, 'K??niglich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'WHITC', 1, '1997-03-10', '1997-04-07', '1997-03-14', 1, 60.1800003, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES (DEFAULT,'BONAP', 4, '1997-03-11', '1997-04-08', '1997-03-14', 2, 64.5599976, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES (DEFAULT,'BSBEV', 2, '1997-03-11', '1997-04-08', '1997-03-18', 3, 45.5900002, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO orders VALUES (DEFAULT,'SEVES', 8, '1997-03-12', '1997-04-09', '1997-03-19', 1, 4.19999981, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK');
INSERT INTO orders VALUES (DEFAULT,'ISLAT', 1, '1997-03-13', '1997-03-27', '1997-03-21', 3, 16.3700008, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO orders VALUES (DEFAULT,'PERIC', 5, '1997-03-13', '1997-04-10', '1997-03-21', 2, 83.4899979, 'Pericles Comidas cl??sicas', 'Calle Dr. Jorge Cash 321', 'M??xico D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES (DEFAULT,'SUPRD', 9, '1997-03-14', '1997-04-11', '1997-04-04', 1, 68.5199966, 'Supr??mes d??lices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO orders VALUES (DEFAULT,'HILAA', 8, '1997-03-17', '1997-04-14', '1997-03-24', 3, 4.40999985, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Crist??bal', 'T??chira', '5022', 'Venezuela');
INSERT INTO orders VALUES (DEFAULT,'PRINI', 5, '1997-03-17', '1997-04-14', '1997-03-25', 2, 13.0200005, 'Princesa Isabel Vinhos', 'Estrada da sa??de n. 58', 'Lisboa', NULL, '1756', 'Portugal');
INSERT INTO orders VALUES (DEFAULT,'VICTE', 2, '1997-03-18', '1997-04-01', '1997-03-26', 3, 4.80999994, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France');
INSERT INTO orders VALUES (DEFAULT,'RATTC', 3, '1997-03-19', '1997-04-16', '1997-03-21', 3, 708.950012, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES (DEFAULT,'FOLIG', 6, '1997-03-20', '1997-04-17', '1997-03-24', 2, 1.35000002, 'Folies gourmandes', '184, chauss??e de Tournai', 'Lille', NULL, '59000', 'France');
INSERT INTO orders VALUES (DEFAULT,'RICAR', 8, '1997-03-20', '1997-04-17', '1997-03-25', 2, 64.3300018, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'LAZYK', 1, '1997-03-21', '1997-04-18', '1997-04-10', 3, 7.48000002, 'Lazy K Kountry Store', '12 Orchestra Terrace', 'Walla Walla', 'WA', '99362', 'USA');
INSERT INTO orders VALUES (DEFAULT,'WHITC', 7, '1997-03-24', '1997-04-21', '1997-04-25', 2, 15.2799997, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES (DEFAULT,'BSBEV', 3, '1997-03-24', '1997-04-21', '1997-04-01', 3, 6.88000011, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO orders VALUES (DEFAULT,'LINOD', 4, '1997-03-25', '1997-04-08', '1997-03-31', 2, 64.4499969, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO orders VALUES (DEFAULT,'HILAA', 1, '1997-03-26', '1997-04-23', '1997-04-02', 2, 30.5300007, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Crist??bal', 'T??chira', '5022', 'Venezuela');
INSERT INTO orders VALUES (DEFAULT,'QUEEN', 2, '1997-03-26', '1997-04-23', '1997-03-28', 2, 71.0699997, 'Queen Cozinha', 'Alameda dos Can??rios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'FRANK', 8, '1997-03-27', '1997-04-24', '1997-04-02', 2, 4.92999983, 'Frankenversand', 'Berliner Platz 43', 'M??nchen', NULL, '80805', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'PICCO', 6, '1997-03-28', '1997-04-25', '1997-04-09', 2, 5.28999996, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria');
INSERT INTO orders VALUES (DEFAULT,'HILAA', 7, '1997-03-31', '1997-04-28', '1997-04-03', 2, 210.190002, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Crist??bal', 'T??chira', '5022', 'Venezuela');
INSERT INTO orders VALUES (DEFAULT,'FURIB', 8, '1997-03-31', '1997-04-28', '1997-04-08', 3, 16.9599991, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal');
INSERT INTO orders VALUES (DEFAULT,'BOTTM', 3, '1997-04-01', '1997-04-29', '1997-04-11', 1, 62.8899994, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES (DEFAULT,'LAMAI', 4, '1997-04-02', '1997-04-30', '1997-04-10', 3, 10.6400003, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO orders VALUES (DEFAULT,'COMMI', 4, '1997-04-02', '1997-04-30', '1997-04-09', 2, 65.9899979, 'Com??rcio Mineiro', 'Av. dos Lus??adas, 23', 'Sao Paulo', 'SP', '05432-043', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'LAUGB', 3, '1997-04-03', '1997-05-01', '1997-04-11', 3, 4.6500001, 'Laughing Bacchus Wine Cellars', '2319 Elm St.', 'Vancouver', 'BC', 'V3F 2K1', 'Canada');
INSERT INTO orders VALUES (DEFAULT,'TRADH', 7, '1997-04-04', '1997-05-02', '1997-04-07', 2, 46.7700005, 'Tradi??ao Hipermercados', 'Av. In??s de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'LEHMS', 7, '1997-04-04', '1997-05-02', '1997-04-07', 1, 36.2099991, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'HILAA', 8, '1997-04-07', '1997-05-05', '1997-04-11', 2, 29.75, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Crist??bal', 'T??chira', '5022', 'Venezuela');
INSERT INTO orders VALUES (DEFAULT,'LILAS', 4, '1997-04-08', '1997-05-06', '1997-04-16', 2, 102.019997, 'LILA-Supermercado', 'Carrera 52 con Ave. Bol??var #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO orders VALUES (DEFAULT,'LAMAI', 6, '1997-04-09', '1997-05-07', '1997-04-17', 1, 42.6800003, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO orders VALUES (DEFAULT,'BLAUS', 9, '1997-04-09', '1997-05-07', '1997-04-16', 3, 8.85000038, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'PERIC', 2, '1997-04-10', '1997-05-08', '1997-04-29', 1, 69.3199997, 'Pericles Comidas cl??sicas', 'Calle Dr. Jorge Cash 321', 'M??xico D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES (DEFAULT,'HUNGO', 6, '1997-04-11', '1997-05-09', '1997-04-16', 2, 16.7399998, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (DEFAULT,'WHITC', 4, '1997-04-11', '1997-05-09', '1997-04-18', 3, 59.1300011, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES (DEFAULT,'MEREP', 3, '1997-04-14', '1997-05-12', '1997-04-21', 3, 7.13000011, 'M??re Paillarde', '43 rue St. Laurent', 'Montr??al', 'Qu??bec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES (DEFAULT,'KOENE', 9, '1997-04-15', '1997-05-13', '1997-05-02', 2, 21.1900005, 'K??niglich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'ANTON', 7, '1997-04-15', '1997-05-13', '1997-04-22', 1, 47.4500008, 'Antonio Moreno Taquer??a', 'Mataderos  2312', 'M??xico D.F.', NULL, '05023', 'Mexico');
INSERT INTO orders VALUES (DEFAULT,'OTTIK', 1, '1997-04-16', '1997-05-14', '1997-05-13', 2, 4.98999977, 'Ottilies K??seladen', 'Mehrheimerstr. 369', 'K??ln', NULL, '50739', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'BLAUS', 4, '1997-04-17', '1997-05-15', '1997-04-29', 1, 0.150000006, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'SAVEA', 6, '1997-04-18', '1997-05-16', '1997-04-28', 3, 367.630005, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (DEFAULT,'BONAP', 4, '1997-04-18', '1997-05-16', '1997-04-21', 3, 350.640015, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES (DEFAULT,'FAMIA', 7, '1997-04-21', '1997-05-19', '1997-04-24', 2, 3.52999997, 'Familia Arquibaldo', 'Rua Or??s, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'WANDK', 7, '1997-04-22', '1997-06-03', '1997-04-28', 1, 105.650002, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'ERNSH', 3, '1997-04-22', '1997-05-20', '1997-05-16', 2, 789.950012, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (DEFAULT,'QUICK', 2, '1997-04-23', '1997-05-07', '1997-05-23', 1, 204.470001, 'QUICK-Stop', 'Taucherstra??e 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'HUNGO', 2, '1997-04-24', '1997-05-22', '1997-05-01', 3, 62.7799988, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (DEFAULT,'NORTS', 3, '1997-04-24', '1997-05-22', '1997-04-29', 3, 32.0699997, 'North/South', 'South House 300 Queensbridge', 'London', NULL, 'SW7 1RZ', 'UK');
INSERT INTO orders VALUES (DEFAULT,'TORTU', 4, '1997-04-25', '1997-05-09', '1997-05-05', 2, 218.149994, 'Tortuga Restaurante', 'Avda. Azteca 123', 'M??xico D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES (DEFAULT,'CHOPS', 6, '1997-04-28', '1997-05-26', '1997-05-01', 3, 91.7600021, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland');
INSERT INTO orders VALUES (DEFAULT,'SANTG', 7, '1997-04-29', '1997-05-27', '1997-05-01', 1, 13.3699999, 'Sant?? Gourmet', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Norway');
INSERT INTO orders VALUES (DEFAULT,'CACTU', 8, '1997-04-29', '1997-05-27', '1997-05-02', 2, 17.2199993, 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO orders VALUES (DEFAULT,'LEHMS', 4, '1997-04-30', '1997-05-28', '1997-05-06', 1, 45.3300018, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'SEVES', 7, '1997-05-01', '1997-05-29', '1997-05-30', 2, 77.6299973, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK');
INSERT INTO orders VALUES (DEFAULT,'BERGS', 1, '1997-05-01', '1997-05-29', '1997-05-07', 2, 244.789993, 'Berglunds snabbk??p', 'Berguvsv??gen  8', 'Lule??', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (DEFAULT,'BONAP', 1, '1997-05-02', '1997-05-30', '1997-05-23', 2, 11.0600004, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES (DEFAULT,'WARTH', 4, '1997-05-05', '1997-06-02', '1997-05-15', 2, 58.5900002, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO orders VALUES (DEFAULT,'QUICK', 7, '1997-05-05', '1997-06-02', '1997-05-07', 1, 41.9000015, 'QUICK-Stop', 'Taucherstra??e 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'GREAL', 6, '1997-05-06', '1997-05-20', '1997-05-09', 2, 3.3499999, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO orders VALUES (DEFAULT,'MAISD', 5, '1997-05-07', '1997-06-04', '1997-05-09', 2, 66.6900024, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Belgium');
INSERT INTO orders VALUES (DEFAULT,'PICCO', 3, '1997-05-08', '1997-06-05', '1997-05-12', 2, 339.220001, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria');
INSERT INTO orders VALUES (DEFAULT,'OCEAN', 7, '1997-05-08', '1997-06-05', '1997-05-19', 1, 8.11999989, 'Oc??ano Atl??ntico Ltda.', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO orders VALUES (DEFAULT,'EASTC', 7, '1997-05-09', '1997-06-06', '1997-05-12', 3, 74.4599991, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK');
INSERT INTO orders VALUES (DEFAULT,'FOLKO', 8, '1997-05-12', '1997-06-09', '1997-05-22', 1, 188.039993, 'Folk och f?? HB', '??kergatan 24', 'Br??cke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (DEFAULT,'LEHMS', 8, '1997-05-12', '1997-06-09', '1997-05-14', 2, 27.9400005, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'ANTON', 4, '1997-05-13', '1997-06-10', '1997-05-21', 1, 15.6400003, 'Antonio Moreno Taquer??a', 'Mataderos  2312', 'M??xico D.F.', NULL, '05023', 'Mexico');
INSERT INTO orders VALUES (DEFAULT,'LEHMS', 3, '1997-05-14', '1997-06-11', '1997-06-06', 2, 58.8800011, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'RICSU', 1, '1997-05-14', '1997-05-28', '1997-05-19', 1, 78.8499985, 'Richter Supermarkt', 'Starenweg 5', 'Gen??ve', NULL, '1204', 'Switzerland');
INSERT INTO orders VALUES (DEFAULT,'BSBEV', 9, '1997-05-15', '1997-06-12', '1997-05-16', 3, 4.86999989, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO orders VALUES (DEFAULT,'BSBEV', 6, '1997-05-16', '1997-06-13', '1997-05-23', 3, 12.3599997, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO orders VALUES (DEFAULT,'QUICK', 3, '1997-05-19', '1997-06-16', '1997-06-13', 3, 1007.64001, 'QUICK-Stop', 'Taucherstra??e 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'HANAR', 2, '1997-05-19', '1997-06-16', '1997-05-29', 1, 68.6500015, 'Hanari Carnes', 'Rua do Pa??o, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'KOENE', 1, '1997-05-20', '1997-06-17', '1997-05-26', 3, 10.9499998, 'K??niglich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'LILAS', 8, '1997-05-21', '1997-06-18', '1997-05-23', 2, 48.1699982, 'LILA-Supermercado', 'Carrera 52 con Ave. Bol??var #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO orders VALUES (DEFAULT,'LONEP', 4, '1997-05-21', '1997-06-18', '1997-05-30', 1, 24.9099998, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO orders VALUES (DEFAULT,'LAZYK', 8, '1997-05-22', '1997-06-19', '1997-06-26', 2, 11.9200001, 'Lazy K Kountry Store', '12 Orchestra Terrace', 'Walla Walla', 'WA', '99362', 'USA');
INSERT INTO orders VALUES (DEFAULT,'VICTE', 1, '1997-05-23', '1997-06-20', '1997-05-27', 3, 194.720001, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France');
INSERT INTO orders VALUES (DEFAULT,'SEVES', 3, '1997-05-23', '1997-06-20', '1997-06-02', 2, 178.429993, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK');
INSERT INTO orders VALUES (DEFAULT,'TOMSP', 3, '1997-05-26', '1997-06-23', '1997-06-02', 2, 1.42999995, 'Toms Spezialit??ten', 'Luisenstr. 48', 'M??nster', NULL, '44087', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'QUICK', 5, '1997-05-27', '1997-06-10', '1997-05-30', 1, 171.240005, 'QUICK-Stop', 'Taucherstra??e 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'GODOS', 7, '1997-05-28', '1997-06-25', '1997-06-06', 3, 4.32000017, 'Godos Cocina T??pica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain');
INSERT INTO orders VALUES (DEFAULT,'FURIB', 4, '1997-05-28', '1997-07-09', '1997-06-06', 3, 72.9499969, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal');
INSERT INTO orders VALUES (DEFAULT,'HILAA', 2, '1997-05-29', '1997-06-26', '1997-06-05', 1, 83.2200012, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Crist??bal', 'T??chira', '5022', 'Venezuela');
INSERT INTO orders VALUES (DEFAULT,'WARTH', 2, '1997-05-30', '1997-06-27', '1997-06-03', 2, 149.490005, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO orders VALUES (DEFAULT,'OTTIK', 4, '1997-05-30', '1997-06-27', '1997-06-05', 3, 120.970001, 'Ottilies K??seladen', 'Mehrheimerstr. 369', 'K??ln', NULL, '50739', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'SAVEA', 6, '1997-06-02', '1997-06-30', '1997-06-04', 3, 252.490005, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (DEFAULT,'SIMOB', 2, '1997-06-03', '1997-07-15', '1997-06-13', 1, 9.80000019, 'Simons bistro', 'Vinb??ltet 34', 'Kobenhavn', NULL, '1734', 'Denmark');
INSERT INTO orders VALUES (DEFAULT,'LEHMS', 9, '1997-06-03', '1997-06-17', '1997-06-06', 2, 96.7200012, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'AROUT', 1, '1997-06-04', '1997-07-02', '1997-06-10', 2, 72.9700012, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES (DEFAULT,'BLONP', 6, '1997-06-05', '1997-07-03', '1997-06-13', 1, 8.05000019, 'Blondel p??re et fils', '24, place Kl??ber', 'Strasbourg', NULL, '67000', 'France');
INSERT INTO orders VALUES (DEFAULT,'FRANK', 8, '1997-06-06', '1997-07-04', '1997-06-09', 1, 36.6500015, 'Frankenversand', 'Berliner Platz 43', 'M??nchen', NULL, '80805', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'FOLKO', 2, '1997-06-06', '1997-07-04', '1997-06-09', 2, 242.210007, 'Folk och f?? HB', '??kergatan 24', 'Br??cke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (DEFAULT,'REGGC', 1, '1997-06-09', '1997-07-07', '1997-06-12', 1, 22.9500008, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO orders VALUES (DEFAULT,'RICAR', 2, '1997-06-10', '1997-07-22', '1997-06-24', 2, 60.4300003, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'RATTC', 4, '1997-06-10', '1997-07-08', '1997-06-16', 3, 13.75, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES (DEFAULT,'MEREP', 8, '1997-06-11', '1997-07-09', '1997-06-18', 2, 7.1500001, 'M??re Paillarde', '43 rue St. Laurent', 'Montr??al', 'Qu??bec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES (DEFAULT,'BLONP', 9, '1997-06-12', '1997-07-10', '1997-06-18', 1, 88.4000015, 'Blondel p??re et fils', '24, place Kl??ber', 'Strasbourg', NULL, '67000', 'France');
INSERT INTO orders VALUES (DEFAULT,'HUNGO', 1, '1997-06-12', '1997-07-10', '1997-06-17', 1, 33.9700012, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (DEFAULT,'GALED', 3, '1997-06-13', '1997-07-11', '1997-07-09', 3, 6.53999996, 'Galer??a del gastron??mo', 'Rambla de Catalu??a, 23', 'Barcelona', NULL, '8022', 'Spain');
INSERT INTO orders VALUES (DEFAULT,'RATTC', 5, '1997-06-16', '1997-07-14', '1997-07-11', 1, 58.9799995, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES (DEFAULT,'MEREP', 3, '1997-06-17', '1997-07-15', '1997-06-19', 3, 188.990005, 'M??re Paillarde', '43 rue St. Laurent', 'Montr??al', 'Qu??bec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES (DEFAULT,'ERNSH', 8, '1997-06-17', '1997-07-29', '1997-07-04', 3, 26.0599995, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (DEFAULT,'BERGS', 3, '1997-06-18', '1997-07-16', '1997-06-25', 2, 116.43, 'Berglunds snabbk??p', 'Berguvsv??gen  8', 'Lule??', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (DEFAULT,'ANTON', 7, '1997-06-19', '1997-07-17', '1997-06-20', 3, 84.8399963, 'Antonio Moreno Taquer??a', 'Mataderos  2312', 'M??xico D.F.', NULL, '05023', 'Mexico');
INSERT INTO orders VALUES (DEFAULT,'TRAIH', 4, '1997-06-19', '1997-07-17', '1997-06-30', 2, 37.5999985, 'Trail''s Head Gourmet Provisioners', '722 DaVinci Blvd.', 'Kirkland', 'WA', '98034', 'USA');
INSERT INTO orders VALUES (DEFAULT,'MORGK', 5, '1997-06-20', '1997-07-04', '1997-06-30', 1, 127.339996, 'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig', NULL, '04179', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'TORTU', 3, '1997-06-23', '1997-07-07', '1997-06-30', 3, 18.5599995, 'Tortuga Restaurante', 'Avda. Azteca 123', 'M??xico D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES (DEFAULT,'TRAIH', 9, '1997-06-23', '1997-08-04', '1997-06-30', 2, 25.4099998, 'Trail''s Head Gourmet Provisioners', '722 DaVinci Blvd.', 'Kirkland', 'WA', '98034', 'USA');
INSERT INTO orders VALUES (DEFAULT,'BSBEV', 4, '1997-06-24', '1997-07-22', '1997-07-25', 3, 29.6000004, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO orders VALUES (DEFAULT,'LETSS', 1, '1997-06-25', '1997-07-23', '1997-07-04', 2, 13.7299995, 'Let''s Stop N Shop', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA');
INSERT INTO orders VALUES (DEFAULT,'OTTIK', 4, '1997-06-26', '1997-07-24', '1997-07-01', 3, 75.8899994, 'Ottilies K??seladen', 'Mehrheimerstr. 369', 'K??ln', NULL, '50739', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'FAMIA', 3, '1997-06-26', '1997-07-24', '1997-07-02', 1, 3.00999999, 'Familia Arquibaldo', 'Rua Or??s, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'BLAUS', 3, '1997-06-27', '1997-07-25', '1997-07-14', 2, 27.7099991, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'WARTH', 2, '1997-06-30', '1997-07-28', '1997-07-04', 2, 7.28000021, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO orders VALUES (DEFAULT,'BLONP', 4, '1997-06-30', '1997-07-28', '1997-07-04', 1, 59.1399994, 'Blondel p??re et fils', '24, place Kl??ber', 'Strasbourg', NULL, '67000', 'France');
INSERT INTO orders VALUES (DEFAULT,'WELLI', 7, '1997-07-01', '1997-07-29', '1997-07-10', 1, 13.4099998, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'REGGC', 9, '1997-07-02', '1997-07-30', '1997-07-09', 1, 0.479999989, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO orders VALUES (DEFAULT,'QUEDE', 1, '1997-07-02', '1997-07-30', '1997-07-09', 1, 62.5200005, 'Que Del??cia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'QUICK', 2, '1997-07-03', '1997-07-31', '1997-07-10', 3, 194.669998, 'QUICK-Stop', 'Taucherstra??e 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'GREAL', 8, '1997-07-04', '1997-08-01', '1997-07-14', 2, 4.42000008, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO orders VALUES (DEFAULT,'MEREP', 4, '1997-07-07', '1997-08-04', '1997-07-14', 3, 44.7700005, 'M??re Paillarde', '43 rue St. Laurent', 'Montr??al', 'Qu??bec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES (DEFAULT,'VAFFE', 1, '1997-07-07', '1997-07-21', '1997-07-16', 1, 55.9199982, 'Vaffeljernet', 'Smagsloget 45', '??rhus', NULL, '8200', 'Denmark');
INSERT INTO orders VALUES (DEFAULT,'LEHMS', 3, '1997-07-08', '1997-08-05', '1997-07-16', 1, 32.0999985, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'LEHMS', 7, '1997-07-09', '1997-08-06', '1997-08-13', 2, 174.199997, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'OLDWO', 3, '1997-07-09', '1997-08-06', '1997-07-16', 2, 5.23999977, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO orders VALUES (DEFAULT,'ERNSH', 2, '1997-07-10', '1997-08-07', '1997-07-14', 1, 96.7799988, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (DEFAULT,'WHITC', 8, '1997-07-11', '1997-08-08', '1997-08-12', 1, 16.3400002, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES (DEFAULT,'PICCO', 7, '1997-07-11', '1997-08-08', '1997-07-18', 3, 35.1199989, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria');
INSERT INTO orders VALUES (DEFAULT,'RATTC', 1, '1997-07-14', '1997-08-11', '1997-07-18', 3, 44.4199982, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES (DEFAULT,'BSBEV', 6, '1997-07-15', '1997-08-26', '1997-07-21', 3, 29.9799995, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO orders VALUES (DEFAULT,'HUNGC', 4, '1997-07-16', '1997-08-13', '1997-07-21', 1, 45.1300011, 'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA');
INSERT INTO orders VALUES (DEFAULT,'HILAA', 7, '1997-07-16', '1997-08-27', '1997-07-22', 1, 58.2999992, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Crist??bal', 'T??chira', '5022', 'Venezuela');
INSERT INTO orders VALUES (DEFAULT,'VAFFE', 8, '1997-07-17', '1997-08-14', '1997-07-22', 2, 2.92000008, 'Vaffeljernet', 'Smagsloget 45', '??rhus', NULL, '8200', 'Denmark');
INSERT INTO orders VALUES (DEFAULT,'SAVEA', 8, '1997-07-18', '1997-08-15', '1997-08-08', 2, 48.7700005, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (DEFAULT,'FURIB', 1, '1997-07-18', '1997-08-15', '1997-07-29', 1, 7.46000004, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal');
INSERT INTO orders VALUES (DEFAULT,'MEREP', 1, '1997-07-21', '1997-08-18', '1997-07-29', 2, 379.130005, 'M??re Paillarde', '43 rue St. Laurent', 'Montr??al', 'Qu??bec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES (DEFAULT,'TRADH', 4, '1997-07-22', '1997-08-19', '1997-07-31', 3, 79.4000015, 'Tradi??ao Hipermercados', 'Av. In??s de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'SAVEA', 5, '1997-07-22', '1997-08-19', '1997-07-25', 1, 200.240005, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (DEFAULT,'TOMSP', 4, '1997-07-23', '1997-08-20', '1997-08-01', 2, 27.7900009, 'Toms Spezialit??ten', 'Luisenstr. 48', 'M??nster', NULL, '44087', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'DUMON', 7, '1997-07-24', '1997-08-21', '1997-07-30', 2, 1.85000002, 'Du monde entier', '67, rue des Cinquante Otages', 'Nantes', NULL, '44000', 'France');
INSERT INTO orders VALUES (DEFAULT,'LAMAI', 8, '1997-07-25', '1997-08-22', '1997-08-06', 1, 26.7800007, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO orders VALUES (DEFAULT,'WOLZA', 6, '1997-07-25', '1997-08-22', '1997-08-01', 2, 80.6500015, 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Poland');
INSERT INTO orders VALUES (DEFAULT,'SAVEA', 1, '1997-07-28', '1997-08-25', '1997-08-01', 2, 544.080017, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (DEFAULT,'HILAA', 4, '1997-07-29', '1997-08-26', '1997-08-01', 2, 8.10999966, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Crist??bal', 'T??chira', '5022', 'Venezuela');
INSERT INTO orders VALUES (DEFAULT,'BLAUS', 8, '1997-07-29', '1997-08-26', '1997-08-01', 3, 1.92999995, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'WILMK', 2, '1997-07-30', '1997-08-27', '1997-08-06', 3, 0.75, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finland');
INSERT INTO orders VALUES (DEFAULT,'GREAL', 1, '1997-07-31', '1997-08-28', '1997-08-05', 2, 116.529999, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO orders VALUES (DEFAULT,'GREAL', 4, '1997-07-31', '1997-08-28', '1997-08-04', 2, 18.5300007, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO orders VALUES (DEFAULT,'MEREP', 1, '1997-08-01', '1997-09-12', '1997-08-08', 1, 154.679993, 'M??re Paillarde', '43 rue St. Laurent', 'Montr??al', 'Qu??bec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES (DEFAULT,'MEREP', 3, '1997-08-04', '1997-09-01', '1997-08-07', 3, 91.0500031, 'M??re Paillarde', '43 rue St. Laurent', 'Montr??al', 'Qu??bec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES (DEFAULT,'LAUGB', 2, '1997-08-05', '1997-09-02', '1997-08-14', 3, 0.939999998, 'Laughing Bacchus Wine Cellars', '2319 Elm St.', 'Vancouver', 'BC', 'V3F 2K1', 'Canada');
INSERT INTO orders VALUES (DEFAULT,'ISLAT', 4, '1997-08-05', '1997-09-02', '1997-08-11', 2, 23.7299995, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO orders VALUES (DEFAULT,'RICAR', 4, '1997-08-06', '1997-09-03', '1997-08-11', 3, 50.9700012, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'FRANK', 8, '1997-08-07', '1997-09-04', '1997-08-12', 2, 97.1800003, 'Frankenversand', 'Berliner Platz 43', 'M??nchen', NULL, '80805', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'THECR', 4, '1997-08-07', '1997-09-04', '1997-08-19', 2, 94.8000031, 'The Cracker Box', '55 Grizzly Peak Rd.', 'Butte', 'MT', '59801', 'USA');
INSERT INTO orders VALUES (DEFAULT,'ANATR', 3, '1997-08-08', '1997-09-05', '1997-08-14', 1, 43.9000015, 'Ana Trujillo Emparedados y helados', 'Avda. de la Constituci??n 2222', 'M??xico D.F.', NULL, '05021', 'Mexico');
INSERT INTO orders VALUES (DEFAULT,'BERGS', 1, '1997-08-11', '1997-09-08', '1997-08-20', 2, 138.690002, 'Berglunds snabbk??p', 'Berguvsv??gen  8', 'Lule??', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (DEFAULT,'SAVEA', 8, '1997-08-11', '1997-09-22', '1997-08-21', 3, 107.459999, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (DEFAULT,'BLONP', 4, '1997-08-12', '1997-09-09', '1997-08-20', 3, 30.3600006, 'Blondel p??re et fils', '24, place Kl??ber', 'Strasbourg', NULL, '67000', 'France');
INSERT INTO orders VALUES (DEFAULT,'GODOS', 4, '1997-08-12', '1997-09-09', '1997-08-20', 3, 85.4599991, 'Godos Cocina T??pica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain');
INSERT INTO orders VALUES (DEFAULT,'KOENE', 1, '1997-08-13', '1997-09-10', '1997-08-19', 2, 32.3499985, 'K??niglich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'LAMAI', 8, '1997-08-14', '1997-09-11', '1997-08-15', 1, 0.870000005, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO orders VALUES (DEFAULT,'WANDK', 8, '1997-08-14', '1997-09-11', '1997-08-19', 1, 41.3800011, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'ERNSH', 7, '1997-08-15', '1997-09-12', '1997-08-18', 3, 477.899994, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (DEFAULT,'FOLIG', 4, '1997-08-15', '1997-09-12', '1997-08-21', 3, 487.380005, 'Folies gourmandes', '184, chauss??e de Tournai', 'Lille', NULL, '59000', 'France');
INSERT INTO orders VALUES (DEFAULT,'MAGAA', 8, '1997-08-18', '1997-09-15', '1997-08-21', 3, 47.4599991, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy');
INSERT INTO orders VALUES (DEFAULT,'WARTH', 4, '1997-08-19', '1997-09-16', '1997-08-26', 1, 1.14999998, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO orders VALUES (DEFAULT,'QUEEN', 6, '1997-08-19', '1997-09-16', '1997-08-26', 1, 201.289993, 'Queen Cozinha', 'Alameda dos Can??rios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'LINOD', 3, '1997-08-20', '1997-09-17', '1997-09-01', 1, 158.440002, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO orders VALUES (DEFAULT,'SANTG', 7, '1997-08-20', '1997-09-17', '1997-08-27', 3, 38.6399994, 'Sant?? Gourmet', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Norway');
INSERT INTO orders VALUES (DEFAULT,'WANDK', 4, '1997-08-21', '1997-09-18', '1997-08-28', 1, 23.5499992, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'HILAA', 4, '1997-08-22', '1997-09-19', '1997-08-26', 2, 179.610001, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Crist??bal', 'T??chira', '5022', 'Venezuela');
INSERT INTO orders VALUES (DEFAULT,'SIMOB', 7, '1997-08-22', '1997-09-19', '1997-09-05', 3, 41.8899994, 'Simons bistro', 'Vinb??ltet 34', 'Kobenhavn', NULL, '1734', 'Denmark');
INSERT INTO orders VALUES (DEFAULT,'ALFKI', 6, '1997-08-25', '1997-09-22', '1997-09-02', 1, 29.4599991, 'Alfreds Futterkiste', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'WELLI', 3, '1997-08-25', '1997-09-22', '1997-09-01', 2, 0.140000001, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'HANAR', 4, '1997-08-26', '1997-09-23', '1997-09-02', 1, 12.4099998, 'Hanari Carnes', 'Rua do Pa??o, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'HUNGO', 9, '1997-08-27', '1997-10-08', '1997-09-03', 3, 142.330002, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (DEFAULT,'QUEDE', 4, '1997-08-27', '1997-09-10', '1997-09-03', 2, 45.5400009, 'Que Del??cia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'RICAR', 5, '1997-08-28', '1997-10-09', '1997-09-09', 2, 14.25, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'MAISD', 5, '1997-08-28', '1997-09-25', '1997-08-29', 3, 6.19999981, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Belgium');
INSERT INTO orders VALUES (DEFAULT,'FAMIA', 5, '1997-08-29', '1997-09-26', '1997-09-03', 3, 176.809998, 'Familia Arquibaldo', 'Rua Or??s, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'WANDK', 8, '1997-09-01', '1997-09-29', '1997-09-11', 2, 20.6000004, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'GOURL', 4, '1997-09-01', '1997-09-29', '1997-09-08', 2, 7.13999987, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'FRANK', 1, '1997-09-02', '1997-09-30', '1997-09-19', 1, 93.25, 'Frankenversand', 'Berliner Platz 43', 'M??nchen', NULL, '80805', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'BERGS', 5, '1997-09-02', '1997-09-30', '1997-09-11', 1, 55.2599983, 'Berglunds snabbk??p', 'Berguvsv??gen  8', 'Lule??', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (DEFAULT,'REGGC', 1, '1997-09-03', '1997-10-01', '1997-09-11', 2, 4.40999985, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO orders VALUES (DEFAULT,'GREAL', 6, '1997-09-04', '1997-10-02', '1997-09-10', 1, 57.1500015, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO orders VALUES (DEFAULT,'SAVEA', 2, '1997-09-04', '1997-10-02', '1997-09-15', 2, 352.690002, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (DEFAULT,'QUICK', 4, '1997-09-05', '1997-10-03', '1997-09-08', 1, 364.149994, 'QUICK-Stop', 'Taucherstra??e 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'QUEEN', 7, '1997-09-05', '1997-10-03', '1997-09-10', 2, 105.809998, 'Queen Cozinha', 'Alameda dos Can??rios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'HUNGC', 8, '1997-09-08', '1997-10-06', '1997-10-15', 1, 111.290001, 'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA');
INSERT INTO orders VALUES (DEFAULT,'HUNGO', 7, '1997-09-09', '1997-10-07', '1997-09-15', 3, 17.5499992, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (DEFAULT,'LONEP', 3, '1997-09-09', '1997-10-07', '1997-09-18', 2, 1.27999997, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO orders VALUES (DEFAULT,'BONAP', 2, '1997-09-10', '1997-09-24', '1997-10-03', 2, 113.150002, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES (DEFAULT,'FURIB', 1, '1997-09-10', '1997-10-08', '1997-09-19', 3, 1.26999998, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal');
INSERT INTO orders VALUES (DEFAULT,'LONEP', 1, '1997-09-11', '1997-10-09', '1997-09-17', 2, 26.3099995, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO orders VALUES (DEFAULT,'RICSU', 7, '1997-09-12', '1997-10-10', '1997-09-22', 2, 232.419998, 'Richter Supermarkt', 'Starenweg 5', 'Gen??ve', NULL, '1204', 'Switzerland');
INSERT INTO orders VALUES (DEFAULT,'ERNSH', 7, '1997-09-12', '1997-10-10', '1997-09-19', 1, 78.0899963, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (DEFAULT,'WANDK', 1, '1997-09-15', '1997-10-13', '1997-09-23', 2, 47.2200012, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'SIMOB', 2, '1997-09-15', '1997-10-13', '1997-09-22', 1, 24.3899994, 'Simons bistro', 'Vinb??ltet 34', 'Kobenhavn', NULL, '1734', 'Denmark');
INSERT INTO orders VALUES (DEFAULT,'FRANK', 4, '1997-09-16', '1997-10-14', '1997-09-18', 1, 203.479996, 'Frankenversand', 'Berliner Platz 43', 'M??nchen', NULL, '80805', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'FRANR', 1, '1997-09-17', '1997-10-15', '1997-09-24', 1, 30.3400002, 'France restauration', '54, rue Royale', 'Nantes', NULL, '44000', 'France');
INSERT INTO orders VALUES (DEFAULT,'BERGS', 9, '1997-09-17', '1997-10-01', '1997-09-26', 2, 95.75, 'Berglunds snabbk??p', 'Berguvsv??gen  8', 'Lule??', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (DEFAULT,'WILMK', 2, '1997-09-18', '1997-10-16', '1997-09-19', 1, 22.7600002, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finland');
INSERT INTO orders VALUES (DEFAULT,'ISLAT', 4, '1997-09-18', '1997-10-16', '1997-09-30', 2, 0.899999976, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO orders VALUES (DEFAULT,'FRANK', 5, '1997-09-19', '1997-10-17', '1997-09-23', 2, 31.8500004, 'Frankenversand', 'Berliner Platz 43', 'M??nchen', NULL, '80805', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'TORTU', 2, '1997-09-22', '1997-10-20', '1997-09-29', 2, 2.00999999, 'Tortuga Restaurante', 'Avda. Azteca 123', 'M??xico D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES (DEFAULT,'ANTON', 1, '1997-09-22', '1997-10-20', '1997-09-26', 3, 4.03000021, 'Antonio Moreno Taquer??a', 'Mataderos  2312', 'M??xico D.F.', NULL, '05023', 'Mexico');
INSERT INTO orders VALUES (DEFAULT,'SAVEA', 7, '1997-09-23', '1997-10-21', '1997-10-16', 3, 388.980011, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (DEFAULT,'BLONP', 8, '1997-09-23', '1997-10-21', '1997-09-30', 3, 27.9400005, 'Blondel p??re et fils', '24, place Kl??ber', 'Strasbourg', NULL, '67000', 'France');
INSERT INTO orders VALUES (DEFAULT,'OLDWO', 1, '1997-09-24', '1997-10-22', '1997-09-26', 1, 26.6100006, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO orders VALUES (DEFAULT,'GREAL', 3, '1997-09-25', '1997-10-23', '1997-09-30', 3, 76.1299973, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO orders VALUES (DEFAULT,'ANTON', 3, '1997-09-25', '1997-10-23', '1997-10-01', 2, 36.1300011, 'Antonio Moreno Taquer??a', 'Mataderos  2312', 'M??xico D.F.', NULL, '05023', 'Mexico');
INSERT INTO orders VALUES (DEFAULT,'DUMON', 2, '1997-09-26', '1997-10-24', '1997-10-01', 1, 4.4000001, 'Du monde entier', '67, rue des Cinquante Otages', 'Nantes', NULL, '44000', 'France');
INSERT INTO orders VALUES (DEFAULT,'OTTIK', 3, '1997-09-26', '1997-10-24', '1997-09-30', 1, 145.630005, 'Ottilies K??seladen', 'Mehrheimerstr. 369', 'K??ln', NULL, '50739', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'GOURL', 4, '1997-09-29', '1997-10-13', '1997-10-03', 2, 33.75, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'PICCO', 2, '1997-09-30', '1997-10-28', '1997-10-08', 1, 96.5, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria');
INSERT INTO orders VALUES (DEFAULT,'HUNGO', 9, '1997-09-30', '1997-10-28', '1997-10-30', 2, 296.429993, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (DEFAULT,'VAFFE', 4, '1997-10-01', '1997-10-15', '1997-10-07', 2, 299.089996, 'Vaffeljernet', 'Smagsloget 45', '??rhus', NULL, '8200', 'Denmark');
INSERT INTO orders VALUES (DEFAULT,'BERGS', 1, '1997-10-01', '1997-10-29', '1997-10-07', 2, 13.4200001, 'Berglunds snabbk??p', 'Berguvsv??gen  8', 'Lule??', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (DEFAULT,'HANAR', 1, '1997-10-02', '1997-10-30', '1997-10-03', 1, 15.8000002, 'Hanari Carnes', 'Rua do Pa??o, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'QUICK', 2, '1997-10-03', '1997-11-14', '1997-10-22', 2, 810.049988, 'QUICK-Stop', 'Taucherstra??e 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'ALFKI', 4, '1997-10-03', '1997-10-31', '1997-10-13', 2, 61.0200005, 'Alfred''s Futterkiste', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'WHITC', 3, '1997-10-06', '1997-10-20', '1997-10-10', 3, 139.339996, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES (DEFAULT,'QUICK', 8, '1997-10-06', '1997-11-03', '1997-10-09', 3, 398.359985, 'QUICK-Stop', 'Taucherstra??e 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'WILMK', 7, '1997-10-07', '1997-11-18', '1997-10-14', 1, 16.7199993, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finland');
INSERT INTO orders VALUES (DEFAULT,'WHITC', 8, '1997-10-08', '1997-11-19', '1997-10-14', 3, 102.550003, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES (DEFAULT,'LINOD', 3, '1997-10-08', '1997-11-05', '1997-10-14', 1, 45.5200005, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO orders VALUES (DEFAULT,'ERNSH', 4, '1997-10-09', '1997-11-06', '1997-10-17', 1, 272.470001, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (DEFAULT,'MORGK', 3, '1997-10-09', '1997-11-06', '1997-10-13', 3, 0.579999983, 'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig', NULL, '04179', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'SAVEA', 3, '1997-10-10', '1997-11-07', '1997-10-16', 1, 65.0999985, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (DEFAULT,'HUNGO', 6, '1997-10-13', '1997-10-27', '1997-10-15', 3, 220.309998, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (DEFAULT,'ALFKI', 4, '1997-10-13', '1997-11-24', '1997-10-21', 1, 23.9400005, 'Alfred''s Futterkiste', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'FOLKO', 6, '1997-10-14', '1997-11-11', '1997-10-20', 2, 152.300003, 'Folk och f?? HB', '??kergatan 24', 'Br??cke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (DEFAULT,'QUEEN', 6, '1997-10-14', '1997-11-11', '1997-11-07', 1, 4.78000021, 'Queen Cozinha', 'Alameda dos Can??rios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'HILAA', 9, '1997-10-15', '1997-11-12', '1997-11-18', 2, 3.51999998, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Crist??bal', 'T??chira', '5022', 'Venezuela');
INSERT INTO orders VALUES (DEFAULT,'OLDWO', 8, '1997-10-16', '1997-11-13', '1997-10-21', 3, 135.630005, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO orders VALUES (DEFAULT,'AROUT', 4, '1997-10-16', '1997-10-30', '1997-10-23', 3, 21.7399998, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES (DEFAULT,'THEBI', 6, '1997-10-17', '1997-11-28', '1997-11-05', 2, 2.96000004, 'The Big Cheese', '89 Jefferson Way Suite 2', 'Portland', 'OR', '97201', 'USA');
INSERT INTO orders VALUES (DEFAULT,'GOURL', 1, '1997-10-17', '1997-11-14', '1997-11-20', 3, 210.800003, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'FRANS', 1, '1997-10-20', '1997-11-17', '1997-10-23', 1, 4.98000002, 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italy');
INSERT INTO orders VALUES (DEFAULT,'SAVEA', 5, '1997-10-21', '1997-12-02', '1997-10-29', 2, 52.4099998, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (DEFAULT,'HUNGO', 3, '1997-10-21', '1997-11-18', '1997-10-31', 1, 89.9300003, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (DEFAULT,'SAVEA', 1, '1997-10-22', '1997-11-19', '1997-10-24', 1, 167.050003, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (DEFAULT,'SAVEA', 5, '1997-10-22', '1997-11-19', '1997-10-27', 3, 24.4899998, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (DEFAULT,'BONAP', 3, '1997-10-23', '1997-11-06', '1997-10-29', 1, 63.2000008, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES (DEFAULT,'RANCH', 4, '1997-10-24', '1997-11-21', '1997-10-27', 2, 22.5699997, 'Rancho grande', 'Av. del Libertador 900', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO orders VALUES (DEFAULT,'FRANK', 1, '1997-10-24', '1997-11-21', '1997-10-29', 2, 59.25, 'Frankenversand', 'Berliner Platz 43', 'M??nchen', NULL, '80805', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'KOENE', 1, '1997-10-27', '1997-11-24', '1997-10-29', 3, 170.880005, 'K??niglich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'LETSS', 8, '1997-10-27', '1997-11-24', '1997-11-05', 2, 51.4399986, 'Let''s Stop N Shop', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA');
INSERT INTO orders VALUES (DEFAULT,'QUEDE', 8, '1997-10-28', '1997-11-11', '1997-11-05', 2, 9.52999973, 'Que Del??cia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'QUICK', 5, '1997-10-29', '1997-11-26', '1997-10-31', 3, 48.9199982, 'QUICK-Stop', 'Taucherstra??e 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'SAVEA', 8, '1997-10-29', '1997-12-10', '1997-11-04', 1, 74.5800018, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (DEFAULT,'WHITC', 3, '1997-10-30', '1997-11-27', '1997-11-25', 1, 21.7199993, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES (DEFAULT,'MEREP', 8, '1997-10-30', '1997-12-11', '1997-11-05', 2, 57.75, 'M??re Paillarde', '43 rue St. Laurent', 'Montr??al', 'Qu??bec', 'H1J 1C3', 'Canada');
INSERT INTO orders VALUES (DEFAULT,'FAMIA', 4, '1997-10-31', '1997-11-28', '1997-11-05', 3, 10.8299999, 'Familia Arquibaldo', 'Rua Or??s, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'EASTC', 4, '1997-11-03', '1997-11-17', '1997-12-05', 1, 16.5599995, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK');
INSERT INTO orders VALUES (DEFAULT,'REGGC', 2, '1997-11-03', '1997-12-01', '1997-12-05', 1, 89.9000015, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO orders VALUES (DEFAULT,'QUEEN', 4, '1997-11-04', '1997-12-02', '1997-11-11', 2, 58.3300018, 'Queen Cozinha', 'Alameda dos Can??rios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'LINOD', 8, '1997-11-04', '1997-12-16', '1997-11-14', 3, 141.059998, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO orders VALUES (DEFAULT,'BONAP', 5, '1997-11-05', '1997-12-03', '1997-11-14', 1, 20.1200008, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES (DEFAULT,'CHOPS', 7, '1997-11-06', '1997-12-04', '1997-11-14', 1, 96.6500015, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland');
INSERT INTO orders VALUES (DEFAULT,'BONAP', 3, '1997-11-06', '1997-12-04', '1997-11-07', 1, 16.9699993, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES (DEFAULT,'BERGS', 1, '1997-11-07', '1997-12-05', '1997-11-10', 3, 110.110001, 'Berglunds snabbk??p', 'Berguvsv??gen  8', 'Lule??', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (DEFAULT,'GOURL', 2, '1997-11-07', '1997-12-05', '1997-11-12', 3, 1.63, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'LETSS', 6, '1997-11-10', '1997-12-08', '1997-11-21', 2, 45.9700012, 'Let''s Stop N Shop', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA');
INSERT INTO orders VALUES (DEFAULT,'HUNGO', 9, '1997-11-11', '1997-12-09', '1997-11-21', 2, 44.0999985, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (DEFAULT,'VINET', 2, '1997-11-11', '1997-12-09', '1997-11-18', 2, 7.78999996, 'Vins et alcools Chevalier', '59 rue de l''Abbaye', 'Reims', NULL, '51100', 'France');
INSERT INTO orders VALUES (DEFAULT,'SPECD', 2, '1997-11-12', '1997-12-10', '1997-11-18', 1, 2.91000009, 'Sp??cialit??s du monde', '25, rue Lauriston', 'Paris', NULL, '75016', 'France');
INSERT INTO orders VALUES (DEFAULT,'VINET', 3, '1997-11-12', '1997-12-10', '1997-11-17', 3, 11.0799999, 'Vins et alcools Chevalier', '59 rue de l''Abbaye', 'Reims', NULL, '51100', 'France');
INSERT INTO orders VALUES (DEFAULT,'WHITC', 4, '1997-11-13', '1997-12-11', '1997-11-25', 2, 81.8799973, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES (DEFAULT,'AROUT', 4, '1997-11-14', '1997-11-28', '1997-11-18', 3, 10.96, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES (DEFAULT,'BOTTM', 3, '1997-11-14', '1997-12-12', '1997-11-18', 3, 243.729996, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES (DEFAULT,'AROUT', 1, '1997-11-17', '1997-12-15', '1997-11-21', 2, 23.7199993, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES (DEFAULT,'VAFFE', 6, '1997-11-17', '1997-12-15', '1997-11-24', 1, 69.1900024, 'Vaffeljernet', 'Smagsloget 45', '??rhus', NULL, '8200', 'Denmark');
INSERT INTO orders VALUES (DEFAULT,'QUICK', 9, '1997-11-18', '1997-12-16', '1997-11-27', 1, 3.51999998, 'QUICK-Stop', 'Taucherstra??e 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'CHOPS', 1, '1997-11-19', '1997-12-17', '1997-11-21', 3, 31.4300003, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland');
INSERT INTO orders VALUES (DEFAULT,'PICCO', 6, '1997-11-19', '1997-12-17', '1997-11-26', 1, 117.330002, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria');
INSERT INTO orders VALUES (DEFAULT,'SAVEA', 3, '1997-11-20', '1997-12-18', '1997-11-28', 1, 232.550003, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (DEFAULT,'ISLAT', 4, '1997-11-20', '1997-12-18', '1997-12-19', 2, 61.5299988, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO orders VALUES (DEFAULT,'WARTH', 9, '1997-11-21', '1997-12-19', '1997-11-24', 1, 79.3000031, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO orders VALUES (DEFAULT,'RICSU', 3, '1997-11-24', '1997-12-22', '1997-12-03', 3, 130.789993, 'Richter Supermarkt', 'Starenweg 5', 'Gen??ve', NULL, '1204', 'Switzerland');
INSERT INTO orders VALUES (DEFAULT,'NORTS', 2, '1997-11-24', '1997-12-22', '1997-11-28', 3, 1.38999999, 'North/South', 'South House 300 Queensbridge', 'London', NULL, 'SW7 1RZ', 'UK');
INSERT INTO orders VALUES (DEFAULT,'FRANS', 3, '1997-11-25', '1997-12-23', '1997-11-27', 1, 7.69999981, 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italy');
INSERT INTO orders VALUES (DEFAULT,'MAGAA', 6, '1997-11-25', '1997-12-23', '1997-11-27', 3, 2.38000011, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy');
INSERT INTO orders VALUES (DEFAULT,'BONAP', 4, '1997-11-26', '1997-12-24', '1997-11-28', 2, 16.7099991, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES (DEFAULT,'SPLIR', 8, '1997-11-27', '1997-12-25', '1997-12-02', 2, 73.2099991, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO orders VALUES (DEFAULT,'SAVEA', 6, '1997-11-27', '1997-12-25', '1997-12-15', 1, 8.18999958, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (DEFAULT,'RICSU', 3, '1997-11-28', '1997-12-26', '1997-12-04', 3, 138.169998, 'Richter Supermarkt', 'Starenweg 5', 'Gen??ve', NULL, '1204', 'Switzerland');
INSERT INTO orders VALUES (DEFAULT,'ANATR', 3, '1997-11-28', '1997-12-26', '1997-12-12', 3, 11.9899998, 'Ana Trujillo Emparedados y helados', 'Avda. de la Constituci??n 2222', 'M??xico D.F.', NULL, '05021', 'Mexico');
INSERT INTO orders VALUES (DEFAULT,'MAISD', 4, '1997-12-01', '1997-12-29', '1997-12-10', 1, 155.639999, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Belgium');
INSERT INTO orders VALUES (DEFAULT,'RATTC', 5, '1997-12-02', '1997-12-30', '1997-12-08', 2, 18.6599998, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES (DEFAULT,'FOLKO', 3, '1997-12-02', '1997-12-30', '1997-12-09', 1, 328.73999, 'Folk och f?? HB', '??kergatan 24', 'Br??cke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (DEFAULT,'FOLIG', 3, '1997-12-03', '1997-12-31', '1997-12-08', 3, 37.3499985, 'Folies gourmandes', '184, chauss??e de Tournai', 'Lille', NULL, '59000', 'France');
INSERT INTO orders VALUES (DEFAULT,'ERNSH', 6, '1997-12-03', '1997-12-31', '1997-12-08', 3, 145.449997, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (DEFAULT,'QUICK', 3, '1997-12-04', '1998-01-01', '1997-12-09', 3, 42.7400017, 'QUICK-Stop', 'Taucherstra??e 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'OTTIK', 4, '1997-12-05', '1998-01-02', '1997-12-09', 1, 157.550003, 'Ottilies K??seladen', 'Mehrheimerstr. 369', 'K??ln', NULL, '50739', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'SUPRD', 4, '1997-12-05', '1998-01-02', '1997-12-15', 3, 1.59000003, 'Supr??mes d??lices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO orders VALUES (DEFAULT,'AROUT', 3, '1997-12-08', '1998-01-05', '1997-12-15', 2, 146.320007, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES (DEFAULT,'VAFFE', 3, '1997-12-08', '1998-01-05', '1997-12-12', 1, 65.0599976, 'Vaffeljernet', 'Smagsloget 45', '??rhus', NULL, '8200', 'Denmark');
INSERT INTO orders VALUES (DEFAULT,'HANAR', 8, '1997-12-09', '1998-01-06', '1997-12-17', 3, 5.32000017, 'Hanari Carnes', 'Rua do Pa??o, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'ERNSH', 9, '1997-12-10', '1998-01-07', '1998-01-02', 2, 11.1899996, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (DEFAULT,'LEHMS', 3, '1997-12-10', '1998-01-07', '1997-12-19', 2, 91.2799988, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'ERNSH', 1, '1997-12-11', '1998-01-08', '1997-12-16', 3, 96.4300003, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (DEFAULT,'FOLKO', 4, '1997-12-11', '1997-12-25', '1997-12-12', 1, 48.2000008, 'Folk och f?? HB', '??kergatan 24', 'Br??cke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (DEFAULT,'THECR', 7, '1997-12-12', '1998-01-09', '1997-12-26', 1, 20.25, 'The Cracker Box', '55 Grizzly Peak Rd.', 'Butte', 'MT', '59801', 'USA');
INSERT INTO orders VALUES (DEFAULT,'ERNSH', 1, '1997-12-15', '1998-01-12', '1997-12-18', 3, 351.529999, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (DEFAULT,'GOURL', 7, '1997-12-15', '1997-12-29', '1998-01-21', 2, 3.00999999, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'BERGS', 3, '1997-12-16', '1998-01-13', '1997-12-24', 1, 6.78999996, 'Berglunds snabbk??p', 'Berguvsv??gen  8', 'Lule??', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (DEFAULT,'MORGK', 3, '1997-12-16', '1998-01-13', '1998-01-14', 2, 58.1300011, 'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig', NULL, '04179', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'LILAS', 2, '1997-12-16', '1997-12-30', '1997-12-25', 1, 42.1300011, 'LILA-Supermercado', 'Carrera 52 con Ave. Bol??var #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO orders VALUES (DEFAULT,'WARTH', 2, '1997-12-17', '1998-01-14', '1997-12-19', 3, 73.1600037, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO orders VALUES (DEFAULT,'CACTU', 9, '1997-12-17', '1998-01-14', '1997-12-22', 3, 1.10000002, 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO orders VALUES (DEFAULT,'HANAR', 4, '1997-12-18', '1998-01-15', '1997-12-19', 2, 124.980003, 'Hanari Carnes', 'Rua do Pa??o, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'MAGAA', 4, '1997-12-18', '1998-01-15', '1997-12-22', 3, 70.0899963, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy');
INSERT INTO orders VALUES (DEFAULT,'GROSR', 1, '1997-12-18', '1998-01-15', '1997-12-24', 3, 1.50999999, 'GROSELLA-Restaurante', '5?? Ave. Los Palos Grandes', 'Caracas', 'DF', '1081', 'Venezuela');
INSERT INTO orders VALUES (DEFAULT,'QUEEN', 8, '1997-12-19', '1998-01-16', '1997-12-23', 1, 110.870003, 'Queen Cozinha', 'Alameda dos Can??rios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'LAMAI', 2, '1997-12-19', '1998-01-02', '1997-12-26', 1, 249.929993, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO orders VALUES (DEFAULT,'QUICK', 1, '1997-12-22', '1998-01-19', '1998-01-19', 2, 42.7000008, 'QUICK-Stop', 'Taucherstra??e 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'FOLIG', 1, '1997-12-22', '1998-01-19', '1997-12-31', 2, 100.599998, 'Folies gourmandes', '184, chauss??e de Tournai', 'Lille', NULL, '59000', 'France');
INSERT INTO orders VALUES (DEFAULT,'GOURL', 6, '1997-12-22', '1998-01-19', '1997-12-26', 1, 28.2299995, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'FRANK', 6, '1997-12-23', '1998-01-20', '1998-01-01', 2, 16.8500004, 'Frankenversand', 'Berliner Platz 43', 'M??nchen', NULL, '80805', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'WOLZA', 1, '1997-12-23', '1998-01-20', '1997-12-31', 3, 23.7900009, 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Poland');
INSERT INTO orders VALUES (DEFAULT,'AROUT', 3, '1997-12-24', '1998-01-21', '1998-01-08', 3, 4.51999998, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES (DEFAULT,'QUEDE', 6, '1997-12-24', '1998-01-21', '1998-01-02', 1, 21.4899998, 'Que Del??cia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'ERNSH', 8, '1997-12-24', '1998-01-21', '1998-01-20', 2, 126.660004, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (DEFAULT,'HILAA', 3, '1997-12-25', '1998-01-22', '1998-01-14', 1, 26.5200005, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Crist??bal', 'T??chira', '5022', 'Venezuela');
INSERT INTO orders VALUES (DEFAULT,'DRACD', 7, '1997-12-25', '1998-01-22', '1998-01-05', 2, 33.3499985, 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', NULL, '52066', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'ISLAT', 2, '1997-12-26', '1998-01-23', '1998-01-05', 1, 2.32999992, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO orders VALUES (DEFAULT,'KOENE', 9, '1997-12-26', '1998-02-06', '1998-01-05', 3, 30.7600002, 'K??niglich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'SEVES', 1, '1997-12-26', '1998-01-23', '1998-01-05', 3, 137.440002, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK');
INSERT INTO orders VALUES (DEFAULT,'BOLID', 4, '1997-12-29', '1998-01-26', '1997-12-31', 2, 97.0899963, 'B??lido Comidas preparadas', 'C/ Araquil, 67', 'Madrid', NULL, '28023', 'Spain');
INSERT INTO orders VALUES (DEFAULT,'SIMOB', 4, '1997-12-29', '1998-01-26', '1998-01-02', 2, 257.26001, 'Simons bistro', 'Vinb??ltet 34', 'Kobenhavn', NULL, '1734', 'Denmark');
INSERT INTO orders VALUES (DEFAULT,'WELLI', 4, '1997-12-30', '1998-01-27', '1998-01-06', 1, 55.2299995, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'SEVES', 6, '1997-12-30', '1998-01-27', '1998-01-07', 2, 27.3299999, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK');
INSERT INTO orders VALUES (DEFAULT,'THEBI', 2, '1997-12-30', '1998-01-27', '1998-01-09', 3, 237.339996, 'The Big Cheese', '89 Jefferson Way Suite 2', 'Portland', 'OR', '97201', 'USA');
INSERT INTO orders VALUES (DEFAULT,'VICTE', 3, '1997-12-31', '1998-01-28', '1998-01-05', 2, 22.1100006, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France');
INSERT INTO orders VALUES (DEFAULT,'FRANS', 4, '1997-12-31', '1998-01-28', '1998-01-30', 1, 1.36000001, 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italy');
INSERT INTO orders VALUES (DEFAULT,'OLDWO', 2, '1998-01-01', '1998-01-29', '1998-01-09', 3, 45.5299988, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO orders VALUES (DEFAULT,'WELLI', 7, '1998-01-01', '1998-01-29', '1998-01-07', 1, 4.86999989, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'LAUGB', 2, '1998-01-01', '1998-01-29', '1998-01-07', 3, 4.32999992, 'Laughing Bacchus Wine Cellars', '2319 Elm St.', 'Vancouver', 'BC', 'V3F 2K1', 'Canada');
INSERT INTO orders VALUES (DEFAULT,'LINOD', 8, '1998-01-02', '1998-01-30', '1998-01-08', 1, 31.2199993, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO orders VALUES (DEFAULT,'REGGC', 5, '1998-01-02', '1998-01-30', '1998-01-12', 1, 59.7799988, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO orders VALUES (DEFAULT,'RICAR', 1, '1998-01-05', '1998-02-02', '1998-01-09', 1, 47.3800011, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'VICTE', 3, '1998-01-05', '1998-02-02', '1998-01-14', 3, 130.940002, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France');
INSERT INTO orders VALUES (DEFAULT,'SAVEA', 2, '1998-01-05', '1998-02-02', '1998-01-14', 3, 14.6199999, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (DEFAULT,'GREAL', 4, '1998-01-06', '1998-02-03', '1998-02-04', 2, 719.780029, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO orders VALUES (DEFAULT,'KOENE', 3, '1998-01-06', '1998-01-20', '1998-01-13', 2, 306.070007, 'K??niglich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'MAGAA', 7, '1998-01-07', '1998-02-04', '1998-01-12', 3, 65.4800034, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy');
INSERT INTO orders VALUES (DEFAULT,'CACTU', 2, '1998-01-07', '1998-02-04', '1998-01-16', 3, 19.7600002, 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO orders VALUES (DEFAULT,'RATTC', 3, '1998-01-07', '1998-02-04', '1998-01-13', 2, 37.5200005, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES (DEFAULT,'SPLIR', 1, '1998-01-08', '1998-02-05', '1998-01-15', 1, 36.6800003, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO orders VALUES (DEFAULT,'TRAIH', 6, '1998-01-08', '1998-02-05', '1998-01-16', 3, 7, 'Trail''s Head Gourmet Provisioners', '722 DaVinci Blvd.', 'Kirkland', 'WA', '98034', 'USA');
INSERT INTO orders VALUES (DEFAULT,'LILAS', 5, '1998-01-09', '1998-02-06', '1998-01-13', 2, 163.970001, 'LILA-Supermercado', 'Carrera 52 con Ave. Bol??var #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO orders VALUES (DEFAULT,'FOLKO', 8, '1998-01-09', '1998-02-06', '1998-01-30', 1, 1.23000002, 'Folk och f?? HB', '??kergatan 24', 'Br??cke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (DEFAULT,'DRACD', 1, '1998-01-09', '1998-02-06', '1998-01-14', 1, 79.25, 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', NULL, '52066', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'BLONP', 6, '1998-01-12', '1998-02-09', '1998-02-06', 1, 7.09000015, 'Blondel p??re et fils', '24, place Kl??ber', 'Strasbourg', NULL, '67000', 'France');
INSERT INTO orders VALUES (DEFAULT,'BONAP', 1, '1998-01-12', '1998-01-26', '1998-02-06', 2, 63.5400009, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES (DEFAULT,'RANCH', 9, '1998-01-13', '1998-01-27', '1998-02-04', 1, 90.8499985, 'Rancho grande', 'Av. del Libertador 900', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO orders VALUES (DEFAULT,'ISLAT', 9, '1998-01-13', '1998-02-10', '1998-01-23', 1, 154.720001, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO orders VALUES (DEFAULT,'TRADH', 4, '1998-01-13', '1998-02-24', '1998-01-21', 2, 81.8300018, 'Tradi??ao Hipermercados', 'Av. In??s de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'SANTG', 3, '1998-01-14', '1998-02-11', '1998-01-23', 2, 72.1900024, 'Sant?? Gourmet', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Norway');
INSERT INTO orders VALUES (DEFAULT,'LAMAI', 2, '1998-01-14', '1998-02-11', '1998-01-19', 2, 43.2599983, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO orders VALUES (DEFAULT,'OTTIK', 6, '1998-01-15', '1998-02-12', '1998-01-23', 2, 71.4899979, 'Ottilies K??seladen', 'Mehrheimerstr. 369', 'K??ln', NULL, '50739', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'TRADH', 1, '1998-01-15', '1998-02-12', '1998-01-19', 3, 29.7800007, 'Tradi??ao Hipermercados', 'Av. In??s de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'ALFKI', 1, '1998-01-15', '1998-02-12', '1998-01-21', 3, 69.5299988, 'Alfred''s Futterkiste', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'ERNSH', 7, '1998-01-16', '1998-02-13', '1998-01-21', 1, 411.880005, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (DEFAULT,'BERGS', 9, '1998-01-16', '1998-02-13', '1998-01-23', 3, 13.3199997, 'Berglunds snabbk??p', 'Berguvsv??gen  8', 'Lule??', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (DEFAULT,'LINOD', 3, '1998-01-19', '1998-02-16', '1998-01-23', 3, 59.2799988, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO orders VALUES (DEFAULT,'TRADH', 3, '1998-01-19', '1998-02-16', '1998-01-22', 3, 35.4300003, 'Tradi??ao Hipermercados', 'Av. In??s de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'LINOD', 4, '1998-01-19', '1998-03-02', '1998-02-16', 2, 2.71000004, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO orders VALUES (DEFAULT,'SUPRD', 5, '1998-01-20', '1998-02-17', '1998-01-29', 2, 424.299988, 'Supr??mes d??lices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO orders VALUES (DEFAULT,'TORTU', 1, '1998-01-20', '1998-02-17', '1998-01-29', 3, 54.4199982, 'Tortuga Restaurante', 'Avda. Azteca 123', 'M??xico D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES (DEFAULT,'VICTE', 4, '1998-01-21', '1998-02-18', '1998-01-26', 2, 9.26000023, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France');
INSERT INTO orders VALUES (DEFAULT,'PICCO', 8, '1998-01-21', '1998-02-18', '1998-01-26', 2, 25.2199993, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria');
INSERT INTO orders VALUES (DEFAULT,'QUICK', 8, '1998-01-21', '1998-02-04', '1998-01-30', 1, 212.979996, 'QUICK-Stop', 'Taucherstra??e 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'SUPRD', 2, '1998-01-22', '1998-03-05', '1998-01-23', 3, 56.4599991, 'Supr??mes d??lices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO orders VALUES (DEFAULT,'SAVEA', 4, '1998-01-22', '1998-02-05', '1998-02-10', 3, 487.570007, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (DEFAULT,'CONSH', 7, '1998-01-23', '1998-02-20', '1998-01-29', 2, 38.2400017, 'Consolidated Holdings', 'Berkeley Gardens 12  Brewery', 'London', NULL, 'WX1 6LT', 'UK');
INSERT INTO orders VALUES (DEFAULT,'KOENE', 9, '1998-01-23', '1998-02-20', '1998-01-30', 2, 0.560000002, 'K??niglich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'VICTE', 1, '1998-01-23', '1998-03-06', '1998-01-30', 1, 49.1899986, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France');
INSERT INTO orders VALUES (DEFAULT,'RICAR', 5, '1998-01-26', '1998-02-23', '1998-02-02', 1, 160.550003, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'RATTC', 8, '1998-01-26', '1998-02-09', '1998-01-30', 1, 174.050003, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES (DEFAULT,'BLAUS', 9, '1998-01-27', '1998-02-24', '1998-02-03', 2, 53.8300018, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'ERNSH', 3, '1998-01-27', '1998-02-24', '1998-02-05', 2, 100.220001, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (DEFAULT,'OLDWO', 3, '1998-01-27', '1998-02-24', '1998-02-04', 1, 170.970001, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO orders VALUES (DEFAULT,'ANTON', 3, '1998-01-28', '1998-02-25', '1998-02-10', 2, 58.4300003, 'Antonio Moreno Taquer??a', 'Mataderos  2312', 'M??xico D.F.', NULL, '05023', 'Mexico');
INSERT INTO orders VALUES (DEFAULT,'BERGS', 8, '1998-01-28', '1998-02-25', '1998-02-06', 2, 188.850006, 'Berglunds snabbk??p', 'Berguvsv??gen  8', 'Lule??', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (DEFAULT,'LACOR', 2, '1998-01-29', '1998-02-26', '1998-02-03', 1, 52.5099983, 'La corne d''abondance', '67, avenue de l''Europe', 'Versailles', NULL, '78000', 'France');
INSERT INTO orders VALUES (DEFAULT,'FRANK', 1, '1998-01-29', '1998-02-26', '1998-02-02', 2, 76.0999985, 'Frankenversand', 'Berliner Platz 43', 'M??nchen', NULL, '80805', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'FRANR', 3, '1998-01-29', '1998-02-26', '1998-02-04', 3, 19.2600002, 'France restauration', '54, rue Royale', 'Nantes', NULL, '44000', 'France');
INSERT INTO orders VALUES (DEFAULT,'WHITC', 4, '1998-01-30', '1998-02-27', '1998-02-17', 2, 14.9300003, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES (DEFAULT,'LEHMS', 8, '1998-01-30', '1998-03-13', '1998-02-02', 2, 53.2299995, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'HILAA', 4, '1998-02-02', '1998-03-02', '1998-02-17', 2, 30.2600002, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Crist??bal', 'T??chira', '5022', 'Venezuela');
INSERT INTO orders VALUES (DEFAULT,'AROUT', 4, '1998-02-02', '1998-03-02', '1998-02-09', 2, 3.03999996, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES (DEFAULT,'QUICK', 2, '1998-02-02', '1998-02-16', '1998-02-12', 1, 348.140015, 'QUICK-Stop', 'Taucherstra??e 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'BERGS', 5, '1998-02-03', '1998-03-03', '1998-02-12', 1, 109.110001, 'Berglunds snabbk??p', 'Berguvsv??gen  8', 'Lule??', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (DEFAULT,'LONEP', 6, '1998-02-03', '1998-03-17', '1998-02-11', 1, 1.92999995, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO orders VALUES (DEFAULT,'QUEEN', 7, '1998-02-04', '1998-03-04', '1998-02-23', 2, 191.270004, 'Queen Cozinha', 'Alameda dos Can??rios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'SEVES', 5, '1998-02-04', '1998-03-04', '1998-02-09', 1, 143.279999, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK');
INSERT INTO orders VALUES (DEFAULT,'WOLZA', 5, '1998-02-04', '1998-03-04', '1998-02-13', 3, 12.04, 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Poland');
INSERT INTO orders VALUES (DEFAULT,'BONAP', 9, '1998-02-05', '1998-03-05', '1998-02-10', 2, 112.269997, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES (DEFAULT,'GODOS', 5, '1998-02-05', '1998-03-05', '1998-02-09', 2, 175.320007, 'Godos Cocina T??pica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain');
INSERT INTO orders VALUES (DEFAULT,'WILMK', 4, '1998-02-06', '1998-03-06', '1998-02-09', 1, 0.819999993, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finland');
INSERT INTO orders VALUES (DEFAULT,'GODOS', 5, '1998-02-06', '1998-03-06', '1998-02-11', 2, 19.5799999, 'Godos Cocina T??pica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain');
INSERT INTO orders VALUES (DEFAULT,'BERGS', 4, '1998-02-06', '1998-03-06', '1998-03-03', 2, 32.3699989, 'Berglunds snabbk??p', 'Berguvsv??gen  8', 'Lule??', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (DEFAULT,'BONAP', 7, '1998-02-09', '1998-03-09', '1998-02-12', 3, 60.4199982, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES (DEFAULT,'RICAR', 1, '1998-02-09', '1998-03-09', '1998-02-19', 1, 38.0600014, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'QUICK', 4, '1998-02-10', '1998-03-10', '1998-02-12', 1, 46.6899986, 'QUICK-Stop', 'Taucherstra??e 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'WILMK', 3, '1998-02-10', '1998-03-10', '1998-02-12', 3, 8.5, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finland');
INSERT INTO orders VALUES (DEFAULT,'FOLKO', 7, '1998-02-10', '1998-03-24', '1998-02-18', 1, 88.0100021, 'Folk och f?? HB', '??kergatan 24', 'Br??cke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (DEFAULT,'CACTU', 4, '1998-02-11', '1998-03-11', '1998-02-18', 1, 2.83999991, 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO orders VALUES (DEFAULT,'SAVEA', 4, '1998-02-11', '1998-03-11', '1998-02-20', 3, 23.1000004, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (DEFAULT,'LONEP', 8, '1998-02-12', '1998-03-12', '1998-02-20', 3, 0.529999971, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO orders VALUES (DEFAULT,'LETSS', 4, '1998-02-12', '1998-03-12', '1998-02-13', 2, 90.9700012, 'Let''s Stop N Shop', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA');
INSERT INTO orders VALUES (DEFAULT,'SUPRD', 6, '1998-02-12', '1998-03-12', '1998-02-18', 3, 5.63999987, 'Supr??mes d??lices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO orders VALUES (DEFAULT,'HANAR', 1, '1998-02-13', '1998-03-13', '1998-03-02', 1, 4.98999977, 'Hanari Carnes', 'Rua do Pa??o, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'GALED', 8, '1998-02-13', '1998-03-13', '1998-02-16', 3, 1.25, 'Galer??a del gastron??mo', 'Rambla de Catalu??a, 23', 'Barcelona', NULL, '8022', 'Spain');
INSERT INTO orders VALUES (DEFAULT,'GODOS', 1, '1998-02-16', '1998-03-16', '1998-02-23', 2, 51.8699989, 'Godos Cocina T??pica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain');
INSERT INTO orders VALUES (DEFAULT,'RATTC', 9, '1998-02-16', '1998-03-16', '1998-02-23', 3, 280.609985, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES (DEFAULT,'DUMON', 7, '1998-02-16', '1998-03-16', '1998-02-18', 1, 32.7599983, 'Du monde entier', '67, rue des Cinquante Otages', 'Nantes', NULL, '44000', 'France');
INSERT INTO orders VALUES (DEFAULT,'LEHMS', 7, '1998-02-17', '1998-03-17', '1998-02-19', 2, 20.3700008, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'MAISD', 4, '1998-02-17', '1998-03-17', '1998-02-19', 2, 120.269997, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Belgium');
INSERT INTO orders VALUES (DEFAULT,'KOENE', 9, '1998-02-18', '1998-03-18', '1998-02-20', 2, 77.7799988, 'K??niglich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'SAVEA', 1, '1998-02-18', '1998-03-18', '1998-02-20', 1, 116.129997, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (DEFAULT,'ERNSH', 3, '1998-02-18', '1998-03-18', '1998-02-23', 1, 162.75, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (DEFAULT,'MAISD', 7, '1998-02-19', '1998-03-19', '1998-02-27', 3, 32.4500008, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Belgium');
INSERT INTO orders VALUES (DEFAULT,'HUNGO', 3, '1998-02-19', '1998-03-19', '1998-02-25', 2, 603.539978, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (DEFAULT,'OCEAN', 4, '1998-02-20', '1998-03-20', '1998-03-06', 2, 1.26999998, 'Oc??ano Atl??ntico Ltda.', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO orders VALUES (DEFAULT,'LILAS', 5, '1998-02-20', '1998-03-20', '1998-02-26', 3, 1.21000004, 'LILA-Supermercado', 'Carrera 52 con Ave. Bol??var #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO orders VALUES (DEFAULT,'WELLI', 1, '1998-02-20', '1998-03-20', '1998-03-04', 2, 1.65999997, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'HILAA', 4, '1998-02-23', '1998-03-23', '1998-02-26', 1, 62.0900002, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Crist??bal', 'T??chira', '5022', 'Venezuela');
INSERT INTO orders VALUES (DEFAULT,'FOLKO', 1, '1998-02-23', '1998-03-23', '1998-03-03', 1, 44.1500015, 'Folk och f?? HB', '??kergatan 24', 'Br??cke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (DEFAULT,'HANAR', 3, '1998-02-24', '1998-03-24', '1998-03-04', 3, 36.7099991, 'Hanari Carnes', 'Rua do Pa??o, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'WHITC', 3, '1998-02-24', '1998-03-24', '1998-02-27', 3, 162.949997, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES (DEFAULT,'WELLI', 9, '1998-02-24', '1998-03-24', '1998-03-06', 2, 13.7200003, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'WOLZA', 4, '1998-02-25', '1998-03-11', '1998-03-03', 3, 26.2900009, 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Poland');
INSERT INTO orders VALUES (DEFAULT,'SPECD', 6, '1998-02-25', '1998-03-25', '1998-02-27', 3, 9.18999958, 'Sp??cialit??s du monde', '25, rue Lauriston', 'Paris', NULL, '75016', 'France');
INSERT INTO orders VALUES (DEFAULT,'REGGC', 4, '1998-02-26', '1998-03-26', '1998-03-06', 2, 32.9599991, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO orders VALUES (DEFAULT,'SANTG', 1, '1998-02-26', '1998-03-26', '1998-03-10', 2, 53.0499992, 'Sant?? Gourmet', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Norway');
INSERT INTO orders VALUES (DEFAULT,'WILMK', 1, '1998-02-26', '1998-03-26', '1998-03-04', 3, 38.1100006, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finland');
INSERT INTO orders VALUES (DEFAULT,'GODOS', 3, '1998-02-26', '1998-03-26', '1998-03-05', 1, 38.1899986, 'Godos Cocina T??pica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain');
INSERT INTO orders VALUES (DEFAULT,'HUNGO', 2, '1998-02-26', '1998-03-26', '1998-03-18', 2, 580.909973, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (DEFAULT,'QUEEN', 4, '1998-02-26', '1998-03-26', '1998-03-04', 1, 33.0499992, 'Queen Cozinha', 'Alameda dos Can??rios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'QUEEN', 6, '1998-02-27', '1998-03-27', '1998-03-02', 1, 21.1900005, 'Queen Cozinha', 'Alameda dos Can??rios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'TORTU', 2, '1998-02-27', '1998-03-27', '1998-03-02', 2, 3.50999999, 'Tortuga Restaurante', 'Avda. Azteca 123', 'M??xico D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES (DEFAULT,'RANCH', 1, '1998-02-27', '1998-03-27', '1998-03-09', 2, 63.7700005, 'Rancho grande', 'Av. del Libertador 900', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO orders VALUES (DEFAULT,'ROMEY', 4, '1998-03-02', '1998-03-30', '1998-03-11', 2, 8.28999996, 'Romero y tomillo', 'Gran V??a, 1', 'Madrid', NULL, '28001', 'Spain');
INSERT INTO orders VALUES (DEFAULT,'BOTTM', 3, '1998-03-02', '1998-03-30', '1998-03-11', 3, 48.8300018, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES (DEFAULT,'LINOD', 2, '1998-03-02', '1998-03-30', '1998-03-04', 2, 19.7999992, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO orders VALUES (DEFAULT,'AROUT', 4, '1998-03-03', '1998-03-31', '1998-03-09', 2, 29.6100006, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES (DEFAULT,'VAFFE', 1, '1998-03-03', '1998-04-14', '1998-03-09', 1, 176.479996, 'Vaffeljernet', 'Smagsloget 45', '??rhus', NULL, '8200', 'Denmark');
INSERT INTO orders VALUES (DEFAULT,'HANAR', 5, '1998-03-03', '1998-03-31', '1998-03-05', 3, 62.7400017, 'Hanari Carnes', 'Rua do Pa??o, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'LAMAI', 7, '1998-03-03', '1998-04-14', '1998-03-13', 3, 68.2600021, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO orders VALUES (DEFAULT,'BERGS', 3, '1998-03-04', '1998-04-01', '1998-04-08', 2, 151.520004, 'Berglunds snabbk??p', 'Berguvsv??gen  8', 'Lule??', NULL, 'S-958 22', 'Sweden');
INSERT INTO orders VALUES (DEFAULT,'HANAR', 3, '1998-03-04', '1998-04-01', '1998-03-13', 1, 2.26999998, 'Hanari Carnes', 'Rua do Pa??o, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'ANATR', 4, '1998-03-04', '1998-04-01', '1998-03-11', 3, 39.9199982, 'Ana Trujillo Emparedados y helados', 'Avda. de la Constituci??n 2222', 'M??xico D.F.', NULL, '05021', 'Mexico');
INSERT INTO orders VALUES (DEFAULT,'LACOR', 4, '1998-03-05', '1998-04-02', '1998-04-08', 1, 19.7900009, 'La corne d''abondance', '67, avenue de l''Europe', 'Versailles', NULL, '78000', 'France');
INSERT INTO orders VALUES (DEFAULT,'GALED', 1, '1998-03-05', '1998-04-02', '1998-03-18', 1, 1.36000001, 'Galer??a del gastron??mo', 'Rambla de Catalu??a, 23', 'Barcelona', NULL, '8022', 'Spain');
INSERT INTO orders VALUES (DEFAULT,'FRANK', 6, '1998-03-05', '1998-04-02', '1998-03-12', 1, 33.9300003, 'Frankenversand', 'Berliner Platz 43', 'M??nchen', NULL, '80805', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'SUPRD', 4, '1998-03-06', '1998-04-17', '1998-03-18', 3, 15.5500002, 'Supr??mes d??lices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO orders VALUES (DEFAULT,'RICSU', 4, '1998-03-06', '1998-03-20', '1998-03-19', 2, 13.6000004, 'Richter Supermarkt', 'Starenweg 5', 'Gen??ve', NULL, '1204', 'Switzerland');
INSERT INTO orders VALUES (DEFAULT,'BONAP', 8, '1998-03-06', '1998-04-03', '1998-03-24', 1, 134.639999, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES (DEFAULT,'ISLAT', 6, '1998-03-06', '1998-04-03', '1998-03-16', 3, 54.1500015, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO orders VALUES (DEFAULT,'LEHMS', 3, '1998-03-09', '1998-04-06', '1998-03-12', 3, 32.0099983, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'WELLI', 4, '1998-03-09', '1998-04-06', '1998-03-18', 3, 47.5900002, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'GREAL', 3, '1998-03-09', '1998-04-06', '1998-03-18', 2, 33.6800003, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO orders VALUES (DEFAULT,'CACTU', 7, '1998-03-10', '1998-03-24', '1998-03-13', 3, 31.5100002, 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO orders VALUES (DEFAULT,'QUICK', 3, '1998-03-10', '1998-04-07', '1998-03-16', 2, 31.8899994, 'QUICK-Stop', 'Taucherstra??e 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'MAGAA', 2, '1998-03-10', '1998-04-07', '1998-03-13', 2, 76.3300018, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy');
INSERT INTO orders VALUES (DEFAULT,'BONAP', 8, '1998-03-11', '1998-04-08', '1998-03-23', 3, 19.7700005, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES (DEFAULT,'SAVEA', 7, '1998-03-11', '1998-04-08', '1998-03-20', 2, 400.809998, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (DEFAULT,'REGGC', 9, '1998-03-11', '1998-04-08', '1998-03-18', 3, 17.9500008, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO orders VALUES (DEFAULT,'BSBEV', 4, '1998-03-11', '1998-04-08', '1998-03-19', 2, 2.17000008, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO orders VALUES (DEFAULT,'BOTTM', 6, '1998-03-12', '1998-03-26', '1998-03-13', 3, 52.9199982, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES (DEFAULT,'MORGK', 4, '1998-03-12', '1998-04-09', '1998-03-18', 1, 10.2200003, 'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig', NULL, '04179', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'VAFFE', 1, '1998-03-12', '1998-04-09', '1998-03-19', 2, 27.2000008, 'Vaffeljernet', 'Smagsloget 45', '??rhus', NULL, '8200', 'Denmark');
INSERT INTO orders VALUES (DEFAULT,'BSBEV', 3, '1998-03-13', '1998-04-10', '1998-03-16', 2, 3.25999999, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO orders VALUES (DEFAULT,'GODOS', 3, '1998-03-13', '1998-04-10', '1998-03-19', 3, 23.3899994, 'Godos Cocina T??pica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain');
INSERT INTO orders VALUES (DEFAULT,'BOTTM', 2, '1998-03-13', '1998-04-10', '1998-03-17', 3, 74.4400024, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES (DEFAULT,'MAGAA', 1, '1998-03-16', '1998-04-13', '1998-03-23', 2, 2.5, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy');
INSERT INTO orders VALUES (DEFAULT,'RICSU', 9, '1998-03-16', '1998-04-27', '1998-04-07', 2, 30.8500004, 'Richter Supermarkt', 'Starenweg 5', 'Gen??ve', NULL, '1204', 'Switzerland');
INSERT INTO orders VALUES (DEFAULT,'ALFKI', 1, '1998-03-16', '1998-04-27', '1998-03-24', 1, 40.4199982, 'Alfred''s Futterkiste', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'AROUT', 9, '1998-03-16', '1998-03-30', '1998-03-25', 2, 23.7199993, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES (DEFAULT,'LINOD', 5, '1998-03-17', '1998-04-28', '1998-03-20', 1, 27.9099998, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO orders VALUES (DEFAULT,'FOLKO', 8, '1998-03-17', '1998-04-14', '1998-03-20', 2, 3.25999999, 'Folk och f?? HB', '??kergatan 24', 'Br??cke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (DEFAULT,'BLAUS', 6, '1998-03-17', '1998-04-28', '1998-03-20', 2, 44.6500015, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'HILAA', 8, '1998-03-18', '1998-04-15', '1998-03-27', 3, 105.360001, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Crist??bal', 'T??chira', '5022', 'Venezuela');
INSERT INTO orders VALUES (DEFAULT,'OCEAN', 7, '1998-03-18', '1998-04-15', '1998-03-27', 2, 49.5600014, 'Oc??ano Atl??ntico Ltda.', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO orders VALUES (DEFAULT,'GOURL', 6, '1998-03-18', '1998-04-29', '1998-03-23', 2, 4.98000002, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'HILAA', 3, '1998-03-19', '1998-04-02', '1998-04-08', 1, 2.07999992, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Crist??bal', 'T??chira', '5022', 'Venezuela');
INSERT INTO orders VALUES (DEFAULT,'QUEEN', 8, '1998-03-19', '1998-04-16', '1998-03-30', 1, 104.470001, 'Queen Cozinha', 'Alameda dos Can??rios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'QUICK', 8, '1998-03-19', '1998-04-16', '1998-03-23', 2, 275.790009, 'QUICK-Stop', 'Taucherstra??e 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'FURIB', 9, '1998-03-19', '1998-04-16', '1998-03-26', 3, 2.70000005, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal');
INSERT INTO orders VALUES (DEFAULT,'SPECD', 3, '1998-03-20', '1998-04-17', '1998-03-24', 2, 87.3799973, 'Sp??cialit??s du monde', '25, rue Lauriston', 'Paris', NULL, '75016', 'France');
INSERT INTO orders VALUES (DEFAULT,'OLDWO', 6, '1998-03-20', '1998-04-17', '1998-03-30', 3, 144.380005, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO orders VALUES (DEFAULT,'CHOPS', 4, '1998-03-20', '1998-04-17', '1998-04-08', 1, 27.1900005, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland');
INSERT INTO orders VALUES (DEFAULT,'TOMSP', 2, '1998-03-23', '1998-04-20', '1998-04-02', 2, 62.2200012, 'Toms Spezialit??ten', 'Luisenstr. 48', 'M??nster', NULL, '44087', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'ERNSH', 1, '1998-03-23', '1998-04-20', '1998-04-01', 3, 74.5999985, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (DEFAULT,'COMMI', 1, '1998-03-23', '1998-04-20', '1998-03-30', 2, 0.209999993, 'Com??rcio Mineiro', 'Av. dos Lus??adas, 23', 'Sao Paulo', 'SP', '05432-043', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'BOLID', 9, '1998-03-24', '1998-04-07', '1998-04-24', 1, 16.1599998, 'B??lido Comidas preparadas', 'C/ Araquil, 67', 'Madrid', NULL, '28023', 'Spain');
INSERT INTO orders VALUES (DEFAULT,'FRANR', 2, '1998-03-24', '1998-04-21', '1998-04-02', 2, 121.82, 'France restauration', '54, rue Royale', 'Nantes', NULL, '44000', 'France');
INSERT INTO orders VALUES (DEFAULT,'LACOR', 4, '1998-03-24', '1998-04-21', '1998-03-26', 2, 0.0199999996, 'La corne d''abondance', '67, avenue de l''Europe', 'Versailles', NULL, '78000', 'France');
INSERT INTO orders VALUES (DEFAULT,'LACOR', 6, '1998-03-24', '1998-04-21', '1998-03-27', 2, 15.1700001, 'La corne d''abondance', '67, avenue de l''Europe', 'Versailles', NULL, '78000', 'France');
INSERT INTO orders VALUES (DEFAULT,'SPLIR', 3, '1998-03-25', '1998-04-08', '1998-04-03', 3, 12.96, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO orders VALUES (DEFAULT,'BOTTM', 1, '1998-03-25', '1998-04-22', '1998-03-27', 3, 32.2700005, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES (DEFAULT,'HILAA', 1, '1998-03-25', '1998-05-06', '1998-04-03', 1, 37.9700012, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Crist??bal', 'T??chira', '5022', 'Venezuela');
INSERT INTO orders VALUES (DEFAULT,'FOLKO', 8, '1998-03-26', '1998-04-23', '1998-04-10', 3, 208.5, 'Folk och f?? HB', '??kergatan 24', 'Br??cke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (DEFAULT,'MAISD', 9, '1998-03-26', '1998-04-23', '1998-04-23', 2, 32.8199997, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Belgium');
INSERT INTO orders VALUES (DEFAULT,'ERNSH', 8, '1998-03-26', '1998-04-23', '1998-03-31', 2, 353.070007, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (DEFAULT,'FOLKO', 4, '1998-03-27', '1998-05-08', '1998-04-17', 1, 1.25999999, 'Folk och f?? HB', '??kergatan 24', 'Br??cke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (DEFAULT,'HANAR', 1, '1998-03-27', '1998-04-24', '1998-04-02', 2, 193.369995, 'Hanari Carnes', 'Rua do Pa??o, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'BOTTM', 2, '1998-03-27', '1998-04-24', '1998-04-08', 1, 14.0100002, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES (DEFAULT,'SAVEA', 2, '1998-03-27', '1998-04-24', '1998-04-06', 2, 657.539978, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (DEFAULT,'SAVEA', 1, '1998-03-30', '1998-04-27', '1998-04-03', 3, 211.220001, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (DEFAULT,'HUNGO', 2, '1998-03-30', '1998-04-27', '1998-04-02', 1, 91.5100021, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (DEFAULT,'OCEAN', 8, '1998-03-30', '1998-04-27', '1998-04-21', 2, 217.860001, 'Oc??ano Atl??ntico Ltda.', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO orders VALUES (DEFAULT,'EASTC', 8, '1998-03-31', '1998-04-28', '1998-04-06', 1, 185.479996, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK');
INSERT INTO orders VALUES (DEFAULT,'RATTC', 3, '1998-03-31', '1998-04-28', '1998-04-10', 2, 61.1399994, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES (DEFAULT,'QUEDE', 2, '1998-03-31', '1998-04-28', '1998-04-02', 1, 34.7599983, 'Que Del??cia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'ERNSH', 2, '1998-04-01', '1998-05-13', '1998-04-07', 3, 117.610001, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (DEFAULT,'QUICK', 1, '1998-04-01', '1998-04-29', '1998-04-07', 1, 38.5099983, 'QUICK-Stop', 'Taucherstra??e 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'THEBI', 1, '1998-04-01', '1998-04-29', '1998-04-03', 3, 4.26999998, 'The Big Cheese', '89 Jefferson Way Suite 2', 'Portland', 'OR', '97201', 'USA');
INSERT INTO orders VALUES (DEFAULT,'FOLKO', 7, '1998-04-01', '1998-04-29', '1998-04-10', 3, 8.81000042, 'Folk och f?? HB', '??kergatan 24', 'Br??cke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (DEFAULT,'VAFFE', 2, '1998-04-02', '1998-04-16', '1998-04-09', 3, 65.5299988, 'Vaffeljernet', 'Smagsloget 45', '??rhus', NULL, '8200', 'Denmark');
INSERT INTO orders VALUES (DEFAULT,'PERIC', 1, '1998-04-02', '1998-04-30', '1998-04-06', 3, 46, 'Pericles Comidas cl??sicas', 'Calle Dr. Jorge Cash 321', 'M??xico D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES (DEFAULT,'QUICK', 4, '1998-04-02', '1998-04-30', '1998-04-10', 2, 1.12, 'QUICK-Stop', 'Taucherstra??e 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'LILAS', 8, '1998-04-03', '1998-05-15', '1998-04-13', 2, 73.9100037, 'LILA-Supermercado', 'Carrera 52 con Ave. Bol??var #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO orders VALUES (DEFAULT,'WOLZA', 8, '1998-04-03', '1998-04-17', '1998-04-17', 2, 20.3099995, 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Poland');
INSERT INTO orders VALUES (DEFAULT,'OTTIK', 6, '1998-04-03', '1998-05-01', '1998-04-10', 2, 96.3499985, 'Ottilies K??seladen', 'Mehrheimerstr. 369', 'K??ln', NULL, '50739', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'RATTC', 2, '1998-04-06', '1998-05-04', '1998-04-14', 3, 55.1199989, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO orders VALUES (DEFAULT,'FOLKO', 2, '1998-04-06', '1998-05-04', '1998-04-14', 2, 197.300003, 'Folk och f?? HB', '??kergatan 24', 'Br??cke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (DEFAULT,'SAVEA', 4, '1998-04-06', '1998-05-04', '1998-04-16', 1, 141.160004, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (DEFAULT,'THECR', 3, '1998-04-06', '1998-05-04', '1998-04-08', 3, 14.9099998, 'The Cracker Box', '55 Grizzly Peak Rd.', 'Butte', 'MT', '59801', 'USA');
INSERT INTO orders VALUES (DEFAULT,'MAISD', 3, '1998-04-07', '1998-05-05', '1998-04-20', 1, 44.8400002, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Belgium');
INSERT INTO orders VALUES (DEFAULT,'WILMK', 2, '1998-04-07', '1998-05-05', '1998-04-10', 1, 0.75, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finland');
INSERT INTO orders VALUES (DEFAULT,'GREAL', 3, '1998-04-07', '1998-05-05', '1998-04-15', 2, 25.1900005, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO orders VALUES (DEFAULT,'PRINI', 8, '1998-04-08', '1998-05-06', '1998-04-13', 2, 202.240005, 'Princesa Isabel Vinhos', 'Estrada da sa??de n. 58', 'Lisboa', NULL, '1756', 'Portugal');
INSERT INTO orders VALUES (DEFAULT,'ERNSH', 7, '1998-04-08', '1998-05-06', NULL, 3, 79.4599991, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (DEFAULT,'GODOS', 2, '1998-04-08', '1998-05-06', '1998-04-10', 1, 59.1100006, 'Godos Cocina T??pica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain');
INSERT INTO orders VALUES (DEFAULT,'REGGC', 2, '1998-04-09', '1998-05-07', '1998-04-21', 2, 28.7099991, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO orders VALUES (DEFAULT,'ALFKI', 3, '1998-04-09', '1998-05-07', '1998-04-13', 1, 1.21000004, 'Alfred''s Futterkiste', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'FRANK', 1, '1998-04-09', '1998-04-23', '1998-04-17', 3, 242.949997, 'Frankenversand', 'Berliner Platz 43', 'M??nchen', NULL, '80805', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'ROMEY', 2, '1998-04-09', '1998-05-07', '1998-04-10', 1, 32.9900017, 'Romero y tomillo', 'Gran V??a, 1', 'Madrid', NULL, '28001', 'Spain');
INSERT INTO orders VALUES (DEFAULT,'LINOD', 2, '1998-04-10', '1998-05-08', '1998-04-15', 3, 23.6000004, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO orders VALUES (DEFAULT,'SANTG', 2, '1998-04-10', '1998-04-24', '1998-04-20', 2, 4.61999989, 'Sant?? Gourmet', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Norway');
INSERT INTO orders VALUES (DEFAULT,'AROUT', 9, '1998-04-10', '1998-05-08', '1998-04-13', 2, 33.7999992, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO orders VALUES (DEFAULT,'ERNSH', 9, '1998-04-13', '1998-05-11', '1998-04-20', 2, 754.26001, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (DEFAULT,'LONEP', 4, '1998-04-13', '1998-05-11', '1998-04-16', 2, 11.6499996, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO orders VALUES (DEFAULT,'RANCH', 6, '1998-04-13', '1998-05-11', NULL, 3, 3.17000008, 'Rancho grande', 'Av. del Libertador 900', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO orders VALUES (DEFAULT,'OTTIK', 2, '1998-04-14', '1998-05-12', '1998-04-16', 2, 43.2999992, 'Ottilies K??seladen', 'Mehrheimerstr. 369', 'K??ln', NULL, '50739', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'QUICK', 3, '1998-04-14', '1998-05-12', '1998-04-21', 1, 297.179993, 'QUICK-Stop', 'Taucherstra??e 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'HANAR', 9, '1998-04-14', '1998-05-12', '1998-05-04', 2, 6.26999998, 'Hanari Carnes', 'Rua do Pa??o, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'BSBEV', 1, '1998-04-14', '1998-04-28', '1998-04-24', 2, 123.830002, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO orders VALUES (DEFAULT,'EASTC', 4, '1998-04-15', '1998-05-13', '1998-04-20', 1, 74.3600006, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK');
INSERT INTO orders VALUES (DEFAULT,'WARTH', 6, '1998-04-15', '1998-05-13', '1998-04-24', 3, 29.1700001, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO orders VALUES (DEFAULT,'FRANS', 4, '1998-04-15', '1998-05-13', '1998-04-28', 1, 47.0900002, 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italy');
INSERT INTO orders VALUES (DEFAULT,'BOTTM', 1, '1998-04-16', '1998-05-14', '1998-04-20', 1, 52.5200005, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES (DEFAULT,'KOENE', 2, '1998-04-16', '1998-05-14', '1998-04-22', 1, 29.5900002, 'K??niglich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'CHOPS', 4, '1998-04-16', '1998-05-14', '1998-04-27', 1, 47.8400002, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland');
INSERT INTO orders VALUES (DEFAULT,'SAVEA', 7, '1998-04-17', '1998-05-15', '1998-04-27', 2, 830.75, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (DEFAULT,'SAVEA', 6, '1998-04-17', '1998-05-15', '1998-04-24', 2, 227.220001, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (DEFAULT,'WHITC', 2, '1998-04-17', '1998-05-15', '1998-04-23', 3, 606.190002, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES (DEFAULT,'RICSU', 7, '1998-04-17', '1998-05-15', '1998-04-23', 3, 84.7399979, 'Richter Supermarkt', 'Starenweg 5', 'Gen??ve', NULL, '1204', 'Switzerland');
INSERT INTO orders VALUES (DEFAULT,'OLDWO', 8, '1998-04-20', '1998-06-01', '1998-04-27', 1, 40.3199997, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO orders VALUES (DEFAULT,'SUPRD', 2, '1998-04-20', '1998-05-18', '1998-04-24', 2, 0.170000002, 'Supr??mes d??lices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO orders VALUES (DEFAULT,'DRACD', 8, '1998-04-20', '1998-05-18', '1998-04-22', 3, 149.470001, 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', NULL, '52066', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'GODOS', 7, '1998-04-21', '1998-05-19', '1998-04-27', 1, 3.20000005, 'Godos Cocina T??pica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain');
INSERT INTO orders VALUES (DEFAULT,'SUPRD', 1, '1998-04-21', '1998-05-19', '1998-04-30', 2, 29.5900002, 'Supr??mes d??lices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO orders VALUES (DEFAULT,'LINOD', 1, '1998-04-21', '1998-05-19', NULL, 2, 65, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO orders VALUES (DEFAULT,'GREAL', 4, '1998-04-22', '1998-05-20', NULL, 3, 18.8400002, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO orders VALUES (DEFAULT,'CHOPS', 3, '1998-04-22', '1998-05-20', '1998-04-28', 2, 48.2200012, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland');
INSERT INTO orders VALUES (DEFAULT,'COMMI', 2, '1998-04-22', '1998-05-06', '1998-05-01', 1, 29.9899998, 'Com??rcio Mineiro', 'Av. dos Lus??adas, 23', 'Sao Paulo', 'SP', '05432-043', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'SPECD', 5, '1998-04-22', '1998-05-20', '1998-04-29', 2, 8.80000019, 'Sp??cialit??s du monde', '25, rue Lauriston', 'Paris', NULL, '75016', 'France');
INSERT INTO orders VALUES (DEFAULT,'WOLZA', 4, '1998-04-23', '1998-05-21', '1998-05-01', 1, 8.72000027, 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Poland');
INSERT INTO orders VALUES (DEFAULT,'BOTTM', 6, '1998-04-23', '1998-05-21', NULL, 2, 70.5800018, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES (DEFAULT,'WANDK', 8, '1998-04-23', '1998-05-21', '1998-04-24', 2, 71.6399994, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'EASTC', 7, '1998-04-24', '1998-05-22', '1998-05-01', 3, 46.6199989, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK');
INSERT INTO orders VALUES (DEFAULT,'BOTTM', 7, '1998-04-24', '1998-05-22', '1998-04-30', 3, 24.1200008, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO orders VALUES (DEFAULT,'GOURL', 3, '1998-04-24', '1998-05-22', '1998-05-04', 1, 8.34000015, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'FOLKO', 8, '1998-04-27', '1998-05-25', '1998-05-05', 2, 59.4099998, 'Folk och f?? HB', '??kergatan 24', 'Br??cke', NULL, 'S-844 67', 'Sweden');
INSERT INTO orders VALUES (DEFAULT,'LAMAI', 7, '1998-04-27', '1998-05-25', NULL, 3, 2.78999996, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO orders VALUES (DEFAULT,'HANAR', 3, '1998-04-27', '1998-05-25', '1998-05-01', 1, 67.2600021, 'Hanari Carnes', 'Rua do Pa??o, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'PICCO', 2, '1998-04-27', '1998-05-25', '1998-04-29', 2, 53.0499992, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria');
INSERT INTO orders VALUES (DEFAULT,'CACTU', 8, '1998-04-28', '1998-05-26', NULL, 1, 0.330000013, 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO orders VALUES (DEFAULT,'HILAA', 7, '1998-04-28', '1998-05-26', '1998-05-05', 2, 120.919998, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Crist??bal', 'T??chira', '5022', 'Venezuela');
INSERT INTO orders VALUES (DEFAULT,'EASTC', 8, '1998-04-28', '1998-05-12', '1998-05-01', 2, 278.959991, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK');
INSERT INTO orders VALUES (DEFAULT,'NORTS', 3, '1998-04-29', '1998-05-27', '1998-05-01', 3, 4.13000011, 'North/South', 'South House 300 Queensbridge', 'London', NULL, 'SW7 1RZ', 'UK');
INSERT INTO orders VALUES (DEFAULT,'BLAUS', 9, '1998-04-29', '1998-05-27', NULL, 3, 31.1399994, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'RICAR', 2, '1998-04-29', '1998-06-10', NULL, 2, 85.8000031, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'FRANS', 2, '1998-04-30', '1998-05-28', '1998-05-04', 2, 10.9799995, 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italy');
INSERT INTO orders VALUES (DEFAULT,'GREAL', 4, '1998-04-30', '1998-06-11', NULL, 3, 14.0100002, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO orders VALUES (DEFAULT,'REGGC', 4, '1998-04-30', '1998-05-28', NULL, 2, 29.9300003, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO orders VALUES (DEFAULT,'HUNGO', 3, '1998-04-30', '1998-05-28', '1998-05-06', 2, 81.7300034, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO orders VALUES (DEFAULT,'SAVEA', 1, '1998-05-01', '1998-05-29', '1998-05-04', 1, 30.0900002, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO orders VALUES (DEFAULT,'LILAS', 8, '1998-05-01', '1998-05-29', NULL, 1, 12.9099998, 'LILA-Supermercado', 'Carrera 52 con Ave. Bol??var #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO orders VALUES (DEFAULT,'WHITC', 7, '1998-05-01', '1998-05-29', '1998-05-04', 2, 44.7200012, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO orders VALUES (DEFAULT,'DRACD', 1, '1998-05-04', '1998-05-18', '1998-05-06', 2, 7.98000002, 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', NULL, '52066', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'QUEEN', 8, '1998-05-04', '1998-06-01', NULL, 2, 81.75, 'Queen Cozinha', 'Alameda dos Can??rios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO orders VALUES (DEFAULT,'TORTU', 1, '1998-05-04', '1998-06-01', '1998-05-06', 2, 15.6700001, 'Tortuga Restaurante', 'Avda. Azteca 123', 'M??xico D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES (DEFAULT,'LEHMS', 2, '1998-05-05', '1998-06-02', NULL, 1, 136, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO orders VALUES (DEFAULT,'LILAS', 1, '1998-05-05', '1998-06-02', NULL, 1, 0.930000007, 'LILA-Supermercado', 'Carrera 52 con Ave. Bol??var #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO orders VALUES (DEFAULT,'ERNSH', 4, '1998-05-05', '1998-06-02', NULL, 2, 258.640015, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO orders VALUES (DEFAULT,'PERIC', 2, '1998-05-05', '1998-06-02', NULL, 2, 24.9500008, 'Pericles Comidas cl??sicas', 'Calle Dr. Jorge Cash 321', 'M??xico D.F.', NULL, '05033', 'Mexico');
INSERT INTO orders VALUES (DEFAULT,'SIMOB', 7, '1998-05-06', '1998-06-03', NULL, 2, 18.4400005, 'Simons bistro', 'Vinb??ltet 34', 'Kobenhavn', NULL, '1734', 'Denmark');
INSERT INTO orders VALUES (DEFAULT,'RICSU', 8, '1998-05-06', '1998-06-03', NULL, 2, 6.19000006, 'Richter Supermarkt', 'Starenweg 5', 'Gen??ve', NULL, '1204', 'Switzerland');
INSERT INTO orders VALUES (DEFAULT,'BONAP', 4, '1998-05-06', '1998-06-03', NULL, 2, 38.2799988, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO orders VALUES (DEFAULT,'RATTC', 1, '1998-05-06', '1998-06-03', NULL, 2, 8.52999973, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO products VALUES (DEFAULT,'Chai', 8, 1, '10 boxes x 30 bags', 18, 39, 0, 10, 1);
INSERT INTO products VALUES (DEFAULT,'Chang', 1, 1, '24 - 12 oz bottles', 19, 17, 40, 25, 1);
INSERT INTO products VALUES (DEFAULT,'Aniseed Syrup', 1, 2, '12 - 550 ml bottles', 10, 13, 70, 25, 0);
INSERT INTO products VALUES (DEFAULT,'Chef Anton''s Cajun Seasoning', 2, 2, '48 - 6 oz jars', 22, 53, 0, 0, 0);
INSERT INTO products VALUES (DEFAULT,'Chef Anton''s Gumbo Mix', 2, 2, '36 boxes', 21.3500004, 0, 0, 0, 1);
INSERT INTO products VALUES (DEFAULT,'Grandma''s Boysenberry Spread', 3, 2, '12 - 8 oz jars', 25, 120, 0, 25, 0);
INSERT INTO products VALUES (DEFAULT,'Uncle Bob''s Organic Dried Pears', 3, 7, '12 - 1 lb pkgs.', 30, 15, 0, 10, 0);
INSERT INTO products VALUES (DEFAULT,'Northwoods Cranberry Sauce', 3, 2, '12 - 12 oz jars', 40, 6, 0, 0, 0);
INSERT INTO products VALUES (DEFAULT,'Mishi Kobe Niku', 4, 6, '18 - 500 g pkgs.', 97, 29, 0, 0, 1);
INSERT INTO products VALUES (DEFAULT,'Ikura', 4, 8, '12 - 200 ml jars', 31, 31, 0, 0, 0);
INSERT INTO products VALUES (DEFAULT,'Queso Cabrales', 5, 4, '1 kg pkg.', 21, 22, 30, 30, 0);
INSERT INTO products VALUES (DEFAULT,'Queso Manchego La Pastora', 5, 4, '10 - 500 g pkgs.', 38, 86, 0, 0, 0);
INSERT INTO products VALUES (DEFAULT,'Konbu', 6, 8, '2 kg box', 6, 24, 0, 5, 0);
INSERT INTO products VALUES (DEFAULT,'Tofu', 6, 7, '40 - 100 g pkgs.', 23.25, 35, 0, 0, 0);
INSERT INTO products VALUES (DEFAULT,'Genen Shouyu', 6, 2, '24 - 250 ml bottles', 13, 39, 0, 5, 0);
INSERT INTO products VALUES (DEFAULT,'Pavlova', 7, 3, '32 - 500 g boxes', 17.4500008, 29, 0, 10, 0);
INSERT INTO products VALUES (DEFAULT,'Alice Mutton', 7, 6, '20 - 1 kg tins', 39, 0, 0, 0, 1);
INSERT INTO products VALUES (DEFAULT,'Carnarvon Tigers', 7, 8, '16 kg pkg.', 62.5, 42, 0, 0, 0);
INSERT INTO products VALUES (DEFAULT,'Teatime Chocolate Biscuits', 8, 3, '10 boxes x 12 pieces', 9.19999981, 25, 0, 5, 0);
INSERT INTO products VALUES (DEFAULT,'Sir Rodney''s Marmalade', 8, 3, '30 gift boxes', 81, 40, 0, 0, 0);
INSERT INTO products VALUES (DEFAULT,'Sir Rodney''s Scones', 8, 3, '24 pkgs. x 4 pieces', 10, 3, 40, 5, 0);
INSERT INTO products VALUES (DEFAULT,'Gustaf''s Kn??ckebr??d', 9, 5, '24 - 500 g pkgs.', 21, 104, 0, 25, 0);
INSERT INTO products VALUES (DEFAULT,'Tunnbr??d', 9, 5, '12 - 250 g pkgs.', 9, 61, 0, 25, 0);
INSERT INTO products VALUES (DEFAULT,'Guaran?? Fant??stica', 10, 1, '12 - 355 ml cans', 4.5, 20, 0, 0, 1);
INSERT INTO products VALUES (DEFAULT,'NuNuCa Nu??-Nougat-Creme', 11, 3, '20 - 450 g glasses', 14, 76, 0, 30, 0);
INSERT INTO products VALUES (DEFAULT,'Gumb??r Gummib??rchen', 11, 3, '100 - 250 g bags', 31.2299995, 15, 0, 0, 0);
INSERT INTO products VALUES (DEFAULT,'Schoggi Schokolade', 11, 3, '100 - 100 g pieces', 43.9000015, 49, 0, 30, 0);
INSERT INTO products VALUES (DEFAULT,'R??ssle Sauerkraut', 12, 7, '25 - 825 g cans', 45.5999985, 26, 0, 0, 1);
INSERT INTO products VALUES (DEFAULT,'Th??ringer Rostbratwurst', 12, 6, '50 bags x 30 sausgs.', 123.790001, 0, 0, 0, 1);
INSERT INTO products VALUES (DEFAULT,'Nord-Ost Matjeshering', 13, 8, '10 - 200 g glasses', 25.8899994, 10, 0, 15, 0);
INSERT INTO products VALUES (DEFAULT,'Gorgonzola Telino', 14, 4, '12 - 100 g pkgs', 12.5, 0, 70, 20, 0);
INSERT INTO products VALUES (DEFAULT,'Mascarpone Fabioli', 14, 4, '24 - 200 g pkgs.', 32, 9, 40, 25, 0);
INSERT INTO products VALUES (DEFAULT,'Geitost', 15, 4, '500 g', 2.5, 112, 0, 20, 0);
INSERT INTO products VALUES (DEFAULT,'Sasquatch Ale', 16, 1, '24 - 12 oz bottles', 14, 111, 0, 15, 0);
INSERT INTO products VALUES (DEFAULT,'Steeleye Stout', 16, 1, '24 - 12 oz bottles', 18, 20, 0, 15, 0);
INSERT INTO products VALUES (DEFAULT,'Inlagd Sill', 17, 8, '24 - 250 g  jars', 19, 112, 0, 20, 0);
INSERT INTO products VALUES (DEFAULT,'Gravad lax', 17, 8, '12 - 500 g pkgs.', 26, 11, 50, 25, 0);
INSERT INTO products VALUES (DEFAULT,'C??te de Blaye', 18, 1, '12 - 75 cl bottles', 263.5, 17, 0, 15, 0);
INSERT INTO products VALUES (DEFAULT,'Chartreuse verte', 18, 1, '750 cc per bottle', 18, 69, 0, 5, 0);
INSERT INTO products VALUES (DEFAULT,'Boston Crab Meat', 19, 8, '24 - 4 oz tins', 18.3999996, 123, 0, 30, 0);
INSERT INTO products VALUES (DEFAULT,'Jack''s New England Clam Chowder', 19, 8, '12 - 12 oz cans', 9.64999962, 85, 0, 10, 0);
INSERT INTO products VALUES (DEFAULT,'Singaporean Hokkien Fried Mee', 20, 5, '32 - 1 kg pkgs.', 14, 26, 0, 0, 1);
INSERT INTO products VALUES (DEFAULT,'Ipoh Coffee', 20, 1, '16 - 500 g tins', 46, 17, 10, 25, 0);
INSERT INTO products VALUES (DEFAULT,'Gula Malacca', 20, 2, '20 - 2 kg bags', 19.4500008, 27, 0, 15, 0);
INSERT INTO products VALUES (DEFAULT,'Rogede sild', 21, 8, '1k pkg.', 9.5, 5, 70, 15, 0);
INSERT INTO products VALUES (DEFAULT,'Spegesild', 21, 8, '4 - 450 g glasses', 12, 95, 0, 0, 0);
INSERT INTO products VALUES (DEFAULT,'Zaanse koeken', 22, 3, '10 - 4 oz boxes', 9.5, 36, 0, 0, 0);
INSERT INTO products VALUES (DEFAULT,'Chocolade', 22, 3, '10 pkgs.', 12.75, 15, 70, 25, 0);
INSERT INTO products VALUES (DEFAULT,'Maxilaku', 23, 3, '24 - 50 g pkgs.', 20, 10, 60, 15, 0);
INSERT INTO products VALUES (DEFAULT,'Valkoinen suklaa', 23, 3, '12 - 100 g bars', 16.25, 65, 0, 30, 0);
INSERT INTO products VALUES (DEFAULT,'Manjimup Dried Apples', 24, 7, '50 - 300 g pkgs.', 53, 20, 0, 10, 0);
INSERT INTO products VALUES (DEFAULT,'Filo Mix', 24, 5, '16 - 2 kg boxes', 7, 38, 0, 25, 0);
INSERT INTO products VALUES (DEFAULT,'Perth Pasties', 24, 6, '48 pieces', 32.7999992, 0, 0, 0, 1);
INSERT INTO products VALUES (DEFAULT,'Tourti??re', 25, 6, '16 pies', 7.44999981, 21, 0, 10, 0);
INSERT INTO products VALUES (DEFAULT,'P??t?? chinois', 25, 6, '24 boxes x 2 pies', 24, 115, 0, 20, 0);
INSERT INTO products VALUES (DEFAULT,'Gnocchi di nonna Alice', 26, 5, '24 - 250 g pkgs.', 38, 21, 10, 30, 0);
INSERT INTO products VALUES (DEFAULT,'Ravioli Angelo', 26, 5, '24 - 250 g pkgs.', 19.5, 36, 0, 20, 0);
INSERT INTO products VALUES (DEFAULT,'Escargots de Bourgogne', 27, 8, '24 pieces', 13.25, 62, 0, 20, 0);
INSERT INTO products VALUES (DEFAULT,'Raclette Courdavault', 28, 4, '5 kg pkg.', 55, 79, 0, 0, 0);
INSERT INTO products VALUES (DEFAULT,'Camembert Pierrot', 28, 4, '15 - 300 g rounds', 34, 19, 0, 0, 0);
INSERT INTO products VALUES (DEFAULT,'Sirop d''??rable', 29, 2, '24 - 500 ml bottles', 28.5, 113, 0, 25, 0);
INSERT INTO products VALUES (DEFAULT,'Tarte au sucre', 29, 3, '48 pies', 49.2999992, 17, 0, 0, 0);
INSERT INTO products VALUES (DEFAULT,'Vegie-spread', 7, 2, '15 - 625 g jars', 43.9000015, 24, 0, 5, 0);
INSERT INTO products VALUES (DEFAULT,'Wimmers gute Semmelkn??del', 12, 5, '20 bags x 4 pieces', 33.25, 22, 80, 30, 0);
INSERT INTO products VALUES (DEFAULT,'Louisiana Fiery Hot Pepper Sauce', 2, 2, '32 - 8 oz bottles', 21.0499992, 76, 0, 0, 0);
INSERT INTO products VALUES (DEFAULT,'Louisiana Hot Spiced Okra', 2, 2, '24 - 8 oz jars', 17, 4, 100, 20, 0);
INSERT INTO products VALUES (DEFAULT,'Laughing Lumberjack Lager', 16, 1, '24 - 12 oz bottles', 14, 52, 0, 10, 0);
INSERT INTO products VALUES (DEFAULT,'Scottish Longbreads', 8, 3, '10 boxes x 8 pieces', 12.5, 6, 10, 15, 0);
INSERT INTO products VALUES (DEFAULT,'Gudbrandsdalsost', 15, 4, '10 kg pkg.', 36, 26, 0, 15, 0);
INSERT INTO products VALUES (DEFAULT,'Outback Lager', 7, 1, '24 - 355 ml bottles', 15, 15, 10, 30, 0);
INSERT INTO products VALUES (DEFAULT,'Flotemysost', 15, 4, '10 - 500 g pkgs.', 21.5, 26, 0, 0, 0);
INSERT INTO products VALUES (DEFAULT,'Mozzarella di Giovanni', 14, 4, '24 - 200 g pkgs.', 34.7999992, 14, 0, 0, 0);
INSERT INTO products VALUES (DEFAULT,'R??d Kaviar', 17, 8, '24 - 150 g jars', 15, 101, 0, 5, 0);
INSERT INTO products VALUES (DEFAULT,'Longlife Tofu', 4, 7, '5 kg pkg.', 10, 4, 20, 5, 0);
INSERT INTO products VALUES (DEFAULT,'Rh??nbr??u Klosterbier', 12, 1, '24 - 0.5 l bottles', 7.75, 125, 0, 25, 0);
INSERT INTO products VALUES (DEFAULT,'Lakkalik????ri', 23, 1, '500 ml', 18, 57, 0, 20, 0);
INSERT INTO products VALUES (DEFAULT,'Original Frankfurter gr??ne So??e', 12, 2, '12 boxes', 13, 32, 0, 15, 0);


--
-- Data for Name: region; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO region VALUES (DEFAULT,'Eastern');
INSERT INTO region VALUES (DEFAULT,'Western');
INSERT INTO region VALUES (DEFAULT,'Northern');
INSERT INTO region VALUES (DEFAULT,'Southern');


--
-- Data for Name: shippers; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO shippers VALUES (DEFAULT,'Speedy Express', '(503) 555-9831');
INSERT INTO shippers VALUES (DEFAULT,'United Package', '(503) 555-3199');
INSERT INTO shippers VALUES (DEFAULT,'Federal Shipping', '(503) 555-9931');
INSERT INTO shippers VALUES (DEFAULT,'Alliance Shippers', '1-800-222-0451');
INSERT INTO shippers VALUES (DEFAULT,'UPS', '1-800-782-7892');
INSERT INTO shippers VALUES (DEFAULT,'DHL', '1-800-225-5345');



--
-- Data for Name: suppliers; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO suppliers VALUES (DEFAULT,'Exotic Liquids', 'Charlotte Cooper', 'Purchasing Manager', '49 Gilbert St.', 'London', NULL, 'EC1 4SD', 'UK', '(171) 555-2222', NULL, NULL);
INSERT INTO suppliers VALUES (DEFAULT,'New Orleans Cajun Delights', 'Shelley Burke', 'Order Administrator', 'P.O. Box 78934', 'New Orleans', 'LA', '70117', 'USA', '(100) 555-4822', NULL, '#CAJUN.HTM#');
INSERT INTO suppliers VALUES (DEFAULT,'Grandma Kelly''s Homestead', 'Regina Murphy', 'Sales Representative', '707 Oxford Rd.', 'Ann Arbor', 'MI', '48104', 'USA', '(313) 555-5735', '(313) 555-3349', NULL);
INSERT INTO suppliers VALUES (DEFAULT,'Tokyo Traders', 'Yoshi Nagase', 'Marketing Manager', '9-8 Sekimai Musashino-shi', 'Tokyo', NULL, '100', 'Japan', '(03) 3555-5011', NULL, NULL);
INSERT INTO suppliers VALUES (DEFAULT,'Cooperativa de Quesos ''Las Cabras''', 'Antonio del Valle Saavedra', 'Export Administrator', 'Calle del Rosal 4', 'Oviedo', 'Asturias', '33007', 'Spain', '(98) 598 76 54', NULL, NULL);
INSERT INTO suppliers VALUES (DEFAULT,'Mayumi''s', 'Mayumi Ohno', 'Marketing Representative', '92 Setsuko Chuo-ku', 'Osaka', NULL, '545', 'Japan', '(06) 431-7877', NULL, 'Mayumi''s (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/mayumi.htm#');
INSERT INTO suppliers VALUES (DEFAULT,'Pavlova, Ltd.', 'Ian Devling', 'Marketing Manager', '74 Rose St. Moonie Ponds', 'Melbourne', 'Victoria', '3058', 'Australia', '(03) 444-2343', '(03) 444-6588', NULL);
INSERT INTO suppliers VALUES (DEFAULT,'Specialty Biscuits, Ltd.', 'Peter Wilson', 'Sales Representative', '29 King''s Way', 'Manchester', NULL, 'M14 GSD', 'UK', '(161) 555-4448', NULL, NULL);
INSERT INTO suppliers VALUES (DEFAULT,'PB Kn??ckebr??d AB', 'Lars Peterson', 'Sales Agent', 'Kaloadagatan 13', 'G??teborg', NULL, 'S-345 67', 'Sweden', '031-987 65 43', '031-987 65 91', NULL);
INSERT INTO suppliers VALUES (DEFAULT,'Refrescos Americanas LTDA', 'Carlos Diaz', 'Marketing Manager', 'Av. das Americanas 12.890', 'Sao Paulo', NULL, '5442', 'Brazil', '(11) 555 4640', NULL, NULL);
INSERT INTO suppliers VALUES (DEFAULT,'Heli S????waren GmbH & Co. KG', 'Petra Winkler', 'Sales Manager', 'Tiergartenstra??e 5', 'Berlin', NULL, '10785', 'Germany', '(010) 9984510', NULL, NULL);
INSERT INTO suppliers VALUES (DEFAULT,'Plutzer Lebensmittelgro??m??rkte AG', 'Martin Bein', 'International Marketing Mgr.', 'Bogenallee 51', 'Frankfurt', NULL, '60439', 'Germany', '(069) 992755', NULL, 'Plutzer (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/plutzer.htm#');
INSERT INTO suppliers VALUES (DEFAULT,'Nord-Ost-Fisch Handelsgesellschaft mbH', 'Sven Petersen', 'Coordinator Foreign Markets', 'Frahmredder 112a', 'Cuxhaven', NULL, '27478', 'Germany', '(04721) 8713', '(04721) 8714', NULL);
INSERT INTO suppliers VALUES (DEFAULT,'Formaggi Fortini s.r.l.', 'Elio Rossi', 'Sales Representative', 'Viale Dante, 75', 'Ravenna', NULL, '48100', 'Italy', '(0544) 60323', '(0544) 60603', '#FORMAGGI.HTM#');
INSERT INTO suppliers VALUES (DEFAULT,'Norske Meierier', 'Beate Vileid', 'Marketing Manager', 'Hatlevegen 5', 'Sandvika', NULL, '1320', 'Norway', '(0)2-953010', NULL, NULL);
INSERT INTO suppliers VALUES (DEFAULT,'Bigfoot Breweries', 'Cheryl Saylor', 'Regional Account Rep.', '3400 - 8th Avenue Suite 210', 'Bend', 'OR', '97101', 'USA', '(503) 555-9931', NULL, NULL);
INSERT INTO suppliers VALUES (DEFAULT,'Svensk Sj??f??da AB', 'Michael Bj??rn', 'Sales Representative', 'Brovallav??gen 231', 'Stockholm', NULL, 'S-123 45', 'Sweden', '08-123 45 67', NULL, NULL);
INSERT INTO suppliers VALUES (DEFAULT,'Aux joyeux eccl??siastiques', 'Guyl??ne Nodier', 'Sales Manager', '203, Rue des Francs-Bourgeois', 'Paris', NULL, '75004', 'France', '(1) 03.83.00.68', '(1) 03.83.00.62', NULL);
INSERT INTO suppliers VALUES (DEFAULT,'New England Seafood Cannery', 'Robb Merchant', 'Wholesale Account Agent', 'Order Processing Dept. 2100 Paul Revere Blvd.', 'Boston', 'MA', '02134', 'USA', '(617) 555-3267', '(617) 555-3389', NULL);
INSERT INTO suppliers VALUES (DEFAULT,'Leka Trading', 'Chandra Leka', 'Owner', '471 Serangoon Loop, Suite #402', 'Singapore', NULL, '0512', 'Singapore', '555-8787', NULL, NULL);
INSERT INTO suppliers VALUES (DEFAULT,'Lyngbysild', 'Niels Petersen', 'Sales Manager', 'Lyngbysild Fiskebakken 10', 'Lyngby', NULL, '2800', 'Denmark', '43844108', '43844115', NULL);
INSERT INTO suppliers VALUES (DEFAULT,'Zaanse Snoepfabriek', 'Dirk Luchte', 'Accounting Manager', 'Verkoop Rijnweg 22', 'Zaandam', NULL, '9999 ZZ', 'Netherlands', '(12345) 1212', '(12345) 1210', NULL);
INSERT INTO suppliers VALUES (DEFAULT,'Karkki Oy', 'Anne Heikkonen', 'Product Manager', 'Valtakatu 12', 'Lappeenranta', NULL, '53120', 'Finland', '(953) 10956', NULL, NULL);
INSERT INTO suppliers VALUES (DEFAULT,'G''day, Mate', 'Wendy Mackenzie', 'Sales Representative', '170 Prince Edward Parade Hunter''s Hill', 'Sydney', 'NSW', '2042', 'Australia', '(02) 555-5914', '(02) 555-4873', 'G''day Mate (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/gdaymate.htm#');
INSERT INTO suppliers VALUES (DEFAULT,'Ma Maison', 'Jean-Guy Lauzon', 'Marketing Manager', '2960 Rue St. Laurent', 'Montr??al', 'Qu??bec', 'H1J 1C3', 'Canada', '(514) 555-9022', NULL, NULL);
INSERT INTO suppliers VALUES (DEFAULT,'Pasta Buttini s.r.l.', 'Giovanni Giudici', 'Order Administrator', 'Via dei Gelsomini, 153', 'Salerno', NULL, '84100', 'Italy', '(089) 6547665', '(089) 6547667', NULL);
INSERT INTO suppliers VALUES (DEFAULT,'Escargots Nouveaux', 'Marie Delamare', 'Sales Manager', '22, rue H. Voiron', 'Montceau', NULL, '71300', 'France', '85.57.00.07', NULL, NULL);
INSERT INTO suppliers VALUES (DEFAULT,'Gai p??turage', 'Eliane Noz', 'Sales Representative', 'Bat. B 3, rue des Alpes', 'Annecy', NULL, '74000', 'France', '38.76.98.06', '38.76.98.58', NULL);
INSERT INTO suppliers VALUES (DEFAULT,'For??ts d''??rables', 'Chantal Goulet', 'Accounting Manager', '148 rue Chasseur', 'Ste-Hyacinthe', 'Qu??bec', 'J2S 7S8', 'Canada', '(514) 555-2955', '(514) 555-2921', NULL);


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

INSERT INTO us_states VALUES (DEFAULT,'Alabama', 'AL', 'south');
INSERT INTO us_states VALUES (DEFAULT,'Alaska', 'AK', 'north');
INSERT INTO us_states VALUES (DEFAULT,'Arizona', 'AZ', 'west');
INSERT INTO us_states VALUES (DEFAULT,'Arkansas', 'AR', 'south');
INSERT INTO us_states VALUES (DEFAULT,'California', 'CA', 'west');
INSERT INTO us_states VALUES (DEFAULT,'Colorado', 'CO', 'west');
INSERT INTO us_states VALUES (DEFAULT,'Connecticut', 'CT', 'east');
INSERT INTO us_states VALUES (DEFAULT,'Delaware', 'DE', 'east');
INSERT INTO us_states VALUES (DEFAULT,'District of Columbia', 'DC', 'east');
INSERT INTO us_states VALUES (DEFAULT,'Florida', 'FL', 'south');
INSERT INTO us_states VALUES (DEFAULT,'Georgia', 'GA', 'south');
INSERT INTO us_states VALUES (DEFAULT,'Hawaii', 'HI', 'west');
INSERT INTO us_states VALUES (DEFAULT,'Idaho', 'ID', 'midwest');
INSERT INTO us_states VALUES (DEFAULT,'Illinois', 'IL', 'midwest');
INSERT INTO us_states VALUES (DEFAULT,'Indiana', 'IN', 'midwest');
INSERT INTO us_states VALUES (DEFAULT,'Iowa', 'IO', 'midwest');
INSERT INTO us_states VALUES (DEFAULT,'Kansas', 'KS', 'midwest');
INSERT INTO us_states VALUES (DEFAULT,'Kentucky', 'KY', 'south');
INSERT INTO us_states VALUES (DEFAULT,'Louisiana', 'LA', 'south');
INSERT INTO us_states VALUES (DEFAULT,'Maine', 'ME', 'north');
INSERT INTO us_states VALUES (DEFAULT,'Maryland', 'MD', 'east');
INSERT INTO us_states VALUES (DEFAULT,'Massachusetts', 'MA', 'north');
INSERT INTO us_states VALUES (DEFAULT,'Michigan', 'MI', 'north');
INSERT INTO us_states VALUES (DEFAULT,'Minnesota', 'MN', 'north');
INSERT INTO us_states VALUES (DEFAULT,'Mississippi', 'MS', 'south');
INSERT INTO us_states VALUES (DEFAULT,'Missouri', 'MO', 'south');
INSERT INTO us_states VALUES (DEFAULT,'Montana', 'MT', 'west');
INSERT INTO us_states VALUES (DEFAULT,'Nebraska', 'NE', 'midwest');
INSERT INTO us_states VALUES (DEFAULT,'Nevada', 'NV', 'west');
INSERT INTO us_states VALUES (DEFAULT,'New Hampshire', 'NH', 'east');
INSERT INTO us_states VALUES (DEFAULT,'New Jersey', 'NJ', 'east');
INSERT INTO us_states VALUES (DEFAULT,'New Mexico', 'NM', 'west');
INSERT INTO us_states VALUES (DEFAULT,'New York', 'NY', 'east');
INSERT INTO us_states VALUES (DEFAULT,'North Carolina', 'NC', 'east');
INSERT INTO us_states VALUES (DEFAULT,'North Dakota', 'ND', 'midwest');
INSERT INTO us_states VALUES (DEFAULT,'Ohio', 'OH', 'midwest');
INSERT INTO us_states VALUES (DEFAULT,'Oklahoma', 'OK', 'midwest');
INSERT INTO us_states VALUES (DEFAULT,'Oregon', 'OR', 'west');
INSERT INTO us_states VALUES (DEFAULT,'Pennsylvania', 'PA', 'east');
INSERT INTO us_states VALUES (DEFAULT,'Rhode Island', 'RI', 'east');
INSERT INTO us_states VALUES (DEFAULT,'South Carolina', 'SC', 'east');
INSERT INTO us_states VALUES (DEFAULT,'South Dakota', 'SD', 'midwest');
INSERT INTO us_states VALUES (DEFAULT,'Tennessee', 'TN', 'midwest');
INSERT INTO us_states VALUES (DEFAULT,'Texas', 'TX', 'west');
INSERT INTO us_states VALUES (DEFAULT,'Utah', 'UT', 'west');
INSERT INTO us_states VALUES (DEFAULT,'Vermont', 'VT', 'east');
INSERT INTO us_states VALUES (DEFAULT,'Virginia', 'VA', 'east');
INSERT INTO us_states VALUES (DEFAULT,'Washington', 'WA', 'west');
INSERT INTO us_states VALUES (DEFAULT,'West Virginia', 'WV', 'south');
INSERT INTO us_states VALUES (DEFAULT,'Wisconsin', 'WI', 'midwest');
INSERT INTO us_states VALUES (DEFAULT,'Wyoming', 'WY', 'west');


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