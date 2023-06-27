CREATE OR REPLACE FUNCTION insert_salesperson_func(salesperson_id INTEGER, fname TEXT, lname TEXT, salary INTEGER)
RETURNS void
AS $MAIN$
BEGIN 
	INSERT INTO salesperson 
	VALUES (salesperson_id, fname, lname, salary);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT insert_salesperson_func(1, 'Saraa', 'Yafai', 150000);
SELECT insert_salesperson_func(2, 'Louis', 'Litt', 160000);
SELECT insert_salesperson_func(3, 'Harvey', 'Spector', 155000);
SELECT insert_salesperson_func(4, 'Donna', 'Rose', 155000);

SELECT * 
FROM salesperson;

CREATE OR REPLACE FUNCTION insert_customer_func(customer_id INTEGER, fname TEXT, lname TEXT,  address TEXT, phone_number TEXT)
RETURNS void
AS $MAIN$
BEGIN 
	INSERT INTO customer 
	VALUES (customer_id, fname, lname, address, phone_number);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT insert_customer_func(1, 'Mohamed', 'Ali', '424 E 22 St, Brooklyn, NY','718-424-2442');
SELECT insert_customer_func(2, 'Abdulla', 'Ahmed', '646 W 44 St, Queens, NY','212-646-4664');
SELECT insert_customer_func(3, 'Iftikhar', 'Uddin', '686 S 88 St, Bronx, NY','929-868-6886');
SELECT insert_customer_func(4, 'Sami', 'Beig', '979 N 99 St, Manhatten, NY','516-979-7997');

SELECT *
FROM customer;

CREATE OR REPLACE FUNCTION insert_newcar_func(newcar_id INTEGER, make TEXT, year_ INTEGER, model TEXT, date_brought DATE, newcar_amount NUMERIC, salesperson_id INTEGER, customer_id INTEGER)
RETURNS void
AS $MAIN$
BEGIN 
	INSERT INTO newcar 
	VALUES (newcar_id, make, year_, model, date_brought, newcar_amount, salesperson_id, customer_id);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT insert_newcar_func(1, 'Toyota', 2023, 'Landcruiser', CURRENT_DATE, 115500.00, 1, 1);
SELECT insert_newcar_func(2, 'Mercedes', 2023, 'G-Wagon', CURRENT_DATE, 155000.00, 2, 2);
SELECT insert_newcar_func(3, 'Porsche', 2023, 'Spyder 918', CURRENT_DATE, 210000.00, 3, 3);
SELECT insert_newcar_func(4, 'Lamborghini', 2023, 'Urus', CURRENT_DATE, 250000.00, 4, 4);

ALTER TABLE newcar
ADD COLUMN is_serviced BOOLEAN DEFAULT FALSE;

CREATE OR REPLACE FUNCTION update_service_status(customer_id INTEGER)
RETURNS VOID AS
$$
BEGIN
	UPDATE newcar
	SET is_serviced = TRUE
	WHERE customer_id = customer_id;
    COMMIT;
 
END;
$$
LANGUAGE plpgsql;

SELECT update_service_status(1);

SELECT *
FROM newcar;

CREATE OR REPLACE FUNCTION insert_mechanic_func(mechanic_id INTEGER, fname TEXT, lname TEXT, service_id INTEGER)
RETURNS void
AS $MAIN$
BEGIN 
	INSERT INTO mechanic 
	VALUES (mechanic_id, fname, lname, service_id);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT insert_mechanic_func(1, 'Brian', 'Shew', 1);
SELECT insert_mechanic_func(2, 'Kevin', 'Hart', 2);
SELECT insert_mechanic_func(3, 'Nick', 'Cannon', 3);
SELECT insert_mechanic_func(4, 'Rachel', 'Zane', 4);

SELECT *
FROM mechanic;


CREATE OR REPLACE FUNCTION insert_usedcar_func(usedcar_id INTEGER, make TEXT, year_ INTEGER, model TEXT)
RETURNS void
AS $MAIN$
BEGIN 
	INSERT INTO usedcar 
	VALUES (usedcar_id, make, year_, model);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT insert_usedcar_func(1, 'Toyota', 2018, 'Rav4');
SELECT insert_usedcar_func(2, 'Toyota', 2019, 'CR-V');
SELECT insert_usedcar_func(3, 'Toyota', 2017, 'Palisades');
SELECT insert_usedcar_func(4, 'Toyota', 2016, 'Altima');

SELECT *
FROM usedcar;



CREATE OR REPLACE FUNCTION insert_servicedcar_func(service_id INTEGER, description TEXT, service_amount NUMERIC, used_car_id INTEGER)
RETURNS void
AS $MAIN$
BEGIN
	INSERT INTO servicedcar
	VALUES (service_id, description, service_amount, used_car_id);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT insert_servicedcar_func(1, 'Oil change', 60.99, 1);
SELECT insert_servicedcar_func(2, 'Break change', 220.99, 2);
SELECT insert_servicedcar_func(3, 'Tire change', 150.99, 3);
SELECT insert_servicedcar_func(4, 'Paint job', 1200.00, 4);

CREATE OR REPLACE FUNCTION insert_INVOICE_func(invoice_id INTEGER, payment BOOLEAN, customer_id INTEGER, service_id INTEGER)
RETURNS VOID
AS $MAIN$
BEGIN
	INSERT INTO invoice
	VALUES (invoice_id, payment, customer_id, service_id);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT insert_invoice_func(1, TRUE, 1, 1);
SELECT insert_invoice_func(2, TRUE, 2, 2);
SELECT insert_invoice_func(3, TRUE, 3, 3);
SELECT insert_invoice_func(4, TRUE, 4, 4);

SELECT *
FROM invoice;


CREATE OR REPLACE FUNCTION insert_parts_func(parts_id INTEGER, parts_name TEXT, quantity INTEGER, parts_amount NUMERIC, customer_id INTEGER)
RETURNS VOID
AS $MAIN$
BEGIN
	INSERT INTO parts
	VALUES (parts_id, parts_name, quantity, parts_amount, customer_id);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT insert_parts_func(1, 'Muffler', 1, 45.99, 1);
SELECT insert_parts_func(2, 'Breaks', 3, 85.99, 2);
SELECT insert_parts_func(3, 'Suspension', 2, 98.99, 3);
SELECT insert_parts_func(4, 'Spark Plug', 4, 485.00, 4);




