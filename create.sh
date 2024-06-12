#!/bin/bash

first=".first"

if [ ! -f "$first" ];
then
    echo Forma de uso bash ./script.sh DIR DE LA CARPETA DESCOMPRIMIDA DEL VISUAL exemple: ~/Downloads/code-stable-x64-1715058993/VSCode-linux-x64.
    echo -e "\e[33mEs importante la carpeta ha de ser la que tiene el ejecutable del propio visual si no es esa no funcionara no me hago responsable de lo que pase despues si no sigues de forma correcta todo."
    echo -e "UP2YOU Usar este script.sh. Personalmente recomiendo hazerlo paso a paso y ya de paso entender como funciona todo este tema.\e[0m"
    echo Usage: bash ./script.sh PATH_TO_THE_UNZIPPED_FOLDER_OF_VISUAL  exemple: ~/Downloads/code-stable-x64-1715058993/VSCode-linux-x64.
    echo -e "\e[33mIt's important that the folder provided contains the executable of Visual Studio Code. If it's not the correct folder, it won't work. I'm not responsible for any issues that may occur if you don't follow these instructions correctly."
    echo -e "UP2YOU to use this script.sh. Personally, I recommend doing it step by step and understanding how everything works.\e[0m"
    touch $first
    exit 1
fi

if [ -z "$1" ];
then
    echo Forma de uso bash ./script.sh DIR DE LA CARPETA DESCOMPRIMIDA DEL VISUAL exemple: ~/Downloads/code-stable-x64-1715058993/VSCode-linux-x64.
    echo -e "\e[31mEs importante la carpeta ha de ser la que tiene el ejecutable del propio visual si no es esa no funcionara no me hago responsable de lo que pase despues si no sigues de forma correcta todo."
    echo -e "UP2YOU Usar este script.sh. Personalmente recomiendo hazerlo paso a paso y ya de paso entender como funciona todo este tema.\e[0m"
    echo Usage: bash ./script.sh PATH_TO_THE_UNZIPPED_FOLDER_OF_VISUAL  exemple: ~/Downloads/code-stable-x64-1715058993/VSCode-linux-x64.
    echo -e "\e[31mIt's important that the folder provided contains the executable of Visual Studio Code. If it's not the correct folder, it won't work. I'm not responsible for any issues that may occur if you don't follow these instructions correctly."
    echo -e "UP2YOU to use this script.sh. Personally, I recommend doing it step by step and understanding how everything works.\e[0m"
    exit 1
fi

mkdir -p ~/opt/vscode
mv $1/* ~/opt/vscode
echo "code() {
    nohup ~/opt/vscode/code "'$@'" > /dev/null 2>&1 &
}" >> ~/.zshrc

echo "[Desktop Entry]
Name=Visual Studio Code
Comment=Code Editing. Redefined.
Exec=$HOME/opt/vscode/code --no-sandbox %F
Icon=$HOME/opt/vscode/resources/app/resources/linux/code.png
Type=Application
Terminal=false
Categories=Development;IDE;
StartupWMClass=Code" > ~/.local/share/applications/vscode.desktop
chmod +x ~/.local/share/applications/vscode.desktop
cp ~/.local/share/applications/vscode.desktop ~/Desktop
chmod +x ~/Desktop/vscode.desktop
echo DONE
rm $first
