#!/usr/bin/env perl

use strict;
use warnings;

sub process_file($)
{
    open FR, '<', $_[0];
    my @c = <FR>;
    close FR;

    foreach (@c) {
        # https://lh4.googleusercontent.com/-GWp05gBMM6M/U9w0zIvbkhI/AAAAAAAAaPU/BrZpHnA_gfc/w2048-h1365/T49A1307.jpg
        if (m,"(https://lh\d+\.googleusercontent\.com/[a-zA-Z0-9/_\-]+?/w\d+-h\d+[^"]+\.(jpg|png|gif|JPG|PNG|GIF))",) {
            print $1, "\n";
        }
        # https://lh5.googleusercontent.com/-5qwoDzVXd2w/U9y4x3wZMbI/AAAAAAAAj8E/JF9jK-7VhyU/w1280-h720/2%2B-%2B2
        elsif (m,"(https://lh\d+\.googleusercontent\.com/[a-zA-Z0-9/_\-]+?/w\d+-h\d+/[^"]+)",) {
            print $1, "\n";
        }

        # https://lh3.googleusercontent.com/-5qwoDzVXd2w/U9y4x3wZMbI/AAAAAAAAj8E/JF9jK-7VhyU/w1086-h611-no/2%2B-%2B2
    }
}

sub main(@)
{
    process_file($_[0]);
}

main(@ARGV);

__END__
