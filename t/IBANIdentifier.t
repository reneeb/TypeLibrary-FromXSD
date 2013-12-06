#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use TypeLibrary::FromXSD::Element;

my $xsd_element = qq!<xs:simpleType name="IBANIdentifier">
    <xs:restriction base="xs:string">
      <xs:pattern value="[a-zA-Z]{2,2}[0-9]{2,2}[a-zA-Z0-9]{1,30}"/>
    </xs:restriction>
  </xs:simpleType>!;

my $element     = TypeLibrary::FromXSD::Element->new( $xsd_element );

my $check   = qq!!;
is $element->type, $check;

done_testing(); 
