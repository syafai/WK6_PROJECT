CREATE TABLE SALESPERSON (
  salesperson_id SERIAL PRIMARY KEY,
  fname VARCHAR(50),
  lname VARCHAR(50),
  salary INTEGER
);


CREATE TABLE CUSTOMER (
  customer_id SERIAL PRIMARY KEY,
  lname VARCHAR(50),
  fname VARCHAR(50),
  address VARCHAR(100),
  phone_number VARCHAR(20)
);

CREATE TABLE NEWCAR (
  car_id SERIAL PRIMARY KEY,
  make VARCHAR(50),
  year_ INTEGER,
  model VARCHAR(50),
  date_brought DATE,
  newcar_amount NUMERIC(10,2),
  salesperson_id INTEGER NOT NULL,
  customer_id INTEGER NOT NULL,
    FOREIGN KEY (salesperson_id)
      REFERENCES SALESPERSON(salesperson_id),
    FOREIGN KEY (customer_id)
      REFERENCES CUSTOMER(customer_id)
);


CREATE TABLE MECHANIC (
  mechanic_id SERIAL PRIMARY KEY,
  fname VARCHAR(50),
  lname VARCHAR(50),
  service_id INTEGER NOT NULL,
	FOREIGN KEY (service_id)
	  REFERENCES SALESPERSON(salesperson_id)
);

CREATE TABLE USEDCAR (
  used_car_id SERIAL PRIMARY KEY,
  make VARCHAR(50),
  year_ INTEGER,
  model VARCHAR(50)
);

CREATE TABLE SERVICEDCAR (
  service_id SERIAL PRIMARY KEY,
  description VARCHAR(1000),
  service_amount NUMERIC(10,2),	
  used_car_id INTEGER NOT NULL,
    FOREIGN KEY (used_car_id)
      REFERENCES USEDCAR(used_car_id)
);

CREATE TABLE INVOICE (
  invoice_id SERIAL PRIMARY KEY,
  payment BOOLEAN,
  customer_id INTEGER NOT NULL,
  service_id INTEGER NOT NULL,
    FOREIGN KEY (customer_id)
      REFERENCES CUSTOMER(customer_id),
    FOREIGN KEY (service_id)
      REFERENCES SERVICEDCAR(service_id)
);

CREATE TABLE PARTS (
  parts_id SERIAL PRIMARY KEY,
  parts_name VARCHAR(100),
  quantity INTEGER,
  parts_amount NUMERIC(10,2),
  customer_id INTEGER NOT NULL, 
    FOREIGN KEY (customer_id)
      REFERENCES CUSTOMER(customer_id)
);



