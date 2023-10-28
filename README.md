**What is this project**

This project is an iteration to build up a docker container that contains all I need to build Linux on my Sipeed Tang Primer 20k. It will help me to have an isolated area to compile and clean it up easily without needing to remember to run scripts for cleanup.

You need to build this docker, and then you can run an instance of it.

This Dockerfile assumes you've put your Gowin IDE files inside the IDE folder (I've already copied the files inside the repo, but you can change it if you want – just download the student version from the Gowin site).

**So How to Start**

1. Clone the repository:
   ```
   git clone https://github.com/gr8linux/docker-linuxonlitex.git
   cd docker-linuxonlitex
   ```

2. Build the Docker Image:
   ```
   docker build .
   ```

3. Run the Docker Container:
   ```
   cd ~/src/mybuildarea
   docker run -it --rm -v .:/home/linux-on-litex-vexriscv/build dockerlinuxonlitex
   ```
4. After that you need to run the below or your prefered config inside the container 
   ```
   ./make.py --board=sipeed_tang_primer_20k --toolchain=gowin --build
   ```
   if the build was finished without any error you shoud see your file inside the build directory 
5. Exit the docker and run the below command to load/flash it into your board
   ```
   openFPGALoader ./gateware/sipeed_tang_primer_20k.fs
   ```
You can then load it using OpenFPGALoader. OpenFPGALoader is already included in the image, and if you run in privileged mode, you can run it inside the container itself.

This setup provides a convenient environment for compiling Linux for your Sipeed Tang Primer 20k FPGA board, keeping everything self-contained within the Docker container.
