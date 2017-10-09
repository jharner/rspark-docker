# rspark-docker

`rspark-docker` runs R, PostreSQL, YARN, Hadoop, Hive, and Spark in Docker containers. Running the start script downloads images from Docker Hub the first time it is run and check for changes thereafter.

## Installing Docker for Mac
The Docker solutions for a Mac work on macOS 10.11 (El Capitan) or later. Go here to get [Docker for the Mac:](https://www.docker.com/docker-mac) and follow the directions for installaition. 

## Installing Docker for Windows
For Windows first install [git for Windows](https://git-for-windows.github.io). This will give you an emulated bash shell which you wil need for running Docker and/ or Vagrant and of course git for version control.  Docker only runs on Windows 10. Pro will definitely work, but Home may or may not. If you do not have Win 10, you will need to run `rspark` in VirtualBox provisioned by Vagrant. Go here to get [Docker for the Windows:](https://www.docker.com/docker-windows) and follow the directions for installaition.

## Running rspark from Docker
Before beginning launch Terminal.app on the Mac or git bash on Windows (start typing bash from the Start menu to find it). Once running, you should be in your home direcotry, e.g, type `pwd` to verify. Stay there or `cd` to wherever you want `rspark` installed.

Clone `rspark-docker` from GitHub or run:
```
git clone https://github.com/jharner/rspark-docker.git
```
This should only be run the first time.

`rspark` can be installed by pulling the Docker images from Docker Hub. `cd` to rspark-docker and then execute:
```
./start.sh
```
This will take awhile, particularly the first time. Eventually, you will reach a line somewhat like: "hive_1      | SLF4J: Actual binding is of type [org.apache.logging.slf4j.Log4jLoggerFactory]"

Leave the terminal running.  

Now open a browser with the url: localhost:8787  

Sign into RStudio:  

Username: rstudio  
Passwork: rstudio

When finished, quit the current R session (red button). Then return to the terminal and type: Control-C to exit.
