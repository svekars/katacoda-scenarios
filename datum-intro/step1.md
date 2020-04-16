Pachyderm uses a set of primitives that enable you to store and manipulate
data in Pachyderm. The first primitive that you create in Pachyderm is
called **repository**. A repository is a location where you store your
data inside of Pachyderm. Pachyderm has input and output repositories.
Input repositories are created by the Pachyderm users, and output
repositories are created automatically by the pipelines and have the
same name as the pipeline that outputs data into it. For example, if
you create a machine learning data model, you might be putting your
training data in an input repository, and the results of your
computations will be stored in an output repository.

After putting some data into an input repository, you need to create
a **pipeline** that will run your code. A pipeline
is created from a specification, or spec, that includes various
parameters. Typically, in a pipeline spec you specify one or a few input
repositories, your code, and a glob pattern. Every time new data is added
to the input repository, the pipeline runs a **job** that processes these
changes and puts the results into the output repository. The job processes
the data as a single piece or breaks it down to smaller chunks according
to the glob pattern defined in your pipeline spec. These processing chunks
of data are called **datums**.
