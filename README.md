# VscodeInstall
How install vscode in 42 barcelona
#
Primero de todo ves a [VS Code download](https://code.visualstudio.com/Download) y descarga la version x64 en formato tar.gz para linux.
Una vez echo eso ves a descargas y descomprime la carpeta depues sigue estos pasos desde la terminal.

```bash
mkdir -p ~/opt/vscode
```
El siguiente comando la direccion es de ejemplo(sola la primera la segundo debe de ser esa) si no has cambiado nada debe de ser bastante similar a esa ruta.
```bash
mv ~/Downloads/code-stable-x64-1715058993/VSCode-linux-x64/* ~/opt/vscode
```

El siguiente paso es para configurar el visual para poder usar "code ." si no lo quieres saltate el paso.
```bash
vim ~/.zshrc
```
Al final del archivo escribe:
```bash
code() {
    nohup ~/opt/vscode/code "$@" > /dev/null 2>&1 &
}
```
[!CAUTION]
Si tenias una regla de code previamente y haces source .zshrc puede que te entre en un bucle infinito por eso lo suyo sera reiniciar la terminal

Con esto echo tenemos el code configurado para que funcione correctamente en el caso de que sea un fanatico del entorno grafico a continuacion un paso a paso de como configurarlo..

```bash
vim ~/.local/share/applications/vscode.desktop
```
Pondremos dentro importante sustituir $HOME con vuestro /home/user42 es importante para este documento
```bash
[Desktop Entry]
Name=Visual Studio Code
Comment=Code Editing. Redefined.
Exec=$HOME/opt/vscode/code --no-sandbox %Fi
Icon=$HOME/opt/vscode/resources/app/resources/linux/code.png
Type=Application
Terminal=false
Categories=Development;IDE;
StartupWMClass=Code
```
```bash
chmod +x ~/.local/share/applications/vscode.desktop
cp ~/.local/share/applications/vscode.desktop ~/Desktop
```
Con esto echo tendremos que dar click derecho encima del fichero que acabamos de copiar en el escritorio y darle a Allow Launching con eso echo ya  lo tendremos funcional en el escritorio si queremos tenerlo en la barra solo tendremos que abrirlo y desde la misma barra click derecho Add to Favorites 
