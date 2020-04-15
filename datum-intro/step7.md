Let's check the specification that was used to create this pipeline:

`pachctl inspect pipeline cats-combine`{{execute}}

Among other information, you can see the `glob` parameter
in the input section of the pipeline spec:

```
Input:
{
  "pfs": {
    "name": "cats",
    "repo": "cats",
    "branch": "master",
    "glob": "/"
  }
}
```

`glob` is set to `/`, which means
all directories and files are processed as one unit, or datum.

You can preview what will constitute a single datum by using the
`pachctl glob file` command.

For example, if you want to check what will go into one datum if
you set `glob` to `/`, run:

`pachctl glob file cats@master:/`{{execute}}

**Output:**

`NAME TYPE SIZE
/    dir  50.58KiB`

As you can see in the output, the root directory is a signle
datum.

Now, let's see what will go into one datum if you set `glob` to `/*`:

`pachctl glob file cats@master:/*`{{execute}}

**Output:**

```
NAME   TYPE SIZE
/Cats1 dir  26.54KiB
/Cats2 dir  24.04KiB
```

Now you have two datums — `Cats1` and `Cats2`. If you change something
in the `Cats1` directory, only that directory will be processed and the
other will be skipped as Pachyderm won't detect any changes.

Let's see what happens if you set `glob` to `/*/*`:

`pachctl glob file cats@master:/*/*`{{execute}}

**Output:**

```
NAME                     TYPE SIZE
/Cats1/Calico.csv        file 6.073KiB
/Cats1/Scottish-Fold.csv file 8.413KiB
/Cats1/Siamese.csv       file 12.05KiB
/Cats2/Abyssinian.csv    file 6.702KiB
/Cats2/Bengal.csv        file 8.414KiB
/Cats2/Russian-Blue.csv  file 8.924KiB
```

Now, each file is a datum, and only the file (or files) that was
changed will be processed by the pipeline.

Let's change the `glob` parameter in the `cats` pipeline
and see how many datums each new job will process.
