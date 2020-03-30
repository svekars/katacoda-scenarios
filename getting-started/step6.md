Now, that you have Pachyderm up and running, let's
try to create our first Pachyderm pipeline. This
pipeline will perform basic image edge detection
by using the OpenCV Library.

First, we need to create an input repository in which
the data that you want to process will be stored. Let's
create a repo called `images` by running the following
command:

`pachctl create repo images`{{execute}}

Verify that the repository was successfully created:

`pachctl list repo`{{execute}}

Now, let's add some data to this repository:

`pachctl put file images@master:liberty.png -f http://imgur.com/46Q8nDz.png`{{execute}}

Verify that the file was added by running:

`pachctl list file images@master`{{execute}}

Now, let's create a pipeline that will perform edge detection.
A minimum Pachyderm pipelines needs a code that performs
desired computations and a pipeline specification in YAML
or JSON format.

Open an `edges.py` file for editing:

`nano edges.py`{{execute}}

Add the following Python code:

`import cv2
import numpy as np
from matplotlib import pyplot as plt
import os
def make_edges(image):
   img = cv2.imread(image)
   tail = os.path.split(image)[1]
   edges = cv2.Canny(img,100,200)
   plt.imsave(os.path.join("/pfs/out", os.path.splitext(tail)[0]+'.png'), edges, cmap = 'gray')
for dirpath, dirs, files in os.walk("/pfs/images"):
   for file in files:
       make_edges(os.path.join(dirpath, file))`{{execute}}

The code above checks all `.png` files in the directory and uses the `Canny`
algorithm to detect edges on the image.

Save and exit by pressing `CTRL + O`, `ENTER`, and `CTRL + X`.

Now, let's create the pipeline spec.
Open an `edges.yml` file for editing by running:

`nano edges.yml`{{execute}}

Paste the following YAML specification:

`pipeline:
  name: edges
description: An edge detection pipeline.
transform:
  cmd:
  - python3
  - "/edges.py"
  image: pachyderm/opencv
input:
  pfs:
    repo: images
    glob: "/*"`{{execute}}

Save and exit by pressing `CTRL + O`, `ENTER`, and `CTRL + X`.

When you have your code and the pipeline spec ready, you
can create your pipeline by running:

`pachctl create pipeline -f edges.yml`{{execute}}

Verify that Pachyderm has created your first pipeline:

`pachctl list pipeline`{{execute}}

