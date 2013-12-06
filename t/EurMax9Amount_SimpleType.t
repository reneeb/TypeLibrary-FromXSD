#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use TypeLibrary::FromXSD::Element;

my $xsd_element = qq!<xs:simpleType name="EurMax9Amount_SimpleType">
    <xs:restriction base="xs:decimal">
      <xs:minInclusive value="0.01"/>
      <xs:fractionDigits value="2"/>
      <xs:totalDigits value="11"/>
      <xs:maxInclusive value="999999999.99"/>
    </xs:restriction>
  </xs:simpleType>!;

my $element     = TypeLibrary::FromXSD::Element->new( $xsd_element );

my $check   = qq!!;
is $element->type, $check;

done_testing(); 
