#Mocking

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

#Without Mocking

Describe "Testing New-StagingEntry"{
    It "[Parameterless] Should not throw"{
        {New-StagingEntry} | should not throw
        
    }
    It "[Parameterless] Should return 'Staging-Computername'"{
        $d = New-StagingEntry
        $d | should Match 'Staging-CMP.*$' 
        
    }
}



#With Mocking


Describe "Testing New-StagingEntry"{
    Mock -CommandName Get-NextADComputerName -MockWith {"CMP0003"}
    It "[Parameterless] Should not throw"{
        {New-StagingEntry} | should not throw
        
    }
    It "[Parameterless] Should return 'Staging-Computername'"{
        $d = New-StagingEntry
        $d | should Match 'Staging-CMP.*$' 
        
    }
}