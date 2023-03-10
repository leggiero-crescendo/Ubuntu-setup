#!/bin/sh -e

echo "[#Setup Locale]"
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8


echo "[#Setup Sources]"
sudo apt update && sudo apt install curl gnupg2 lsb-release
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
#add the repository to your sources list
sudo sh -c 'echo "deb [arch=amd64,arm64] http://packages.ros.org/ros2/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/ros2-latest.list'


echo "[#Install ROS 2 packages]"
sudo apt update
sudo apt install ros-foxy-desktop
#sudo apt install ros-foxy-ros-base


echo "[#Environment setup]"
echo "[#Sourcing the setup script]"
source /opt/ros/foxy/setup.bash
echo "[#Launching the setup script]"
sh -c "echo \"source /opt/ros/foxy/setup.bash\" >> ~/.bashrc"

echo "[#Install argcomplete]"
sudo apt install python3-argcomplete


#echo "[#Try example]"
#new terminal execution
#tmux new -s
#source /opt/ros/foxy/setup.bash
#ros2 run demo_nodes_cpp talker
#new terminal execution
#tmux new -s
#source /opt/ros/foxy/setup.bash
#ros2 run demo_nodes_py listener


echo "[#Install additional RMW implementations]"
sudo apt update
#sudo apt install ros-foxy-rmw-opensplice-cpp # for OpenSplice
#sudo apt install ros-foxy-rmw-connext-cpp # for RTI Connext (requires license agreement)


#echo "[#Install additional packages using ROS 1 packages]"
#sudo apt update
#sudo apt install ros-foxy-ros1-bridge


echo "[#Install turtlesim]" #https://index.ros.org/doc/ros2/Tutorials/Turtlesim/Introducing-Turtlesim/
sudo apt update
sudo apt install ros-foxy-turtlesim
#Use turtlesim
#ros2 run turtlesim turtlesim_node
#ros2 run turtlesim turtle_teleop_key


echo "[#Install colcon to build packages]"
sudo apt install python3-colcon-common-extensions


#echo "[#ros2_example_ws git clone / build / install]"
#Create a workspace
mkdir -p ~/ros2_example_ws/src
cd ~/ros2_example_ws
#Add some sources
git clone https://github.com/ros2/examples src/examples
cd ~/ros2_example_ws/src/examples/
git checkout foxy
cd ~/ros2_example_ws
#Build the workspace
colcon build --symlink-install
#Source the environment
. install/setup.bash
#Try a demo
#ros2 run examples_rclcpp_minimal_subscriber subscriber_member_function
#tmux new -s
#ros2 run examples_rclcpp_minimal_publisher publisher_member_function

#echo "[#Install development tools and ROS tools]"
sudo apt update && sudo apt install -y \
  build-essential \
  cmake \
  git \
  python3-colcon-common-extensions \
  python3-pip \
  python-rosdep \
  python3-vcstool \
  wget
# install some pip packages needed for testing
python3 -m pip install -U \
  argcomplete \
  flake8 \
  flake8-blind-except \
  flake8-builtins \
  flake8-class-newline \
  flake8-comprehensions \
  flake8-deprecated \
  flake8-docstrings \
  flake8-import-order \
  flake8-quotes \
  pytest-repeat \
  pytest-rerunfailures \
  pytest \
  pytest-cov \
  pytest-runner \
  setuptools
# install Fast-RTPS dependencies
sudo apt install --no-install-recommends -y \
  libasio-dev \
  libtinyxml2-dev
# install CycloneDDS dependencies
sudo apt install --no-install-recommends -y \
  libcunit1-dev
  

#Tips
#If you do not want to build a specific package place an empty file named COLCON_IGNORE in the directory and it will not be indexed.
