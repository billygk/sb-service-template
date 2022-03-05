# Spring boot cloud template 

### This is still work in progress ...


Spring boot Cloud template: keycloak, gateway, etc... 

This setup is intended for local development.


### Here is a diagram of the template layout

```
                                        +----------+                                                        
                                        | Internet |                                                        
                                        +----------+                                                        
                                             |                                                              
                                             |                                                              
                                       cookie session                                                       
                                             |                                                              
                                        +----------+                                                        
                                        |   LB     |                                                        
                                        +----------+                                                        
                                             |                                                              
                                      cookie session                                                        
                      +-----------+          |            +----------+                   +---------------+  
                      |  Gateway  +----------+------------| Gateway  |          |------- |  Auth Server  |  
                      +-----------+                       +----------+          |        +---------------+  
+---------------+         jwt                                  jwt              |                           
|cache/key-value|----------|------------------------------------|----------------                           
+---------------+          |                                                                                
                           |                                                                                
                           |                    +------------+                                              
   +---------------+       |------------------- | Service-A  |                                              
   | Configuration |-------|                    +------------+                                              
   |   Service     |       |                                                                                
   +---------------+       |                    +------------+                                              
                           |------------------- | Service-B  |                                              
                           |                    +------------+                                              
    +------------+         |                                                                                
    |  Database  |         |                    +------------+         +----------+          +-------------+
    |   Server   | --------|--------------------| Service-C  |---------|  Queue   |----------|  Service-Q  |
    +------------+                              +------------+         |  Server  |          |   Queue     |
                                                                       +----------+          |  Consumer   |
                                                                                             +-------------+
            -                                                                                               
                                                                                                            
                                                                                                            
                                                                                                            
                                                                                                                                                                                                       
```


### Backing services

- cache/key-value: Redis
- database server: (Mysql)
- Queue: rabbitMq
- Auth Server: Keycloak


We will be using docker to generate our backing services 

```
$ cd backing-services
$ docker-compose [build|start]
```

If all goes well we should have all our backing services up and running. 

We only need to setup our keycloak server, we need to:
- create realm
- create a client
- create a couple of roles
- create a couple of users

