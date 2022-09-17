# ADDS-Deployment (Windows Server 2019)

This Repository Contains deployment of Active Directory Domain service in Windows server 2019 using Powershell Scripts with Step by Step guidelines. 
## Prerequisites
 - [ ] Install Windows server 2019 Standard / Data center versions
 - [ ] Active Directory Architecture
 - [ ] Open Ports Necessary for ADDS to function
		 
	|               Port |Type                          |Description                       |
	|----------------|-------------------------------|-----------------------------|
	|135|TCP/UDP       |RPC endpoint mapper         |
	|   137       |TCP/UDP           |NetBIOS name service            |
	|138         |UDP|NetBIOS datagram service|
	|139	|TCP|NetBIOS session service|
	|445|TCP/UDP|SMB over IP (Microsoft-DS)|


 - [ ] Configure Static IP to Domain Controller
 - [ ] Install ADDS Role in Server 
 - [ ] Configure according to requirement
 - [ ] Validate ADDS installation with windows event logs
 - [ ] Set up Performance Monitoring (Optional)
 - [ ] Configure ADDS backup and Disaster Recovery (Optional - Recommended)
 
 ## Steps
 
 ### 1. IP Configuration
   
   Change the Dynamic IPs (If any) in to static IP. Can use below PowerShell Command
  
   ```New-NetIPAddress` -InterfaceIndex 4 -IPAddress 192.168.1.10 -PrefixLength 24 DefaultGateway 192.168.1.1```
	
 ### 2. Configuration of DNS 
   Need to setup preferred DNS as private DNS in here.
	
   ```Set-DnsClientServerAddress -InterfaceIndex 4 -ServerAddresses ("192.168.1.100","8.8.8.8")```
	
### 3. Installation of ADDS Role
   Use Get-Windowsfeature command to retrieve exact feature name and below command to install windows ADDS feature.
	
   ```Install-windowsfeature –Name AD-Domain-Services –IncludeManagementTools```
	
   After installation need to import ADDSDeployment module using ```Import-Module ADDSDeployment``` to proceed with ADDS installation and configuration
   
   Then below are set of commands to configure ADDS.
   
   ```Install-ADDSForest `
 
   	-DomainName "customerdomain.com" `
 
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
   
### 4. Adding Safe-Mode Password (DSRM)

  After excecuting installation commands request for Safe Mode Administrator Password will pop-up. So Enter Directory Services Restore Mode (DSRM)  password
### 5. Reboot the Server and confirm Services

   ```Get-Service adws,kdc,netlogon,dns```
   
### 6. Below are some validation commands.

|Command|Description  |
|---------------|--|
|```Get-ADDomainController```              |  List details of Domain Controller|
|```Get-ADDomain customerdomain.com```		| List Details about active Directory Domain |
|```Get-ADForest customerdomain.com``` | List details on AD Foress|
|```Get-smbshare SYSVOL``` | Show Domain controller sharing SYSVOL volume |

	
