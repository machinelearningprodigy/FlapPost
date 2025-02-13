SOLID Principles


## Powershell
# Loop through untracked files and commit each separately
git ls-files --others --exclude-standard | ForEach-Object {
    git add $_
    git commit -m "Added $_"
}

# Force push to GitHub
git push -u -f origin main



### GitBash
for file in $(git ls-files --others --exclude-standard); do 
    git add "$file" 
    git commit -m "Added $(basename "$file")"
done
git push -u -f origin main

