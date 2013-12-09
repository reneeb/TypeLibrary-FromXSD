#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use TypeLibrary::FromXSD::Element;
use XML::LibXML;

my $xsd_element = qq!<?xml version="1.0" encoding="UTF-8"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="urn:sepade:xsd:pain.001.001.02" targetNamespace="urn:sepade:xsd:pain.001.001.02" elementFormDefault="qualified">
<xs:simpleType name="ISODateTime">
    <xs:restriction base="xs:dateTime"/>
  </xs:simpleType>
</xs:schema>!;

my ($node)  = XML::LibXML->new->parse_string( $xsd_element )->getDocumentElement->getElementsByTagName( 'xs:simpleType' );

{
    my $element = TypeLibrary::FromXSD::Element->new( $node );

    my $check   = q*declare ISODateTime =>
    as Str,
    where {
        ($_ =~ m{\A-?[0-9]{4,}-[0-9]{2}-[0-9]{2}T[0-2][0-9]:[0-5][0-9]:[0-5][0-9](?:Z|[-+]?[0-2][0-9]:[0-5][0-9])?\z})
    };*;
    is $element->type, $check;
}

{
    my $element = TypeLibrary::FromXSD::Element->new( $node, validate => { dateTime => 'validate_datetime' } );

    my $check   = q*declare ISODateTime =>
    as Str,
    where {
        ($_ =~ m{\A-?[0-9]{4,}-[0-9]{2}-[0-9]{2}T[0-2][0-9]:[0-5][0-9]:[0-5][0-9](?:Z|[-+]?[0-2][0-9]:[0-5][0-9])?\z}) && 
        (validate_datetime($_))
    };*;
    is $element->type, $check;
}

done_testing(); 
