#!/usr/bin/perl -w

use strict;
use warnings;

use lib '../lib';

unless ( @ARGV == 2 ) {
    die "usage: perl get_recent.pl LOGIN PASSWORD\n";
}

use WWW::PAUSE::Recent;
my $pause = WWW::PAUSE::Recent->new(
    login   => shift,
    pass    => shift,
    ua_args => { timeout => 10, },
);

my $data = $pause->get_recent
    or die "Failed to fetch data: " . $pause->error;

foreach my $dist ( @$data ) {
    print "$dist->{dist} by $dist->{name} (size: $dist->{size})\n";
}

