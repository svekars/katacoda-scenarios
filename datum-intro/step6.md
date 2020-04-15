**Note: Wait until the environment is set up before running
this example.**

Let's imagine you have `.csv` files in which you
store cats breeds and you have a Pachyderm pipeline
that runs a script that combines these files in one.


In this tutorial, we have already preconfigured this
pipeline.

View the list of existing pipelines in this environment:
`pachctl list pipeline`{{execute}}

You should see the `cats` pipeline successfully running.

Get the list of repositories and the list of files in each
repository:

`pachctl list repo && pachctl list file cats@master`{{execute}}

As you can see, there are two directories in the `cats`
repository `/Cats1` and `/Cats2`. Let's view the files in each
of this repositories:

`pachctl list file cats@master:Cats1 && pachctl list file cats@master:Cats2`{{execute}}

**Output:**

```
NAME                     TYPE SIZE
/Cats1/Calico.csv        file 6.073KiB
/Cats1/Scottish-Fold.csv file 8.413KiB
/Cats1/Siamese.csv       file 12.05KiB
NAME                     TYPE SIZE
/Cats2/Abyssinian.csv    file 6.702KiB
/Cats2/Bengal.csv        file 8.414KiB
/Cats2/Russian-Blue.csv  file 8.924KiB
```

You have three `.csv` files that correspond to a cat bread
in each directory.

Finally, let's print the contents of one of those files in
the terminal:

`pachctl get file cats@master:Cats1/Calico.csv`{{execute}}

You can see that the file has columns and rows with information
about cats of a particular breed, including the age, gender, size, coat,
and other parameters. All other files have similar content corresponding
to the eponymous breed.
