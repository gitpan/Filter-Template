#!/usr/bin/perl
# $Id: Makefile.PL 18 2009-07-27 04:41:20Z rcaputo $

use ExtUtils::MakeMaker;

# Touch CHANGES so it exists.
open(CHANGES, ">>CHANGES") and close CHANGES;

WriteMakefile(
	NAME         => 'Filter::Template',
	AUTHOR       => 'Rocco Caputo <rcaputo@cpan.org>',
	ABSTRACT     => 'Source filter for inline code templating.',
	LICENSE      => 'perl',
	VERSION_FROM => 'lib/Filter/Template.pm',
	META_ADD     => {
		resources  => {
			license    => 'http://dev.perl.org/licenses/',
			repository => 'http://thirdlobe.com/svn/filter-template/trunk'
		},
	},
	PREREQ_PM    => {
		'Filter::Util::Call'  => 1.06,
		'Test::More'          => 0,
	},
	dist         => {
		COMPRESS   => 'gzip -9f',
		SUFFIX     => 'gz',
		PREOP      => (
			'svn-log.perl tee ./$(DISTNAME)-$(VERSION)/CHANGES > ./CHANGES'
		),
	},
);