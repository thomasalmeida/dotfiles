import json
import subprocess
import os

# Get the current user's home directory
home_dir = os.path.expanduser("~")

# Construct the file path dynamically
file_path = f"{home_dir}/dotfiles/VSCodium/User/extensions.json"

# Load data from the JSON file
with open(file_path, "r") as file:
    extensions = json.load(file)

# Iterate over each extension and install it using the codium command
for ext in extensions:
    ext_id = ext["identifier"]["id"]
    try:
        # Install the extension using the codium command
        subprocess.run(["codium", "--install-extension", ext_id], check=True)
        print(f"Installed extension: {ext_id}")
    except subprocess.CalledProcessError:
        print(f"Error installing extension: {ext_id}")

print("Finished.")
