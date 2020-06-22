<?xml version="1.0" encoding="UTF-8"?>
<!-- $Id: $ -->
<xsl:stylesheet exclude-result-prefixes="d"
                 version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:d="http://docbook.org/ns/docbook"
    xmlns:fo="http://www.w3.org/1999/XSL/Format">

<xsl:template match="d:glossentry/d:glossterm" mode="glossary.as.blocks">
  <xsl:variable name="id">
    <xsl:call-template name="object.id"/>
  </xsl:variable>
  <fo:inline id="{$id}" xsl:use-attribute-sets="glossterm.properties">
    <xsl:apply-templates/>
  </fo:inline>
  <xsl:if test="following-sibling::d:glossterm">, </xsl:if>
</xsl:template>


</xsl:stylesheet>
