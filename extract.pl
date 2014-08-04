#!/usr/bin/env perl

use strict;
use warnings;

sub process_file($)
{
    my %collect = ();

    open FR, '<', $_[0];
    my @c = <FR>;
    close FR;

    foreach (@c) {
        # https://lh4.googleusercontent.com/-GWp05gBMM6M/U9w0zIvbkhI/AAAAAAAAaPU/BrZpHnA_gfc/w2048-h1365/T49A1307.jpg
        if (m,"(https://lh\d+\.googleusercontent\.com/[a-zA-Z0-9/_\-]+?/w\d+-h\d+[^"]+\.(jpg|png|gif|JPG|PNG|GIF))",) {
            $collect{$1} = 1 if not exists($collect{$1});
            # print $1, "\n";
        }

        # https://lh5.googleusercontent.com/-5qwoDzVXd2w/U9y4x3wZMbI/AAAAAAAAj8E/JF9jK-7VhyU/w1280-h720/2%2B-%2B2
        elsif (m,"(https://lh\d+\.googleusercontent\.com/[a-zA-Z0-9/_\-]+?/w\d+-h\d+/[^"]+)",) {
            $collect{$1} = 1 if not exists($collect{$1});
            # print $1, "\n";
        }

        # https://lh3.googleusercontent.com/-5qwoDzVXd2w/U9y4x3wZMbI/AAAAAAAAj8E/JF9jK-7VhyU/w1086-h611-no/2%2B-%2B2

        # ["https://lh3.googleusercontent.com/5INsKlb735vF1BTekhKiRv_DlaFcBJkR",1600,2400]
        elsif (m!\["(https://lh\d+\.googleusercontent\.com/[a-zA-Z0-9/_\-]+?)",(\d+),(\d+)\]!) {
            my $url = sprintf '%s=w%s-h%s-p-no', $1, $2, $3;
            $collect{$url} = 1 if not exists($collect{$url});
            # print $url, "\n";
        }
    }

    foreach (keys %collect) {
        print $_, "\n";
    }
}

sub main(@)
{
    process_file($_[0]);
}

main(@ARGV);

__END__
