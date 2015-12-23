#!/usr/bin/env perl

use strictures;
use 5.010;
use Mojo::UserAgent;

@ARGV or die "Usage: $0 URL-to-repo-homepage\n";
my $dom = Mojo::UserAgent->new( max_redirects => 5 )->get( shift )->res->dom;

my $h
= $dom->find( join ',', map "article.markdown-body.entry-content h$_", 1..6 );

say '# TABLE OF CONTENTS';
for ( $h->each ) {
    my ( $indent )= $_->tag =~ /(\d+)/;
    my $url = $_->at('a:first-child')->{href};
    $_->at('a:first-child')->remove;
    $_->find('a')->map('remove');
    my $content = $_->content =~ s{</?code>}{`}gr;
    $content =~ s/^\s+|\s+$//g;

    say +('    ' x ($indent-1) ) . "- [$content]($url)";
}

