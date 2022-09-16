Install-WindowsFeature –Name AD-Domain-Services –IncludeManagementTools

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

  #Confirm Installation

  Get-Service adws,kdc,netlogon,dns

  Get-ADDomainController
  Get-ADDomain basicadds.com
  Get-smbshare SYSVOL
