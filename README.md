# ADDS-Deployment

This Repository Contains deployment of Active Directory Domain service in Windows server 2019 using Powershell Scripts with Step by Step guidelines. 
## Prerequisites
 - [ ] Install Windows server 2019 Standard / Data center versions
 - [ ] Active Directory Architecture
 - [ ] Open Ports Necessary for ADDS to function
		 
|               Port |Type                          |Description                       |
|----------------|-------------------------------|-----------------------------|
|135|TCP/UDP       |RPC endpoint mapper         |
|   136       |TCP/UDP           |NetBIOS name service            |
|137          |UDP|NetBIOS datagram service|

 - [ ] Configure Static IP to Domain Controller
 - [ ] Install ADDS Role in Server 
 - [ ] Configure according to requirement
 - [ ] Validate ADDS installation with windows event logs
 - [ ] Set up Performance Monitoring (Optional)
 - [ ] Configure ADDS backup and Disaster Recovery (Optional - Recommended)
 
 ## Steps
 
  1. IP Configuration
  
  Change the Dynamic IPs (If any) in to static IP. Can use below PowerShell Command
  
  '''New-NetIPAddress` -InterfaceIndex 4 -IPAddress 192.168.1.10 -PrefixLength 24 DefaultGateway 192.168.1.1'''