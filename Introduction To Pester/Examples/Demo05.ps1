
    Function Export-BiosData {
        [CmdletBinding()]
        param (
            [ValidateSet("Json","CSV")]
            [String]$Format,
            [Switch]$ExportData,
            $ExportFolder = "$home"
        )
            
            
        $Data = Get-WmiObject win32_bios
        Switch($Format){
            "json"{
                $cov = $Data | ConvertTo-Json
                $Extension = ".json"
                Break;
            }
            "Csv"{
                $cov = $Data | ConvertTo-Csv -NoTypeInformation
                $Extension = ".csv"
            }
            default{
                Throw "Error: Format $($Format) is not defined"
            }
        }
        
        If(!(test-Path $Exportfolder)){
            $null = Mkdir  $ExportFolder
        }
        $FilePath = Join-Path -Path $ExportFolder -ChildPath ("BiosData" + $Extension)
        $cov | Out-File -FilePath $FilePath -Force
        $return = Get-Item $FilePath
        
        return $return
        
    }
    


 Describe "Testing Export-BiosData"{
    It "[Format:csv]Should export data to csv file"{
        Export-BiosData -Format CSV -ExportFolder $TestDrive
        $File = Get-Item "$Testdrive\BiosData.csv"
        $File | should exist

    }
    It "[Format:Json]Should export data to Json file"{
        Export-BiosData -Format Json -ExportFolder $TestDrive
        $File = Get-Item "$TestDrive\BiosData.Json"
        $File | should exist
        
    }
}