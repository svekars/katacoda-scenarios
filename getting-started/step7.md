Let's add more files to your repository and compile a montage of those images.

Run:

`pachctl put file images@master:AT-AT.png -f http://imgur.com/8MN9Kg0.png
pachctl put file images@master:kitten.png -f http://imgur.com/g2QnNqa.png`{{execute}}

Every time you add data to a Pachyderm repo, Pachyderm starts a new job
and creates a commit.

Let's look at the jobs and commits that were created for the files you
have added in this tutorial:

`pachctl list job
pachctl list commit images@master`{{execute}}

Now, lets crate a `montage` pipeline that will stitch all the images
that you have added in one collage.

First let's create the pipeline specification. Open the `montage.json`
fo editing:

`nano montage.json`{{execute}}

Add the following montage specification:

`{
  "pipeline": {
    "name": "montage"
  },
  "description": "A pipeline that creates a montage.",
  "input": {
    "cross": [ {
      "pfs": {
        "glob": "/",
        "repo": "images"
      }
    },
    {
      "pfs": {
        "glob": "/",
        "repo": "edges"
      }
    } ]
  },
  "transform": {
    "cmd": [ "sh" ],
    "image": "v4tech/imagemagick",
    "stdin": [ "montage -shadow -background SkyBlue -geometry 300x300+2+2 $(find /pfs -type f | sort) /pfs/out/montage.png" ]
  }
}`{{execute}}

The script in the `"stdin"` field must be in one line. If you are on a
small screen, the script could have been pasted incorrectly. If part of
the  script, especially everything after `sort)`, jumped to the next line,
move the cursor to the beginning of that line and click **Backspace** or
**Delete** to move the line up.

Save and exit by pressing `CTRL + O`, `ENTER`, and `CTRL + X`.

The pipeline combines the data in `images` and `edges` repositories
and creates a cross product of it.
This specification already includes the code that the pipeline will
run in the `stdin` field. The pipeline will run the `montage` command
from the ImageMagick software to combine all images in these two
repositories together.

Let's create this pipeline:

`pachctl create pipeline -f montage.json`{{execute}}

Verify that the pipeline was created:

`pachctl list pipeline`{{execute}}

Go to the UI to view the result in the `montage` repository:

![montage](/svekars/scenarios/getting-started/assets/montage.png)
