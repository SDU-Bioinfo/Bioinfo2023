# export requirements.txt
pipreqs --force ./ --encoding=utf-8

# removing torch related packages
grep -v -i "torch" requirements.txt > requirements.txt.tmp
mv requirements.txt.tmp requirements.txt

docker build -t submission .

