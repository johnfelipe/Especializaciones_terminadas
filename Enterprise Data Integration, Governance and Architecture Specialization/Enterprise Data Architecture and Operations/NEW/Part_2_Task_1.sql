
-- Create tables for OLTP schema

CREATE TABLE roles (
    id INT PRIMARY KEY AUTO_INCREMENT,
    role_name VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARBINARY(255) NOT NULL
);

CREATE TABLE employee_roles (
    employee_id INT,
    role_id INT,
    PRIMARY KEY (employee_id, role_id),
    FOREIGN KEY (employee_id) REFERENCES employees(id),
    FOREIGN KEY (role_id) REFERENCES roles(id)
);

CREATE TABLE patients (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    dob DATE NOT NULL,
    medical_record VARBINARY(255) NOT NULL,
    insurance_number VARBINARY(255) NOT NULL
);

-- Insert sample data
-- Encryption key setup
SET @encryption_key = 'SecureHealthKey';

INSERT INTO roles (role_name)
VALUES ('Doctor'), ('Nurse'), ('Admin');

INSERT INTO employees (name, email, password)
VALUES 
('Dr. John Doe', 'john.doe@securehealth.com', AES_ENCRYPT('doctor_password', @encryption_key)),
('Nurse Jane', 'jane.nurse@securehealth.com', AES_ENCRYPT('nurse_password', @encryption_key)),
('Admin Lisa', 'lisa.admin@securehealth.com', AES_ENCRYPT('admin_password', @encryption_key));

-- Assign roles
INSERT INTO employee_roles (employee_id, role_id)
VALUES (1, 1), (2, 2), (3, 3);

INSERT INTO patients (name, dob, medical_record, insurance_number)
VALUES
('Alice Johnson', '1990-05-15', AES_ENCRYPT('Diabetes, Hypertension', @encryption_key), AES_ENCRYPT('INS-123456789', @encryption_key)),
('Bob Smith', '1985-10-22', AES_ENCRYPT('Asthma', @encryption_key), AES_ENCRYPT('INS-987654321', @encryption_key));
