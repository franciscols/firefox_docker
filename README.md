# Firefox  in docker

Running any version of firefox in a browser window, using docker and VNC.
```
git clone git@github.com:franciscols/firefox_docker.git
cd firefox_docker 
docker-compose up --build
```

Browse to http://localhost:6080

In case you want a diferent version of firefox, just edit the docker-compose accordingly and run the docker-compose up --build again
