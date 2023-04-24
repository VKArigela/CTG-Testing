resource keyvault 'Microsoft.KeyVault/vaults@2022-11-01'
name: 'FNKeyvault'
  location: 'EastUS'
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: subscription().tenantId

    enableRbacAuthorization: false      // Using Access Policies model
    accessPolicies: [
      {
        objectId: 'd89101d9-cf97-4b6c-9656-c6da457d8add'
        tenantId: tenantId
        permissions: {
          secrets: [
            'all'
          ]
          certificates: [
            'all'
          ]
          keys: [
            'all'
          ]
        }
      }
    ]

    
    enabledForDeployment: true
    enabledForTemplateDeployment: true

    enablePurgeProtection: true
    enableSoftDelete: true
    softDeleteRetentionInDays: 30
    createMode: 'default'
  }
}
