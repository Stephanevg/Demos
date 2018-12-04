$filePath = "$home\OutputData.xml"
$coverageFile = "C:\Users\taavast3\OneDrive\Repo\Projects\OpenSource\Demos\Introduction To Pester\Examples\coverage.ps1"
invoke-pester "C:\Users\taavast3\OneDrive\Repo\Projects\OpenSource\Demos\Introduction To Pester\Examples\Demo06.ps1" -CodeCoverage $coverageFile
