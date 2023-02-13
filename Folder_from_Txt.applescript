set theFile to choose file with prompt "Selecciona el archivo RTF que contiene los nombres de las carpetas:"
set theFolder to choose folder with prompt "Selecciona la carpeta donde se crearán las nuevas carpetas:"

tell application "TextEdit"
	open theFile
	set fileText to text of document 1
	close document 1
end tell

set folderNames to paragraphs of fileText

repeat with i from 1 to the count of folderNames
	set thisFolderName to item i of folderNames
	if thisFolderName is not equal to "" then
		set thisFolderName to do shell script "echo " & quoted form of thisFolderName & " | tr ' ' '_'"
		try
			tell application "Finder"
				make new folder at theFolder with properties {name:thisFolderName}
			end tell
		on error
			display dialog "No se pudo crear la carpeta " & thisFolderName & "." buttons {"OK"} default button 1
		end try
	end if
end repeat
