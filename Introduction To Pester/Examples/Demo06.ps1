#Mocking

#Without Mocking
. "C:\Users\taavast3\OneDrive\Repo\Projects\OpenSource\Demos\Introduction To Pester\Examples\coverage.ps1"


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


Describe "Testing New-StagingEntry with mocking"{
    Mock -CommandName Get-NextADComputerName -MockWith {"CMP0003"}
    It "[Parameterless] Should not throw"{
        {New-StagingEntry} | should not throw
        
    }
    It "[Parameterless] Should return 'Staging-Computername'"{
        $d = New-StagingEntry
        $d | should Match 'Staging-CMP.*$' 
        
    }

    Assert-MockCalled -CommandName Get-NextADComputerName
}