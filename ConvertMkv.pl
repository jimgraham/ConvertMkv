#!/usr/bin/perl
use strict;
use warnings;
use File::Find::Rule;
use File::Which;
use Getopt::Long;

#-- find ffprobe and ffmpeg
my $ffmpeg_exe  = which('ffmpeg')  || die "Cannot find 'ffmpeg' in PATH";
my $ffprobe_exe = which('ffprobe') || die "Cannot find 'ffprobe' in PATH";

#-- get options (starting directory)

#-- get API key for TVDB
my $api_key = &GetApiKey();

#-- get list of all .mkv files.
my @mkv_files = File::Find::Rule->file()->name( '*.mkv' )->in( qw{ . } );

#-- start processing files
foreach my $mkv_file (@mkv_files)
{
	print STDOUT $mkv_file, "\n";
	
	#-- get best guess at name
	my ($show_name, $season, $episode ) = &ParseShowDetailsFromFileName($mkv_file);

	#-- look up in TVDB database
	#--  use your own API key for this. Read from API file


	#-- encode the mkv videdo
}

=head2 GetApiKey

Gets the API key from a file called "API" in the same directory as this file.

=cut
sub GetApiKey
{
	my $api_key = '';
	if ( -e "API")
	{
		open my $file, '<', "API"; 
		$api_key = <$file>; 
		close $file;
	}
	$api_key;
}

=head2 ParseShowDetailsFromFileName

Gets the best guess for a show name, season and episode number.

=cut
sub ParseShowDetailsFromFileName
{
	my $file_name = shift @_;
	#-- return the show name, season, episode
}
