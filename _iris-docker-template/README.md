## How to Run the Application

Open InterSystems IRIS terminal:

```shell
$ docker-compose exec iris iris session iris
USER>zn "IRISAPP"
IRISAPP>do ##class(package.HelloWorld).Hello()
```

## How to start coding

Right-click on **docker-compose.yml** file and click Compose Restart

Click on ObjectScript extension, select namespace, login to it

NAMESPACE: IRISAPP  
USERNAME: _SYSTEM  
PASSWORD: SYS  

> Link to the template: [objectscript-docker-template](https://github.com/intersystems-community/objectscript-docker-template)
