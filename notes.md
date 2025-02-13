SOLID Principles


## POWERSHELL
# Loop through untracked files and commit each separately
git ls-files --others --exclude-standard | ForEach-Object {
    git add $_
    git commit -m "Added $_"
}

# Force push to GitHub
git push -u -f origin main



### GITBASH
for file in $(git ls-files --others --exclude-standard); do 
    git add "$file" 
    git commit -m "Added $(basename "$file")"
done
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
