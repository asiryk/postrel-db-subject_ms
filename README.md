# Post-relational Databases

> Material provided by Igor Sikorsky Kyiv Polytechnic Institute, Iryna Mykhailova, PhD

## ACID

ACID (**atomicity**, **consistency**, **isolation**, **durability**) is a set of properties of database transactions intended to guarantee data validity despite errors, power failures, and other mishaps.

* **Atomicity** requires that each transaction be "all or nothing": if one part of the transaction fails, then the entire transaction fails, and the database state is left unchanged.
* The **consistency** property ensures that any transaction will bring the database from one valid state to another. Any data written to the database must be valid according to all defined rules, including constraints, cascades, triggers, and any combination thereof.
* The **isolation** property ensures that the concurrent execution of transactions results in a system state that would be obtained if transactions were executed sequentially.
* The **durability** property ensures that once a transaction has been committed, it will remain so, even in the event of power loss, crashes, or errors.

## Relational Databases

### Properties of Relational Databases

* Each element in a table is a data element;
* All cells in a column are of the same type (number, varchar etc);
* Each column has its unique name;
* Table shouldn’t have several equal rows;
* Order of sequence of rows and columns is not important.

### Pros of Relational Databases

* Ease of use: tables consist of rows and columns, there’s a limited number of datatypes for storing information
* Flexibility: different tables from which information has to be linked and extracted can be easily joined
* Precision: relational algebra and relational calculus ensures that there is no ambiguity
* Security
* Data Independence: is achieved with normalization structure
* Have transactional logic, supports ACID

### Cons of Relational Databases

* Because of the limited number of datatypes and normalization it is sometimes hard or even impossible to represent data from non-traditional areas, e.g. computer-aided design (CAD), computer-aided manufacturing (CAM), geo-informational systems (GIS), computer-aided software engineering (CASE).

## Object-Oriented Databases

Object-oriented database combines database capabilities with object-oriented programming language capabilities.

Object databases based on persistent programming acquired a niche in application areas such as engineering and spatial databases, telecommunications, and scientific areas such as high energy physics and molecular biology. Another group of object databases focuses on embedded use in devices, packaged software, and real-time systems.

Object-Relational DB must adhere to the 13 propositions of the [Third-generation database system manifesto](http://dl.acm.org/citation.cfm?id=390001).

### Third-Generation Database System Manifesto

1. N-dimensional object-oriented modelling
1. 2-dimensional relational modelling
1. Inheritance
1. Encapsulation
1. Object persistence
1. Class composition
1. Polymorphism
1. Navigational access to objects
1. Relational access
1. Non-procedural access via queries
1. Interfaces to 3d generation traditional languages
1. Interfaces to 3d generation OO languages
1. Interfaces to 4th generation languages

### Object Model in Object-Relational DB

* User-Defined Types allow to define new datatypes including attributes
and methods. UDT are fully encapsulated so you can access values
only through getters (called observers) and setters (called mutators).
Methods use “dot” notation to access data from UDT.
* Typed Tables allow to define table which contain instances of UDTs
with which it is directly associated.
* Both UDTs and TTs support inheritance, so if you have a UDT A that
inherits from UDT B, then the corresponding TT A has to inherit from TT B.

### Examples

PostgreSQL, Illustra, Omniscience, UniSQL, DB2, Oracle, Microsoft SQL Server, etc.

## NoSQL Databases

A NoSQL database provides a mechanism for storage and retrieval of
data which is modeled in means other than the tabular relations used in
relational databases.
NoSQL databases are increasingly used in big data and real-time web
applications.
Usually NoSQL databases are schema-free, have easy replication
support, simple API, are eventually consistent / BASE (not ACID) and
can store and manipulate a huge amount of data.

### Characteristics of NoSQL Databases

* Use different types of stores
* It is possible to design DB without scheme because data structure is
weakly typed
* It is possible to store data as a complete entity
* It is possible to utilize several cores simultaneously
* There is a simple scheme for linear scaling, i.e. adding processors
increases performance

### Kinds of NoSQL Databases

* Wide column stores
* Document stores
* Key-Value / Tuple store
* Graph databases
* XML databases
* Multidimensional databases
* Multivalue databases
* etc

## CAP Theorem

> CAP theorem was proposed by Eric Brewer in app. 1998

It is impossible for a distributed data store to simultaneously provide more than
two out of the following three guarantees:

1. **Consistency** - every read receives the most recent write or an error
1. **Availability** - every request receives a (non-error) response – without guarantee that it contains the
most recent write
1. **Partition tolerance** - the system continues to operate despite an arbitrary number of messages being
dropped (or delayed) by the network between nodes

Database systems designed with traditional ACID guarantees in mind choose
consistency over availability, whereas systems designed around the BASE philosophy,
common for the NoSQL, choose availability over consistency.

When choosing consistency over availability, the system will return an error or a time-out
if particular information cannot be guaranteed to be up to date due to network
partitioning. When choosing availability over consistency, the system will always process
the query and try to return the most recent available version of the information, even if it
cannot guarantee it is up to date due to network partitioning.

## BASE

* **Basic Availability** – each query is guaranteed to return a result or an error
* **Soft state** – state of the system can change in time even without entering
new data to become consistent
* **Eventual consistency** – data can be inconsistent at some point but it will
become consistent after some time.

A BASE datastore values availability, but it doesn’t offer guaranteed
consistency of replicated data at write time. Overall, the BASE consistency
model provides a less strict assurance than ACID: data will be consistent in
the future, either at read time or it will always be consistent, but only for
certain processed past snapshots.

## Column-Oriented Database

A column-oriented DBMS (or columnar database management system)
is a database management system that stores data tables by column
rather than by row.

It can use traditional database query languages like SQL to load data and
perform queries. By storing data in columns rather than rows, the database can more
precisely access the data it needs to answer a query rather than
scanning and discarding unwanted data in rows. Thanks to storing data in columns query performance is often
increased.

### Row-Oriented DB vs. Column-Oriented DB

Row-oriented database:

| 1 | Paris  | 54000 | France  |
|---|--------|-------|---------|
| 2 | Kyiv   | 03000 | Ukraine |
| 3 | London | 47000 | UK      |

Column-oriented database: 

| 1      | 2       | 3      |
|--------|---------|--------|
| Paris  | Kyiv    | London |
| 54000  | 03000   | 47000  |
| France | Ukraine | UK     |

### Pros of Column-Oriented Database

* Effective disk work: doesn’t read
attributes which aren’t needed for
query execution
* Uses map reduce
* Uses specialized operators to
work with cached data
* Is designed to work efficiently with
physical memory and CPU
* Support ACID

### Cons of Column-Oriented Database

* Significantly slower at handling
transactions
* Slow writing on disk speed
* Have some functional limitations

### Examples

Cassandra, Scylla, MonetDB, ConcourseDB, Elassandra, etc.

## Key-Value Database

A key-value store, or key-value database, is a data storage paradigm
designed for storing, retrieving, and managing associative arrays
(dictionary or hash).

The records are stored and retrieved using a key that uniquely identifies
the record, and is used to quickly find the data within the database.

The type of the stored data doesn’t matter, it can be numbers, strings,
serialized objects etc.

Are usually used to store big binary or character streams, to organize a
specialized file system.

### Pros of Key-Value Database

* Has considerable flexibility thanks to the data representation as one entity
* Uses far less memory because doesn’t require placeholders for missing records
* Is very scalable and is usually used in cloud services

### Cons of Key-Value Database

* Doesn’t guarantee the logical integrity of data since they don’t have any limitations on the structure of the data that is stored inside them
* Is very dependent on the application that “knows” what data is stored in the keys
* Lack the standardization

### Examples

DynamoDB, Azure Table Storage, Aerospike, RocksDB, Oracle NOSQL Database, Voldemort, etc.

## Document-Oriented Database

A document-oriented database, or document store, is a database
designed for storing, retrieving and managing document-oriented
information, also known as semi-structured data.

Document-oriented databases are inherently a subclass of the
key-value store. The difference lies in the way the data is processed; in
a key-value store the data is considered to be inherently opaque to the
database, whereas a document-oriented system relies on internal
structure in the document in order to extract metadata that the database
engine uses for further optimization.

It is based on document repositories that have a tree structure (sometimes
forests). The structure begins at the root node and may have several internal
and leaf nodes. Leaf nodes contain data which, when adding the document, is
entered in indexes that allows to find a place (path) to necessary data.

Document-oriented databases are used to store hierarchical data structures.
Each entry in them is stored as a separate document that has its own set of
fields, which may differ in different documents.

Documents can be organized (grouped) in a collection, and these collections
can contain other collections. Although documents in such collections can be
arbitrary, it is best to combine documents with a similar structure into a
collection for more efficient indexing.

### Pros of Document-Oriented Database

* Documents are independent units of data
* Allows to change “schema”, since a document contains whatever keys and values the application logic requires
* Good scalability and decentralization
* Can be indexed for faster search

### Cons of Document-Oriented Database

* Doesn’t support ACID and doesn’t control the logical integrity of data inside the database
* Doesn’t work good with complex queries that link several documents together by their properties

### Examples

Elastic, MongoDB, Azure DocumentDB, CouchDB, NosDB, iBoxDB, etc.

## Multimodel Database

Most database management systems are organized around a single
data model that determines how data can be organized, stored, and
manipulated. In contrast, a multimodel database is designed to support
multiple data models against a single, integrated backend.

One multimodel database can support document, graph, relational,
object-oriented and/or key-value models.

In addition to offering multiple data models in a single data store, some
databases allow developers to easily define custom data models.

Usually it has all the benefits of the supported models which allow to
nullify the negatives of some of them.

### Examples

* ArangoDB (document (JSON), graph, key-value)
* IRIS (hierarchical, relational, object-oriented, document (JSON))
* CouchBase (document(JSON), key-value)
* MarkLogic (document (XML and JSON), graph (RDF with OWL/RDFS),
text, geospatial, binary, SQL)
* OrientDB (document (JSON), graph, key-value, text, geospatial, binary,
reactive, SQL)
* etc
