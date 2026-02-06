import os
import random
import re

# Directory containing the files (use "." for current directory)
directory = "."

pattern = re.compile(r'^(.+)\.(jpg|jpeg|png)$', re.IGNORECASE)

for filename in os.listdir(directory):
    match = pattern.match(filename)
    if match:
        prefix = f"{random.randint(0, 99):02d}"
        new_name = f"{prefix}-{filename}"

        old_path = os.path.join(directory, filename)
        new_path = os.path.join(directory, new_name)

        # Avoid overwriting existing files
        if not os.path.exists(new_path):
            os.rename(old_path, new_path)
            print(f"Renamed: {filename} → {new_name}")
        else:
            print(f"Skipped (already exists): {new_name}")

