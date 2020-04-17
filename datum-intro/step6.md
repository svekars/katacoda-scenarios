**Note: Wait until the environment is set up before running
this example.**

When environment is ready, Pachyderm UI is avaialable
at http://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].[[KATACODA_DOMAIN]]/?port=80&path=ws. In this tutorial, you must use
`http` to access the UI.

Let's imagine you have `.csv` files, in which you
store cats breeds, and a Pachyderm pipeline
that combines these files in one file.

In this tutorial, this pipeline is already preconfigured
for you.

View the list of existing pipelines in this environment:
`pachctl list pipeline`{{execute}}

You should see the `cats` pipeline successfully running.

Get the list of repositories and the list of files in each
repository:

`pachctl list repo && pachctl list file cats@master`{{execute}}

As you can see, there are two directories in the `cats`
repository `/Cats1` and `/Cats2`. Let's view the files in each
of these repositories:

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

You have three `.csv` files that correspond to a cat breed
in each directory.

Finally, let's print the contents of one of those files in
the terminal:

`pachctl get file cats@master:Cats1/Calico.csv`{{execute}}

You can see that the file has columns and rows with information
about cats of a particular breed, including the age, gender, size, coat,
and other parameters. Other files have similar content.

You can pretty print the file that was copied to the repository by using this
script:

`./print.py`{{execute}}

Also, you can view the files in the [UI](http://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].[[KATACODA_DOMAIN]]/?port=80&path=ws/app/repos/cats/commits) under **Repo > cats**.

![CSV in the UI](/svekars/scenarios/datum-intro/assets/ui-file-browse-cats.png)
