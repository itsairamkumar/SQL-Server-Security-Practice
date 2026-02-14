  # SQL Server Security Practice

This repository contains hands-on practice scripts for SQL Server security, focusing on real-world scenarios such as managing logins, users, table-level permissions, database roles, and security testing.

## 🔹 Part 1: Setup and Basic Operations

### What you'll learn:
1. **Create database** only if it doesn't already exist.
2. **Create logins** for four different teams:
   - DevLogin
   - HRLogin
   - FinLogin
   - AuditLogin
3. **Create corresponding users** inside the `GoogleBD` database:
   - DevUser
   - HRUser
   - FinUser
   - AuditUser
4. **Create and modify tables:**
   - `Employees`
   - `Salaries`
5. **Insert, Alter and update** records.

## Part 2: Security and Permissions

### What you'll explore:

6. **Table-level permissions** using:
   - `GRANT`
   - `REVOKE`
   - `DENY`

7. **Assign database-level roles:**
   - `db_owner`
   - `db_datareader`
   - `db_datawriter`

8. **Test specific user access** with:
   - `ALTER` and `DROP` commands

## File Structure:
- `SQL-Security-Practice.sql` – Complete SQL script covering Part 1 & 2.

## Use Case:
Ideal for students, working professionals, and DBAs looking to get practical with SQL Server security mechanisms in a controlled environment.

## Notes:
- The sample DB used is `GoogleBD`
- Users and permissions are given as per team roles
- Try running these scripts in SSMS step-by-step for full understanding

---

Related YouTube Video:
Watch the walkthrough and explanation of this project here: [YouTube Link](https://youtube.com/playlist?list=PLX6s51pY5RfYF2M-_mULnBUyuvbganMqy&si=AmLcV_pKW3-Ag7bf)

---

If you find this helpful, consider giving the repo a ⭐ and subscribing to the channel for more hands-on content.

🙏 Thank you!
