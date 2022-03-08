# Spring boot cloud template 

### This is still work in progress ...


Spring boot Cloud template: keycloak, gateway, etc... 

This setup is intended for local development.


### Here is a diagram of the template layout

```
                                        +----------+                                                        
                                        |  Client  |                                                        
                                        +----------+                                                        
                                             |                                                              
                                      cookie session                                                        
                                             |
                                       +-----------+         +---------------+  
                                       |  Gateway  + ------- |  Auth Server  |  
                                       +-----------+         +---------------+  
                                             |                       |
                                            jwt                      |                                             
+---------------+                            |                       |                           
|cache/key-value|----------------------------------------------------|                          
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
- create realm: "**sbService**"
- create a client: "**sb-service-edge**" , get **client secret** from keycloak and update edge application.yml
- create a couple of realm roles: **sbAdmin**, **sbUser1**, **sbUser2**
- create a couple of users: **sbadmin**, **sbuser1**, **sbuser2** and link to corresponding roles.


