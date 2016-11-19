# shame-mx-ipv6

shame-mx-ipv6 is a Ruby script that checks a list of domains to see if their MX records support IPv6. It accepts a CSV with headers containing a list of any number of domains. It will attempt to perform an MX lookup against each domain, and then checks those MX records to see if they each have an associated AAAA record. Unless all MX records have an associated AAAA record, it is determined that the domain in question does not support IPv6.

### Usage
```$ ./shame-mx-ipv6.rb```

### Configuration
Prior to running, make sure the *domains_file* and *blacklist* parameters are configured to your liking. At the very least, you must specify the location of the CSV containing the domains you want to check.

The *blacklist* array can be used to exclude domains that should not be checked.

### Todo
* Provide the ability to pass in parameters to the script directly
* Perform overhaul of script to use classes
* Provide a brief report, such as the number of domains checked, and a percentage of those that support IPv6
* Error checking
* Explore other ways of displaying the results

License
---
MIT
