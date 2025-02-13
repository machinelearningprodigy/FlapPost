# Array of random messages for new files
$ADD_MESSAGES = @(
    "Added",
    "Adding this file",
    "New file added",
    "Adding file",
    "Including new file",
    "Introducing new file",
    "New addition",
    "Fresh file added"
)

# Array of random messages for updated files
$UPDATE_MESSAGES = @(
    "Updated",
    "Updating",
    "Changes applied",
    "Updates done",
    "Modified",
    "Refreshed",
    "Changes implemented",
    "Revision complete"
)

# Check if we're in a git repository
if (-not (Test-Path .git)) {
    Write-Host "Error: Not a git repository" -ForegroundColor Red
    exit 1
}

# Function to get random message from array
function Get-RandomMessage {
    param([string[]]$messages)
    return $messages | Get-Random
}

# Handle new files
$newFiles = git ls-files --others --exclude-standard
if ($newFiles) {
    foreach ($file in $newFiles) {
        $filename = Split-Path $file -Leaf
        git add $file
        $randomMsg = Get-RandomMessage -messages $ADD_MESSAGES
        git commit -m "$randomMsg`: $filename"
        Write-Host "Committed new file: $filename" -ForegroundColor Green
    }
}

# Handle modified files
$modifiedFiles = git ls-files -m
if ($modifiedFiles) {
    foreach ($file in $modifiedFiles) {
        $filename = Split-Path $file -Leaf
        git add $file
        $randomMsg = Get-RandomMessage -messages $UPDATE_MESSAGES
        git commit -m "$randomMsg`: $filename"
        Write-Host "Committed modified file: $filename" -ForegroundColor Yellow
    }
}

# Push all changes
if (git remote | Select-String -Pattern "origin") {
    Write-Host "Pushing changes to origin..." -ForegroundColor Cyan
    git push -u -f origin main
}
else {
    Write-Host "No remote 'origin' found. Skipping push." -ForegroundColor Yellow
}

Write-Host "Script completed successfully!" -ForegroundColor Green
pause