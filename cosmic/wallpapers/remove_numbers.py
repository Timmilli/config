import os
import re

# Directory containing the files (use "." for current directory)
directory = "."

pattern = re.compile(r'^(\d{2})-(.+)\.(jpg|jpeg|png)$', re.IGNORECASE)

for filename in os.listdir(directory):
    match = pattern.match(filename)
    if match:
        new_name = f"{match.group(2)}.{match.group(3)}"
        old_path = os.path.join(directory, filename)
        new_path = os.path.join(directory, new_name)

        # Avoid overwriting existing files
        if not os.path.exists(new_path):
            os.rename(old_path, new_path)
            print(f"Renamed: {filename} → {new_name}")
        else:
            print(f"Skipped (already exists): {new_name}")

