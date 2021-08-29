#!/usr/bin/perl
our $projectroot = "/srv/gitweb/repo";
our $git_temp = "/srv/gitweb/.git/gitweb/tmp";
our $projects_list = $projectroot;
our $projects_list_categories_group = 1;

$feature{'remote_heads'}{'default'} = [1];
