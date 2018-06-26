
Select-AzureRmSubscription -SubscriptionId fef2404c-a174-4cf1-b2a3-83d5cb7e3bee
$rg = Get-AzureRmResourceGroup -ResourceGroupName RG-EUR-IT-TEST-AEP -ErrorVariable notPresent -ErrorAction 0

if($notPresent){
    New-AzureRmResourceGroup -Name "RG-EUR-IT-TEST-AEP" -Location "West Europe"
}


new-azurermresourcegroupdeployment -templatefile ..\Templates\RG-AEP.json -ResourceGroupName RG-EUR-IT-TEST-AEP -TemplateParameterObject @{region="EUR"; country="IT";environment="TEST";sqllogin="sqladmin";sqlpassword="r=6M~/A8&r|f";tenantDomain="inoffice.microsoft.com";amsClientId="9a3fa62e-9784-4546-b38a-ab0452823ebe";amsClientSecret="NIG1vaioqn7ChGnh2MfS4J5Q33qoKXGLEsNwE19TAf0="} -verbose