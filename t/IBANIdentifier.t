#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use TypeLibrary::FromXSD::Element;
use XML::LibXML;

my $xsd_element = qq!<?xml version="1.0" encoding="UTF-8"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="urn:sepade:xsd:pain.001.001.02" targetNamespace="urn:sepade:xsd:pain.001.001.02" elementFormDefault="qualified">
<xs:simpleType name="IBANIdentifier">
    <xs:restriction base="xs:string">
      <xs:pattern value="[a-zA-Z]{2,2}[0-9]{2,2}[a-zA-Z0-9]{1,30}"/>
    </xs:restriction>
  </xs:simpleType>
</xs:schema>!;

my ($node)  = XML::LibXML->new->parse_string( $xsd_element )->getDocumentElement->getElementsByTagName( 'xs:simpleType' );
my $element = TypeLibrary::FromXSD::Element->new( $node );

my $check   = q*declare IBANIdentifier =>
    as Str,
    where {
        ($_ =~ m![a-zA-Z]{2,2}[0-9]{2,2}[a-zA-Z0-9]{1,30}!)
    };*;
is $element->type, $check;

done_testing(); 
