# shame-mx-ipv6

shame-mx-ipv6 is a Ruby script that checks a list of domains to see if their MX records support IPv6. It accepts a CSV with headers containing a list of any number of domains. It will attempt to perform an MX lookup against each domain, and then checks those MX records to see if they each have an associated AAAA record. Unless all MX records have an associated AAAA record, it is determined that the domain in question does not support IPv6.

### Usage
`$ ./shame-mx-ipv6.rb -c domains.csv [-b domain1.com,domain2.com]`

### Configuration
When running, pass in the CSV file containing the domains you want to check via the `-c` or `--csv` parameter.

The optional `blacklist` parameter can be used to exclude domains that should not be checked.

### Todo
* Refactor to using classes, since this was originally written in a rush
* Provide a brief report, such as the number of domains checked, and a percentage of those that support IPv6
* Proper error handling
* Explore other ways of displaying the results

License
---
MIT
