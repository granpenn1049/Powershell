#Arrays
param (
    [String]$Filepath,
    [String]$SortOrder = "Ascending" -or "Descending",
    [String]$DataType = "Numeric" -or "Alpha" -or "Both"
)

$FileContent = Get-Content "$Filepath"
$ContentArray = $FileContent.split(",")
$IntArray = $ContentArray -match "^[\d\.+\d]+$"
$StringArrary = $ContentArray -match "^[A-Z]+$"

#Numeric, Alpha, or Both -Ascending
if(($DataType -eq "Numeric") -and ($SortOrder -eq "Ascending")) {
    $IntArray | Sort-Object
    break
}
elseif(($DataType -eq "Alpha") -and ($SortOrder -eq "Ascending")) {
    $StringArray | Sort-Object
}
elseif(($DataType -eq "Both") -and ($SortOrder -eq "Ascending")) {
    $IntArray+$StringArrary | Sort-Object
}
else {
    Write-Error 'Must pass in $Filepath, $SortOrder ("Ascending" or "Descending"), and $DataType ("Numeric", "Alpha", or "Both")'
}

#Numeric, Alpha, or Both -Descending
if(($DataType -eq "Numeric") -and ($SortOrder -eq "Descending")) {
    $IntArray | Sort-Object -Descending
}
elseif(($DataType -eq "Alpha") -and ($SortOrder -eq "Descending")) {
    $StringArray | Sort-Object -Descending
}
elseif(($DataType -eq "Both") -and ($SortOrder -eq "Descending")) {
    $IntArray+$StringArrary | Sort-Object -Descending
}
else {
    Write-Error 'Must pass in $Filepath, $SortOrder ("Ascending" or "Descending"), and $DataType ("Numeric", "Alpha", or "Both")'
}