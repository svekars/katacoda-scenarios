Imagine a machine learning model workflow in which you have
training data that is being constantly updated. The data is
collected from some sort of source, such as a database, a file,
a sensor, or other. The data sciencients then prepare and preprocess
the data by removing corrupt, noisy, and incorrect elements. This
process is called data cleaning, and data scientists spent most of
their time on this step. Then, the actual experiment is conducted
and the model is trained against the cleaned data. Does the experiment
end here? In the real world, it typically does not. This process is
repeated multiple times with different combinations of data, code,
and parameters, and that’s what makes the machine learning model reliable.

But how do data scientists keep track of the data that is being used
in these experiments? How do they make machine learning models reproducible?
And how data science systems can be used in production workflows?

The answer to all these questions is that the training data should
be treated the same way as we treat the code today. We store the
code in a version control system and run it against multiple
automated tests before using it in production. Same principles must
apply to the data used to train machine learning models.

