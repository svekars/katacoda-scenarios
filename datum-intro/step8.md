Now that we know the structure of our repository and files, 
let's try to update some of the files with different `glob`
settings and see how Pachyderm will process them.

As it was previously mentioned, every time you change a file
in a repository, Pachyderm starts a job for the pipeline that
uses that repository as input.

Let's see the jobs that we have already ran for the `cats`
pipeline:

`pachctl list job -p cats-combine`{{execute}}

In the **Progress** bar, you can see the number of datums
that were processed and skipped. In this job run, Pachyderm
processed one datum and skipped one datum respectively:

![Jobs](svekars/scenarios/datum-intro/assets/job1.png)

To get more detailed information about processed datums,
run `pachctl list datum` with the corresponding job ID:

`pachctl list datum <ID> --raw`

Note, that the pipeline has processed `51793` bytes and
just one datum with the `/` path.

Now, let's change the glob in the pipeline specification by running
`pachctl edit pipeline cats-combine`{{execute}}

Find the `"glob"` and change it to `/*`.

As soon as you save your changes, the pipeline starts a job
with the new changes.
If you run `pachctl list pipeline`, you will see that the pipeline
version has been updated to `2`.

Run `pachctl list job -p cats-combine --history all` to see
that Pachyderm has processed two datums:

![two datums](svekars/scenarios/datum-intro/assets/two-datums.png)

Finally, run `pachctl list datum <ID> --raw` to see that
Pachyderm has processed two datums - one is the `Cats1` directory
and the other is `Cats2`.

Now, let's modify a file and see how many datums the pipeline will
process. 







