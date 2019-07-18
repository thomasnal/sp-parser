# SP Parser

The `SP Parser` app prints a report of different visit statistics.  The app reads source of the information from a log file provided at command line.

The log file contains one visit information on each line.  Each line contains path and IP address separated by a white space.  The app expects the format is correct.


# Usage
Run the parser by providing a log file name at command line,
```
./parser webserver.log
```


# Test

Complete test suite is executed by,
```
ruby test.rb
```


# Design

The parser app is available in file `parser.rb`.  The app functionality is provided by following classes,

* `visits_log`
* `total_visits`
* `total_visits_report`
* `unique_visits`
* `unique_visits_report`

and module,

* `can_print`


### VisitsLog

Provides interface for accessing log file and processing its records.  It is used by classes which calculate visits.


### TotalVisits

Counts every visit made by an IP address to any path.  It calls VisitsLog and processes log file one line at a time.


### TotalVisitsReport

It prints each path and number of visits to stdout in descending order.  The count includes repeated visits.

Example,
```
/help_page/1 80 visits
```


### UniqueVists

Counts unique visits, each IP address visiting a path is counted only once.  It calls VisitsLog and processes log file one line at a time.


### UniqueVistsReport

It prints each path and number of unique visits to stdout in descending order.

Example,
```
/help_page/1 23 unique views
```


### CanPrint

Common print functionality used by the report classes.
