
#Base test drive
Describe "Using TestDrive"{
    It "Should contain TestDrive"{
        $TestDrive | should not beNullOrEmpty
    }

    It "Should contain plop folder."{
        $Testfolder = Join-Path -Path $TestDrive -ChildPath "plop"
        $null = mkdir $Testfolder
        write-host (Get-Item $Testfolder).FullName
        $TestFolder | should exist
    }
}

#Scopes

Describe "Using TestDrive"{
    It "Should contain TestDrive"{
        $TestDrive | should not beNullOrEmpty
    }

    It "Should contain plop folder"{
        write-host (Get-Item $TestDrive).FullName
        $Testfolder = Join-Path -Path $TestDrive -ChildPath "plop"
        $TestFolder | should exist
    }
}

