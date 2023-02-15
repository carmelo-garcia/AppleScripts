set barcode to ""

repeat until barcode is not ""
    display dialog "Por favor, escanea el código de barras" default answer ""
    set barcode to text returned of result
end repeat

set folderName to "Carpeta de " & barcode
set targetFolder to (choose folder with prompt "Selecciona la ubicación donde se creará la carpeta de captura")

tell application "Finder"
    if not (exists folder folderName of targetFolder) then
        set newFolder to make new folder at targetFolder with properties {name:folderName}
    end if
    set captureFolder to folder folderName of targetFolder
end tell

return captureFolder as alias


(*Este código utiliza un bucle repeat para esperar hasta que el código de barras se escanee correctamente. 
Una vez que se ha escaneado el código de barras,
se utiliza para crear una carpeta y se establece como la carpeta de captura para ese producto.
Este código también permite al usuario seleccionar la ubicación donde se creará la carpeta de captura.*)
