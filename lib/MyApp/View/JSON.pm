package MyApp::View::JSON;

use Moose;
BEGIN { extends 'Catalyst::View::JSON' }

__PACKAGE__->config( { expose_stash => 'json_data' } );

__PACKAGE__->meta->make_immutable( inline_constructor => 0 );
