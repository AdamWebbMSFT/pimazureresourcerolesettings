# Example of automating Azure Privileged Identity Management Role Settings for Azure Resources

The goal of this repo is to provide examples of how to automate the configuration of Azure Privileged Identity Management (PIM) Role Settings for Azure Resources.

When assisting a customer with automating configuration of PIM role settings for Azure Resources, I struggled to locate any concrete examples or sample code. This was most likely due to the [PIM APIs being in public preview](https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-apis).

Documentation to configure the role settings manually for an Azure Resource can be located [here](https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-resource-roles-configure-role-settings).

## [PowerShell](./Examples/pimrolesettings.ps1)

### Pre-requisites

* Latest version of the [Azure Active Directory V2 Preview Module](https://www.powershellgallery.com/packages/AzureADPreview)
* [Discover and on-board Azure Subscription to PIM](https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-resource-roles-discover-resources)
* Azure Subscription Id
* Azure RBAC role Id e.g. [Contributor](https://docs.microsoft.com/en-us/azure/role-based-access-control/built-in-roles#all) is b24988ac-6180-42a0-ab88-20f7382dd24c

### Steps

1. Ensure the pre-requisites are met
2. Clone this repo or open the [PowerShell file](./examples/pimrolesettings.ps1) in an IDE e.g. Visual Studio Code or PowerShell ISE
3. Replace the token with your Azure Subscription Id on line 7
4. Run the commands in order

### Results

The results of running through all the commands in the PowerShell file:

* Azure MFA will be required upon PIM role Activation for the Azure Contributor role
* Azure MFA will be required upon active assignment of the Azure Contributor role wthin PIM

You can validate the above settings by opening the Azure Portal and navigating to Privileged Identity Management > Azure Resources > Azure Subscription > Settings > Contributor > Edit > Activation/Assignment

## References

https://www.jasonfritts.me/2021/07/20/automating-azure-privileged-identity-management-pim-with-powershell
https://docs.microsoft.com/en-us/powershell/module/azuread/?view=azureadps-2.0-preview#privileged-role-management
