echo "Installation Gephi-Filter"
git clone https://github.com/ukiyo-e/SydneyJenkins.git

echo "Cd target forlder"
cd SydneyJenkins/src/

echo "Download Sydney Graphml file"
aws s3 --region us-west-2 cp "s3://graphml.rd-switchboard/sydney/sydney.zip"
sudo unzip sydney.zip -d lib 

echo "Excute Java"
javacc HeadlessSimple.java

echo "Copy files to S3..."
NOW="$(date +'%Y-%m-%d')"
aws s3 --region us-west-2 ../test2.gexf s3://graphml.rd-switchboard/sydney/filtergraph/$NOW/
