#!/bin/bash

SRC_DIR=$(cd $(dirname $0) && pwd)

show_question() {
  echo -e "\033[1;34m$@\033[0m"
}

show_dir() {
  echo -e "\033[1;32m$@\033[0m"
}

show_error() {
  echo -e "\033[1;31m$@\033[0m"
}

end() {
  echo -e "\nExiting...\n"
  exit 0
}

continue() {
  show_question "\nDo you want to continue? (y)es, (n)o : \n"
  read INPUT
  case $INPUT in
    [Yy]* ) ;;
    [Nn]* ) end;;
    * ) show_error "\nSorry, try again."; continue;;
  esac
}

install() {
  cd src/gtk-3.0/theme-assets
  ln -s -b ${Avengers}/nautilus_bg_img_bottom.jpg nautilus_bg_img_bottom.jpg
  ln -s -b ${Avengers}/nautilus_bg_img_top.jpg nautilus_bg_img_top.jpg

  cd ${SRC_DIR}
  ./Install

  gsettings set org.gnome.desktop.wm.preferences button-layout appmenu:minimize,maximize,close
  gsettings set org.gnome.desktop.interface gtk-theme Avengers
}

main() {
  show_question "\nWhich version do you want to install:

+------------------------------------------------------------------+

              (1)  Default
              (2)  Black_Widow
              (3)  Captain_America
              (4)  Hulk
              (5)  Iron_Man
              (6)  Thor

+------------------------------------------------------------------+\n"

  read INPUT
  case $INPUT in
    [1]* ) Avengers="Default" && install;;
    [2]* ) Avengers="Black_Widow" && install;;
    [3]* ) Avengers="Captain_America" && install;;
    [4]* ) Avengers="Hulk" && install;;
    [5]* ) Avengers="Iron_Man" && install;;
    [6]* ) Avengers="Thor" && install;;
    * ) show_error "\nSorry, try again."; continue;;
  esac
}

echo -e "\e[1m\n+---------------------------------------------+"
echo -e "|       Avengers Theme Installer Script       |"
echo -e "+---------------------------------------------+\n\e[0m"

main
