set theClip to the clipboard
set targetFolder to choose folder with prompt "Selecciona la carpeta donde quieres crear las nuevas carpetas:"

set theParagraphs to paragraphs of theClip

repeat with thisParagraph in theParagraphs
    set thisParagraph to (text 1 thru -2 of thisParagraph) -- eliminar el retorno de carro al final de cada línea
    set folderName to my sanitizeString(thisParagraph)
    if folderName is not "" then -- comprobar que el nombre de la carpeta no está vacío
        tell application "Finder"
            set folderExists to exists folder (targetFolder as text) & folderName
            if folderExists then
                display alert "La carpeta ya existe" message "La carpeta con el nombre " & folderName & " ya existe en la ubicación seleccionada." buttons {"OK"} default button 1
            else
                set newFolder to make new folder at targetFolder
                set name of newFolder to folderName
            end if
        end tell
    end if
end repeat

on sanitizeString(theString)
    set validChars to "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.-_ "
    set sanitizedString to ""
    repeat with i from 1 to length of theString
        set thisChar to character i of theString
        if thisChar is in validChars then
            set sanitizedString to sanitizedString & thisChar
        else
            set sanitizedString to sanitizedString & "_"
        end if
    end repeat
    return sanitizedString
end sanitizeString
