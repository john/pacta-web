# README

## Intro

This is a basic web app designed to call the [PACTA](https://rmi.org/press-release/2-degree-investing-initiative-transfers-stewardship/) Capital Transition Assessment
model, which it assumes is being run behind an API.
<br />
<br />

## Running it

This repo creates two containers, one running a postgres DB, the other a Rails app. If you just want to run the app you can use the Dockerfile by itself, rather than docker-compose, which starts both. To run the whole thing:

1. Install Docker

3. Clone this repo
```
git clone https://github.com/john/pacta.git
```

4. cd into repo and build images. The app was originally name supnet and the Rails app retains that name; until that gets changed (soon) the volume needs to retain it.

```
cd pacta

docker volume create --name pacta-db
docker volume create --name supnet
```

5. Initialize:

```
docker compose up --build
```

6. Connect to the shell running in the container. In a separate terminal run `docker ps` to list running containers, then, using the container name you just found, connect to it:

```
docker ps
```

```
docker exec -t -i pacta-pacta-1 /bin/bash
```

7. After building for the first time you'll see you need to create the databases. In a separate terminal run:

```
docker compose run pacta rails db:create
docker compose run pacta rails db:migrate
```

Running the migrations also creates and admin user ("Little Bobby Admin," admin@example.com) and an 'Acme Financial' organization.

8. Once the database is set up, you can start the containers normally:

```
docker compose up
```

You should then be able to hit it at http://127.0.0.1, log in, create portfolios,
and run (fake, until the API is wired) reports.

## Connecting to the database
`psql --host=localhost --username=pacta --port=6542 --dbname=supnet`
(pw: test_db_password)
List tables: \dt
Describe a table: \d table_name

DB port is 6542, mapped to the standard postgresql on the container side.

## License
Copyright (c) 2023 John McGrath (jmcgrath@rmi.org) and [RMI](https://rmi.org). See [LICENSE][] for
details.

[license]: LICENSE.md
