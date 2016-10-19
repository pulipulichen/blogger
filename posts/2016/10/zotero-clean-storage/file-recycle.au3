For $i = 1 To $CmdLine[0]
   IF FileExists($CmdLine[$i]) Then
	  FileRecycle($CmdLine[$i])
   EndIf
Next
