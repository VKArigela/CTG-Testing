resource plan 'Microsoft.Web/serverfarms@2023-04-03' = {
  name: FNappService
  location: EastUS
  kind: 'functionapp'
  sku: {
    name: 'FN1'
  }
  properties: {
  }
}

resource funcApp 'Microsoft.Web/sites@2023-04-03' = {
  name: FNfunctionApp
  location: EastUS
  kind: 'functionapp'
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    httpsOnly: true
    serverFarmId: plan.id
    siteConfig: {
      ftpsState: 'Disabled'
      minTlsVersion: '1.2'
      netFrameworkVersion: 'v6.0'
      appSettings: [
        {
          name: 'AzureWebJobsStorage'
          value: storageConnectionString
        }
        {
          name: 'WEBSITE_CONTENTAZUREFILECONNECTIONSTRING'
          value: storageConnectionString
        }
        {
          name: 'APPINSIGHTS_INSTRUMENTATIONKEY'
          value: appInsights.properties.InstrumentationKey
        }
        {
          name: 'FUNCTIONS_WORKER_RUNTIME'
          value: 'dotnet'
        }
        {
          name: 'FUNCTIONS_EXTENSION_VERSION'
          value: '~4'
        }
        {
          name: 'ApiKey'
          value: '@Microsoft.KeyVault(VaultName=${kv.name};SecretName=${kv::storageNameSecret.name})'
        }
        {
          name: 'ContentStorageAccount'
          value: storage.name
        }
        {
          name: 'ContentContainer'
          value: storage::blobService::content.name
        }
      ]
    }
  }
}
