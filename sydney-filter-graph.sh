echo "Installation Gephi-Filter"
git clone https://github.com/ukiyo-e/SydneyJenkins.git

echo "Cd target forlder"
cd SydneyJenkins/src/main/resources

echo "Download Sydney Graphml file"
aws s3 --region us-west-2 cp "s3://graphml.rd-switchboard/sydney/sydney.zip" .
#sudo curl "https://s3-us-west-2.amazonaws.com/graphml.rd-switchboard/sydney/sydney.zip"
sudo unzip sydney.zip

echo "Excute Java"
cd ..
cd ..
cd ..
mvn clean install
mvn clean package

echo "Copy files to S3..."
NOW="$(date +'%Y-%m-%d')"
aws s3 --region us-west-2 output.gexf s3://graphml.rd-switchboard/sydney/filtergraph/$NOW/
