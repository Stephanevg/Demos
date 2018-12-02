#Exercice 01

#Coca:
    #Create a test for a function called: Export-BiosData that exports BIOS information In the following formats:
        #CSV -> $Home\BiosData.csv
        #JSON -> $Home\BiosData.Json
    #the file must be located at: $Home\BiosData.Json or $Home\BiosData.csv

#Cola:
    #Create a function that export Bios data to either: 
        #CSV File -> $Home\BiosData.csv
        #or
        #Json File -> $Home\BiosData.Json

#Tip use a parameter called 'format'

#Solution

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
            Export-BiosData -Format CSV
            $File = Get-Item "$Home\BiosData.csv"
            $File | should exist

        }
        It "[Format:Json]Should export data to Json file"{
            Export-BiosData -Format Json
            $File = Get-Item "$Home\BiosData.Json"
            $File | should exist
            
        }
    }

