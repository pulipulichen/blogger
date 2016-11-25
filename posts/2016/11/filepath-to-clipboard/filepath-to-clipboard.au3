Local $clipboard = ""
For $i = 1 To $CmdLine[0]
   If $clipboard <> "" Then
	  $clipboard = $clipboard & ' '
   EndIf
   $clipboard = $clipboard & '"' & $CmdLine[$i] & '"'
Next

If $clipboard <> "" Then
   ClipPut ( $clipboard )
EndIf