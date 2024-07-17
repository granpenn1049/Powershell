#Arrays
$FileContent = Get-Content "C:\Users\penne\OneDrive\Documents\Powershell\PowershellAssignment\Samples\Sample3.txt"
$ContentArray = $FileContent.split(",")
$IntArray = $ContentArray -match "^[\d\.+\d]+$"
$StringArrary = $ContentArray -match "^[A-Z]+$"

$IntArray
$StringArrary

$IntDataType = $IntArray | ForEach-Object {$_.GetType()}
$IntDataType

$StringDataType = $StringArrary | ForEach-Object {$_.GetType()}
$StringDataType