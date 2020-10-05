#!/usr/bin/perl

use JSON::PP;
use File::Copy;
use strict;

my $repository = "jharner/rspark-tutorial";
my $versionFile = ".rspark-version";
my $defaultVersion = "v0.1.6";
my $localDir = "./rspark-tutorial";

my $ts = time() . "_" . rand();
my $fname = "/tmp/foobar.$ts.zip";
my $vers = getLastVersion();
my @items = getVersions();

MAIN: while (my ($index, $item) = each @items) {
	my $oname = $item->{'name'};
	my $url = $item->{'url'};
	if ($oname eq $vers) {
		if ($index == 0) { last; } # do nothing if most recent version
		my $upItem = $items[$index - 1];
		my $name = $upItem->{'name'};
		$url = $upItem->{'url'};
		print "updating from $oname to $name\n";
		my $destDir = "/tmp/$ts";
		downloadZip($url, $destDir);
		`unzip -d $destDir -qo $fname`;
		unless ([-d $destDir]) {
			die "failed to unzip\n";
			exit;
		}
		opendir(DIR, $destDir) || die "failed to unload unzipped data";
		my $first = "";
		while (my $cur = readdir(DIR)) {
			# find first file that doesn't start with a ., which should be directory with contents
			if ("." eq substr($cur, 0, 1)) { next; } # might be a .DS_Store file
			$first = $cur;
			last;
		}
		closedir(DIR);
		unless (-d "$destDir/$first") { die "failed to find unzipped data"; }
		system("rm -rf $localDir");
		system("mv $destDir/$first $localDir");
		print "update complete\n";
		#save last version downloaded
		my $handle;
		open ($handle, '>', $versionFile) || die "failed to write version file: $!";
		print $handle $name;
		close(handle);
		last MAIN;
	}
}

exec 'docker-compose up';

END {
	unlink $fname;
	system("rm -rf /tmp/$ts");
}

sub getLastVersion() {
	if (! -e $versionFile) { return $defaultVersion; }
	open my $fh, '<', $versionFile or return $defaultVersion;
	my $content;
	read $fh, my $content, -s $fh;
	close $fh;
	chomp $content;
	return $content;
}

sub downloadZip() {
	my ($url, $dest) = @_;
	my $req = "curl -sL -o $fname $url";
	`$req`;
	if (! -e "$fname") {
		die "failed to download zip file\n";
	}
	`unzip -d $dest -qo $fname`;
	unless ([-d $dest]) {
		die "failed to unzip\n";
	}
	my $redirect = `curl -sv $url 2>&1 | grep -i Location:`;
	$redirect =~ s#.*?(https://.*)#$1#;
	my $req = "curl -s -o $fname $redirect";
	`$req`;
}

# returns a hash with keys being tags and values being urls for zip files
sub getVersions() {
	my $EOL="\015\012";
	my $BLANK = $EOL x 2;
	my $rawJson = `curl -sL -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/$repository/tags`;
	my $json = decode_json $rawJson;
	my @items;
	foreach my $item (@$json) {
		my @keys = keys %$item;
		my $name = $item->{'name'};
		my $url = $item->{'zipball_url'};
		my %data = ( "url" => $url, "name" => $name );
		push(@items, \%data);
	}
	return @items;
}
