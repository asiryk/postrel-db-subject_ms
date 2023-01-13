# ObjectScript language

## Namespaces and Databases

Data and code are stored in IRIS in databases, referred to by
namespaces.

Each IRIS application process runs in one namespace.

Process accesses data and code in databases referenced by that
namespace.

### Chose Namespace using ObjectScript REPL

```objectscipt
zn "Namespace" // Option 1

set $namespace = "Namespace" // Option 2
```

## Variables

ObjectScript doesn't require the variable to be declared.
The variable is created when it is assigned a value.
Type of the variable is defined by its usage.

### Local variables

```objectscript
set a = "Some string"
set a(1) = 3.14

set a("subscript") = 44
set a(2, "index") = "another string"
```

### Global variables (globals)

They have a persistent value which is stored in database.

```objectscript
set ^a = "Some string"
set ^a(1) = 3.14
set ^a("subscript") = 44
set ^a(2, "index") = "another string"
```
