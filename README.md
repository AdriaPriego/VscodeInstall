# VscodeInstall
Cómo instalar VS Code en 42 Barcelona
#
Teneis un script que hace esto mismo ahora bien no aseguro que funcione perfecto por lo tanto UP2YOU usarlo (Avisad en el caso de encontrar algun error apriego- pls).

Primero de todo, ve a [VS Code download](https://code.visualstudio.com/Download#) y descarga la versión x64 en formato tar.gz para Linux. Una vez hecho eso, ve a Descargas y descomprime la carpeta. Después, sigue estos pasos desde la terminal.

```bash
mkdir -p ~/opt/vscode
```
El siguiente comando es un ejemplo (solo la primera línea, la segunda debe ser esa). Si no has cambiado nada, debería ser bastante similar a esa ruta.
```bash
mv ~/Downloads/code-stable-x64-1715058993/VSCode-linux-x64/* ~/opt/vscode
```
## Code . (Opcional)
El siguiente paso es para configurar Visual Studio Code para poder usar "code .". Si no lo quieres, sáltate este paso.
```bash
vim ~/.zshrc
```
Al final del archivo escribe:
```bash
code() {
    nohup ~/opt/vscode/code "$@" > /dev/null 2>&1 &
}
```
> [!CAUTION]
> Si tenías una regla de code previamente y haces source .zshrc, puede que entres en un bucle infinito. Por eso, lo mejor será reiniciar la terminal.

Con esto hecho, tenemos code configurado para que funcione correctamente. Si eres un fanático del entorno gráfico, a continuación se explica cómo configurarlo.
## Visual link Escritorio
```bash
vim ~/.local/share/applications/vscode.desktop
```
Despues escribe lo siguiente en el fichero:
> [!CAUTION]
> Es importante sustituir NOFUNCIONARASINOLOPONESBIEN con tu /home/user42. Es crucial para este documento. Si no haces esto, no funcionará nada.
```bash
[Desktop Entry]
Name=Visual Studio Code
Comment=Code Editing. Redefined.
Exec=NOFUNCIONARASINOLOPONESBIEN/opt/vscode/code --no-sandbox %Fi
Icon=NOFUNCIONARASINOLOPONESBIEN/opt/vscode/resources/app/resources/linux/code.png
Type=Application
Terminal=false
Categories=Development;IDE;
StartupWMClass=Code
```
```bash
chmod +x ~/.local/share/applications/vscode.desktop
cp ~/.local/share/applications/vscode.desktop ~/Desktop
```
> [!IMPORTANT]
> Con esto hecho, tendremos que hacer clic derecho sobre el archivo que acabamos de copiar en el escritorio y seleccionar "Allow Launching". Con eso hecho, ya lo tendremos funcional en el escritorio. Si queremos tenerlo en la barra, solo tendremos que abrirlo y desde la misma barra hacer clic derecho y seleccionar "Add to Favorites".
