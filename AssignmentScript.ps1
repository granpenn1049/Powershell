#Arrays
param (
    [String]$Filepath,
    [String]$SortOrder = "Ascending" -or "Descending",
    [String]$DataType = "Numeric" -or "Alpha" -or "Both"
)

#Script Variables
$FileContent = Get-Content "$Filepath"
$ContentArray = $FileContent.split(",")
[int[]]$NumericArray = $ContentArray -match "^[\d\.+\d]+$"
$AlphaArray = $ContentArray -match "^[A-Z]+$"

#Numeric, Alpha, or Both -and Ascending vs. Descending
if (($DataType -match "Numeric") -and ($SortOrder -match "Ascending")) {
    $NumericArray | Sort-Object
}
elseif (($DataType -match "Alpha") -and ($SortOrder -match "Ascending")) {
    $AlphaArray | Sort-Object
}
elseif (($DataType -match "Both") -and ($SortOrder -match "Ascending")) {
    $NumericArray + $AlphaArray | Sort-Object
}
elseif (($DataType -match "Numeric") -and ($SortOrder -match "Descending")) {
    $NumericArray | Sort-Object -Descending
}
elseif (($DataType -match "Alpha") -and ($SortOrder -match "Descending")) {
    $AlphaArray | Sort-Object -Descending
}
elseif (($DataType -match "Both") -and ($SortOrder -match "Descending")) {
    $NumericArray + $AlphaArray | Sort-Object -Descending
}
else {
    Write-Error 'Must pass in $Filepath (filepath of .txt file), $SortOrder ("Ascending" or "Descending"), and $DataType ("Numeric", "Alpha", or "Both")'
}