# IaC-docker-puppet

## How to Start

```
docker-compose up -d
```

## Components
| SW           | VERSION | 
| ------------ | ------- |
| puppetserver | 7.7     |          
| puppetdb     | 7.10    |           
| postgres     | 12.6    |
| puppetboard  | 3.2     |


## Access to puppetboard
```
http://${ServerIp}:9090/
```
※404 error if node is not assigned [URL](https://github.com/voxpupuli/puppetboard/issues/515)

## Ca create (puppet-agent)
```
/opt/puppetlabs/bin/puppet agent --ca_server=${PUPPET_SERVER}
```

## Ca sing (puppetserver)
```
docker exec -it puppetserver bash
puppetserver ca sign --certname ${add host}
```

# Setting r10k
The module is imported using r10k.Configuration files can be found below.
```
./puppetserver/r10k/r10k.yaml
./puppetserver/r10k/github-token
```
