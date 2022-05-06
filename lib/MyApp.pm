package MyApp;
use Moose;
use namespace::autoclean;

use Catalyst::Runtime 5.80;

use Catalyst qw/
  -Debug
  ConfigLoader
  Session
  Session::State::Cookie
  Session::Store::Dummy
  /;

extends 'Catalyst';

our $VERSION = '0.01';

__PACKAGE__->config(
    name => 'MyApp',

    # Disable deprecated behavior needed by old applications
    disable_component_resolution_regex_fallback => 1,
    enable_catalyst_header                      => 1,   # Send X-Catalyst header
    encoding => 'UTF-8',    # Setup request decoding and response encoding
);

__PACKAGE__->setup();

1;
