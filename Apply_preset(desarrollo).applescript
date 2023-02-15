tell application "Capture One 21"
    -- Cargar el preset
    set presetName to "Nombre del preset"
    set presetPath to "/Users/usuario/Documents/CaptureOne/Presets/" & presetName & ".costyle"
    set thePreset to load preset presetPath
    
    -- Procesar todas las imágenes en la carpeta
    set folderPath to choose folder with prompt "Selecciona la carpeta de imágenes"
    set theFiles to list folder folderPath without invisibles
    
    repeat with theFile in theFiles
        set filePath to folderPath & "/" & theFile
        
        if (theFile ends with ".jpg") or (theFile ends with ".tif") or (theFile ends with ".png") then
            -- Abrir la imagen
            set theImage to open filePath
            
            -- Aplicar el preset
            apply thePreset to theImage
            
            -- Guardar la imagen con el mismo nombre y en la misma ubicación
            save theImage in filePath
            
            -- Cerrar la imagen
            close theImage saving no
        end if
    end repeat
end tell


(*probar en applescript y guardar con formato aplicación
IMPORTANTE:PENDIENTE DE PRUEBA Y COMPROBACIÓN*)
