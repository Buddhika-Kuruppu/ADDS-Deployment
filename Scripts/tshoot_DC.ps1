# List Domain Wide FSMO Roles
Get-ADForest | Select-object DomainNamingMaster,SchemaMaster | Format-List

# List Forest Wide FSMO Roles
Get-ADDomain | Select-object InfrastructureMaster, PDCEmulator, RIDMaster | Format-List

#Move an FSMO Role
Move-ADDirectoryServerOperationMasterRole -identity "Domain Controller - Primary/Secondary" -OperationMasterRole PDCEmulator

#Seize a FSMO Role
Move-ADDirectoryServerOperationMasterRole -identity "Domain Controller - Primary/Secondary" -OperationMasterRole PDCEmulator -Force
