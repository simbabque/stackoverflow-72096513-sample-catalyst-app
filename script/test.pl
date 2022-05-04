#!/usr/bin/env perl
use strict;
use warnings;

use HTTP::CookieJar::LWP ();
use LWP::UserAgent       ();
use JSON 'decode_json';

my $ua1 = LWP::UserAgent->new( cookie_jar => HTTP::CookieJar::LWP->new );
my $ua2 = LWP::UserAgent->new( cookie_jar => HTTP::CookieJar::LWP->new );

request( get  => $ua1 );
request( post => $ua1 );
request( post => $ua1 );
request( get  => $ua1 );
request( post => $ua2 );
request( get  => $ua1 );

sub request {
    my ( $method, $ua ) = @_;
    my $res = $ua->$method('http://localhost:3000/user');
    if ( $res->is_success ) {
        my $json = decode_json( $res->content );
        printf "user %d - %d writes\n", @$json{qw/id number_of_writes/};
    }
}
