!/bin/bash
#
# This script creates a new user on the local system.
# You will be prompted to enter the username (login), the person name, and a password.
# The username, password, and host for the account will be displayed.

# Make sure the script is being executed with superuser privileges.
if [[ ${UID} -ne 0 ]]
then
     echo "Please run this script with sudo or root"
     exit 1
fi


# Get the username (login).
read -p "Enter the username to create: " USER_NAME

# Get the real name (contents for the description field).

read -p "Enter the person Role (Title Devops Engineer, Backend Engineer etc.): " COMMENT


# Get the password.

read -sp "Enter the passsword:    " PASSWORD


# Create the account.

useradd -m -c "${COMMENT}" -p $(echo $PASSWORD | openssl passwd -6 -stdin) ${USER_NAME}



# Check to see if the useradd command succeeded.
# We don't want to tell the user that an account was created when it hasn't been.

if [[ "${?}" -eq 0 ]]
then
    echo -e "\nThis username and password have been succesfully created"
    echo  "Here : $(tail -1 /etc/passwd)"
else
    echo "This username is already exists. Please select different username"
    exit 1
fi


# Set the password.


# Check to see if the passwd command succeeded.



# Force password change on first login.

passwd -e ${USER_NAME}


# Display the username, password, and the host where the user was created.

echo
echo "Username"
echo ${USER_NAME}

echo
echo "Password"
echo ${PASSWORD}

# Windows kullanicilari icin asagidaki yama kod terminalde calistirilmali. Ya da \n ifadesi kullanilmamali scriptte.!!!
# sed -i 's/\r$//' user_passwd.sh ; chmod +x user_passwd.sh