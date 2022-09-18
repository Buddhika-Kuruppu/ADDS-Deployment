#List excluded applications for cloning 
Get-ADDCCloningExcludedApplicationList
#Generate exceptions xml
Get-ADDCCloningExcludedApplicationList -GenerateXml
#Create the domain controller clone details
Get-ADDCCloneconfigFile