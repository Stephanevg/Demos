
#Base test drive
Describe "Using TestDrive"{
    It "Should contain TestDrive"{
        $TestDrive | should not beNullOrEmpty
    }

    It "Should contain plop folder."{
        $Testfolder = Join-Path -Path $TestDrive -ChildPath "plop"
        $null = mkdir $Testfolder
        $TestFolder | should exist
    }
}

#Scopes

Describe "Using TestDrive"{
    It "Should contain TestDrive"{
        $TestDrive | should not beNullOrEmpty
    }

    It "Should contain plop folder"{
        $Testfolder = Join-Path -Path $TestDrive -ChildPath "plop"
        $TestFolder | should exist
    }
}

