#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use TypeLibrary::FromXSD::Element;

my $xsd_element = qq!<xs:simpleType name="DocumentType3Code">
    <xs:restriction base="xs:string">
      <xs:enumeration value="RADM"/>
      <xs:enumeration value="RPIN"/>
      <xs:enumeration value="FXDR"/>
      <xs:enumeration value="DISP"/>
      <xs:enumeration value="PUOR"/>
      <xs:enumeration value="SCOR"/>
    </xs:restriction>
  </xs:simpleType>!;

my $element     = TypeLibrary::FromXSD::Element->new( $xsd_element );

my $check   = qq!!;
is $element->type, $check;

done_testing(); 
