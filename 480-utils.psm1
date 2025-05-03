function 480Banner()
{
    Write-Host "Hello SYS480-Devops"
}

function 480Connect([string] $server)
{
    $conn = $global:DefaultVIServer
    #connected?
    if ($conn){
      $msg = "You are already connected to: {0}" -f $conn

      Write-Host -ForeGroundColor Green $msg

    }
    else{
        $conn=Connect-VIServer -Server $server
    }
}

function Get-480Config([string] $config_path){
    Write-Host "Reading" $sconfig_path
    $conf=$null
    if(Test-Path $config_path){
        $conf = (Get-Content -Raw -Path $config_path | ConvertFrom-Json)
    }
    else{
        Write-Host -ForegroundColor "yellow" "No configuration found"
    }
    return $conf
}

function Select-VM([string] $folder)
{

    $selected_vm = $null
    try
    {

        $vms = Get-VM -Location $folder
        $index = 1
        foreach($vm in $vms)
        {
            Write-Host [$index] $vm.name
            $index = 1
        }
        $pick_index = Read-Host "Which Index Number [x] do you wish to pick?"
        $selected_vm = $vms[$pick_index -1]
        Write-Host "You Picked  " $selected_vm.name
        return $selected_vm
    }
    catch
    {
        Write-Host "Invalid Folder: $folder" -ForegroundColor "Red"

    }
}
