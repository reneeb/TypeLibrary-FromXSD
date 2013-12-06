#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use TypeLibrary::FromXSD::Element;

my $xsd_element = qq!<xs:simpleType name="CHIPSUniversalIdentifier">
    <xs:restriction base="xs:string">
      <xs:pattern value="CH[0-9]{6,6}"/>
    </xs:restriction>
  </xs:simpleType>!;

my $element     = TypeLibrary::FromXSD::Element->new( $xsd_element );

my $check   = q*declare CHIPSUniversalIdentifier =>
    as Str,
    where {
        ($_ =~ m!CH[0-9]{6,6}!)
    }*;
is $element->type, $check;

done_testing(); 
