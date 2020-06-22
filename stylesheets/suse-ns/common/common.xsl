<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="d"
                 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:d="http://docbook.org/ns/docbook" version="1.0">

 <xsl:template match="d:step" mode="number">
  <xsl:param name="rest" select="''"/>
  <xsl:param name="recursive" select="1"/>
  <xsl:variable name="format">
   <xsl:call-template name="procedure.step.numeration"/>
  </xsl:variable>
  <xsl:variable name="num">
   <xsl:number count="d:step" format="{$format}"/>
  </xsl:variable>
  
  <xsl:choose>
   <xsl:when test="$recursive != 0 and ancestor::d:step">
    <xsl:apply-templates select="ancestor::d:step[1]" mode="number">
     <xsl:with-param name="rest" select="concat($num, $rest)"/>
    </xsl:apply-templates>
   </xsl:when>
   <xsl:otherwise>
    <xsl:value-of select="concat($num, $rest)"/>
   </xsl:otherwise>
  </xsl:choose>
 </xsl:template>

</xsl:stylesheet>
