import requests
import os
import git
import time

# Set your DeepSeek API key
DEEPSEEK_API_KEY = "56-ghfqecvdvfhdfhdhcdf9b6f9ngh"
DEEPSEEK_API_URL = "https://api.deepseek.com/v1/chat/completions"

# Initialize Git repo
repo = git.Repo(".")

def get_commit_message(diff):
    """Generate a meaningful commit message using DeepSeek API."""
    headers = {
        "Authorization": f"Bearer {DEEPSEEK_API_KEY}",
        "Content-Type": "application/json"
    }
    data = {
        "model": "deepseek-chat",
        "messages": [
            {"role": "system", "content": "Generate a short, meaningful Git commit message for the given code changes."},
            {"role": "user", "content": diff}
        ]
    }

    response = requests.post(DEEPSEEK_API_URL, json=data, headers=headers)
    
    if response.status_code == 200:
        return response.json()["choices"][0]["message"]["content"].strip()
    else:
        print(f"Error: {response.json()}")
        return "Updated files"

def commit_and_push():
    """Automatically add, commit, and push changes with AI-generated commit messages."""
    while True:
        untracked_files = repo.untracked_files
        if untracked_files:
            for file in untracked_files:
                repo.git.add(file)
                diff = repo.git.diff("--staged")
                commit_msg = get_commit_message(diff) if diff else f"Added {file}"
                repo.git.commit("-m", commit_msg)
                print(f"Committed: {commit_msg}")

            # Push to GitHub
            repo.git.push("-u", "origin", "main", force=True)
            print("Changes pushed to the GitHub ✅")

        # Sleep for a while before checking again
        time.sleep(60)  # Run every 60 seconds

# Run the automation in the background
commit_and_push()
