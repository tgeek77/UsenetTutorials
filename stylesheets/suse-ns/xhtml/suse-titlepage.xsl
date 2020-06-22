<?xml version="1.0" encoding="ASCII"?>
<!-- 
   Purpose:  Contains titlepage specific structure
-->

<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:d="http://docbook.org/ns/docbook"
  xmlns:date="http://exslt.org/dates-and-times"
  xmlns="http://www.w3.org/1999/xhtml"
  extension-element-prefixes="date"
  exclude-result-prefixes="date d">
  
<xsl:template name="titlepage.timestamp">
  <xsl:variable name="format">
    <xsl:call-template name="gentext.template">
      <xsl:with-param name="context" select="'datetime'"/>
      <xsl:with-param name="name" select="'titlepage.format'"/>
      </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="date">
    <xsl:choose>
      <xsl:when test="function-available('date:date-time')">
        <xsl:value-of select="date:date-time()"/>
      </xsl:when>
      <xsl:when test="function-available('date:dateTime')">
        <!-- Xalan quirk -->
        <xsl:value-of select="date:dateTime()"/>
      </xsl:when>
    </xsl:choose>
  </xsl:variable>
  
  <div class="buildtime">
    <p>
      <xsl:call-template name="gentext">
        <xsl:with-param name="key">PubDate</xsl:with-param>
      </xsl:call-template>
      <xsl:text> </xsl:text>
      <xsl:call-template name="datetime.format">
        <xsl:with-param name="date" select="$date"/>
        <xsl:with-param name="format" select="$format"/>
        <xsl:with-param name="padding" select="1"/>
      </xsl:call-template>
    </p>
  </div>
</xsl:template>

<!-- This stylesheet was created by template/titlepage.xsl; do not edit it by hand. -->
<xsl:template name="article.titlepage.recto">
  <xsl:choose>
    <xsl:when test="d:articleinfo/d:title">
      <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:articleinfo/d:title"/>
    </xsl:when>
    <xsl:when test="d:artheader/d:title">
      <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:artheader/d:title"/>
    </xsl:when>
    <xsl:when test="d:info/d:title">
      <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:info/d:title"/>
    </xsl:when>
    <xsl:when test="d:title">
      <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:title"/>
    </xsl:when>
  </xsl:choose>

  <xsl:choose>
    <xsl:when test="d:articleinfo/d:subtitle">
      <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:articleinfo/d:subtitle"/>
    </xsl:when>
    <xsl:when test="d:artheader/d:subtitle">
      <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:artheader/d:subtitle"/>
    </xsl:when>
    <xsl:when test="d:info/d:subtitle">
      <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:info/d:subtitle"/>
    </xsl:when>
    <xsl:when test="d:subtitle">
      <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:subtitle"/>
    </xsl:when>
  </xsl:choose>

  <xsl:call-template name="titlepage.timestamp"/>

  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:articleinfo/d:corpauthor"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:artheader/d:corpauthor"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:info/d:corpauthor"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:articleinfo/d:authorgroup"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:artheader/d:authorgroup"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:info/d:authorgroup"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:articleinfo/d:author"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:artheader/d:author"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:info/d:author"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:articleinfo/d:othercredit"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:artheader/d:othercredit"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:info/d:othercredit"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:articleinfo/d:releaseinfo"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:artheader/d:releaseinfo"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:info/d:releaseinfo"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:articleinfo/d:copyright"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:artheader/d:copyright"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:info/d:copyright"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:articleinfo/d:legalnotice"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:artheader/d:legalnotice"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:info/d:legalnotice"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:articleinfo/d:pubdate"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:artheader/d:pubdate"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:info/d:pubdate"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:articleinfo/d:revision"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:artheader/d:revision"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:info/d:revision"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:articleinfo/d:revhistory"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:artheader/d:revhistory"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:info/d:revhistory"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:articleinfo/d:abstract"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:artheader/d:abstract"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:info/d:abstract"/>
</xsl:template>


<xsl:template name="book.titlepage.recto">
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:bookinfo/d:productname[not(@role='abbrev')]"/>
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:productname[not(@role='abbrev')]"/>
  <xsl:choose>
    <xsl:when test="d:bookinfo/d:titleabbrev">
      <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:bookinfo/d:titleabbrev"/>
    </xsl:when>
    <xsl:when test="d:info/d:titleabbrev">
      <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:titleabbrev"/>
    </xsl:when>
    <xsl:when test="d:titleabbrev">
      <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:titleabbrev"/>
    </xsl:when>
    <xsl:when test="d:title">
      <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:title"/>
    </xsl:when>
    <xsl:when test="d:bookinfo/d:title">
      <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:bookinfo/d:title"/>
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

  
  <xsl:call-template name="titlepage.timestamp"/>
  
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:bookinfo/d:authorgroup"/>
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:authorgroup"/>
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:bookinfo/d:legalnotice"/>
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:legalnotice"/>
</xsl:template>



<xsl:template name="book.titlepage.verso">
</xsl:template>

<xsl:template name="book.titlepage.separator">
   <hr/>
</xsl:template>

<xsl:template name="book.titlepage.before.recto">
</xsl:template>

<xsl:template name="book.titlepage.before.verso">
</xsl:template>

<xsl:template name="book.titlepage">
  <!--<xsl:message>**** book.titlepage: <xsl:value-of select="name(.)"/>
  title:         <xsl:value-of select="d:bookinfo/d:title"/>
  productname:   <xsl:value-of select="d:bookinfo/d:productname[not(@role='abbrev')]"/>
  productnumber: <xsl:value-of select="d:bookinfo/d:productnumber"/>
  </xsl:message>-->
  <div class="titlepage">
    <div>
      <xsl:call-template name="book.titlepage.before.recto"/>
      <xsl:call-template name="book.titlepage.recto"/>
    </div>
    <div>
      <xsl:call-template name="book.titlepage.before.verso"/>
      <xsl:call-template name="book.titlepage.verso"/>
    </div>
    <xsl:call-template name="book.titlepage.separator"/>
  </div>
</xsl:template>

<xsl:template match="*" mode="book.titlepage.recto.mode">
  <!-- if an element isn't found in this mode, -->
  <!-- try the generic titlepage.mode -->
  <xsl:apply-templates select="." mode="titlepage.mode"/>
</xsl:template>

<xsl:template match="*" mode="book.titlepage.verso.mode">
  <!-- if an element isn't found in this mode, -->
  <!-- try the generic titlepage.mode -->
  <xsl:apply-templates select="." mode="titlepage.mode"/>
</xsl:template>

<xsl:template match="d:productname" mode="book.titlepage.recto.auto.mode">
   <div xsl:use-attribute-sets="book.titlepage.recto.style">
      <xsl:apply-templates select="." mode="book.titlepage.recto.mode"/>
   </div>
</xsl:template>

<xsl:template match="d:titleabbrev" mode="book.titlepage.recto.auto.mode">
   <div xsl:use-attribute-sets="book.titlepage.recto.style">
      <xsl:apply-templates select="." mode="book.titlepage.recto.mode"/>
   </div>
</xsl:template>

<xsl:template match="d:authorgroup" mode="book.titlepage.recto.auto.mode">
   <div xsl:use-attribute-sets="book.titlepage.recto.style">
      <xsl:apply-templates select="." mode="book.titlepage.recto.mode"/>
   </div>
</xsl:template>

<xsl:template match="d:legalnotice" mode="book.titlepage.recto.auto.mode">
   <div xsl:use-attribute-sets="book.titlepage.recto.style">
      <xsl:apply-templates select="." mode="book.titlepage.recto.mode"/>
   </div>
</xsl:template>

</xsl:stylesheet>
