# Setting up MotherDuck

### 1. Installing DuckDB

```bash
# Assuming you already have curl installed on your machine
curl https://install.duckdb.org | sh
```

### 2. Preparing our data

```bash
duckdb cta.duckdb < cta_ridership.sql
```

### 3. Verify your duckdb database has data

```bash
duckdb cta.duckdb < daily_rides.sql
```

### 4. Uploading our duckdb to MotherDuck

Start the duckdb CLI for the database we created

```bash
duckdb cta.duckdb
```

Prompt MotherDuck for a Access Token

```bash
.open md:
```

Ask MotherDuck to host our database

```bash
# This won't work unless you successfully auth with MotherDuck
CREATE OR REPLACE DATABASE "cta" FROM 'cta.duckdb'; 
```

# Setting up Superset

### 1. Get Superset

```bash
git clone https://github.com/apache/superset
```

### 2. Install docker-compose (on Linux)

Update the package index, and install the latest version of Docker Compose:

- For Ubuntu and Debian, run:

```bash
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install docker-compose-plugin
```

- For Arch, run:

```bash
sudo pacman -Syu docker docker-compose
```

Make sure you have docker started.

```bash
# Starting docker
sudo systemctl start docker.service
```

### 3. Start the latest official release of Superset

```bash
# Enter the repository you just cloned
cd superset

# Set the repo to the state associated with the latest official version
git checkout tags/4.1.2

# Fire up Superset using Docker Compose
docker compose -f docker-compose-image-tag.yml up
```

### 4. Log into Superset

Now head over to [http://localhost:8088](http://localhost:8088) and log in with the default created account:

```
username: admin
password: admin
```

We might need this if admin admin doesn't work.

```bash
docker-compose exec superset bash /app/docker-init.sh
```

#### 🎉 Congratulations! Superset is now up and running on your machine! 🎉

#### 5. Adding DuckDB and MotherDuck support

Run these commands while your docker container is still running.

```bash
# This command gives you a ssh connection to the container
docker exec -it superset_app /bin/bash

# Lets install DuckDB driver support
pip install duckdb-engine
```

