#Arrays
param (
    [String]$Filepath,
    [String]$SortOrder = "Ascending" -or "Descending",
    [String]$DataType = "Numeric" -or "Alpha" -or "Both"
)

#Script Variables
$FileContent = Get-Content "$Filepath"
$ContentArray = $FileContent.split(",")
[decimal[]]$IntArray = $ContentArray -match "^[\d\.+\d]+$"
$AlphaArray = $ContentArray -match "^[A-Z]+$"
[decimal[]]$exponentStrings = $ContentArray | Where-Object { $_ -match '^\d+e[+-]?\d+$' }
[decimal[]]$NumericArray = $IntArray+$exponentStrings

#Numeric, Alpha, or Both -and Ascending vs. Descending
if (($DataType -match "Numeric") -and ($SortOrder -match "Ascending")) {
    $NumericArray | Sort-Object
}
elseif (($DataType -match "Alpha") -and ($SortOrder -match "Ascending")) {
    $AlphaArray | Sort-Object
}
elseif (($DataType -match "Both") -and ($SortOrder -match "Ascending")) {
    $NumericArray | Sort-Object
    $AlphaArray | Sort-Object
}
elseif (($DataType -match "Numeric") -and ($SortOrder -match "Descending")) {
    $NumericArray | Sort-Object -Descending
}
elseif (($DataType -match "Alpha") -and ($SortOrder -match "Descending")) {
    $AlphaArray | Sort-Object -Descending
}
elseif (($DataType -match "Both") -and ($SortOrder -match "Descending")) {
    $NumericArray | Sort-Object -Descending
    $AlphaArray | Sort-Object -Descending
}
else {
    Write-Error 'Must pass in $Filepath (filepath of .txt file), $SortOrder ("Ascending" or "Descending"), and $DataType ("Numeric", "Alpha", or "Both")'
}