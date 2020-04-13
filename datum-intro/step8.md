Now that we know the structure of our repository and files, 
let's try to update some of the files with different `glob`
settings and see how Pachyderm will process them.

As it was previously mentioned, every time you change a file
in a repository, Pachyderm starts a job for the pipeline that
uses that repository as input.

Let's see the jobs that we have already ran for the `cats`
pipeline:

`pachctl list pipeline cats`{{execute}}

