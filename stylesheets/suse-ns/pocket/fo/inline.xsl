<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet 
[
  <!ENTITY % fontsizes SYSTEM "fontsizes.ent">
  %fontsizes;
]>
<xsl:stylesheet exclude-result-prefixes="d"
                 version="1.0"
  xmlns:fo="http://www.w3.org/1999/XSL/Format"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:d="http://docbook.org/ns/docbook">

<xsl:template match="d:keycap">
  <xsl:text>[</xsl:text>
  <xsl:apply-imports/>
  <xsl:text>]</xsl:text>
</xsl:template>

<xsl:template match="d:command">
  <fo:inline font-weight="500">
    <xsl:apply-imports/>
  </fo:inline>
</xsl:template>
  
</xsl:stylesheet>
