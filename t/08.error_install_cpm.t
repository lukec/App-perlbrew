#!/usr/bin/env perl
use Test2::V0;

use FindBin;
use lib $FindBin::Bin;
use App::perlbrew;
require 'test2_helpers.pl';

no warnings 'redefine';
sub App::perlbrew::http_get { "" }

like(
    dies {
        my $app = App::perlbrew->new("install-cpm");
        $app->run;
    },
    qr[ERROR: Failed to retrieve cpm executable.]
);

done_testing;
