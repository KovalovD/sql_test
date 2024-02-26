INSERT INTO customers (full_name, date_of_birth, email)
VALUES ('John Doe', '1980-04-01', 'johndoe@email.com'),
       ('Jane Doe', '1985-05-02', 'janedoe@email.com');

INSERT INTO brokers (name, email, company_address, broker_type)
VALUES ('Broker One', 'broker1@email.com', '123 Broker Lane', 'A'),
       ('Broker Two', 'broker2@email.com', '456 Broker Street', 'B');

INSERT INTO products (name, interest_rate, term)
VALUES ('Product A', 5.00, 15),
       ('Product B', 6.00, 20);

INSERT INTO loan_applications (customer_id, broker_id, product_id, loan_amount, status)
VALUES (1, 1, 1, 100000, 'NEW'),
       (2, NULL, 2, 150000, 'PROCESSING');

INSERT INTO application_status_changes (application_id, old_status, new_status)
VALUES (1, 'NEW', 'PROCESSING'),
       (2, 'PROCESSING', 'APPROVED');

INSERT INTO customer_address_history (customer_id, address, start_date, end_date)
VALUES (1, '123 Main St', '2018-01-01', '2020-01-01'),
       (1, '456 Elm St', '2020-01-02', NULL),
       (2, '789 Pine St', '2017-01-01', '2019-01-01'),
       (2, '321 Oak St', '2019-01-02', '2021-01-01');
