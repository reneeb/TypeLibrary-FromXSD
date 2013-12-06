#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use TypeLibrary::FromXSD::Element;

my $xsd_element = qq!<xs:simpleType name="IBEIIdentifier">
    <xs:restriction base="xs:string">
      <xs:pattern value="[A-Z]{2,2}[B-DF-HJ-NP-TV-XZ0-9]{7,7}[0-9]{1,1}"/>
    </xs:restriction>
  </xs:simpleType>!;

my $element     = TypeLibrary::FromXSD::Element->new( $xsd_element );

my $check   = qq!!;
is $element->type, $check;

done_testing(); 
