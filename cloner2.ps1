$vm = Get-VM -Name 480-Firewall

$snapshot = Get-Snapshot -VM $vm -Name "Snapshot 1 - Base"

$vmhost = Get-VMHost -Name "192.168.3.208"

$ds = Get-DataStore -Name "datastore2-super8"

$linkedClone = '{0}.linked' -f $vm.name

$linkedvm = New-VM -LinkedClone -Name $linkedClone -VM $vm -ReferenceSnapshot $snapshot -VMHost $vmhost -Datastore $ds


$newvm = New-VM -Name "vyos.base" -VM $linkedvm -VMHost $vmhost -DataStore $ds

$newvm | New-Snapshot -Name "Base"

$linkedvm | Remove-VM
