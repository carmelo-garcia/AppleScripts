set mainProjectName to text returned of (display dialog "Ingrese el nombre del nuevo proyecto:" default answer "New_Project")(*cuadro de dialogo que solicita el nombre del proyecto*)

tell application "Finder"
  set mainFolder to (make new folder at desktop with properties {name:mainProjectName})(*crea el nuevo folder en el escritorio, modificar el valor desktop por la ubicacion de los proyectos*)
end tell

set numberOfFolders to text returned of (display dialog "Ingrese el número de carpetas que desea crear:" default answer "1")(*cuadro de dialogo que recoge el numero de subcarpetas a crear*)
set numberOfFolders to numberOfFolders as integer

repeat with i from 1 to numberOfFolders(*bucle desde 1 hasta las carpetas indicadas*)
  set theFolderName to "Look_" & i(*nombre de la subcarpeta*)
  tell application "Finder"
    set theFolder to (make new folder at mainFolder with properties {name:theFolderName})
  end tell
end repeat
