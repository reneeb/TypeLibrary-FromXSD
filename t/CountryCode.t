#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use TypeLibrary::FromXSD::Element;

my $xsd_element = qq!<xs:simpleType name="CountryCode">
    <xs:restriction base="xs:string">
      <xs:pattern value="[A-Z]{2,2}"/>
    </xs:restriction>
  </xs:simpleType>!;

my $element     = TypeLibrary::FromXSD::Element->new( $xsd_element );

my $check   = q*declare CountryCode =>
    as Str,
    where {
        (S_ =~ m![A-Z]{2,2}!)
    }*;
is $element->type, $check;

done_testing(); 
