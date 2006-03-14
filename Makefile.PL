#!/usr/bin/perl
# $Id: Makefile.PL 6 2006-03-13 15:17:37Z rcaputo $

use ExtUtils::MakeMaker;

# Touch CHANGES so it exists.
open(CHANGES, ">>CHANGES") and close CHANGES;

WriteMakefile(
	NAME         => 'Filter::Template',
	AUTHOR       => 'Rocco Caputo <rcaputo@cpan.org>',
	ABSTRACT     => 'Source filter for inline code templating.',
	VERSION_FROM => 'lib/Filter/Template.pm',

	PREREQ_PM    => {
		'Filter::Util::Call'  => 1.0601,
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
