# Spring boot cloud template

sb-service-template

Spring boot Cloud template: keycloak, gateway, etc... 


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
                   |  Gateway  +----------+------------| Gateway  |          |------- | OAuth2 Server |  
                   +-----------+                       +----------+          |        |   Keycloak    |  
     +-------+         jwt                                  jwt              |        +---------------+  
     | Redis |----------|------------------------------------|----------------                           
     +-------+          |                                                                                
                        |                                                                                
                        |                    +------------+                                              
+---------------+       |------------------- | Service-A  |                                              
| Configuration |-------|                    +------------+                                              
|   Service     |       |                                                                                
+---------------+       |                    +------------+                                              
                        |------------------- | Service-B  |                                              
                        |                    +------------+                                              
                        |                                                                                
                        |                    +------------+         +----------+          +-------------+
                        |--------------------| Service-C  |---------|  Queue   |----------|  Service-Q  |
                                             +------------+         | rabbitMq |          |   Queue     |
                                                                    +----------+          |  Consumer   |
                                                                                          +-------------+
                                                                                                         

```

