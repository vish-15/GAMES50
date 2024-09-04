# GAMES50

#### Video Demo: https://youtu.be/7eydL8QqQF8


#### Description:
GAMES50 is a web application that mimics a game store environment. Built using Flask for the backend and a combination of HTML and CSS for the frontend, this project demonstrates fundamental features of an online game store.

**Project Overview:**
The application features a game catalog where users can browse, download, and manage their game library. It includes basic user authentication with login and registration functionalities, as well as a profile page where users can view their information.

**Features:**
- **Home Page:** Displays a grid of games with images, titles, descriptions, and download buttons.
- **Profile Page:** Allows users to view and update their profile information.
- **Library Page:** Shows a collection of games that the user has downloaded, available for logged-in users.

**File Descriptions:**
- `app.py`       : The main Flask application file handling routes, user authentication, and database interactions.
- `schema.sql`   : Contains the SQL schema for the database, including tables for games, users, and user-game relationships.
- `base.html`    : The base template that includes common HTML structure and navigation for other pages, using Jinja2 for templating.
- `index.html`   : The main page template displaying the game catalog, utilizing Jinja2 templating to render dynamic content.
- `profile.html` : Template for displaying and updating user profile information.
- `library.html` : Shows the games that the user has downloaded.
- `login.html`   : Provides the login form for user authentication.
- `register.html` : Contains the registration form for new users.
- `styles.css`   : Contains the CSS for styling the application, including the dark mode theme and layout adjustments for responsive design.
- `scripts.js`   : JavaScript file for handling sidebar toggle functionality and other dynamic features.

**Design Decisions:**
- **Dark Mode**: Implemented a dark theme to enhance visual comfort and modernize the user interface.
- **Static Navigation**: The navigation bar is positioned at the top of the page for consistent access across different sections of the site.

**Challenges & Solutions:**
- **Image Handling**: Managing game images and ensuring they display correctly required adjusting CSS for proper layout and responsiveness.
- **User Authentication**: Implementing secure authentication with `bcrypt` for password hashing and maintaining secure session management was crucial for protecting user data.

**Future Enhancements:**
- **Sidebar Navigation**: Future plans include adding a collapsible sidebar for improved navigation and more efficient use of screen space.
- **Dynamic Features**: Enhancements such as dynamic content updates and more interactive elements are planned to enrich user experience.

This README provides a detailed overview of the GAMES50 project, explaining its features, file structure, and design decisions. For more information, you can review the project repository and explore the included code and documentation.
