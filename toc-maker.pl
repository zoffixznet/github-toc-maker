#!/usr/bin/env perl

use strict;
use warnings;
use 5.010;
use Mojo::UserAgent;
use IO::Socket::SSL;

@ARGV or die "Usage: $0 URL-to-repo-homepage [selector-prefix]\n";
my $dom = Mojo::UserAgent->new( max_redirects => 5 )->get( shift )->res->dom;

my $selector = shift || 'article.markdown-body.entry-content';
my $h = $dom->find( join ',', map "$selector h$_", 1..6 );

say '# TABLE OF CONTENTS';
for ( $h->each ) {
    my ( $indent )= $_->tag =~ /(\d+)/;
    my $url = $_->at('a:first-child')->{href};
    $_->find('a')->map('remove');
    my $content = $_->content =~ s{</?code>}{`}gr;
    $content =~ s/^\s+|\s+$//g;

    say +('    ' x ($indent-1) ) . "- [$content]($url)";
}
