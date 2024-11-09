# PGAdmin

PGAdmin is a web based interface for postgresql. I use it to make sure I don't have to 
have dbeaver or something similar installed to check on the database.

Install into the `postgresql` namespace. Use the normal helm chart.

## Default Values

The chart takes in the password in the environment. Because I am lazy I set a default
password in plaintext. Due to this both being an internal facing service only,
as well as being able to change it quickly, I have opted to leave it as such. 
Just go in and change the password after you login.
