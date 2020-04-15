Now that we know the structure of our repository and files, 
let's try to update some of the files with different `glob`
settings and see how Pachyderm will process them.

As it was previously mentioned, every time you change a file
in a repository, Pachyderm starts a job for the pipeline that
uses that repository as input.

Let's see the jobs that have already run for the `cats`
pipeline:

`pachctl list job -p cats-combine`{{execute}}

In the **Progress** bar, you can see the number of datums
that were processed and skipped. In this job run, Pachyderm
processed one datum and skipped zero datums:

![Jobs](/svekars/scenarios/datum-intro/assets/job1.png)
<small> (click to enlarge the image)</small>

To get more detailed information about the processed datums,
run `pachctl list datum` with the corresponding job ID:

`pachctl list datum <ID> --raw`{{execute}}
<small> Replace <ID> with the job ID from the previous command. </small>

Note, that the pipeline has processed `51793` bytes and
just one datum with the `/` path.

Now, let's change the glob in the pipeline specification by running
`pachctl edit pipeline cats-combine`{{execute}}.

Find the `"glob"` parameter and change it to `/*`.

As soon as you save your changes, the pipeline starts a job
with the new changes.
If you run `pachctl list pipeline`{{execute}}, you will see that the pipeline
version has been updated to `2`. Also, the pipeline reprocesses
everything in the `HEAD` of the `master` branch. Therefore,
all your data which is now broken down into two datums was
processed.

Run `pachctl list job -p cats-combine --history all`{{execute}} to see
that Pachyderm has processed two datums:

![two datums](/svekars/scenarios/datum-intro/assets/two-datums.png)

Finally, run `pachctl list datum <ID> --raw`{{execute}} to see that
Pachyderm has processed two datums - one is the `/Cats1` directory
and the other is `/Cats2`.

Now, let's modify a file and see how many datums the pipeline will
process.
