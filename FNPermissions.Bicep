resource storageFunctionAppPermissions 'Microsoft.Authorization/roleAssignments@2023-04-03-preview' = {
  name: guid(storage.id, funcApp.name, storageBlobDataContributorRole)
  scope: storage
  properties: {
    principalId: funcApp.identity.principalId
    principalType: 'ServicePrincipal'
    roleDefinitionId: storageBlobDataContributorRole
  }
}

resource kvFunctionAppPermissions 'Microsoft.Authorization/roleAssignments@2020-04-01-preview' = {
  name: guid(kv.id, funcApp.name, keyVaultSecretsUserRole)
  scope: kv
  properties: {
    principalId: funcApp.identity.principalId
    principalType: 'ServicePrincipal'
    roleDefinitionId: keyVaultSecretsUserRole
  }
}
