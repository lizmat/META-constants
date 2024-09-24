my sub release($of) { $of.version.Str.subst(/ '.' g .+ /) }

sub EXPORT(\DISTRIBUTION) {
    my %META; %META := $_ with try DISTRIBUTION.meta;
    my $compiler := Compiler.new;
    my $vm       := VM.new;

    my $NAME        = %META<name> // "";
    my $DESCRIPTION = %META<description> // "";
    my $VERSION     = (%META<version> // "").Version;
    my $API         = %META<api> // "";
    my $AUTH        = %META<auth> // "";
    my $AUTHORS     = (%META<authors> // ()).join(', ');
    my $SOURCE-URL  = (%META<source-url> // ()).subst(/ \.git $/);
    my $CREDITS     = $NAME ?? qq:to/CREDITS/.chomp !! "";
Provided by $NAME - $VERSION by $AUTHORS,
  implemented in the Raku® Programming Language $*RAKU.version(),
  running on $compiler.name.tc()™ &release($compiler), built on $vm.name.tc() &release($vm).

Suggestions / bug reports / general comments are welcome at
  $SOURCE-URL
CREDITS

    Map.new: (
      :%META, :$NAME, :$DESCRIPTION, :$VERSION, :$API,
      :$AUTH, :$AUTHORS, :$SOURCE-URL, :$CREDITS
    )
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
say API;
say AUTH;
say AUTHORS;
say SOURCE-URL;
say CREDITS;

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
=item API - the "api" field
=item AUTHORS - the "authors" field, joined by ', '
=item SOURCE-URL - the "source-url" field with ".git" removed
=item CREDITS - a credit text created from above
=item META - the meta information hash itself

=head1 AUTHOR

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/META-constants .
Comments and Pull Requests are welcome.

If you like this module, or what I’m doing more generally, committing to a
L<small sponsorship|https://github.com/sponsors/lizmat/>  would mean a great
deal to me!

=head1 COPYRIGHT AND LICENSE

Copyright 2022, 2024 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

# vim: expandtab shiftwidth=4
