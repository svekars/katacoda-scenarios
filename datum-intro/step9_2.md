1. Which command tests a `glob` pattern?

   - [ ] pachctl list <repo>@<branch>
   - [ ] pachctl glob list <glob>
   - [*] pachctl glob file <repo>@<branch>:<glob>
   - [ ] pachctl glob <repo>@<branch>

2. How to view how many datums were processed in a pipeline run? (Select everything that applies)

   - [*] pachctl list datum <job-ID> --raw
   - [ ] pachctl list job -p <pipeline>
   - [*] pachctl list job -p <pipeline> --history all
   - [ ] pachctl show datum

You have a `test` repository configured on this machine. Type the correct
number of datums for the following glob patterns. Verify the by running
the `glob` verification command against the test repository in the terminal.

To solve this problem, you need to run `pachctl glob file`
command with a corresponding glob.

For example:

`pachctl glob file test@master:/
pachctl glob file test@master:/*`{{execute}}

You should see the following number of datums:

- For `/`: 1 datum
- For `/*`: 3 datums
- For `/*/*`: 6 datums
- For `/*/*/*`: 10 datums
- For `/*/*/*/*`: 0 datums, invalid parameter. 
