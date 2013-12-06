#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use TypeLibrary::FromXSD::Element;

my $xsd_element = qq!<xs:simpleType name="DecimalNumber">
    <xs:restriction base="xs:decimal">
      <xs:fractionDigits value="17"/>
      <xs:totalDigits value="18"/>
    </xs:restriction>
  </xs:simpleType>!;

my $element     = TypeLibrary::FromXSD::Element->new( $xsd_element );

my $check   = q*declare DecimalNumber =>
    as Num,
    where {
        (length( (split /\./, $_)[1] ) == 17) &&
        (tr/0123456789// == 18)
    };*;
is $element->type, $check;

done_testing(); 
