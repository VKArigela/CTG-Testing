@description('FNKeyvault')

param appName string




@description('FNKeyvalut1')

@maxLength(15)

param appNameShort string




@description('West US')

param location string




@description('The environment the resources are being deployed to.')

param env string




@description('Name of the key vault')

param vaultName string = 'RG-CTG-${appNameShort}-${env}'




@description('SoftDelete data retention days')

param softDeleteRetentionInDays int = env == 'prod' ? 90 : 30

@description('Custom tags')

param tags object = {}

resource vault 'Microsoft.KeyVault/vaults@2022-07-01' = {

name: vaultName
location: location

properties: {

tenantId: tenant().tenantId

sku: {

family: 'A'

name: 'standard'

 }




enabledForDeployment: false

enabledForDiskEncryption: false

enabledForTemplateDeployment: false

enablePurgeProtection: true

enableRbacAuthorization: true

enableSoftDelete: true

softDeleteRetentionInDays: softDeleteRetentionInDays

networkAcls: {

bypass: 'AzureServices'

defaultAction: 'Deny'


 }

}

tags: union(

{

Project: appName

Environment: env

},

tags)

}
