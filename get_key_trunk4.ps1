Connect-VIServer vcsa-01b.corp.local -User Administrator@vsphere.local -Password VMware1! | out-null
$PG = Get-VDPortgroup -name trunk2
return $PG.key
