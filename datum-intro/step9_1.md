Quiz time! Run `pachctl --help` in the terminal to find the correct answers!

>>1. Which command tests a `glob` pattern? <<
[ ] pachctl list "repo"@"branch"
[ ] pachctl glob list "glob-pattern""
[*] pachctl glob file "repo"@"branch":"glob"
[ ] pachctl glob "repo"@"branch"

>>2. How to view the number of datums that were processed in a pipeline run? (Select everything that applies) <<
[*] pachctl list datum "job-ID" --raw
[ ] pachctl list job -p "pipeline"
[*] pachctl list job -p "pipeline" --history all
[ ] pachctl show datum

3. You have a `test` repository configured on this machine. Type the correct
number of datums for the following glob patterns. Verify the by running
the `glob` verification command against the `test` repository in the terminal.

>> For `/`: <<
=== 1

>> For `/*`: <<
=== 3

>> For `/*/*`: <<

=== 6

>> For `/*/*/*`: <<

=== 10

>> For `/*/*/*/*`: <<
=== 0
