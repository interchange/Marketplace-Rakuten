use 5.006;
use strict;
use warnings FATAL => 'all';
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'Marketplace::Rakuten',
    AUTHOR           => q{Marco Pessotto <melmothx@gmail.com>},
    VERSION_FROM     => 'lib/Marketplace/Rakuten.pm',
    ABSTRACT_FROM    => 'lib/Marketplace/Rakuten.pm',
    LICENSE          => 'Artistic_2_0',
    PL_FILES         => {},
    MIN_PERL_VERSION => 5.006,
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 0,
    },
    BUILD_REQUIRES => {
        'Test::More' => 0,
    },
    PREREQ_PM => {
        'Moo' => 0,
        'namespace::clean' => 0,
        'MooX::Types::MooseLike' => 0,
        'HTTP::Tiny' => 0,
        'XML::LibXML::Simple' => 0,
        'DateTime' => 0,
        'DateTime::Format::ISO8601' => 0,
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'Marketplace-Rakuten-*' },
    META_MERGE => {
        resources => {
            repository  => 'https://github.com/interchange/Marketplace-Rakuten.git',
            bugtracker => 'https://github.com/interchange/Marketplace-Rakuten.git/issues',
            IRC => 'irc://irc.freenode.net/#interchange',
        },
    },
);

# Local Variables:
# cperl-indent-parens-as-block: 1
# End:
