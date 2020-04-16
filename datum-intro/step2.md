Datum is one of the most important performance parameters that
define how a pipeline processes your data. You define datum
through the `glob` parameter in your pipeline spec.
Here is a simple example of a pipeline specification with glob
pattern set to `/` which means process all files and folders
in the repo as one single datum:

```bash
{
  "pipeline": {
    "name": "test-pipeline"
  },
  "description": "A test pipeline",
  "transform": {
    "cmd": [ "bash"],
    "stdin": [cp -a /pfs/dir/* /pfs/out/]
  },
  "input": {
    "pfs": {
      "repo": "test-repo",
      "glob": "/"
    }
  }
}
```

This means that every time you make a change in any file in your
input repository, Pachyderm processes all the files in this repository.
While in some cases, you can leave the datum parameter to its
default parameter (`/`) without compromising the performance of
your pipelines, in other cases it might be absolutely crucial to
adjust it to your needs and your code.
