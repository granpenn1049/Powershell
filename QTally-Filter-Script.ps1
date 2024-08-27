# Define the path to the folder containing the CSV files
$csvFolderPath = "C:\Users\penne_jn6zlx9\OneDrive\Desktop\QTally - Unprocessed"
# Get all CSV files in the folder
$csvFiles = Get-ChildItem -Path $csvFolderPath -Filter *.csv

# Initialize total points for each category
$totals = @{"Filets" = 0; "Nuggets" = 0; "Strips" = 0; "Mac" = 0; "Spicy Filet" = 0}

# Process each CSV file
foreach ($file in $csvFiles) {
    $content = Get-Content -Path $file.FullName
    $currentCategory = ""

    foreach ($line in $content) {
        # Check for category headers and update the current category
        if ($line -match "^(Filets|Nuggets|Strips|Mac|Spicy Filet)") {
            $currentCategory = $matches[1]
            continue
        }

        # If current category is set, capture the point values for calculations
        if ($currentCategory -ne "") {
            # Match lines with points and capture the points
            if ($line -match "\d+(?:\s*\(\d+(?:\.\d+)?\s*Points\))?") {
                $points = [int]($matches[0].ToString().Split(" ")[0]) # Get only the numeric value before Points
                # Update the total points for the current category
                $totals[$currentCategory] += $points
            }
        }
    }
}

# Output the total points per category
$totals.GetEnumerator() | ForEach-Object {
    Write-Output "$($_.Key): $($_.Value) Points"
}