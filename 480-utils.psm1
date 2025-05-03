function 480Banner()
{
    Write-Host "Hello SYS480-Devops"
}


(second rendition)

function 480Banner()
{
    Write-Host "Hello SYS480-Devops"
}

function 480Connect([string] $server)
{
    $conn = $global:DefaultVIServer
    #connected?
    if [$conn]{
      $msg = "You are already connected to: {0}" -f $conn

      Write-Host -ForeGroundColor Green $msg

    }else
    {
        $conn = Connect-VIServer -Server $server
    }
}
