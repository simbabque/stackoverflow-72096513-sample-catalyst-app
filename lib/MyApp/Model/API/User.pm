package MyApp::Model::API::User;

use strict;
use warnings;

use API::User;

use parent 'Catalyst::Model::DBI';

sub ACCEPT_CONTEXT {
    my ( $self, $c, @args ) = @_;

    $c->log->debug( sprintf 'Creating a new API::User object for %s line %d',
        ( caller(2) )[ 0, 2 ] );

    return API::User->new(
        dbh      => $self->dbh,
        metadata => $c->session->{data},
    );
}

1;