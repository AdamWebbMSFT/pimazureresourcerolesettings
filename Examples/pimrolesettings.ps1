## Azure Resource PIM Role Settings for Azure Subscription Example

# Connect to Azure Active Directory
Connect-AzureAD

# Define Azure Subscription and RBAC role Ids
$SubscriptionID = "<Replace with Azure Subscription ID>"
$RoleDefinitionID = "b24988ac-6180-42a0-ab88-20f7382dd24c" # Built-in Contributor Role Definition ID example

# Get the Privleged Resource for the Azure Subscription
$SubscriptionPrivilegedResource = Get-AzureADMSPrivilegedResource -ProviderId AzureResources -Filter "Type eq 'subscription' and ExternalId eq '/subscriptions/$subscriptionId'"

# Get the Settings for the Privledged Role defined in the Azure Subscription Privledged Resource
$PrivilegedRoleSetting = Get-AzureADMSPrivilegedRoleSetting -ProviderId AzureResources -Filter "ResourceId eq '$($SubscriptionPrivilegedResource.Id)' and RoleDefinitionId eq '$roleDefinitionID'"

# Create a Privledged Rule Setting object and define a specific rule setting. In this case, enable MFA settings
$PrivilegedRuleSetting = New-Object Microsoft.Open.MSGraph.Model.AzureADMSPrivilegedRuleSetting
$PrivilegedRuleSetting.RuleIdentifier = "MfaRule"
$PrivilegedRuleSetting.Setting = '{"mfaRequired":true}'

# Set PIM Role activation settings
Set-AzureADMSPrivilegedRoleSetting -ProviderId AzureResources -Id $PrivilegedRoleSetting.Id -UserMemberSettings $PrivilegedRuleSetting

# Set PIM Role assignment settings
Set-AzureADMSPrivilegedRoleSetting -ProviderId AzureResources -Id $PrivilegedRoleSetting.Id -AdminMemberSettings $PrivilegedRuleSetting