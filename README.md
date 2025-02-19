**📖 Ruby Librarian - Book Lending Library**
--------------------------------------------

A simple **book lending system** built with **Ruby on Rails 8**, allowing users to manage books, track borrowings, and view borrower history---**no authentication required**.

* * * * *

** Features**
---------------

1. **Manage Books** - Create, View, Update, Delete books.\
2. **Track Borrowings** - Record when a book is borrowed & returned.\
3. **Borrower History** - View books borrowed by a specific user.\
4. **Flash Messages** - Success & error notifications.\
5. **Validations** - Prevent duplicate borrowings & ensure data integrity.\
6. **CI/CD Integration** - Uses **GitHub Actions** for automated testing & linting.

* * * * *

**🛠 Setup & Installation**
---------------------------

### **1. Prerequisites**

Ensure you have the following installed:

-   **Ruby 3.2+** → `ruby -v`
-   **Rails 8+** → `rails -v`
-   **PostgreSQL 13+** → `psql --version`
-   **Bundler** → `gem install bundler`
-   **Git** → `git --version`

### **2. Clone the Repository**


CopyEdit

`git clone https://github.com/YOUR_GITHUB_USERNAME/ruby_librarian.git
cd ruby_librarian`

### **3. Install Dependencies**

CopyEdit

`bundle install`

### **4. Configure the Database**

1.  **Update `config/database.yml` with your PostgreSQL credentials.**
2.  **Create and migrate the database:**


CopyEdit

`rails db:create db:migrate`

* * * * *

**API Routes**
--------------

The following routes are available in the application:

| **Method** | **Route** | **Controller#Action** | **Purpose** |
| --- | --- | --- | --- |
| **GET** | `/` | `books#index` | Show all books |
| **GET** | `/books/:id` | `books#show` | Show a book's details |
| **GET** | `/books/new` | `books#new` | Form to add a new book |
| **POST** | `/books` | `books#create` | Create a new book |
| **GET** | `/books/:id/edit` | `books#edit` | Form to edit a book |
| **PATCH/PUT** | `/books/:id` | `books#update` | Update a book |
| **DELETE** | `/books/:id` | `books#destroy` | Delete a book |
| **POST** | `/books/:book_id/borrowings` | `borrowings#create` | Borrow a book |
| **POST** | `/books/:book_id/return` | `borrowings#return` | Return a book |
| **GET** | `/borrowers/:name` | `borrowings#history` | View borrower's history |


** Running the Application**
------------------------------

### **Start the Rails Server**

CopyEdit

`rails server`

Access the app at **`http://localhost:3000`**

### **Run the Rails Console**


CopyEdit

`rails console`

* * * * *

**Running Tests**
--------------------

1. **Run RSpec tests:**


CopyEdit

`bundle exec rspec`

2. **Run Rubocop (Linting):**


CopyEdit

`bundle exec rubocop`

* * * * *

**Debugging Common Issues**
------------------------------

### **1. Database Issues?**

CopyEdit

`rails db:reset db:migrate db:seed`

### **2. Bundle Install Errors?**


CopyEdit

`bundle update`

### **3. Missing Tests?**


CopyEdit

`rails generate rspec:install`


**Contributing**
-------------------

1.  **Fork the repo**
2.  **Create a feature branch:** `git checkout -b feature-name`
3.  **Commit changes:** `git commit -m "Add new feature"`
4.  **Push to GitHub:** `git push origin feature-name`
5.  **Open a Pull Request**

* * * * *

**License**
--------------

This project is licensed under the **MIT License**.

* * * * *

### **Final Steps**

1. **Create a `README.md` file in your project root:**


CopyEdit

`touch README.md`

2. **Paste the above content.**\
3. **Commit & Push the README to GitHub:**


CopyEdit

`git add README.md
git commit -m "Add README with setup"
git push origin main`