# SP Ruby Test

The `SP Ruby Test` app prints report of different visit statistics.  The app reads source of the information from a log file provided at command line.

The log file contains one visit information on each line.  Each line contains path and IP address separated by a white space.  The app expects the format is correct.


# Design


### VisitsLog

Turns text records into a data structure used by report classes.


### CanPrint

Common print functionality used by the report classes.
