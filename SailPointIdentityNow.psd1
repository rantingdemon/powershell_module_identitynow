@{
    RootModule        = 'SailPointIdentityNow.psm1'
    ModuleVersion     = '1.0.7'
    GUID              = 'f82fe16a-7702-46f3-ab86-5de11b7305de'
    Author            = 'Darren J Robinson'
    Copyright         = '(c) 2019 . All rights reserved.'
    Description       = "Orchestration of SailPoint IdentityNow"
    PowerShellVersion = '5.0'
    FunctionsToExport = @('Complete-IdentityNowTask',
        'Get-HashString',
        'Get-IdentityNowAccessProfile',
        'Get-IdentityNowAccountActivities',
        'Get-IdentityNowAccountActivity',
        'Get-IdentityNowActiveJobs',
        'Get-IdentityNowAPIClient',
        'Get-IdentityNowApplication',
        'Get-IdentityNowCertCampaign',
        'Get-IdentityNowCertCampaignReport',
        'Get-IdentityNowEmailTemplate',
        'Get-IdentityNowGovernanceGroup',
        'Get-IdentityNowIdentityAttribute',
        'Get-IdentityNowOAuthAPIClient',
        'Get-IdentityNowOrg',
        'Get-IdentityNowOrgConfig',
        'Get-IdentityNowOrgStatus',
        'Get-IdentityNowProfile',
        'Get-IdentityNowProfileOrder',
        'Get-IdentityNowQueue',
        'Get-IdentityNowRole',
        'Get-IdentityNowRule',
        'Get-IdentityNowSource',
        'Get-IdentityNowSourceAccounts',
        'Get-IdentityNowTask',
		'Get-IdentityNowTimeZone',
        'Get-IdentityNowTransform',
        'Get-IdentityNowVACluster',
        'Invoke-IdentityNowAggregateSource',
        'Invoke-IdentityNowRequest',
        'Invoke-IdentityNowSourceReset',
        'Join-IdentityNowAccount',
        'New-IdentityNowAccessProfile',
        'New-IdentityNowAPIClient',
        'New-IdentityNowCertCampaign',        
        'New-IdentityNowGovernanceGroup',
        'New-IdentityNowIdentityProfilesReport',
        'New-IdentityNowOAuthAPIClient',
        'New-IdentityNowProfile',
        'New-IdentityNowRole',
        'New-IdentityNowSource',
        'New-IdentityNowSourceAccountSchemaAttribute',
        'New-IdentityNowSourceConfigReport',
        'New-IdentityNowUserSourceAccount',
        'New-IdentityNowTransform',
        'Remove-IdentityNowAccessProfile',
        'Remove-IdentityNowAPIClient',
        'Remove-IdentityNowGovernanceGroup',
        'Remove-IdentityNowOAuthAPIClient',
        'Remove-IdentityNowProfile',
        'Remove-IdentityNowRole',
        'Remove-IdentityNowSource'
        'Remove-IdentityNowTransform',
        'Remove-IdentityNowUserSourceAccount',
        'Save-IdentityNowConfiguration',
        'Search-IdentityNowAuditEvents',
        'Search-IdentityNowEntitlements',
        'Search-IdentityNowEvents',
        'Search-IdentityNowIdentities',
        'Search-IdentityNowUserProfile',
        'Search-IdentityNowUsers',
        'Set-IdentityNowCredential',
        'Set-IdentityNowOrg',
		'Set-IdentityNowTimeZone',
        'Start-IdentityNowCertCampaign',
        'Start-IdentityNowProfileUserRefresh',
        'Test-IdentityNowCredentials',
        'Test-IdentityNowSourceConnection',
        'Update-IdentityNowAccessProfile',
        'Update-IdentityNowApplication',
        'Update-IdentityNowEmailTemplate',
        'Update-IdentityNowGovernanceGroup',
        'Update-IdentityNowIdentityAttribute',
        'Update-IdentityNowOrgConfig',
        'Update-IdentityNowProfileOrder',
        'Update-IdentityNowRole',
        'Update-IdentityNowSource',
        'Update-IdentityNowUserSourceAccount',
        'Update-IdentityNowTransform'
    )
    PrivateData       = @{
        PSData = @{
            ProjectUri = 'https://github.com/darrenjrobinson/powershell_module_identitynow'
        } 
    } 
}