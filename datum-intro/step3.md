This animation demonstrates how the glob pattern breaks down
your data into datums.

![Datum Intro](/svekars/scenarios/datum-intro/assets/datum_processing.gif)

1. New data is added to a Pachyderm repository. Pachyderm recognizes the new
data as a new commit.
1. Pipeline starts a job breaks up the data into datums according to the glob
pattern in the pipeline spec.
1. The datums go through the transformation defined by your code.
1. The pipeline puts the results to the output repository.
