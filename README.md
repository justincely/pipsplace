# pipsplace
Server side for the pipsplace site.  

Project utilizes a .env file with the following vars:

+ `SECRET_KEY`: Django project secret key. New keys can be generated by following instructions [here](https://www.educative.io/answers/how-to-generate-a-django-secretkey).
+ `DEBUG`: Determines whether Django server launches in debug mode. Options are True or False.
+ `POSTGRES_DB`: Name of your database. This value will be used to name db if none currently exists. If not specified postgres will use the `POSTGRES_USER` field value.
+ `POSTGRES_PASSWORD`: REQUIRED FIELD. Used in conjunction with `POSTGRES_USER` to authorize connection to db.
+ `POSTGRES_USER`: Username used to login to db. If the db does not currently exist the created superuser will use this name and `POSTGRES_PASSWORD`. If unspecified this field defaults to `postgres`
+ `POSTGRES_HOST`: db (name of docker-compose postgres service. This passes assigned host value of the container)
+ `POSTGRES_PORT`: port exposed by database (default of Postgres is 5432)

To run:

+ clone repository
+ create .env file with values specified above
+ run `docker compose up`
+ access running django server at localhost:8000
