# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Users: Admins, Sellers, and Customers with roles using Devise.
Categories: Example: Electronics, Fashion, Home Decor.
Products:
Product name, description, price, stock, SKU, image (Active Storage), and slug (Friendly ID).
Product Variants: Size, color, etc.
Cart: Associated with User and LineItems.
LineItems: Each line item contains a product and its quantity.
Orders: Order ID, total price, payment status (pending, paid, failed), and associations with User and OrderItems.
OrderItems: Stores the product details at the time of order.
3. Implement Features
User Authentication and Authorization
Devise: Set up user authentication (admin, seller, and customer roles).
Pundit: Define roles and permissions for product management, cart access, etc.
Product Management
Admin/Seller CRUD Operations:
Admins/sellers can manage products, images, and categories.
Product Listing for Customers:
Product filtering by category, price, and variants.
Add pagination for product listings using Kaminari.
Shopping Cart
Add to Cart:
Create a session-based cart for guests and a database-backed cart for logged-in users.
Cart Page:
List products in the cart with quantity, price, and total.
Checkout Flow
Order Creation:
A form to capture shipping details.
Calculate total price including tax and shipping.

Razorpay Payment Integration

Payment Flow:
  Create an order with Razorpay when the user clicks the "Pay Now" button.
  Handle Razorpay webhook for payment success/failure.
  Save order details and payment status in the database.

Checkout Page:
Add Razorpay checkout button.
  Upon payment success, save the order in the database and update its status to paid.
  Order Management

Admin Dashboard:
Admin can view/manage all orders.
Customers can view their own orders.

4. Frontend UI
Bootstrap:

Install Bootstrap for responsive UI design. Use Webpacker to integrate it.
Home Page:

Showcase featured products, categories, and discounts.
  Product Page:

  Display detailed product views with images, descriptions, reviews, and variants (size, color).
  Cart and Checkout Pages:

  Display the shopping cart with products, quantities, and prices.
  Implement a checkout page where users can enter shipping info and proceed to payment.

5. Search and Filter
  Searchkick:

Implement Elasticsearch-based search with searchkick.
  Allow users to search by product name, description, and SKU.
  Filter Products:

Filter by category, price range, size, and color.
Implement sorting by relevance, price, and popularity.

6. SEO Optimization
  Use friendly_id gem to create SEO-friendly URLs for products and categories.
  Add meta tags for better search engine indexing.

7. Background Jobs
  Sidekiq:
    Send order confirmation emails in the background.
    Process long-running tasks like generating invoices or reports.

8. Testing
  RSpec: For writing unit and integration tests.
  Capybara: For simulating user interactions (e.g., adding to cart, making payments).

9. Deployment
 Environment Setup:

Set up and Redis for production.
  Integrate Sidekiq with Redis for background jobs.
  Use ActiveStorage with AWS S3 for storing product images.
  SSL & Security:

Secure your app with SSL (HTTPS).
  Use Rails' built-in security features to prevent CSRF, SQL Injection, and XSS.
  10. Performance Optimization
  Caching: Use fragment caching for frequently accessed products.
  CDN: Serve static assets and product images through a CDN for faster load times.
# E-Online-shopping
