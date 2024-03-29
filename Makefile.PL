
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "AnyEvent hiredis API",
  "AUTHOR" => "Whitney Jackson",
  "BUILD_REQUIRES" => {
    "Exporter" => 0,
    "File::Which" => 0,
    "FindBin" => 0,
    "Test::Exception" => 0,
    "Test::More" => 0,
    "Test::TCP" => 0,
    "base" => 0,
    "ok" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "AnyEvent-Hiredis",
  "EXE_FILES" => [
    "bin/compare.pl",
    "bin/bench.pl"
  ],
  "LICENSE" => "perl",
  "NAME" => "AnyEvent::Hiredis",
  "PREREQ_PM" => {
    "AnyEvent" => 0,
    "AnyEvent::Redis" => 0,
    "Benchmark" => 0,
    "Hiredis::Async" => 0,
    "feature" => 0,
    "namespace::autoclean" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.04",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



