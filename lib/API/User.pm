package API::User;

use Moose;
use DBI;

has metadata => (
    isa      => 'HashRef',
    is       => 'ro',
    required => 1,           # either it's required or it has a default
);

has dbh => (
    isa      => 'DBI::db',
    is       => 'ro',
    required => 1,
);

sub create {
    my $self = shift;

    my $dbh = $self->dbh;

    my $sql = 'INSERT INTO `user` DEFAULT VALUES';
    my $sth = $dbh->prepare($sql);

    $sth->execute;

    return $dbh->last_insert_id;
}

sub read {
    my ($self) = @_;

    my $sql = 'SELECT id, number_of_writes FROM user WHERE id=?';
    my $sth = $self->dbh->prepare($sql);

    $sth->execute( $self->metadata->{id} );

    return $sth->fetchrow_hashref;
}

sub write {
    my ($self) = @_;

    my $sql =
      'UPDATE user SET number_of_writes=number_of_writes + 1 WHERE id=?';
    my $sth = $self->dbh->prepare($sql);

    $sth->execute( $self->metadata->{id} );

    return $self->read;
}

__PACKAGE__->meta->make_immutable;
