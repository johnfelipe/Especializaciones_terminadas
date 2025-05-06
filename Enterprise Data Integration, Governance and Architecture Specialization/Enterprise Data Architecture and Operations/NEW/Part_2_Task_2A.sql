
-- Create dimension tables

CREATE TABLE dim_patients (
    patient_id INT PRIMARY KEY,
    name VARCHAR(100),
    dob DATE
);

CREATE TABLE dim_employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE dim_roles (
    role_id INT PRIMARY KEY,
    role_name VARCHAR(50)
);

CREATE TABLE dim_dates (
    date_id INT PRIMARY KEY,
    full_date DATE,
    year INT,
    quarter INT,
    month INT,
    day INT
);

CREATE TABLE dim_diagnosis (
    diagnosis_id INT PRIMARY KEY,
    diagnosis_name VARCHAR(255)
);

-- Create fact table

CREATE TABLE fact_patient_visits (
    visit_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    employee_id INT,
    role_id INT,
    date_id INT,
    diagnosis_id INT,
    total_cost DECIMAL(10,2),
    FOREIGN KEY (patient_id) REFERENCES dim_patients(patient_id),
    FOREIGN KEY (employee_id) REFERENCES dim_employees(employee_id),
    FOREIGN KEY (role_id) REFERENCES dim_roles(role_id),
    FOREIGN KEY (date_id) REFERENCES dim_dates(date_id),
    FOREIGN KEY (diagnosis_id) REFERENCES dim_diagnosis(diagnosis_id)
);

-- Insert sample data into dimensions

INSERT INTO dim_patients (patient_id, name, dob)
VALUES (1, 'Alice Johnson', '1990-05-15'),
       (2, 'Bob Smith', '1985-10-22');

INSERT INTO dim_employees (employee_id, name, email)
VALUES (1, 'Dr. John Doe', 'john.doe@securehealth.com'),
       (2, 'Nurse Jane', 'jane.nurse@securehealth.com');

INSERT INTO dim_roles (role_id, role_name)
VALUES (1, 'Doctor'),
       (2, 'Nurse');

INSERT INTO dim_dates (date_id, full_date, year, quarter, month, day)
VALUES (1, '2025-05-01', 2025, 2, 5, 1),
       (2, '2025-05-02', 2025, 2, 5, 2);

INSERT INTO dim_diagnosis (diagnosis_id, diagnosis_name)
VALUES (1, 'Hypertension'),
       (2, 'Asthma');

-- Insert into fact table

INSERT INTO fact_patient_visits (patient_id, employee_id, role_id, date_id, diagnosis_id, total_cost)
VALUES (1, 1, 1, 1, 1, 150.00),
       (2, 2, 2, 2, 2, 100.00);
