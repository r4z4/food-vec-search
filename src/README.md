In WSL:

cd into /home/r4z4/flask-on-docker
in there is the docker-compose file and .env.dev file

run:
docker-compose up -d --build

it'll build both images. 'up' is like 'run' in docker run [image-name] command. 
You can use docker-compose run command and it overrides a specific run command of one of the Docker containers within the compose, 
but it is probably rare you would do this.

then run:
docker-compose exec web python manage.py create_db

then run:
docker-compose logs -f

**GET USED TO RUNNING THE LOGS COMMAND. DO IT A LOT.
exec into the container like usual
'web' is a dir in our filesystem
python is a directive
manage.py is a file where the method create_db is located. I had
finaeggle these a bit from the example, but its pretty simple.

That create_db method will create the books db and two little records. Even before that we should be able
to run it and go to localhost:5000 and see the template, but just no records until that method ran.

____________________________________
Model files go in /web dir
Container => /usr/src/app