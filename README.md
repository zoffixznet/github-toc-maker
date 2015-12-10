# github-toc-maker
Parse README.md and generate a clickable Table of Contents you can insert into it

# INSTALLATION

You will need [Mojolicious](https://metacpan.org/pod/Mojolicious) Perl 5 module
installed.

# USAGE

    ./toc-maker.pl URL-to-repo-home-page

e.g.:

    ./toc-maker.pl https://github.com/zoffixznet/perl6-Lingua-Conjunction/

The script will print Markdown code that you can copy/paste into your
README.md now. Here's an example of the generated code:

```markdown
    # Table of Contents
    - [NAME](#name)
    - [SYNOPSIS](#synopsis)
    - [Table of Contents](#table-of-contents)
    - [DESCRIPTION](#description)
    - [EXPORTED SUBROUTINES](#exported-subroutines)
        - [`conjunction`](#conjunction)
            - [`alt`](#alt)
            - [`con`](#con)
            - [`dis`](#dis)
            - [`lang`](#lang)
            - [`last`](#last)
            - [`sep`](#sep)
            - [`str`](#str)
            - [`type`](#type)
    - [REPOSITORY](#repository)
    - [BUGS](#bugs)
    - [AUTHOR](#author)
    - [LICENSE](#license)
```

# AUTHOR

Zoffix Znet (http://zoffix.com/)

# LICENSE

You can use and distribute this module under the terms of the
The Artistic License 2.0. See the `LICENSE` file included in this
distribution for complete details.
