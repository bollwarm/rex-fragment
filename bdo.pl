#!/usr/bin/perl

#This is a example for done for diffent ip user pass and port
# do task for ours;

my $cmd=shift;
my @server=<DATA>;
for(@server) { 
#print $_,"\n";
#next if /^#/;
unless (/^#/) { 
my ($pro,$server,$user,$password,$port)=split;

print "begin \n";
$myresult=`rex -qw -E $pro -H $server -f Rexfile $cmd `;

print $myresult;

}
}
__DATA__
XX1 192.168.1.12 user1 pass1 22
XX2 192.168.11.3 user2 pas2 23 
XX3 192.168.12.5 use3 pass3 322
XX4 192.168.17.7 use4 pass4 8022
XX6 192.168.42.8 use5 pass5 7622 
