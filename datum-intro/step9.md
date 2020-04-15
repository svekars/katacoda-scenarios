Let's update the file `/Cats1/Calico.csv` and see how the pipeline
processes these changes:

`vi Cats1/Calico.csv`{{execute}}

Modify the file by removing the last row — row 6. We are using
`vi` to open this file, therefore, press the `d` button twice
to delete the whole line. Then, press `wq`{{execute}} to save
and exit.
Replace the file by the same name in the Pachyderm repo:

`pachctl put file cats@master:Cats1/Calico.csv -f Cats1/Calico.csv`{{execute}}

As soon as Pachyderm detects new changes, a new job starts for this pipeline.
View the list of jobs by running:

`pachctl list job -p cats-combine`{{execute}}

You should see one processed datum and one skipped:

![glob-one-asterisk](/svekars/scenarios/datum-intro/assets/glob-one-asterisk.png)

You can also run `pachctl list datum <job-ID> --raw`{{execute}} to see more
detailed information about the two processed datums.

Now, let's modify the glob pattern in the pipeline to `/*/*`. This setting
means that every file in the `/Cats1` or `/Cats2` directory will be considered
a single datum. Because we have three files in `/Cats1` and three files in
`/Cats2`, we have a total of six datums when we set `glob` to `/*/*`.

To modify the pipeline, run `pachctl edit pipeline cats-combine`{{execute}}

After you modify the pipeline spec, Pachyderm starts a job and reprocesses six
datums for this pipeline.

Let's modify the `/Cats2/Abyssinian.csv` file by deleting the last row — row 5.

`vi Cats2/Abyssinian.csv`{{execute}}

Delete the line by pressing `d` twice, save the file by typing `:wq!`, and
then, replace the corresponding file in the repository:

`pachctl put file cats@master:Cats2/Abyssinian.csv -f Cats2/Abyssinian.csv`{{execute}}

Let's see how many datums Pachyderm is processing this time:

`pachctl list job -p cats-combine`{{execute}}

You should see that Pachyderm processed only one datum, skipped five, and
uploaded and downloaded `12.75KiB` of data.

![glob-double-asterisk](/svekars/scenarios/datum-intro/assets/glob-double-asterisk.png)

While for small datasets, like the one we are using in this example, the
difference in processing the whole dataset or only parts of it is
not significant, it becomes very noticeable when you process multi-gigabyte
datasets.

Try out our [Datum II: Cross, Union, and Join]() tutorial to learn
how you can use the glob pattern with multi-input pipelines.
