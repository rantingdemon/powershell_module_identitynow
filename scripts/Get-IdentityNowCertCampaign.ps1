function Get-IdentityNowCertCampaign {
    <#
.SYNOPSIS
    Get IdentityNow Certification Campaign(s).

.DESCRIPTION
    Get IdentityNow Certification Campaign(s).

.PARAMETER campaignID
    An IdentityNow Certification Campaign(s).

.PARAMETER completed
    (boolean) Completed only campaigns. Defaults to True

.PARAMETER limit
    Number of campaigns to retrieve

.EXAMPLE
    Get-IdentityNowCertCampaign -completed $false

.EXAMPLE
    Get Certification Campaign using ID of the campaign (ID not campaignFilterId)
    Get-IdentityNowCertCampaign -campaignID 2c9180856708ae38016709f4812345c3

.LINK
    http://darrenjrobinson.com/sailpoint-identitynow

#>

    [cmdletbinding()]
    param(
        [Parameter(Mandatory = $false, ValueFromPipeline = $true)]
        [string]$campaignID,
        [Parameter(Mandatory = $false, ValueFromPipeline = $true)]
        [boolean]$completed = $true,
        [Parameter(Mandatory = $false, ValueFromPipeline = $true)]
        [string]$limit = '999999'
    )
    
    # IdentityNow Admin User
    $adminUSR = [string]$IdentityNowConfiguration.AdminCredential.UserName.ToLower()
    $adminPWDClear = [System.Runtime.InteropServices.marshal]::PtrToStringAuto([System.Runtime.InteropServices.marshal]::SecureStringToBSTR($IdentityNowConfiguration.AdminCredential.Password))

    # Generate the account hash
    $hashUser = Get-HashString $adminUSR.ToLower() 
    $adminPWD = Get-HashString "$($adminPWDClear)$($hashUser)"  
    
    $clientSecretv3 = [System.Runtime.InteropServices.marshal]::PtrToStringAuto([System.Runtime.InteropServices.marshal]::SecureStringToBSTR($IdentityNowConfiguration.v3.Password))
    # Basic Auth
    $Bytesv3 = [System.Text.Encoding]::utf8.GetBytes("$($IdentityNowConfiguration.v3.UserName):$($clientSecretv3)")
    $encodedAuthv3 = [Convert]::ToBase64String($Bytesv3)
    $Headersv3 = @{Authorization = "Basic $($encodedAuthv3)" }
    
    # Get v3 oAuth Token
    # oAuth URI
    $oAuthURI = "https://$($IdentityNowConfiguration.orgName).api.identitynow.com/oauth/token"
    $v3Token = Invoke-RestMethod -Method Post -Uri "$($oAuthURI)?grant_type=password&username=$($adminUSR)&password=$($adminPWD)" -Headers $Headersv3 
    $utime = [int][double]::Parse((Get-Date -UFormat %s))

    if ($v3Token.access_token) {
        try {
            if ($campaignID) {           
                $IDNCertCampaigns = Invoke-RestMethod -Method Get -Uri "https://$($IdentityNowConfiguration.orgName).api.identitynow.com/cc/api/campaign/getCertifications?_dc=$($utime)&campaignId=$campaignID" -Headers @{Authorization = "$($v3Token.token_type) $($v3Token.access_token)" }            
                return $IDNCertCampaigns.items
            } else {
                $IDNCertCampaigns = Invoke-RestMethod -Method Get -Uri "https://$($IdentityNowConfiguration.orgName).api.identitynow.com/cc/api/campaign/list?_dc=$($utime)&completedOnly=$($completed)&start=0&limit=$($limit)" -Headers @{Authorization = "$($v3Token.token_type) $($v3Token.access_token)" }            
                return $IDNCertCampaigns.items
            }               
        }
        catch {
            Write-Error "Failed to retrieve Certifcation Campaigns. $($_)" 
        }
    } else {
        Write-Error "Authentication Failed. Check your AdminCredential and v3 API ClientID and ClientSecret. $($_)"
        return $v3Token
    }
}
