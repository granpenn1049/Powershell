#Script Parameters
param (
    [String]$Filepath,
    [String]$SortOrder = "Ascending" -or "Descending",
    [String]$DataType = "Numeric" -or "Alpha" -or "Both"
)

#Script Variables
$FileContent = Get-Content "$Filepath"
$FileContentArray = $FileContent.split(",")

#Numeric Array Varialbes
[Decimal[]]$IntArray = $FileContentArray -match "^[\d\.]+$"
[Decimal[]]$ExponentArray = $FileContentArray -match '^\d+e[+-]?\d+$'
[Decimal[]]$NumericArray = $IntArray + $ExponentArray

#Alphabetic Array Variables
[String[]]$LetterArray = $FileContentArray -match "^[A-Z]+$"
[String[]]$QuoteArray = $FileContentArray -match "'([^']*)'"
[String[]]$AlphaArray = $LetterArray + $QuoteArray

#Numeric, Alpha, or Both and Ascending vs. Descending Logic
if (($DataType -match "Numeric") -and ($SortOrder -match "Ascending")) {
    $Result = (($NumericArray | Sort-Object) -join ",")
}
elseif (($DataType -match "Alpha") -and ($SortOrder -match "Ascending")) {
    $Result = (($AlphaArray | Sort-Object) -join ",")
}
elseif (($DataType -match "Both") -and ($SortOrder -match "Ascending")) {
    $Result = (($NumericArray | Sort-Object) -join ",") + "," + (($AlphaArray | Sort-Object) -join ",")
}
elseif (($DataType -match "Numeric") -and ($SortOrder -match "Descending")) {
    $Result = (($NumericArray | Sort-Object -descending) -join ",")
}
elseif (($DataType -match "Alpha") -and ($SortOrder -match "Descending")) {
    $Result = (($AlphaArray | Sort-Object -descending) -join ",")
}
elseif (($DataType -match "Both") -and ($SortOrder -match "Descending")) {
    $Result = (($NumericArray | Sort-Object -descending) -join ",") + "," + (($AlphaArray | Sort-Object -Descending) -join ",")
}
else {
    Write-Error 'Must pass in the following parameters: $Filepath (Filepath of .txt file), $SortOrder ("Ascending" or "Descending"), and $DataType ("Numeric", "Alpha", or "Both")'
}

$FinalResult = '"' + $Result + '"'
$FinalResult
