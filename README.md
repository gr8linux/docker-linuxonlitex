**What is this project**
This project is an iteration to build up a docker container that contain all I need to build up linux on my sipeed tang primer 20k and it will help me to have an isolated area to compile and clean it up easily without remember the clean up or run script to do that for me.
You need to build this docker and then you could run an instance of it.
This dockerfile assume you put your Gowin ide files inside the IDE folder ( I already copy the file inside of the repo but you could change it if you want just download the student version from Gowin site)
**So How to start**
git clone https://github.com/gr8linux/docker-linuxonlitex.git
cd docker-linuxonlitex
dockr build .
Then you could run it as below:
cd ~/src/mybuildarea
docker run -it --rm -v .:/home/linux-on-litex-vexriscv/build  dockerlinuxonlitex
then you could load it by openFPGALoader
I already put the openFPGALoader inside of the image and if you run in privileges mode you are able to run the openFPGALoader inside the container itself
