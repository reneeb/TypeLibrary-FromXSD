#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use TypeLibrary::FromXSD::Element;

my $xsd_element = qq!<xs:simpleType name="DocumentType2Code">
    <xs:restriction base="xs:string">
      <xs:enumeration value="MSIN"/>
      <xs:enumeration value="CNFA"/>
      <xs:enumeration value="DNFA"/>
      <xs:enumeration value="CINV"/>
      <xs:enumeration value="CREN"/>
      <xs:enumeration value="DEBN"/>
      <xs:enumeration value="HIRI"/>
      <xs:enumeration value="SBIN"/>
      <xs:enumeration value="CMCN"/>
      <xs:enumeration value="SOAC"/>
      <xs:enumeration value="DISP"/>
    </xs:restriction>
  </xs:simpleType>!;

my $element     = TypeLibrary::FromXSD::Element->new( $xsd_element );

my $check   = qq!!;
is $element->type, $check;

done_testing(); 
