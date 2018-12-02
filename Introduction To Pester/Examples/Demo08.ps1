

#Accessing the data
    $Results = invoke-pester .\Demo06.ps1 -PassThru -Show None

    
#Accessinng the data and displaying it
    Write-Host "A total tests of: " -NoNewline
    Write-host "$($Results.TotalCount) "  -NoNewline -ForegroundColor Blue 
    Write-Host "--> " -NoNewline
    Write-host "$($Results.PassedCount) "  -NoNewline -ForegroundColor Green 
    Write-Host "tests passed and " -NoNewline
    Write-host "$($Results.Failedcount) "  -NoNewline -ForegroundColor Red 
    Write-Host "test Failed! " -NoNewline
