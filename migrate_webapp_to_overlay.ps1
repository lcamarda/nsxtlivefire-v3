Connect-VIServer vcsa-01a -username administrator@vsphere.local -Password VMware1!


get-vm web* | Get-NetworkAdapter | Set-NetworkAdapter -Portgroup OV-WEB -Confirm:$false
get-vm lb* | Get-NetworkAdapter |  Set-NetworkAdapter -Portgroup OV-WEB -Confirm:$false
get-vm app* | Get-NetworkAdapter  |  Set-NetworkAdapter -Portgroup OV-APP -Confirm:$false
get-vm db*  | Get-NetworkAdapter  |  Set-NetworkAdapter -Portgroup OV-DB -Confirm:$false


