# the probleme that comes to solve
- when working on some project, avoid installing all its dependencies manually
- the instalation takes to time. by providing the all dependencies you avoid wasting time in installation and errors that occur in this processe
- application often works differently on different machines. so the containers encapsulate all the  dependencies. and ensures that it can runs everywhere.
- Virtual machines are consume resources 
(
- consume a lot of disk space
- consume a lot of RAM and CPU power from the server
- slow to startup
)
, and also slow to boot. after running some apps on these VMs there are some resources that are not used. by using docker we can using few resources since they share the host OS kernel