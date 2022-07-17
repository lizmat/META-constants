sub EXPORT($DISTRIBUTION) {
    if $DISTRIBUTION.can("meta") {
        my %META := $DISTRIBUTION.meta;
        Map.new: (
          META        => %META,
          NAME        => %META<name>,
          DESCRIPTION => %META<description>,
          VERSION     => %META<version>.Version,
          AUTH        => %META<auth>,
          AUTHORS     => %META<authors>.join(', '),
        )
    }
    else {
        die $DISTRIBUTION.^name ~ ' cannot call .meta';
    }
}

=begin pod

=head1 NAME

META::constants - distribution related constants from META info

=head1 SYNOPSIS

=begin code :lang<raku>

use META::constants $?DISTRIBUTION;

say NAME;
say DESCRIPTION;
say VERSION;
say AUTH;
say AUTHORS;

=end code

=head1 DESCRIPTION

META::constants provides an easy way to access information in a
module's META information.  It is intended to be called inside the
code of a module only, although anything that provides a C<.meta>
method, can be used.

=head1 EXPORTED CONSTANTS

=item NAME - the "name" field
=item DESCRIPTION - the "description" field
=item VERSION - the "version" field as a Version object
=item AUTH - the "auth" field
=item AUTHORS - the "authors" field, joined by ', '
=item META - the meta information hash itself

=head1 AUTHOR

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/META-constants .
Comments and Pull Requests are welcome.

If you like this module, or what I’m doing more generally, committing to a
L<small sponsorship|https://github.com/sponsors/lizmat/>  would mean a great
deal to me!

=head1 COPYRIGHT AND LICENSE

Copyright 2022 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

# vim: expandtab shiftwidth=4
