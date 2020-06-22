<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="d"
                 version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:d="http://docbook.org/ns/docbook"
  xmlns:fo="http://www.w3.org/1999/XSL/Format">
  
 <xsl:template name="qandaset.toc"/>
  
  <xsl:template name="book.titlepage.recto">
    
    <fo:block text-align="center" space-before="10em"
      space-before.conditionality="retain" space-before.precedence="10">
      <fo:external-graphic src="manager.svg">
    <xsl:attribute name="src">
      <!--<xsl:call-template name="image.src">
      <xsl:with-param name="filename">manager.svg</xsl:with-param>
    </xsl:call-template>-->
      <xsl:value-of select='concat("url(&apos;", 
                                        "../../d:xslt/d:fo/manager.svg",
                                        "&apos;)")'/>
    </xsl:attribute>
  </fo:external-graphic>
    </fo:block>  
    
  <xsl:choose>
    <xsl:when test="d:bookinfo/d:title">
      <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:bookinfo/d:title"/>
    </xsl:when>
    <xsl:when test="d:info/d:title">
      <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:title"/>
    </xsl:when>
    <xsl:when test="d:title">
      <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:title"/>
    </xsl:when>
  </xsl:choose>

  <xsl:choose>
    <xsl:when test="d:bookinfo/d:subtitle">
      <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:bookinfo/d:subtitle"/>
    </xsl:when>
    <xsl:when test="d:info/d:subtitle">
      <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:subtitle"/>
    </xsl:when>
    <xsl:when test="d:subtitle">
      <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:subtitle"/>
    </xsl:when>
  </xsl:choose>

  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:bookinfo/d:corpauthor"/>
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:corpauthor"/>
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:bookinfo/d:authorgroup"/>
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:authorgroup"/>
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:bookinfo/d:author"/>
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:author"/>
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:bookinfo/d:itermset"/>
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:itermset"/>
</xsl:template>

  
  
  <xsl:template name="book.titlepage.verso">
  <xsl:choose>
    <xsl:when test="d:bookinfo/d:title">
      <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:bookinfo/d:title"/>
    </xsl:when>
    <xsl:when test="d:info/d:title">
      <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:info/d:title"/>
    </xsl:when>
    <xsl:when test="d:title">
      <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:title"/>
    </xsl:when>
  </xsl:choose>
  
  <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:bookinfo/d:corpauthor"/>
  <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:info/d:corpauthor"/>
  <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:bookinfo/d:authorgroup"/>
  <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:info/d:authorgroup"/>
  <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:bookinfo/d:author"/>
  <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:info/d:author"/>
  <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:bookinfo/d:othercredit"/>
  <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:info/d:othercredit"/>
  <!--<xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:bookinfo/d:releaseinfo"/>
  <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:info/d:releaseinfo"/>-->
    
    <fo:block>
      <xsl:apply-templates mode="book.titlepage.verso.auto.mode"
     select="d:bookinfo/d:productname"/>
    <fo:inline>, </fo:inline>
    <xsl:apply-templates mode="book.titlepage.verso.auto.mode"
     select="d:bookinfo/d:productnumber"/> 
    </fo:block>
    <xsl:apply-templates mode="book.titlepage.verso.auto.mode"
    select="d:bookinfo/d:bibliosource"/>
   
  <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:bookinfo/d:pubdate"/>
  <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:info/d:pubdate"/>
  <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:bookinfo/d:copyright"/>
  <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:info/d:copyright"/>
  <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:bookinfo/d:abstract"/>
  <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:info/d:abstract"/>
  <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:bookinfo/d:legalnotice"/>
  <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:info/d:legalnotice"/>
</xsl:template>
  
  <!--<xsl:template match="d:bibliosource" name="book.titlepage.verso.auto.mode">
    <xsl:param name="url" select="normalize-space(.)"/>
    <xsl:variable name ="ulink.url">
      
      <xsl:message></xsl:message>
      
    <xsl:call-template name="fo-external-image">
      <xsl:with-param name="filename" select="$url"/>
    </xsl:call-template>
  </xsl:variable>
    <fo:block hyphenate="false">
      <xsl:call-template name="hyphenate-url">
        <xsl:with-param name="url" select="$url"/>
      </xsl:call-template>
    </fo:block>
  </xsl:template>-->
</xsl:stylesheet>