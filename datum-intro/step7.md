Let's check which pipeline spec was used to create this pipeline:

`pachctl inspect pipeline cats-combine`{{execute}}

Among other information, you should see the input of the pipeline:

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

As you can see the `glob` parameter is set to "/", which means
all directories and files are processed as one unit. 

You can preview what will constitues a single datum by using the
`pachctl glob file` command.

For example, if you want to check what will go into one datum if
you set `glob` to `/`, run:

`master $ pachctl glob file cats@master:/`{{execute}}

**Output:**

`NAME TYPE SIZE
/    dir  50.58KiB`

As you can see in the output, the /root directory constitutes a signle
datum.

Now, let's see what will go into one datum if you set `glob` to `/*`:

`pachctl glob file cats@master:/*`{{execute}}

**Output:**

```
NAME   TYPE SIZE
/Cats1 dir  26.54KiB
/Cats2 dir  24.04KiB
```

Now you have two datums - `Cats1` and `Cats2`. If you change something
in the `Cats1` directory, only that directory will be processed and the
other will be skipped as Pachyderm won't detect any changes.

Let's see what happens if you set `glob` to `/*/*`:

`achctl glob file cats@master:/*/*`{{execute}}

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

Now, each file is a datum. And only the file that was changed will be
processed by the pipeline.

Let's change a file and experiment with the `glob` parameter.
