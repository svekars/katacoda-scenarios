Although Pachyderm supports a wide variety of glob patterns that are
similar to the Linux glob patterns, the following values are used
most commonly:

* `/` — Pachyderm denotes the whole repository as a single datum
and sends all of the input data to a single worker node to be
processed together.
* `/*` — Pachyderm defines each top-level filesystem object, that
is a file or a directory, in the input repo as a separate datum.
For example, if you have a repository with ten files in it and no
directory structure, Pachyderm identifies each file as a single
datum and processes them independently.

* `/*/*` — Pachyderm processes each filesystem object in each
subdirectory as a separate datum.

To help us get a better understanding of datums, let's try out
the examples on the next screens.
