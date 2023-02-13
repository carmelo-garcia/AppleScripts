
set theFile to choose file with prompt "Selecciona el archivo de texto que contiene los nombres de las carpetas:" (*seleccion del archivo de texto fuente para la creacion de carpetas*)
set theFolder to choose folder with prompt "Selecciona la carpeta donde se crearán las nuevas carpetas:"(*selecciona las carpetas donde se crearan las carpetas*)

set fileRef to open for access theFile
set folderNames to paragraphs of (read fileRef)
close access fileRef

repeat with i from 1 to the count of folderNames
	set thisFolderName to item i of folderNames
	try
		tell application "Finder"
			make new folder at theFolder with properties {name:thisFolderName}
		end tell
	on error
		display dialog "No se pudo crear la carpeta " & thisFolderName & "." buttons {"OK"} default button 1
	end try
end repeat
