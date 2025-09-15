#!/usr/bin/perl

use strict;
use warnings;
use Schedule::Easing::Block;
use Test::More tests=>4;

subtest 'Initialization'=>sub {
	eval { my $ease=Schedule::Easing::Block->new(match=>qr/./) };
	is($@,'','Basic initialization');
};

subtest 'Matches'=>sub {
	plan tests=>2;
	my $ease=Schedule::Easing::Block->new(match=>qr/hello/);
	is_deeply({$ease->matches('hello world')},{matched=>1},'Matches');
	is_deeply({$ease->matches('bye world')},  {},          'No match');
};

subtest 'Includes'=>sub {
	plan tests=>2;
	my $ease=Schedule::Easing::Block->new(match=>qr/a/);
	is($ease->includes(),             0,'ts undefined');
	is($ease->includes(1),            0,'ts defined');
};

subtest 'Schedule'=>sub {
	plan tests=>1;
	my $ease=Schedule::Easing::Block->new(match=>qr/a/);
	ok(!defined($ease->schedule()),'Always undefined');
};

