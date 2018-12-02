#Create Basic test


#Test for 

function Get-Share {
    [CmdletBinding()]
    param (
        [Switch]$Hidden
    )
    $Shares = Get-WmiObject win32_share
   If($Hidden){
       $Return = $Shares | ? {$_.Name -Match '^.*\$$'}
   }else{
       $Return = $Shares
   }

   Return $Return

}

Get-Share

Get-Share -Hidden

#Tests:

#Test: It should work (Not throw)
#Test: .Name is of type String
#Test: -Hidden should return only Hidden shares


Describe "Testing Get-Share"{

    It "[ParameterLess]  it should not throw"{
        {Get-Share} | should Not Throw
    }

    It "[ParameterLess] it should return [String] type"{
        $s = Get-Share 
        $S.Name | should -BeOfType String
        
    }

    It "[-Hidden] It should return only hidden shares "{
        $Shares = Get-Share -Hidden 
        $Shares | ? {$_.Name -notmatch '.*\$$'} | should be $null
    }
}
