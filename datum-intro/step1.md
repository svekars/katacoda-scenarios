Pachyderm uses a set of primitives that you use to store and
manipulate data in Pachyderm. The first primitive that you
create in Pachyderm is called a repository - the location where
you store your data inside of Pachyderm. Pachyderm has input and
output repositories. For example, if you are creating a machine
learning data model, you put your training data in an input
repository. The results of your computations will be stored in
an output repository. While input repositories are created by
the user, the output repositories are created automatically.

After putting some data into an input repository, you can create
a pipeline that will perform the desired computation. A pipeline
is created from a specification which includes multiple parameters.
Typically, in a pipeline spec you specify one or multiple input
repositories, your code, and a glob pattern. The glob pattern
defines how your data is broken down into chunks for processing.
These processing chunks are called datums. 

