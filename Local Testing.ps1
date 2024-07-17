$FileContent = Get-Content "C:\Users\penne\OneDrive\Documents\Powershell\PowershellAssignment\Samples\Sample2.txt"
$ContentArray = $FileContent.split(",")
$MixedArray = ForEach($number in $ContentArray) {
    try {
        [int]::parse($number)
    }
    Catch {
        Invoke-Expression -Command $number
    }
}
$ContentType = $ContentArray | ForEach-Object {$_.GetType()}
$ContentType
