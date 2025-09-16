# Stock Market Prediction And Analysis

This project is a web-based application designed to predict stock market trends by analyzing financial data and non-quantifiable information from news articles. It provides a platform for users, companies, and article providers to interact with stock market data and predictions.

## Abstract

Data mining is well founded on the theory that historic data holds the essential memory for predicting the future direction. This technology is designed to help investors discover hidden patterns from historic data that have probable predictive capability in their investment decisions. The prediction of stock markets is regarded as a challenging task of financial time series prediction. This project presents a model that predicts the changes in stock trends by analyzing the influence of news articles, which are rich in information and often superior to numeric data.

## Features

-   **Multi-user Roles:** Separate login and dashboard functionalities for:
    -   **Stock Admin:** Manages the overall application.
    -   **Company:** Manages company profile and shares.
    -   **Article Provider:** Publishes news articles that influence stock predictions.
    -   **User:** Registers, logs in, and views stock predictions and analysis.
-   **Company Analysis:** View comprehensive profiles of registered companies.
-   **Stock Prediction:** Utilizes text mining from news articles to predict stock trends (positive, negative, neutral).
-   **User Management:** Secure user registration and login system.

## Technology Stack

-   **Backend:** Java (Servlets, JSP)
-   **Frontend:** HTML, CSS, JavaScript, jQuery 1.4.2
-   **Database:** The project contains conflicting database configurations.
    -   `db.sql` is a **MySQL** dump.
    -   `src/java/databaseconnection/databasecon.java` is configured for an **Oracle Cloud Infrastructure (OCI)** database.
    -   Please adapt the connection code or the SQL script to match your target database.
-   **Web Server:** Apache Tomcat or any other servlet container.
-   **Build Tool:** Apache Ant (configured for NetBeans)

## Prerequisites

Before you begin, ensure you have the following installed:
-   JDK (Java Development Kit) 8 or later
-   Apache Tomcat 8.5 or later
-   A compatible SQL database server (e.g., MySQL or Oracle).
-   Git

## Setup and Installation

1.  **Clone the repository:**
    ```bash
    git clone git clone https://github.com/Paul-110/Stock-Market-Prediction-and-Analysis.git
    cd Stock-Market-Prediction-and-Analysis
    ```

2.  **Database Setup:**
    -   Create a new database (e.g., `stock_predection`).
    -   Import the schema and initial data from the `db.sql` file into your MySQL database.


3.  **Configure Database Connection:**
    -   Open the `src/java/databaseconnection/databasecon.java` file.
    -   Update the database connection details to match your local setup (whether you choose Oracle or decide to rewrite it for MySQL).
    -   **Recommended:** Move these credentials to a `db.properties` file and add that file to your `.gitignore`.

4.  **Build the Project:**
    -   This project is set up for NetBeans, which uses Ant. The easiest way to build is to open the project in NetBeans IDE and click "Build".
    -   This will create a `.war` file in the `dist/` directory.

5.  **Deploy to Server:**
    -   Copy the generated `.war` file (e.g., `Stock_Market_Predection.war`) from the `dist/` directory to the `webapps/` directory of your Apache Tomcat installation.
    -   Start the Tomcat server.

## Usage

1.  Open your web browser and navigate to `http://localhost:8080/Stock_Market_Predection/` (the final part of the URL may vary depending on the WAR file name).
2.  You can log in using the credentials for different roles as found in the `db.sql` file:
    -   **Stock Admin:** `Stock` / `Stock`
    -   **User:** `venkat` / `venkat`
    -   **Company:** `venkat` / `venkat`
    -   **Article Provider:** `timesofindia` / `123`
