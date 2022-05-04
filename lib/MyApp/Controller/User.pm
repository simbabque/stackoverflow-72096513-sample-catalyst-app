package MyApp::Controller::User;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

__PACKAGE__->config( namespace => 'user' );

sub auto : Private {
    my ( $self, $c ) = @_;

    unless ( $c->session->{data}->{id} ) {
        # we have to initialise data first because the model depends on it
        $c->session->{data} = {}; 
        $c->session->{data}->{id} = $c->model('API::User')->create;
    }
    return 1;
}

sub index_get : Path('') Args(0) GET {
    my ( $self, $c ) = @_;

    $c->stash->{json_data} = $c->model('API::User')->read;

    return;
}

sub index_post : Path('') Args(0) POST {
    my ( $self, $c ) = @_;

    $c->stash->{json_data} = $c->model('API::User')->write;

    return;
}

__PACKAGE__->meta->make_immutable;
