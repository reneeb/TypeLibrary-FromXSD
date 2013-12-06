#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use TypeLibrary::FromXSD::Element;

my $xsd_element = qq!<xs:simpleType name="Max15NumericText">
    <xs:restriction base="xs:string">
      <xs:pattern value="[0-9]{1,15}"/>
    </xs:restriction>
  </xs:simpleType>!;

my $element     = TypeLibrary::FromXSD::Element->new( $xsd_element );

my $check   = qq!!;
is $element->type, $check;

done_testing(); 
