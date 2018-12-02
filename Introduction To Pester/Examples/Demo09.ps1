$filePath = "$home\OutputData.xml"
invoke-pester "C:\Users\taavast3\OneDrive\Repo\Projects\OpenSource\Demos\Introduction To Pester\Examples\Demo06.ps1" -OutputFile $filePath
start $filePath