Install-ADDSForest `
 
  -DomainName "example.com" `
 
  -CreateDnsDelegation:$false ` 
 
  -DatabasePath "C:\Windows\NTDS" ` 
 
  -DomainMode "7" ` 
 
  -DomainNetbiosName "example" ` 
 
  -ForestMode "7" ` 
 
  -InstallDns:$true ` 
 
  -LogPath "C:\Windows\NTDS" ` 
 
  -NoRebootOnCompletion:$True ` 
 
  -SysvolPath "C:\Windows\SYSVOL" ` 
 
  -Force:$true


  