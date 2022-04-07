#!/usr/bin/env perl
use strict;
use warnings;
use FindBin qw($RealBin);
use POSIX qw(strftime);
use Term::ANSIColor qw(:constants);

my ($title)  = @ARGV;

my $out_dir = "$RealBin/../_posts";
die " FATAL ERROR: Expecting output directory in <$out_dir>.\n" unless (-d "$out_dir");
die " MISSING PARAMETER: Please type the post title as first parameter.\n" unless (defined $title);

my ($filename, $post_title) = stringToFilename($title);

print "Filename: ", BOLD, "$out_dir/$filename", RESET, "\n";
print "Title:    ", BOLD, "$post_title", RESET, "\n";

if (-e "$out_dir/$filename") {
	print STDERR RED " WARNING: Output file <$out_dir/$filename> was found: opening NANO in 3 seconds...", RESET, "\n";
	sleep 2;
} else {
	open (my $O, '>', "$out_dir/$filename") || die " FATAL ERROR: Unable to write to <$out_dir/$filename>.\n";
	print {$O} "---\nlayout: post\ntitle: $post_title\n---\n";
}

exec( qq(nano "$out_dir/$filename"));

sub stringToFilename {
	my $string = shift @_;
	my $title = $string;
	$string =~s/\s+/_/g;
	$string =~s/_/-/g;
	$string =~s/[^A-Za-z0-9-]//g;
	$title =~s/-/ /g;
	my $date = strftime "%Y-%m-%d", localtime;
	$string = $date .'-'.$string . '.md';
	return ($string, $title);
}
