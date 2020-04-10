While in some cases, you can leave the datum parameter to its default ‘/’
without compromising the performance of your pipelines, in other cases
adjusting it to suffice your needs and your code could become absolutely
crucial. Imagine that you have a 1TB dataset in which you only change
individual files stored in their respective directories. It would be
unwise to process the whole dataset over and over again instead of
just processing that one file. That is when you have to choose the
right datum parameter.

The glob pattern parameter selection majorly depends on the following
criteria:

The way your code processes the data.
:    The user code must be written in such a way that it processes
     each datum. Pachyderm is not aware of which directories and files
     constitute a single datum, but the data scientist needs to write
     the code so that everything that needs to be processed together
     is added to the same datum. Another aspect of this is

Available resources on each Kubernetes node.
:    To process a datum, you must have enough resources in a Kubernetes
     worker node. In some cases where a dataset is large and the computation
     requires a significant amount of CPU or memory resources, processing the
     whole dataset on one node might not be possible. Then, you can break down
     your dataset into datums that can be processed one by one.

Data parallelization
:    If you have enough resources and multiple datums, Pachyderm can
     distribute datums for processing on multiple workers. Pachyderm enables
     you to configure the number of workers that you want to spin for each
     pipeline by using the `parallelism` parameter in the pipeline
     specification. This number again largely depends on the size of your
     dataset and the way your code runs.

The size of the datasets and what is updated in this dataset
:    If you have a 5TB of data stored in two directories in thousands of
     small size files, and you incrementally update individual files, you
     most likely want to identify each file as a datum rather than the who
     dataset as one datum. Because if you do the latter, every time you
     update one file in this dataset, Pachyderm identifies the whole 5TB
     as a new dataset and processes it all, while if you define each file
     as a datum, Pachyderm will only process that small file.

