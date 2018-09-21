# rspark-docker

`rspark-docker` runs R, PostreSQL, YARN, Hadoop, Hive, and Spark in Docker containers. Running the start script downloads images from Docker Hub the first time it is run and check for changes thereafter.

### Installing Docker for Mac

The Mac is a BSD UNIX-based system and therefore has many of the tools required for data science. Other tools are easy to install. For the most part data science runs on open-source Linux-based environments, which are compatible with macOS. Your principal interface to the UNIX side of the Mac is the Terminal.app found in the Utilities directory (folder) in the Applications directory (folder). You should drag this App to your Dock for easy access. You can also run the X11 windowing system, but it is not necessary since we will be working from the command line.

The Docker solutions work on a Mac with macOS 10.11 (El Capitan) or later. Go here to get [Docker for the Mac:](https://www.docker.com/docker-mac) and follow the directions for installation.  

### Installing Docker for Windows

Windows is not UNIX based and requires additional software. The basic requirement we need here is access to the `bash` shell. The easiest solution is a bash emulator.  

For bash access install [git for Windows](https://git-for-windows.github.io). This will give you an emulated bash shell which we need for running Docker and/ or Vagrant and of course `git` for version control.  

Docker requires a hypervisor (Hyper-V in the case of Windows) to run and it is not installed by default on Windows 10. Hyper-V can be installed on Windows 10 Enterprise, Professional, and Education, but not on Windows 10 Home, Mobile, and earlier verions of Windows. If you meet the system requirements, follow the instruction for installing [Hyper-V here](https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/enable-hyper-v).  

Once Hyper-V is installed, get [Docker for the Windows](https://www.docker.com/docker-windows) and follow the directions for installation.  

The following installations assume you have a `bash` shell available. Ideally, you should be on a high-speed network.  

### Running rspark from Docker

Before beginning launch Terminal.app on the Mac or git bash on Windows (start typing bash from the Start menu to find it). Once running, you should be in your home direcotry, e.g, type `pwd` to verify. Stay there or `cd` to wherever you want `rspark` installed.

Clone `rspark-docker` from GitHub or run:
```
git clone https://github.com/jharner/rspark-docker.git
```
This should only be run the first time.

`rspark-docker` pulls the Docker images from Docker Hub. `cd` to `rspark-docker` and execute:
```
./start.sh
```
This will take awhile, particularly the first time. Eventually, you will reach a line somewhat like: `hive_1      | SLF4J: Actual binding is of type [org.apache.logging.slf4j.Log4jLoggerFactory]`

Leave the terminal running.  

Now open a browser with the url: localhost:8787  

Sign into RStudio:  

Username: rstudio  
Passwork: rstudio

When finished, quit the current R session (red button). Then return to the terminal and type: Control-C to exit.



Before beginning, launch Terminal.app on the Mac or git bash on Windows (start typing bash from the Start menu to find it). Once running, you should be in your home directory, e.g, type `pwd` to verify. Stay there or `cd` to wherever you want `rspark` installed.

`rspark` can be installed by pulling the Docker images from Docker Hub. Run the following command in the terminal:  
```
git clone https://github.com/jharner/rspark-docker.git
```
This should only be run the first time. If `rspark-docker` gets updated (I will notify you if this is the case.), execute:
```
git pull origin master
```
You are now ready to start your session. Assuming you are in the parent directory of `rspark-docker`, execute:
```
cd rspark-docker
./start.sh
```
The last command runs the `start.sh` shell script, pulls the pre-built tagged images from Docker Hub (currently 0.9.2), and launches the containers. You must have execute privileges to run the shell script. If not, use `chmod`, e.g., `chmod 755 start.sh`.

It will take awhile the first time or after a pull from GitHub. Eventually, you will reach a line somewhat like: "hive_1      | SLF4J: Actual binding is of type [org.apache.logging.slf4j.Log4jLoggerFactory]"  Do **not** return to the terminal prompt, but the containers are nevertheless running. **IMPORTANT: leave the program running in the terminal, i.e., do NOT use Control-C and do not quit the terminal**.

Now open a browser in Chrome (or Firefox or Safari) and type the url as: `localhost:8787` and sign into RStudio:  

Username: rstudio  
Password: rstudio

When finished, quit the current R session (red button). Then return to your local terminal and type: Control-C to stop the containers, which will return the prompt.

To start the containers again, assuming you are in your home directory, execute the following commands:  
```
./start.sh
```
if you are in the `rspark-docker` directory. Then login to RStudio as before.
