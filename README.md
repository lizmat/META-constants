[![Actions Status](https://github.com/lizmat/META-constants/actions/workflows/test.yml/badge.svg)](https://github.com/lizmat/META-constants/actions)

NAME
====

META::constants - distribution related constants from META info

SYNOPSIS
========

```raku
use META::constants $?DISTRIBUTION;

say NAME;
say DESCRIPTION;
say VERSION;
say AUTH;
say AUTHORS;
```

DESCRIPTION
===========

META::constants provides an easy way to access information in a module's META information. It is intended to be called inside the code of a module only, although anything that provides a `.meta` method, can be used.

EXPORTED CONSTANTS
==================

  * NAME - the "name" field

  * DESCRIPTION - the "description" field

  * VERSION - the "version" field as a Version object

  * AUTH - the "auth" field

  * AUTHORS - the "authors" field, joined by ', '

  * META - the meta information hash itself

AUTHOR
======

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/META-constants . Comments and Pull Requests are welcome.

If you like this module, or what I’m doing more generally, committing to a [small sponsorship](https://github.com/sponsors/lizmat/) would mean a great deal to me!

COPYRIGHT AND LICENSE
=====================

Copyright 2022 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

