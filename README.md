# BIND9 In a Docker Container
The idea here is to provide via a volume a directory that contains your bind config

The /etc/bind directory should contain all your configuration and zone information
ie:
    
    ├── named.conf
	├── named.conf.log
	└── zones
    	├── hint
    	│   └── bind.root
    	├── master
    	│   └── db.example.com.hosts
    	└── zones.conf.all

You simply need to run the container with the following command:
    
    docker run -d -v /bind_data/:/etc/bind -p 53:53 -p 53:53/udp --name bind9_dns hunty1/bind9-docker
    
The above command assumes that you have your bind configuration data stored in /bind_data
on your docker host



