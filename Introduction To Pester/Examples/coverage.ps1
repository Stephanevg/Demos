
Function Get-NextADComputerName {
    #Does stuff with AD module
    Get-ADComputer
    #Returns computername format: CMP00003
}

Function New-StagingEntry {
    [CmdletBinding()]
    Param(

    )

    $ComputerName = Get-NextADComputerName
    If($ComputerName){
        $return = "Staging-" + $ComputerName
    }else{
        throw "No computer object"
    }

    return $return
}
