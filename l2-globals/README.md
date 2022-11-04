## Bare VSCode, Docker, IRIS set up

> Password for _SYSTEM is SYS

### Boot docker container

Run `boot.sh`

The command without docker-compose: `docker run intersystems/iris-community:2021.2.0.651.0 --check-caps false`

### Start IRIS VM command line

Run `docker-compose exec iris iris session iris`

To exec class or routine:

``` objectscript
// Change namespace
zn "OSCRIPT"

// Run class method
d ##class(cls.ObjectScript.Example).HelloWorld()

// Run routine
do ^cls.ObjectScript.Routine
```
