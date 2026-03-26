# Create groups --loop
while IFS=, read -r groupname description; do
    sudo dseditgroup -o create "$groupname"
done < groups.csv

# Add users to groups --loop
while IFS=, read -r username fullname group password; do
    sudo dseditgroup -o edit -a "$username" "$group"
done < users.csv

# Create the folders and set permissions
sudo mkdir -p /Projects /Public
sudo chgrp Developers /Projects
sudo chmod 770 /Projects        # Owner:(r+w+x); Group:(r+w+x); Others: No access
sudo chgrp Guests /Public
sudo chmod 755 /Public          # Owner:(r+w+x); Group:(r+x); Others:(r+x)
