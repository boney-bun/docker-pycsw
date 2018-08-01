PROJECT_ID := catalogue

SHELL := /bin/bash


setup-pycsw: build-pycsw run-pycsw update-migrations
	@echo
	@echo "------------------------------------------------------------------"
	@echo "Setting up pycsw in production mode"
	@echo "------------------------------------------------------------------"
	@echo "If create_trigger.sql and setup_db.sql can't be found"
	@echo "Build using: build-pycsw, then run with: run-pycsw"
	@echo "------------------------------------------------------------------"
	# the uwsgi service needs to be adapted to the current service.
	@docker-compose -p $(PROJECT_ID) run uwsgi python manage.py migrate catalogue
	@echo "Create a new table and add a trigger function related to catalogue_pycswextrafield table into the database"
	@docker cp ./docker-pycsw/setup_db.sql catalogue-db:/tmp/setup_db.sql
	@docker cp ./docker-pycsw/create_trigger.sql catalogue-db:/tmp/create_trigger.sql
	@echo "Execute the scripts"
	@docker exec -it $(PROJECT_ID)-db su - postgres -c "psql gis -f /tmp/setup_db.sql"
	@docker exec -it $(PROJECT_ID)-db su - postgres -c "psql gis -f /tmp/create_trigger.sql"


build-pycsw:
	@echo
	@echo "------------------------------------------------------------------"
	@echo "Building in production mode"
	@echo "------------------------------------------------------------------"
	@docker-compose -p $(PROJECT_ID) build pycsw

run-pycsw:
	@echo
	@echo "------------------------------------------------------------------"
	@echo "Running pycsw"
	@echo "------------------------------------------------------------------"
	@docker-compose -p $(PROJECT_ID) up -d pycsw

# a command sample doing django migrations
# we need to run this to adjust the docker-pycsw tables from the build
update-migrations:
	@echo
	@echo "------------------------------------------------------------------"
	@echo "Running update migrations in production mode"
	@echo "------------------------------------------------------------------"
	@docker-compose -p $(PROJECT_ID) run uwsgi python manage.py makemigrations