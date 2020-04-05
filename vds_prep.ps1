Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false
Set-PowerCLIConfiguration -DefaultVIServerMode Multiple  -Confirm:$false

Connect-VIServer vcsa-01a.corp.local -User Administrator@vsphere.local -Password VMware1!
Connect-VIServer vcsa-01b.corp.local -User Administrator@vsphere.local -Password VMware1!

if ( -not (Get-VDPortgroup -name trunk1) ) {

Get-VDSwitch -Name SiteA-vDS-01 | Set-VDSwitch -Mtu 1700
Get-VDSwitch -Name SiteA-vDS-02 | Set-VDSwitch -Mtu 1700

$myVDSwitch = Get-VDSwitch -name SiteA-vDS-02

$routedLink1 = New-VDPortGroup -Name trunk1  -VDSwitch $myVDSwitch -VlanTrunkRange 0-4000
$routedLink2 = New-VDPortGroup -Name trunk2  -VDSwitch $myVDSwitch -VlanTrunkRange 0-4000

$routedLink1 | Get-VDUplinkTeamingPolicy | Set-VDUplinkTeamingPolicy -ActiveUplinkPort "Uplink 1" -StandbyUplinkPort "Uplink 2"
$routedLink2 | Get-VDUplinkTeamingPolicy | Set-VDUplinkTeamingPolicy -ActiveUplinkPort "Uplink 2" -StandbyUplinkPort "Uplink 1"




Get-VDSwitch -Name SiteB-vDS-01 | Set-VDSwitch -Mtu 1700


$myVDSwitchB = Get-VDSwitch -name SiteB-vDS-01

$routedLink1B = New-VDPortGroup -Name trunk1  -VDSwitch $myVDSwitchB -VlanTrunkRange 0-4000
$routedLink2B = New-VDPortGroup -Name trunk2  -VDSwitch $myVDSwitchB -VlanTrunkRange 0-4000

$routedLink1B | Get-VDUplinkTeamingPolicy | Set-VDUplinkTeamingPolicy -ActiveUplinkPort "Uplink 1" -StandbyUplinkPort "Uplink 2"
$routedLink2B | Get-VDUplinkTeamingPolicy | Set-VDUplinkTeamingPolicy -ActiveUplinkPort "Uplink 2" -StandbyUplinkPort "Uplink 1"


}

