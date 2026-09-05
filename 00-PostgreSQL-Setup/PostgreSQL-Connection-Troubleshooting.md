# PostgreSQL Connection Troubleshooting

## 📌 Purpose

This document records common PostgreSQL database connection problems encountered while connecting PostgreSQL with VS Code using SQLTools.

It is maintained as a practical troubleshooting guide for the SQL Interview Mastery project.

---

# 🔌 PostgreSQL Connection Architecture

The connection flow is:

PostgreSQL Server
        ↓
PostgreSQL Database
        ↓
Connection Configuration
        ↓
SQLTools
        ↓
VS Code
        ↓
SQL Queries

If any part of this chain is incorrectly configured, the database connection may fail.

---

# 🐛 Problem Faced

While setting up the SQL Interview Mastery environment, the PostgreSQL database connection in VS Code/SQLTools was not working correctly.

The issue was related to the database connection configuration rather than the SQL query itself.

---

# 🔍 Troubleshooting Checklist

Before troubleshooting SQL queries, verify the following:

### 1. PostgreSQL Server

Make sure the PostgreSQL service is running.

Check that PostgreSQL is installed correctly and the PostgreSQL server is available.

---

### 2. Database Name

Verify that the correct database is being used.

Project database:

`sql_interview_mastery`

---

### 3. Host

For a local PostgreSQL installation, the host is normally:

`localhost`

---

### 4. Port

Default PostgreSQL port:

`5432`

---

### 5. Username

Use the PostgreSQL user created during installation.

Example:

`postgres`

---

### 6. Password

Use the password configured for the PostgreSQL user.

Do not store real passwords inside GitHub repositories.

---

### 7. SQLTools Configuration

Verify that the SQLTools connection contains the correct:

- Driver
- Server/Host
- Port
- Username
- Password
- Database

---

# 🧪 Connection Verification

After configuring the connection, test it using:

```sql
SELECT version();