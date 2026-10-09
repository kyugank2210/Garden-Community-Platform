# GardenConnect — Full Java Web Project

## Stack
- Java 17
- Maven WAR
- Jakarta Servlet 6
- JSP + JSTL
- Apache Tomcat 10.1+
- MySQL + JDBC
- MVC/DAO architecture

## Features
1. Registration/login/logout and sessions
2. Community posts
3. Likes with synchronized service
4. Comments
5. Plant library with search
6. My Garden
7. Watering tracker
8. Gardening questions and answers
9. Asynchronous notifications using a background ExecutorService thread
10. Admin user-role management
11. OOP inheritance, overriding, interface implementation and polymorphism
12. Collections and generics through DAO/service lists and maps
13. Custom exception handling
14. JDBC PreparedStatements and ResultSets

## Setup
1. Install JDK 17, IntelliJ IDEA, MySQL, MySQL Workbench and Tomcat 10.1.
2. Run `database/gardenconnect.sql` in MySQL Workbench.
3. Open this project in IntelliJ.
4. Open `src/main/java/com/gardenconnect/util/DBConnection.java`.
5. Replace `CHANGE_ME` with your MySQL root password.
6. Maven: `clean package`.
7. Copy `target/GardenConnect.war` into Tomcat's `webapps` folder.
8. Start `bin/startup.bat`.
9. Open `http://localhost:8080/GardenConnect/`.

## Making an admin
Register a normal account first. Then, in MySQL Workbench:
`USE gardenconnect;`
`UPDATE users SET role='ADMIN' WHERE email='your-email@example.com';`
Log out and log in again. The Admin link will appear.

## Rubric mapping
- Problem understanding/design: complete community gardening workflow
- Core Java: classes, inheritance, polymorphism, interface, exceptions, collections/generics
- Database/JDBC: DAO classes, PreparedStatement, ResultSet, MySQL schema
- Servlets/web: annotated Jakarta Servlets, JSP, sessions, filter, MVC
- Multithreading: NotificationService background worker
- Synchronization: synchronized LikeService.toggleLike
