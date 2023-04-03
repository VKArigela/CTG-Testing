resource kv 'Microsoft.KeyVault/vaults@2023-04-03-preview' = {
  name: FNkeyVault
  location: EastUS
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: subscription().tenantId
    enableRbacAuthorization: true
    enabledForDeployment: false
    enabledForDiskEncryption: true
    enabledForTemplateDeployment: false
  }

  resource storageNameSecret 'secrets' = {
    name: 'ExternalServiceApiKey'
    properties: {
      contentType: 'text/plain'
      value: apiKey
    }
  }
}
