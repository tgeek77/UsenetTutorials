<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:d="http://docbook.org/ns/docbook"
   xmlns:fo="http://www.w3.org/1999/XSL/Format"
   xmlns:exsl="http://exslt.org/common"
   exclude-result-prefixes="exsl d">

   <xsl:template match="d:screen" mode="screen">
      <xsl:apply-templates mode="screen"/>
   </xsl:template>
   
   <xsl:template name="normalize-left">
      <xsl:param name="node" />
      <xsl:variable name="char" select="substring($node,1,1)"/>
      
      <xsl:choose>
         <xsl:when test="$node=''" />
         <xsl:when test="$char='&#x0d;' or
            $char='&#x09;' or
            $char='&#x0a;' or
            $char=' '">
            <xsl:call-template name="normalize-left">
               <xsl:with-param name="node" select="substring($node,2)"/>
            </xsl:call-template>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$node"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   
   <xsl:template name="normalize-right">
      <xsl:param name="node" />
      <xsl:variable name="len" select="string-length($node)"/>
      <xsl:variable name="char" select="substring($node,$len ,1)"/>
      
      <xsl:choose>
         <xsl:when test="$node=''" />
         <xsl:when test="$char='&#x0d;' or
            $char='&#x09;' or
            $char='&#x0a;' or
            $char=' '">
            <xsl:call-template name="normalize-right">
               <xsl:with-param name="node" select="substring($node,1, $len -1)"/>
            </xsl:call-template>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$node"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   
   
   <xsl:template match="d:textnode" mode="screen">
      <xsl:param name="context" select="."/>
      <xsl:variable name="len" select="string-length($context)"/>
      <xsl:variable name="pre" select="count(preceding-sibling::d:textnode)"/>
      <xsl:variable name="fol" select="count(following-sibling::d:textnode)"/>
      
      <!--<xsl:message> textnode = "<xsl:value-of select="$context"/>"
preceding-sibling::textnode = <xsl:value-of select="count(preceding-sibling::d:textnode)"/>
following-sibling::textnode = <xsl:value-of select="count(following-sibling::d:textnode)"/>
   </xsl:message>-->
      
      <xsl:apply-templates mode="screen"/>
      
   </xsl:template>
   
   <xsl:template match="*" mode="screen">
      <xsl:apply-imports/>
   </xsl:template>
   
   
   <xsl:template match="d:textnode">
      <xsl:value-of select="."/>
   </xsl:template>
   
   <!-- The elements, that are allowed in mode="screen" -->
   
   <xsl:template match="d:co" mode="screen">
      <xsl:apply-templates select="self::d:co"/>
   </xsl:template>
   
   <xsl:template match="d:command" mode="screen">
      <xsl:apply-templates select="self::d:command"/>
   </xsl:template>
   
   <xsl:template match="d:emphasis" mode="screen">
      <xsl:apply-templates select="self::d:emphasis"/>
   </xsl:template>
   
   <xsl:template match="d:link" mode="screen">
      <xsl:apply-templates select="self::d:link"/>
   </xsl:template>
   
   <xsl:template match="d:replaceable" mode="screen">
      <xsl:apply-templates select="self::d:replaceable"/>
   </xsl:template>
   
   <xsl:template match="d:option" mode="screen">
      <xsl:apply-templates select="self::d:option"/>
   </xsl:template>
   
   <xsl:template match="d:phrase" mode="screen">
      <xsl:apply-templates select="self::d:phrase"/>
   </xsl:template>
   
   <xsl:template match="d:ulink" mode="screen">
      <xsl:apply-templates select="self::d:ulink"/>
   </xsl:template>
   
   <xsl:template match="d:xref" mode="screen">
      <xsl:apply-templates select="self::d:xref"/>
   </xsl:template>
   

</xsl:stylesheet>
