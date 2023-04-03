resource logAnalytics 'Microsoft.OperationalInsights/workspaces@2023-04-03' = {
  name: FNLoganalytics
  location: EastUS
  properties: {
    sku: {
      name: 'LogAnalyticsSKU'
    }
    retentionInDays: 30
    features: {
      enableLogAccessUsingOnlyResourcePermissions: true
    }
    workspaceCapping: {
      dailyQuotaGb: 1
    }
    publicNetworkAccessForIngestion: 'Enabled'
    publicNetworkAccessForQuery: 'Enabled'
  }
}

resource appInsights 'Microsoft.Insights/components@2023-04-03' = {
  name: FNAppinsights
  location: EastUS
  kind: 'web'
  properties: {
    Application_Type: 'web'
    publicNetworkAccessForIngestion: 'Enabled'
    publicNetworkAccessForQuery: 'Enabled'
    WorkspaceResourceId: logAnalytics.id
  }
}
