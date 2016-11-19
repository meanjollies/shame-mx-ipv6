#!/usr/bin/env ruby
# title:  shame-mx-ipv6.rb
# descr:  check a list of domains and their MX records, if any, for IPv6 support
# author: andrew o'neill
# date:   2016

require 'csv'
require 'resolv'
require 'terminal-table'
require 'colorize'

domains_file = ''
blacklist = ['example.com']

# read in the CSV of domains for checking, and strip the header
domains = CSV.read(domains_file)
domains.shift

# check what AAAA records are available for the mx record
def getv6(mxdomain)
  v6addr = ''
  Resolv::DNS.open do |dns|
    resv6 = dns.getresources(mxdomain, Resolv::DNS::Resource::IN::AAAA)
    resv6.each { |r| v6addr = r.address.to_s }
  end
  if v6addr.empty?
    return 1
  else
    return 0
  end
end

# get the MX records for the domain
def getmx(domain)
  Resolv::DNS.open do |dns|
    resmx = dns.getresources(domain, Resolv::DNS::Resource::IN::MX)
    no_count = 0
    resmx.map do |r|
      if getv6(r.exchange.to_s) == 1
        no_count += 1
      end
    end
    if no_count > 0
      return "no".red
    else
      return "yes".green
    end
  end
end

table_rows = []

# run through the list of domains and check their MX records for associated AAAA records
domains.each do |d|
  domain = d[0]
  print "Checking #{domain}...                \r"
  next if blacklist.include? domain
  table_rows << [domain, getmx(domain)]
end

table = Terminal::Table.new :headings => ['DOMAIN', 'IPV6 SUPPORT?'], :rows => table_rows

puts table
