echo "Installation Gephi-Filter"
git clone https://github.com/ukiyo-e/SydneyJenkins.git

echo "Cd target forlder"
cd SydneyJenkins/src/main

echo "Download Sydney Graphml file"
aws s3 --region us-west-2 cp "s3://raphml.rd-switchboard/sydney/sydney.zip" .
#sudo curl "https://s3-us-west-2.amazonaws.com/graphml.rd-switchboard/sydney/sydney.zip"
sudo unzip sydney.zip

echo "Excute Java"
javac Main.java java Main

echo "Copy files to S3..."
NOW="$(date +'%Y-%m-%d')"
aws s3 --region us-west-2 ../test2.gexf s3://graphml.rd-switchboard/sydney/filtergraph/$NOW/
