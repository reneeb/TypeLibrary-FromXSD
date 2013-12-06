#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use TypeLibrary::FromXSD::Element;

my $xsd_element = qq!<xs:simpleType name="AddressType2Code">
    <xs:restriction base="xs:string">
      <xs:enumeration value="ADDR"/>
      <xs:enumeration value="PBOX"/>
      <xs:enumeration value="HOME"/>
      <xs:enumeration value="BIZZ"/>
      <xs:enumeration value="MLTO"/>
      <xs:enumeration value="DLVY"/>
    </xs:restriction>
  </xs:simpleType>!;

my $element     = TypeLibrary::FromXSD::Element->new( $xsd_element );

my $check   = qq!declare AddressType2Code =>
    as enum ["ADDR","PBOX","HOME","BIZZ","MLTO","DLVY"];!;
is $element->type, $check;

done_testing(); 
