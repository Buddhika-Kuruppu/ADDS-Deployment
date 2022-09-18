#List excluded applications for cloning
Get-ADDCCloningExcludedApplicationList
#Generate exceptions
Get-ADDCCloningExcludedApplicationList -GenerateXml
#Create the domain controller clone
Get-ADDCCloneconfigFile