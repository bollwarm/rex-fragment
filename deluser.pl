
my $user=shift;

my $file='userlist.txt';

open my $Infile,'<',$file or die "open file error";

my @ip;

while(<$Infile>) {
  chomp;
   next unless /$user/;
   my $ip=$1 if /^([^:]*):/;
   push @ip,$ip;

}

close $Infile;

open my $Outfile,'>',"all.ip" or die "open file error";

print $Outfile "[all]\n";
print $Outfile  "$_\n" for(@ip);

close $Outfile;

print   "$_\n" for(@ip);


my $dostr="rex -qw  userdel --u=$user";

print "begin do: $dostr\n";

print `$dostr`;

