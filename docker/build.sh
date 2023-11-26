# Informing the user that the script is exporting requirements.txt
echo "Exporting requirements.txt..."
pipreqs --force ./ --encoding=utf-8
echo 

# Informing the user about the removal of torch related packages
echo "Removing torch related packages from requirements.txt..."
grep -v -i "torch" requirements.txt > requirements.txt.tmp
mv requirements.txt.tmp requirements.txt
echo "Torch related packages removed."
echo

# Prompting the user to enter a number for the Docker build
echo "Please enter the number of your team:"
read number

# Informing the user that Docker build is starting
echo "Building Docker image named sub${number}..."
docker build -t sub${number} .

echo "Docker build completed."
echo
