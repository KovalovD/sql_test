CREATE TABLE customers
(
    customer_id   INT AUTO_INCREMENT PRIMARY KEY,
    full_name     VARCHAR(255) NOT NULL,
    date_of_birth DATE         NOT NULL,
    email         VARCHAR(255) NOT NULL UNIQUE,
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE brokers
(
    broker_id       INT AUTO_INCREMENT PRIMARY KEY,
    name            VARCHAR(255)              NOT NULL,
    email           VARCHAR(255)              NOT NULL UNIQUE,
    company_address VARCHAR(255)              NOT NULL,
    broker_type     ENUM ('A', 'B', 'C', 'D') NOT NULL,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE products
(
    product_id    INT AUTO_INCREMENT PRIMARY KEY,
    name          VARCHAR(255)  NOT NULL,
    interest_rate DECIMAL(5, 2) NOT NULL,
    term          INT           NOT NULL,
    created_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE loan_applications
(
    application_id  INT AUTO_INCREMENT PRIMARY KEY,
    customer_id     INT,
    broker_id       INT,
    product_id      INT                                                                          NOT NULL,
    loan_amount     DECIMAL(10, 2)                                                               NOT NULL,
    monthly_payment DECIMAL(10, 2) GENERATED ALWAYS AS (loan_amount * (interest_rate / 12)) STORED,
    status          ENUM ('NEW', 'PROCESSING', 'APPROVED', 'DECLINED', 'COMPLETED', 'CANCELLED') NOT NULL,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
    FOREIGN KEY (broker_id) REFERENCES brokers (broker_id),
    FOREIGN KEY (product_id) REFERENCES products (product_id)
);

CREATE TABLE application_status_changes
(
    status_change_id INT AUTO_INCREMENT PRIMARY KEY,
    application_id   INT                                                                          NOT NULL,
    old_status       ENUM ('NEW', 'PROCESSING', 'APPROVED', 'DECLINED', 'COMPLETED', 'CANCELLED'),
    new_status       ENUM ('NEW', 'PROCESSING', 'APPROVED', 'DECLINED', 'COMPLETED', 'CANCELLED') NOT NULL,
    changed_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (application_id) REFERENCES loan_applications (application_id)
);

CREATE TABLE customer_address_history
(
    address_id  INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT          NOT NULL,
    address     VARCHAR(255) NOT NULL,
    start_date  DATE         NOT NULL,
    end_date    DATE,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);
