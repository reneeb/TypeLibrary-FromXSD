#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use TypeLibrary::FromXSD::Element;

my $xsd_element = qq!<xs:simpleType name="CurrencyAndAmount_SimpleType">
    <xs:restriction base="xs:decimal">
      <xs:minInclusive value="0"/>
      <xs:fractionDigits value="5"/>
      <xs:totalDigits value="18"/>
    </xs:restriction>
  </xs:simpleType>!;

my $element     = TypeLibrary::FromXSD::Element->new( $xsd_element );

my $check   = q*declare CurrencyAndAmount_SimpleType =>
    as Num,
    where {
        ($_ <= 0) &&
        (length( (split /\./, $_)[1] ) == 5) &&
        (tr/0123456789// == 18)
    }*;
is $element->type, $check;

done_testing(); 
