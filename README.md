# SQL Server with AdventureWorks Database using Docker Compose

This repository contains a Docker Compose setup to create a SQL Server instance and automatically import the AdventureWorks database from a `.bak` file.

## Prerequisites

Before you begin, ensure you have the following installed on your machine:

- [Docker](https://www.docker.com/products/docker-desktop)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Getting Started

### 1. Clone the Repository

Clone this repository to your local machine:

```
git clone https://github.com/sero-dev/adventure-works
```

### 2. Prepare the Backup File

Download the AdventureWorks backup file from a [trusted source](https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver16&tabs=ssms). Depending on which backup you use, you may need to rename the file to `AdventureWorks.bak`.

Place your AdventureWorks.bak file in a directory named import-data within the root of the repository. The structure should look like this:

```
adventure-works/
├── docker-compose.yml
├── README.md
└── import-data/
    ├── .gitkeep
    └── AdventureWorks.bak
```

### 3. Configure Environment Variables

The docker-compose.yml file uses the following environment variables for SQL Server configuration:

- MSSQL_SA_PASSWORD: The password for the SA (System Administrator) account.
- ACCEPT_EULA: Set to Y to accept the End User License Agreement.

You can modify these directly in the docker-compose.yml file if needed. If you do modify the `MSSQL_SA_PASSWORD` variable, find and replace the password on the docker compose file. There should be a total of 3 references for that variable.

### 4. Start the Containers

Run the following command to start the Docker containers and import the AdventureWorks database:

```sh
docker-compose up
```

Docker Compose will perform the following steps:

- Start a SQL Server instance.
- Use the import-data service to wait for the SQL Server instance to be ready.
- Import the AdventureWorks.bak file into the SQL Server instance.

### 5. Connect to SQL Server

Once the setup is complete, you can connect to the SQL Server instance using any SQL Server client. Use the following connection details:

```
Server: localhost
Port: 1433
Username: SA
Password: YourStrong!Passw0rd (or the password you set in docker-compose.yml)
```

### 6. Verify the Database

You can verify that the AdventureWorks database has been successfully imported by connecting to the SQL Server instance and running a query to list the databases:

```sql
SELECT name FROM sys.databases;
```

You should see AdventureWorks in the list of databases.

### Cleaning Up

To stop and remove the Docker containers, run:

```sh
docker-compose down
```

### Troubleshooting

If you encounter issues, ensure that:

- Docker and Docker Compose are correctly installed.
- The AdventureWorks.bak file is correctly placed in the import-data directory.
- The environment variables in docker-compose.yml are correctly configured.
