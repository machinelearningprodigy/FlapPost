SOLID Principles













## POWERSHELL
# Loop through untracked files and commit each separately
git ls-files --others --exclude-standard | ForEach-Object {
    git add $_
    git commit -m "Added $_"
}
git push -u -f origin main

































### GITBASH
for file in $(git ls-files --others --exclude-standard); do 
    git add "$file" 
    git commit -m "Added $(basename "$file")"
done
git push -u -f origin main




































### THE BEST TILL NOW IN GITBASH
# Arrays of random messages for new files
ADD_MESSAGES=(
    "Added"
    "Adding this file"
    "New file added"
    "Adding file"
    "Including new file"
    "Introducing new file"
    "New addition"
    "Fresh file added"
)

# Arrays of random messages for updated files
UPDATE_MESSAGES=(
    "Updated"
    "Updating"
    "Changes applied"
    "Updates done"
    "Modified"
    "Refreshed"
    "Changes implemented"
    "Revision complete"
)

# Function to get random message from array
get_random_message() {
    local arr=("$@")
    local len=${#arr[@]}
    local random_index=$((RANDOM % len))
    echo "${arr[random_index]}"
}

# Handle new files
for file in $(git ls-files --others --exclude-standard); do 
    filename=$(basename "$file")
    git add "$file"
    random_msg=$(get_random_message "${ADD_MESSAGES[@]}")
    git commit -m "$random_msg: $filename"
done

# Handle modified files
for file in $(git ls-files -m); do
    filename=$(basename "$file")
    git add "$file"
    random_msg=$(get_random_message "${UPDATE_MESSAGES[@]}")
    git commit -m "$random_msg: $filename"
done

# Push all changes
git push -u -f origin main

























### GITBASH UPDATED
#!/bin/bash

# Get list of untracked files
files=$(git ls-files --others --exclude-standard)

# Check if there are any untracked files
if [[ -z "$files" ]]; then
    echo "No new untracked files to commit."
    exit 0
fi

# Loop through each file and commit individually
for file in $files; do 
    git add "$file" 
    echo "Added: $file"
    git commit -m "Added $(basename "$file")"
done

# Push changes
echo "Pushing changes to remote repository..."
git push -u origin main


<!-- Making chnges in notes -->
##adding new lines in the notes 
