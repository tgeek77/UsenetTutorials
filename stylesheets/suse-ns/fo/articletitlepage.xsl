<?xml version="1.0" encoding="UTF-8"?>
<!-- $Id: articletitlepage.xsl 43595 2009-08-13 06:25:57Z toms $ -->
<!DOCTYPE xsl:stylesheet >
<xsl:stylesheet exclude-result-prefixes="d"
                 version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:d="http://docbook.org/ns/docbook"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:svg="http://www.w3.org/2000/svg">



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
<!--   <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:articleinfo/d:revision"/> -->
<!--   <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:artheader/d:revision"/> -->
<!--   <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:info/d:revision"/> -->
<!--   <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:articleinfo/d:revhistory"/> -->
<!--   <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:artheader/d:revhistory"/> -->
<!--   <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:info/d:revhistory"/> -->
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:articleinfo/d:abstract"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:artheader/d:abstract"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:info/d:abstract"/>

</xsl:template>


<!--<xsl:template name="article.titlepage.separator">
  <fo:block break-after="page">
  <fo:leader leader-pattern="space" leader-length="0pt"/> </fo:block>
</xsl:template>-->

<xsl:template name="article.titlepage.before.verso">
   <fo:block space-after="4em"/>
   <xsl:apply-templates select="d:articleinfo/d:mediaobject"/>
</xsl:template>

<xsl:template name="article.titlepage.verso">
  <fo:block break-after="page">
  <fo:leader leader-pattern="space" leader-length="0pt"/> </fo:block>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:articleinfo/d:revhistory"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:artheader/d:revhistory"/>
  <xsl:apply-templates mode="article.titlepage.recto.auto.mode" select="d:info/d:revhistory"/>

</xsl:template>


<xsl:template match="d:article/d:articleinfo/d:legalnotice" mode="titlepage.mode">
  <xsl:variable name="id">
    <xsl:call-template name="object.id"/>
  </xsl:variable>

  <!-- New page -->
  <fo:block break-after="page">
  <fo:leader leader-pattern="space" leader-length="0pt"/> </fo:block>

   <xsl:apply-imports/>
  <!--<fo:block id="{$id}" font-size="9pt">
    <xsl:if test="d:title"> <!- - FIXME: add param for using default title? - ->
      <xsl:call-template name="formal.object.heading"/>
    </xsl:if>
    <xsl:apply-templates mode="titlepage.mode"/>
  </fo:block>-->
</xsl:template>


<xsl:template match="d:title" mode="article.titlepage.recto.auto.mode">
 <fo:block xsl:use-attribute-sets="article.titlepage.recto.style"
         role="article.titlepage.recto.auto.mode"
         margin-top="3cm"
         keep-with-next.within-column="always"
         font-size="24.8832pt" font-weight="bold">
   <xsl:call-template name="component.title">
    <xsl:with-param name="node" select="ancestor-or-self::d:article[1]"/>
   </xsl:call-template>
 </fo:block>
</xsl:template>



</xsl:stylesheet>
