### rspark-docker

`rspark-docker` runs R, PostreSQL, Hadoop, Hive, and Spark in Docker containers. Running the `start.sh` script below downloads images from Docker Hub the first time it is run and checks for updates thereafter.

#### Installing Git and Docker for Mac

The Mac is a BSD UNIX-based system and therefore has many of the tools required for data science. Your principal interface to the UNIX side of the Mac is the Terminal.app found in the Utilities subdirectory (folder) of the Applications directory (folder). You should drag this App to your Dock for easy access.

macOS comes preinstalled with `git`, but it should be updated. You can determine the version of `git` by typing `git version` at the command prompt. If `git` is not present or if the version is earlier than `2.17.1`, you need to install or update `git`. 

Go to: [https://git-scm.com/downloads](https://git-scm.com/downloads) and download/install the latest release. You probably will get a message that the package cannot be opened because it is from an unidentified developer. If you see this, then open up System Preferences > Security & Privacy > General, and click 'Open Anyway' for this `pkg` in the lower right.

Docker runs on macOS 10.11 (El Capitan) or later. Go here to get [Docker for the Mac](https://www.docker.com/docker-mac) and follow the directions for installation. You will need to create an account on Docker to download the disk image (.dmg file) and you may get a verification email. After dragging Docker to your Applications folder, run it. You may see '"Docker..." can't be opened...', so again click 'Open Anyway'
in Security & Privacy preferences.

Also, note that you will have access to Docker Desktop in the menu bar on the upper right. The Dashboard gives you access to the containers running or stopped in `rspark`.

#### Installing Git and Docker for Windows

Windows is not UNIX based and requires additional software. The most fundamental requirement is to have access to the `bash` shell. The easiest solution is a bash emulator.  

For bash access install [git for Windows](https://git-for-windows.github.io). This will give you an emulated bash shell which we need for running Docker and/ or Vagrant and of course `git` for version control.  You may be required to provide credentials as part of the installation process.

Docker requires a hypervisor (Hyper-V in the case of Windows) to run and it is not installed by default on Windows 10. Hyper-V can be installed on Windows 10 Enterprise and Professional, but not on Windows 10 Education, Home, Mobile, and earlier verions of Windows. If you meet the system requirements, follow the instruction for installing [Hyper-V here](https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/enable-hyper-v).  You will need to provide appropriate credentials, usually login informaton.

Once Hyper-V is installed, get [Docker for Windows](https://www.docker.com/docker-windows) and follow the directions for installation.  You will need to create an account, verify this account, and provide appropriate credentials, i.e., login information or root access.

Also, note that you will have access to Docker Desktop in the launch bar on the lower right. The Dashboard gives you access to the containers running or stopped in `rspark`.

#### What if can't install one of the required software components?

**Note:** If you are taking a course and you are unable to install any of the above components, Mac or Windows, you will be given an IP address pointing to a Amazon AWS account. In this case, you can connect to `rspark` on AWS using a browser with the URL:port as `<IP address>:8787` rather than `localhost:8787`. You then login with `rstudio` as both the login and password as described below.  

If you are not taking a course, you must create your own AWS account to run `rspark`.

#### Creating a local `rspark-docker` repo

The following instructions assume you have a `bash` shell available with `git` and Docker installed. Ideally, you should be on a high-speed network.  

Before beginning, launch Terminal.app on the Mac or git bash on Windows (start typing bash from the Start menu to find it). Once running, you should be in your home directory. Type `pwd` to verify. Stay there or `cd` to wherever you want `rspark-docker` installed.

The `rspark` environment can be installed by cloning `rspark-docker` from GitHub. Run the following command in the terminal:  
```
git clone https://github.com/jharner/rspark-docker.git
```
This should only be run the first time.

#### Running `rspark-docker`

You are now ready to start your session. Assuming you are in the parent directory of `rspark-docker`, execute:
```
cd rspark-docker
./start.sh
```
The last command runs the `start.sh` shell script, which pulls the pre-built tagged images from Docker Hub (currently 0.9.9), and launches the containers. You must have execute privileges to run the shell script. If not, issue `chmod` from the command line, i.e., 
```
chmod 755 start.sh`
````

It will take awhile the first time or after a pull from GitHub. Eventually, you will be returned to the command prompt. 

**IMPORTANT:** leave the program running in the terminal, i.e., do not terminate the terminal. The Docker containers are running in the background.

Now open a browser in Chrome (or Firefox or Safari) and type the url as:
```
localhost:8787
````
and sign into RStudio as: 

Username: rstudio  
Password: rstudiojh

When finished, quit the current R session (red button). If you will not be using the containers in the near future, then return to the Docker Desktop and Stop the `rspark` app in the Dashboard. You can then click Restart in the Dashboard when you want to resume your work.

If you Delete the containers in the Dashboard, then you will need to start the containers again. Assuming you are in the `rspark-docker` directory, execute the following commands:  
```
./start.sh
```
Then login to RStudio as before.

#### Updating your local `rspark-docker` repo.

If `rspark-docker` gets updated, execute:
```
git pull origin master
```
assuming you are in the `rspark-docker` directory.

#### Installing the rspark-tutorial

Once you have `rspark` running in Docker containers, locally or in AWS, you may want to install the `rspark-tutorial` Go to the `rspark-tutorial` GitHub repo here:  
[rspark-tutorial](https://github.com/jharner/rspark-tutorial)  

and follow the instructions.



