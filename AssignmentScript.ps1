$FileContent = Get-Content "C:\Users\penne\OneDrive\Documents\Powershell\PowershellAssignment\Samples\Sample2.txt"
$ContentArray = $FileContent.split(",")

$IntArray = Return $ContentArray -match "^[\d\.]+$"
Write-Host $IntArray