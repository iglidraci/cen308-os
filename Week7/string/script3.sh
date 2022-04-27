read -p "Enter your name: " name
read -p "enter your surname: " surname
domain="@epoka.edu.al"
year=`date +"%y"`
email=${name:0:1}${surname}${year}${domain}
echo "your email is ${email,,}"