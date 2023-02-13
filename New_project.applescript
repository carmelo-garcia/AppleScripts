set selectedFolder to choose folder with prompt "Seleccione la carpeta de destino:"(*seleccion del directorio donde queremos crear el proyecto*)
set mainProjectName to text returned of (display dialog "Ingrese el nombre del nuevo proyecto:" default answer "New_Project")(*cuadro de dialogo que solicita el nombre del proyecto*)
set testFolderName to "test"
set NameFolders to text returned of(display dialog "Ingresa el nombre de las carpetas a crear:" default answer "Look")

tell application "Finder"
  set mainFolder to (make new folder at selectedFolder with properties {name:mainProjectName})(*crea el nuevo folder en la carpeta seleccionada*)
  set testFolder to (make new folder at mainFolder with properties {name:testFolderName})
end tell

set numberOfFolders to text returned of (display dialog "Ingrese el número de carpetas que desea crear:" default answer "1")(*cuadro de dialogo que recoge el numero de subcarpetas a crear*)
set numberOfFolders to numberOfFolders as integer

repeat with i from 1 to numberOfFolders(*bucle desde 1 hasta las carpetas indicadas*)
  set theFolderName to NameFolders & i as string(*nombre de la subcarpeta*)
  tell application "Finder"
    set theFolder to (make new folder at mainFolder with properties {name:theFolderName})
  end tell
end repeat
