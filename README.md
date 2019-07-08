# SP Ruby Test

The `SP Ruby Test` app prints report of different visit statistics.  The app reads source of the information from a log file provided at command line.

The log file contains one visit information on each line.  Each line contains path and IP address separated by a white space.  The app expects the format is correct.


# Usage
Provide a log file name at command line and run the parser by,
```
./parser webserver.log
```


# Test

To run complete test suite,
```
ruby test.rb
```


# Design

The parser app is available in file `parser.rb`.  The app comprises of following classes,

* `visits_log`
* `total_visits_report`
* `unique_visits_report`

and module,

* `can_print`


### VisitsLog

Turns text records into a data structure used by report classes.


### TotalVisitsReport

It prints each path and number of visits to stdout in descending order.  It counts every visit made by an IP address to any path.  The count includes repeated visits.

Example,
```
/help_page/1 80 visits
```


### UniqueVistsReport

It prints each path and number of unique visits to stdout in descending order.  It counts only unique visits that is each IP address visiting a path is counted only once.

Example,
```
/help_page/1 23 unique views
```


### CanPrint

Common print functionality used by the report classes.
