## Pachyderm Architecture Overview

The following diagram describes high-level Pachyderm architecture.

<pre>
![Architecture Overview](/steps-Pachyderm-stack-diagram_latest.png)
</pre>

![Architecture Overview](/steps-Pachyderm-stack-diagram_latest.png)

Here are the steps of a typical Pachyderm workflow:

1. Data scientists leverage their preferred tools, programming languages,
or integrated development environment (IDE) they like to define the steps
of their data pipelines.
1. Data pipelining tools assemble components to create an end-to-end data
workflow. They define units of work that need be to processed in a specific
sequence, parallelizing where possible.
1. Pachyderm’s data orchestration layer receives a data workflow and
guarantees its execution. It defines a set of workers (containers) that
need to be created, sends those requests to Kubernetes, and ensures the
correct data is made available to each worker. If any worker fails,
Pachyderm’s data orchestration layer ensures that any processing being
done by the failed worker is rescheduled and that all data is persisted
effectively before moving on to the next steps of the workflow.
1. Kubernetes receives work that needs to be scheduled from Pachyderm,
spins up those containers, and schedules them with the appropriate
resources as efficiently as possible.
1. Cloud or on-prem resources such as compute, GPUs, object storage, and
volumes are scaled and available for use.

