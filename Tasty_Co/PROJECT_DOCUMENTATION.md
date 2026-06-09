# TastyCo Web Application Documentation

## 1. Project Overview

TastyCo is a Java Servlet + JSP food ordering application designed for an Apache Tomcat container and a MySQL backend. The application provides:

- User signup and login
- Menu browsing and item ordering
- Order placement with cart handling
- Transaction receipt upload
- Health meter analysis based on ordered dishes
- Dish recommendation via random selection
- Feedback submission support (partial implementation)


## 2. Architecture

### Backend

- Java Servlet-based controller layer under `src/main/java/com/tastyco`
- JDBC-based database access with a shared `DBConnection` helper
- Security additions via `PasswordUtil` for password hashing
- Data model classes for `User`, `Order`, and `Feedback`

### Frontend

- JSP pages under `src/main/webapp`
- CSS assets for styling
- Client-side JavaScript in `script.js` for cart/order flow and local storage
- Image assets under `src/main/webapp/imgs`

### Deployment

- Deployed as a webapp in Apache Tomcat
- Uses `WEB-INF/web.xml` for welcome file configuration
- Uses `WEB-INF/classes/db.properties` to store database connection settings


## 3. Key Files and Responsibilities

### Java backend files

- `DBConnection.java`
  - Loads database settings from `db.properties` or environment variables
  - Provides `connect()` to return a JDBC connection

- `PasswordUtil.java`
  - Implements PBKDF2 password hashing using `PBKDF2WithHmacSHA256`
  - Supports `hashPassword` and `verifyPassword`

- `SignupServlet.java`
  - Accepts signup data from `signup.jsp`
  - Creates a `User` and stores the hashed password with `UserDAO`

- `LoginValidate.java`
  - Authenticates users by email and password
  - Supports legacy plaintext password comparison and automatic migration to hashed storage
  - Creates a session with `user` and `userId`

- `UserDAO.java`
  - Inserts new users into the `users` table
  - Always hashes passwords before saving

- `OrderServlet.java`
  - Accepts JSON cart payload from `order_pg.jsp`
  - Resolves menu item names to `dish_id`
  - Inserts order records into the `orders` table

- `TransactionServlet.java`
  - Receives receipt image uploads from `transac.jsp`
  - Records transaction metadata into the `transactions` table

- `RandomServlet.java`
  - Returns a random dish from the `dishes` table as JSON
  - Used by `index.jsp` to power the random dish picker

- `HealthServlet.java`
  - Reads user orders and dish status values
  - Computes nutritious vs indulgent counts
  - Persists results into the `health` table
  - Returns JSON to `healthm.jsp`

- `FeedbackServlet.java`
  - Accepts feedback form data and saves it to the `feedback` table
  - Uses `FeedbackDAO` and `Feedback`

- `LogoutServlet.java`
  - Invalidates the session and redirects to `index.jsp`


### Frontend pages

- `index.jsp`
  - Landing page with navigation, category previews, random dish modal, and login link
  - Fetches `RandomServlet` to display a random dish recommendation

- `login.jsp`
  - Form that posts to `LoginValidate`

- `signup.jsp`
  - Form that posts to `SignupServlet`

- `Menupage.jsp`
  - Category-based menu overview
  - Links to `order_pg.jsp` sections

- `order_pg.jsp`
  - Full menu page with cart support
  - Dynamically adds items to cart and posts orders to `OrderServlet`

- `transac.jsp`
  - Payment/transaction summary page
  - Uploads receipt file and submits to `TransactionServlet`

- `healthm.jsp`
  - Protected page that calls `HealthServlet`
  - Displays a Chart.js pie chart for nutritious vs indulgent orders

- `aboutus.jsp`
  - Static company/about page content

- `feedback.jsp`
  - Contact/feedback page
  - Includes `logout.jsp` and a form, but the form currently has no `action` attribute

- `logout.jsp`
  - Shared include that displays login/logout UI and the current user email


## 4. Database Schema

The MySQL dataset is stored in `tastycodb.sql` and contains the following tables:

### `dishes`
- `dish_id` int PK
- `name` varchar(100)
- `price` varchar(45)
- `category` varchar(45)
- `status` varchar(45)
- `img_url` varchar(255)

### `users`
- `id` int PK
- `name` varchar(45)
- `email` varchar(45)
- `password` varchar(45)  
  - Note: existing dump contains plaintext passwords; the current code migrates legacy plaintext on login

### `orders`
- `orders_id` int PK
- `user_id` int FK -> `users.id`
- `dish_id` int FK -> `dishes.dish_id`
- `amount` decimal(10,2)
- `quantity` int
- `order_date` date
- `order_time` timestamp

### `transactions`
- `transac_id` int PK
- `transac_number` bigint
- `order_id` int
- `total_amount_paid` double
- `transc_date` date
- `imgs` blob

### `health`
- `health_id` int PK
- `user_id` varchar(45)
- `nutritious` varchar(45)
- `indulgent` varchar(45)

### `feedback`
- `id` int PK
- `name` varchar(45)
- `email` varchar(45)
- `message` varchar(255)


## 5. Configuration and Environment

### Database Connection

`DBConnection` reads settings from `WEB-INF/classes/db.properties`:

- `db.url`
- `db.user`
- `db.password`

It also supports overrides via environment variables:

- `DB_URL`
- `DB_USER`
- `DB_PASSWORD`

### Current Credentials Location

Current file path:
`src/main/webapp/WEB-INF/classes/db.properties`

Example values in the project:

- `db.url=jdbc:mysql://localhost:3306/tastyco`
- `db.user=root`
- `db.password=Aaradhya@2005#`

> Recommendation: Move production credentials out of version-controlled files and rely on environment variables or a secure secrets store.


## 6. User Flows

### Signup / Login

1. User visits `signup.jsp`
2. Form posts to `SignupServlet`
3. `UserDAO.addUser()` hashes password and inserts into `users`
4. User then logs in at `login.jsp`
5. `LoginValidate` verifies password using `PasswordUtil`
6. If password matches legacy plaintext, the password is rehashed and updated
7. Successful login stores `user` and `userId` in session

### Ordering

1. User opens `order_pg.jsp`
2. Items are added to cart in browser state via `script.js`
3. Clicking `Order Now` sends a JSON payload to `OrderServlet`
4. `OrderServlet` converts each item name into `dish_id`
5. Order rows are inserted into the `orders` table
6. User is redirected to `transac.jsp`

### Transaction / Receipt Upload

1. `transac.jsp` auto-generates a new order ID and displays total amount
2. User enters transaction ID and uploads receipt image
3. Form posts multipart data to `TransactionServlet`
4. The servlet stores the receipt bytes and transaction metadata in `transactions`
5. Success redirects to `thankyou.jsp`

### Health Meter

1. Logged-in user opens `healthm.jsp`
2. Page calls `HealthServlet` via POST
3. Servlet scans the user's orders and dish statuses
4. `nutritious` vs `indulgent` counts are returned as JSON
5. Chart.js renders the result as a pie chart
6. Data is also stored/updated in `health`

### Random Dish Recommendation

1. `index.jsp` calls `RandomServlet` on button click
2. Servlet chooses a random `dish_id` and returns JSON
3. The page shows the dish image and allows ordering


## 7. Known Issues and Improvement Areas

- `feedback.jsp` contains a feedback form but does not submit to `FeedbackServlet`; it lacks an `action` attribute.
- `HealthServlet` stores `user_id` as `VARCHAR` in the `health` table rather than an integer.
- `RandomServlet` uses a hard-coded range of `1..32`; if `dishes` table size changes, this may return non-existent IDs.
- `OrderServlet` relies on dish names matching exactly the names in `dishes`; this is brittle and should use item IDs instead.
- `TransactionServlet` trusts client-generated `order-id` and `total-amount` values rather than validating them server-side.
- No CSRF protection is implemented for form submissions.
- Some form pages redirect on error without showing user-friendly messages.


## 8. How to Run Locally

### Prerequisites

- Apache Tomcat 9.x or later
- MySQL server
- `mysql-connector-java` driver available in `WEB-INF/lib`
- Java 11+ (or Java version compatible with Tomcat)

### Setup Steps

1. Import or place the project into your Tomcat workspace.
2. Ensure MySQL has a database named `tastyco`.
3. Execute `tastycodb.sql` to create tables and seed sample data.
4. Update `WEB-INF/classes/db.properties` with your database URL, username, and password, or set env vars `DB_URL`, `DB_USER`, `DB_PASSWORD`.
5. Build the project so `.class` files are compiled under `build/classes` or use your IDE/Tomcat auto-build.
6. Start Tomcat and access the app at:
   - `http://localhost:8080/Tasty_Co/`



### Run Commands

Using PowerShell from the project root:

```powershell
Set-Location -Path 'D:\STUDY\Projects\TASTYCO\Tasty_Co'
# Compile Java source files (if not using IDE build or Maven/Gradle)
javac -cp "C:\path\to\tomcat\lib\servlet-api.jar;src\main\webapp\WEB-INF\lib\mysql-connector-j-8.0.33.jar" -d build\classes src\main\java\com\tastyco\*.java

# Copy compiled classes to Tomcat's WEB-INF/classes (create dirs if missing)
New-Item -ItemType Directory -Path "C:\path\to\tomcat\webapps\Tasty_Co\WEB-INF\classes" -Force | Out-Null
Copy-Item -Path build\classes\* -Destination "C:\path\to\tomcat\webapps\Tasty_Co\WEB-INF\classes" -Recurse -Force

# Copy web resources (JSPs, static files)
Copy-Item -Path src\main\webapp\* -Destination "C:\path\to\tomcat\webapps\Tasty_Co" -Recurse -Force

# Start Tomcat (if not already running)
& "C:\path\to\tomcat\bin\startup.bat"

# Open the application in the default browser
Start-Process "http://localhost:8080/Tasty_Co/"
```

If you use Tomcat manager or an IDE, deploy the `Tasty_Co` folder directly as a webapp and start Tomcat there.

If you already have the webapp deployed and only need to refresh resources, restart Tomcat with:

```powershell
& "C:\path\to\tomcat\bin\shutdown.bat"
Start-Sleep -Seconds 2
& "C:\path\to\tomcat\bin\startup.bat"
```

### Maven

From the project root (if you add a `pom.xml`):

```bash
# Build the WAR
mvn clean package

# Copy the generated WAR to Tomcat webapps (example path)
Copy-Item -Path target\Tasty_Co.war -Destination "C:\path\to\tomcat\webapps\Tasty_Co.war" -Force

# Then start/restart Tomcat as above
```

### Gradle

If you add `build.gradle` with `war` plugin:

```bash
# Build the WAR
gradle clean war

# Copy the WAR to Tomcat
Copy-Item -Path build\libs\Tasty_Co.war -Destination "C:\path\to\tomcat\webapps\Tasty_Co.war" -Force
```

### IDE / Tomcat Manager

- In Eclipse/IntelliJ: add a Tomcat run configuration and deploy the web project; the IDE handles compilation and classpath.
- Use Tomcat Manager UI or the `manager` text API to upload/redeploy the WAR (`/manager/text/deploy?path=/Tasty_Co&war=file:/path/to/Tasty_Co.war`).

Notes:
- Replace `C:\path\to\tomcat` with your Tomcat installation directory.
- Ensure `mysql-connector-java` is present under `WEB-INF/lib` so the webapp can connect to MySQL at runtime.
- Prefer Maven/Gradle for repeatable builds and dependency management instead of manual `javac` and file copies.

### Notes

- The welcome file is `index.jsp` as configured in `WEB-INF/web.xml`.
- The login page is `login.jsp` and the signup page is `signup.jsp`.
- `OrderServlet`, `TransactionServlet`, `RandomServlet`, `HealthServlet`, `SignupServlet`, `LoginValidate`, `FeedbackServlet`, and `LogoutServlet` are mapped using `@WebServlet` annotations.


## 9. Recommended Cleanup

- Remove unused or generated `build/` artifacts from source control.
- Keep only required libraries in `WEB-INF/lib`.
- Convert hard-coded local file paths and values to configuration.
- Fix incomplete feedback flow by wiring `feedback.jsp` to `FeedbackServlet`.


## 10. Notes on Current Project State

- The current codebase is deployable as a simple Tomcat webapp.
- Core functionality works for signup/login, ordering, transaction upload, and health analysis.
- There are security improvements already present: hashed passwords and centralized DB config.
- The main remaining work is to harden validation, fix form wiring, and remove legacy assumptions.
