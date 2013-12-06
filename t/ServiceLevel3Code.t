#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use TypeLibrary::FromXSD::Element;

my $xsd_element = qq!<xs:simpleType name="ServiceLevel3Code">
    <xs:restriction base="xs:string">
      <xs:enumeration value="SEPA"/>
    </xs:restriction>
  </xs:simpleType>!;

my $element     = TypeLibrary::FromXSD::Element->new( $xsd_element );

my $check   = qq!!;
is $element->type, $check;

done_testing(); 
