tell application "Capture One 21"
   activate
   tell current document
      set processNames to {}
      repeat with theProcess in every process
         set end of processNames to name of theProcess
      end repeat
      
      set chosenProcess to choose from list processNames with prompt "Selecciona el proceso que deseas actualizar:" with title "Selecciona el proceso" without empty selection allowed
      if chosenProcess is false then
         return
      end if
      
      set chosenProcessName to item 1 of chosenProcess
      set theProcess to first process whose name is chosenProcessName
      tell theProcess
         set batchCounter to value of parameter "Batch Counter" -- Reemplazar "Batch Counter" con el nombre de tu parámetro de contador de lotes
         display dialog "El contador de lotes actual del proceso " & chosenProcessName & " es " & batchCounter & ". ¿Desea reiniciarlo a 0?" buttons {"Cancelar", "Reiniciar"} default button 2 with title "Reiniciar contador de lotes"
         if button returned of result is "Reiniciar" then
            set value of parameter "Batch Counter" to 0 -- Reemplazar "Batch Counter" con el nombre de tu parámetro de contador de lotes
            display dialog "El contador de lotes del proceso " & chosenProcessName & " se ha reiniciado a 0."
         end if
      end tell
   end tell
end tell
