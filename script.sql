CREATE DATABASE tiendaa;

CREATE TABLE product (
    id SERIAL,
    product_name TEXT,
    price DECIMAL,
)
PARTITION BY RANGE (price);


CREATE TABLE product_partition_1 PARTITION OF product
    FOR VALUES FROM (1.00) TO (3000.00);

CREATE TABLE product_partition_2 PARTITION OF product
    FOR VALUES FROM (3000.01) TO (6000.00);

CREATE TABLE producto_partition_3 PARTITION OF producto
    FOR VALUES FROM (6000.01) TO (10000.00);


CREATE TABLE client (
    id_client SERIAL,
    first_name TEXT,
    last_name TEXT,
    adreess TEXT,
    country TEXT,
    email TEXT,
    cellphone TEXT,
    telephone TEXT,
    job_title TEXT,
    gender TEXT,
    college TEXT,
) PARTITION BY LIST (gender);


CREATE TABLE client_partition_female PARTITION OF client
    FOR VALUES IN ('Female', 'female', 'FEMALE');

CREATE TABLE client_partition_male PARTITION OF client
    FOR VALUES IN ('Male', 'male', 'MALE');

\i /var/lib/postgresql/product.sql 
\i /var/lib/postgresql/client.sql   
  
select * from product_partition_1;
select * from product_partition_2;
select * from product_partition_3;


select * from client_partition_female;
select * from client_partition_male;

select count(*) from product;
select count(*) from product_partition_1;
select count(*) from product_partition_2;
select count(*) from product_partition_3;

select count(*) from client;
select count(*) from client_partition_female;
select count(*) from client_partition_male;




