#!/usr/bin/perl
use strict;
use warnings;
use File::Basename;
use File::Find::Rule;
use File::Which;
use Getopt::Long;
use Log::Log4perl;
use REST::Client;

#-- find ffprobe and ffmpeg
my $ffmpeg_exe  = which('ffmpeg')  || die "Cannot find 'ffmpeg' in PATH";
my $ffprobe_exe = which('ffprobe') || die "Cannot find 'ffprobe' in PATH";

#-- get options (starting directory)

#-- get API key for TVDB
my ($tvdb_api_key, $moviedb_api_key) = &GetApiKey();

#-- get list of all .mkv and .avi files
my @mkv_files = File::Find::Rule->file()->name( '*.mkv', '*.avi')->in( qw{ . } );

#-- start processing files
foreach my $mkv_file (@mkv_files)
{
	print STDOUT $mkv_file, "\n";
	
	#-- get best guess at name
	my ($show_name, $season, $episode ) = &ParseShowDetailsFromFileName($mkv_file);

	#-- look up in TVDB database
	#--  use your own API key for this. Read from API file


	#-- encode the mkv videdo
	EncodeVideo($mkv_file);
}

=head2 GetApiKey

Gets the API key from a file called "TVDB.API" and "MOVIEDB.API" in the same directory as this file.

=cut
sub GetApiKey
{
	my $tvdb_api_key = '';
	my $moviedb_api_key = '';
	if ( -e "TVDB.API")
	{
		open my $file, '<', "TVDB.API"; 
		$tvdb_api_key = <$file>; 
		close $file;
	}
	if ( -e "MOVIEDB.API" )
	{
		open my $file, '<', "MOVIEDB.API";
		$moviedb_api_key = <$file>;
		close $file;
	}
	($tvdb_api_key, $moviedb_api_key);
}

=head2 ParseShowDetailsFromFileName

Gets the best guess for a show name, season and episode number.

=cut
sub ParseShowDetailsFromFileName
{
	#-- need unit tests for this
	my $file_path = shift @_;
	my ($file_name, $directory, $extension) = fileparse($file_path);
	
	#-- if the file matches to S0nE0m, the directory has the TV name
	
	#-- otherwise it's a movie title
	#-- need to consider TVDB and movie DB
	
	#-- movie db
	# -- http://api.themoviedb.org/3/search/movie?api_key=APIKEY&query=MOVIENAME
	# require 'rubygems' if RUBY_VERSION < '1.9'
    # require 'rest_client'
	# headers  = {:accept => "application/json"}
    # response = RestClient.get "http://themoviedb.apiary.io/3/search/movie", headers
    # puts response

	#-- return the show name, season, episode

}

=head2 EncodeVideo

Encodes the video to an .mp4

=cut
sub EncodeVideo
{
	my $file_name = shift @_;
	#-- ffmpeg -profile:v main -level 4.0 -v quiet  -i S01E01\ -\ Pilot.mkv S01E01\ -\ Pilot.mp4
	
	
}
