resource appService 'Microsoft.Web/sites@2023-03-28' = {
  name: ctgtestingvenkata.com
  location: Westus
  tags: testwebsite
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: linuxFxVersion
    }
  }
}
