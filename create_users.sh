#!/bin/bash
while IFS=, read -r username fullname group password; do
    sudo sysadminctl -addUser "$username" -fullName "$fullname" -password "$password"
done < users.csv
