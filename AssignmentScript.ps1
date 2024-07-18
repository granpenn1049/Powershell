#Arrays
param (
    [String]$Filepath,
    [String]$SortOrder = "Ascending" -or "Descending",
    [String]$DataType = "Numeric" -or "Alpha" -or "Both"
)

#Script Variables
$FileContent = Get-Content "$Filepath"
$ContentArray = $FileContent.split(",")
$NumericArray = $ContentArray -match "^[\d\.+\d]+$"
$AlphaArray = $ContentArray -match "^[A-Z]+$"

#Numeric, Alpha, or Both -Ascending
if(($DataType -eq "Numeric") -and ($SortOrder -eq "Ascending")) {
    $NumericArray | Sort-Object
    break
}
elseif(($DataType -eq "Alpha") -and ($SortOrder -eq "Ascending")) {
    $AlphaArray | Sort-Object
}
elseif(($DataType -eq "Both") -and ($SortOrder -eq "Ascending")) {
    $NumericArray+$AlphaArray | Sort-Object
}
else {
    Write-Error 'Must pass in $Filepath, $SortOrder ("Ascending" or "Descending"), and $DataType ("Numeric", "Alpha", or "Both")'
}

#Numeric, Alpha, or Both -Descending
if(($DataType -eq "Numeric") -and ($SortOrder -eq "Descending")) {
    $NumericArray | Sort-Object -Descending
}
elseif(($DataType -eq "Alpha") -and ($SortOrder -eq "Descending")) {
    $AlphaArray | Sort-Object -Descending
}
elseif(($DataType -eq "Both") -and ($SortOrder -eq "Descending")) {
    $NumericArray+$AlphaArray | Sort-Object -Descending
}
else {
    Write-Error 'Must pass in $Filepath, $SortOrder ("Ascending" or "Descending"), and $DataType ("Numeric", "Alpha", or "Both")'
}