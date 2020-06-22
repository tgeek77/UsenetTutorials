<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- $Id:  $ -->
<xsl:stylesheet exclude-result-prefixes="d"
                 version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:d="http://docbook.org/ns/docbook"
    xmlns:fo="http://www.w3.org/1999/XSL/Format">
  

<xsl:template match="d:cmdsynopsis[1]">
  <fo:block xsl:use-attribute-sets="normal.para.spacing">
    <fo:block>Usage:</fo:block>
    <xsl:apply-templates/>
  </fo:block>
</xsl:template>

<xsl:template match="d:synopfragment">
  <xsl:variable name="snum">
    <xsl:apply-templates select="." mode="synopfragment.number"/>
  </xsl:variable>
  <xsl:variable name="id">
    <xsl:call-template name="object.id"/>
  </xsl:variable>
  <fo:block id="{$id}" margin-left="1em" text-indent="-1em">
    <xsl:text>(</xsl:text>
    <xsl:value-of select="$snum"/>
    <xsl:text>)</xsl:text>
    <xsl:text> </xsl:text>
    <xsl:apply-templates/>
  </fo:block>
</xsl:template>
  
  
</xsl:stylesheet>