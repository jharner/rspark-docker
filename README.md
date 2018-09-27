## rspark-docker

`rspark-docker` runs R, PostreSQL, Hadoop, Hive, and Spark in Docker containers. Running the `start.sh` script below downloads images from Docker Hub the first time it is run and checks for updates thereafter.

### Installing Docker for Mac

The Mac is a BSD UNIX-based system and therefore has many of the tools required for data science. Other tools are easy to install. Your principal interface to the UNIX side of the Mac is the Terminal.app found in the Utilities subdirectory (folder) of the Applications directory (folder). You should drag this App to your Dock for easy access.

macOS comes preinstalled with `git`, but it should be updated. Go to: [https://git-scm.com/downloads](https://git-scm.com/downloads) and download/install the latest release. 

Docker runs on macOS 10.11 (El Capitan) or later. Go here to get [Docker for the Mac](https://www.docker.com/docker-mac) and follow the directions for installation.  

### Installing Docker for Windows

Windows is not UNIX based and requires additional software. The most fundamental requirement is to have access to the `bash` shell. The easiest solution is a bash emulator.  

For bash access install [git for Windows](https://git-for-windows.github.io). This will give you an emulated bash shell which we need for running Docker and/ or Vagrant and of course `git` for version control.  

Docker requires a hypervisor (Hyper-V in the case of Windows) to run and it is not installed by default on Windows 10. Hyper-V can be installed on Windows 10 Enterprise and Professional, but not on Windows 10 Education, Home, Mobile, and earlier verions of Windows. If you meet the system requirements, follow the instruction for installing [Hyper-V here](https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/enable-hyper-v).  

Once Hyper-V is installed, get [Docker for the Windows](https://www.docker.com/docker-windows) and follow the directions for installation.  You will also need root acces to your computer to run Docker.

The following installations assume you have a `bash` shell available. Ideally, you should be on a high-speed network.  

### Creating a local `rspark-docker` repo

Before beginning, launch Terminal.app on the Mac or git bash on Windows (start typing bash from the Start menu to find it). Once running, you should be in your home directory. Type `pwd` to verify. Stay there or `cd` to wherever you want `rspark-docker` installed.

The `rspark` environment can be installed by cloning `rspark-docker` from GitHub. Run the following command in the terminal:  
```
git clone https://github.com/jharner/rspark-docker.git
```
This should only be run the first time.

Note: Alternately, the `rspark-docker` repo can be cloned by clicking on the `Clone or download` green button and then clicking on the `Open on Desktop` in top level of the remote `rspark-docker` repo (this page).

### Running `rspark-docker`

You are now ready to start your session. Assuming you are in the parent directory of `rspark-docker`, execute:
```
cd rspark-docker
./start.sh
```
The last command runs the `start.sh` shell script, pulls the pre-built tagged images from Docker Hub (currently 0.9.2), and launches the containers. You must have execute privileges to run the shell script. If not, use `chmod`, i.e., 
```
chmod 755 start.sh`
````

It will take awhile the first time or after a pull from GitHub. Eventually, you will reach a line somewhat like: "hive_1      | SLF4J: Actual binding is of type [org.apache.logging.slf4j.Log4jLoggerFactory]"  

**IMPORTANT:** leave the program running in the terminal, i.e., do NOT use Control-C and do not quit the terminal. The Docker containers are running in the background.

Now open a browser in Chrome (or Firefox or Safari) and type the url as:
```
localhost:8787
````
and sign into RStudio as: 

Username: rstudio  
Password: rstudio  

When finished, quit the current R session (red button). Then return to your local terminal and type: Control-C to stop the containers, which will return the prompt.

To start the containers again, assuming you are in the `rspark-docker` directory, execute the following commands:  
```
./start.sh
```
Then login to RStudio as before.

### Updating your local `rspark-docker` repo.

If `rspark-docker` gets updated, execute:
```
git pull origin master
```
assuming you are in the `rspark-docker` directory.

