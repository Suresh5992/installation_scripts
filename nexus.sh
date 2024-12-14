#first root user 

sudo su - 

apt-get update -y
echo "Install Java"
apt-get install openjdk-8-jdk -y
java -version

echo "Install Nexus"
useradd -M -d /opt/nexus -s /bin/bash -r nexus
echo "nexus ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/nexus


mkdir /opt/nexus
wget https://sonatype-download.global.ssl.fastly.net/repository/downloads-prod-group/3/nexus-3.29.2-02-unix.tar.gz


tar xzf nexus-3.29.2-02-unix.tar.gz -C /opt/nexus --strip-components=1


chown -R nexus:nexus /opt/nexus


#before this when ever you see ../sonarqube change into ./sonarqube  4 times you should do it (most important)
nano /opt/nexus/bin/nexus.vmoptions

#now you have to cnfigure the user mapped 
nano /opt/nexus/bin/nexus.rc
#uncommand : run_as_user="nexus"

#we have to start the nexus server 
sudo -u nexus /opt/nexus/bin/nexus start

# Display shows [ Starting Nexus ]

# to view ip: 8081 port Defult 

# till Here is Sufficient
# if you have any Dought 
#youtube link :  https://www.youtube.com/watch?v=8KZi7KBpk0I&t=3s
time : 39-41 min 


_____________________________________________________________________________________
```
https://www.howtoforge.com/how-to-install-and-configure-nexus-repository-manager-on-ubuntu-20-04/
```


```
docker run -d -p 8081:8081 --name nexus sonatype/nexus3
```
