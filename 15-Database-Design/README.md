
## 5. `15-Database-Design/README.md`

```markdown
# Day 15: Database Design

## 📌 Overview
Database design is the process of organizing data into tables,
relationships, and constraints to support reliable storage
and efficient querying.

A good database design reduces unnecessary duplication
and maintains data integrity.

## 🎯 Learning Objectives
- Understand relational database design.
- Identify entities and attributes.
- Define primary and foreign keys.
- Understand table relationships.
- Apply normalization.
- Enforce data integrity.

## 📚 Topics Covered
- Introduction to database design
- Entities and attributes
- Tables, rows, and columns
- Primary keys
- Foreign keys
- One-to-one relationships
- One-to-many relationships
- Many-to-many relationships
- Normalization
- First Normal Form (1NF)
- Second Normal Form (2NF)
- Third Normal Form (3NF)
- Constraints and referential integrity

## 💻 Example: Customers and Orders

```sql
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);