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
   openFPGALoader sipeed_tang_primer_20k/gateware/sipeed_tang_primer_20k.fs
   ```
To run it as of a privileged
```
docker run -it --rm --privileged dockerlinuxonlitex
# After you login 
lsusb
# Or after the build you can load the file by openFPGALoader
```
You can then load it using OpenFPGALoader. OpenFPGALoader is already included in the image, and if you run in privileged mode, you can run it inside the container itself.

This setup provides a convenient environment for compiling Linux for your Sipeed Tang Primer 20k FPGA board, keeping everything self-contained within the Docker container.

**Sample build without run the command inside docker**

To just build your requried image you could run it something like below

```
docker run -it --rm  -v .:/home/linux-on-litex-vexriscv/build dockerlinuxonlitex python -m litex_boards.targets.sipeed_tang_primer_20k --l2-size 512  --build --cpu-type vexriscv_smp --cpu-variant linux --build  --with-spi-sdcard --with-wishbone-memory
```
![Build Process](https://github.com/gr8linux/docker-linuxonlitex/blob/master/doc/ScreenShot1.png)

Or if you like to load it directly
```

docker run --privileged -it --rm  -v .:/home/linux-on-litex-vexriscv/build dockerlinuxonlitex python -m litex_boards.targets.sipeed_tang_primer_20k --l2-size 512  --build --cpu-type vexriscv_smp --cpu-variant linux --build  --with-spi-sdcard --with-wishbone-memory --load
```
**What is next**
You might like to have the board and know how it is looklike
**The board**
You could buy the board directly from Amazon or Aliexpress if you like 
Just search Sipeed tang primer 20k
![Board Picture](https://github.com/gr8linux/docker-linuxonlitex/blob/master/doc/ScreenShot1.png)
**The Gowin IDE**
You need to download it from the Gowin site:
[Download eda tools](https://www.gowinsemi.com/en/support/download_eda/)

