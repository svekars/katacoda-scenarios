While in some cases, you can leave the datum parameter to its default `/`
without compromising the performance of your pipelines, in other cases,
adjusting it to suffice your code requirements could become absolutely
crucial. Imagine that you have a 1TB dataset in which you only change
individual files stored in their respective directories. It would be
unwise to process the whole dataset over and over again instead of
just processing that one file. That is when you have to choose the
right datum parameter.

The glob pattern parameter selection majorly depends on the following
criteria:

* **The way your code processes data**

  The user code must be written in such a way that it processes an indivisible
  unit of work as a single datum. Pachyderm does not know which directories
  and files constitute a single datum, but the data scientist needs to write
  the code so that everything that must be processed together
  is added to the same datum.

* **Available resources on each Kubernetes node**

  To process a datum, you must have enough resources in a Kubernetes
  worker node. In some cases where a dataset is large and the computation
  requires a significant amount of CPU, memory, or storage resources,
  processing the whole dataset on one node might not be possible.
  Then, you can break down your dataset into datums that can be
  processed one by one.

* **Data parallelization**

  If you have enough resources and multiple datums, Pachyderm can
  distribute datums for processing on multiple workers. Pachyderm enables
  you to configure the number of workers that you want to spin for each
  pipeline by using the `parallelism` parameter in the pipeline
  specification. This number again largely depends on the size of your
  dataset and the way your code runs.

* **The size of the datasets and what is updated in this dataset**

  If you have a 5TB of data stored in two directories in thousands of
  small files, and you incrementally update individual files, you
  might want to store the files that are updated together in
  sub-directories and define a sub-directory as a datum, so
  that only the changed files are processed. There could be
  other options based on your specific use case, but certaintly
  you don't want to process the whole 5TB dataset every time.
