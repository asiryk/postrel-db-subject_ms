## How to Run the Application

Build an image

```shell
docker-compose build .
```

Create and start the container in detached mode


```shell
docker-compose up -d
```

Open InterSystems IRIS terminal

```shell
$ docker-compose exec iris iris session iris
USER>zn "IRISAPP"
IRISAPP>do ^l5.Execute
```

To exit the session

```shell
USER>HALT
# or simply
USER>H
```

## How to start coding

Right-click on **docker-compose.yml** file and click Compose Restart

Click on ObjectScript extension, select namespace, login to it

NAMESPACE: IRISAPP

USERNAME: _SYSTEM

PASSWORD: SYS

## Check classes

Go to [management portal](http://localhost:52773/csp/sys/exp/UtilExpGlobalView.csp)
-> Select correct namespace -> Globals -> View Global Data


> Link to the template: [objectscript-docker-template](https://github.com/intersystems-community/objectscript-docker-template)
