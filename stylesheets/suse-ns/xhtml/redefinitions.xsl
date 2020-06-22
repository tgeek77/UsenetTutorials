<?xml version="1.0" encoding="ASCII"?>
<!-- 
   Purpose:  Contains customizations mostly in titlepage.mode
-->

<xsl:stylesheet version="1.0"
  xmlns="http://www.w3.org/1999/xhtml" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:d="http://docbook.org/ns/docbook" 
  xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0"
  exclude-result-prefixes="l d">


<!-- Other templates -->
<xsl:template match="d:authorgroup" mode="titlepage.mode">
  <table width="100%">
    <xsl:apply-templates select="." mode="class.attribute"/>
   <tbody>
    <tr valign="top">
     <td width="15%">
     <xsl:choose>
       <xsl:when test="@role='authors'">
        <xsl:call-template name="gentext">
            <xsl:with-param name="key" select="'Authors'"/>
        </xsl:call-template>
       </xsl:when>
       <xsl:when test="@role='office'">
        <xsl:call-template name="gentext">
            <xsl:with-param name="key" select="'Office'"/>
        </xsl:call-template>
       </xsl:when>
       <xsl:when test="@role='translators'">
      <!--<xsl:if test="not(/d:book/@lang='en')">
         <xsl:call-template name="gentext">
            <xsl:with-param name="key" select="'Translators'"/>
         </xsl:call-template>
      </xsl:if>-->
       </xsl:when>
       <xsl:otherwise>
        <!-- needs to be checked -->
        <xsl:call-template name="gentext">
            <xsl:with-param name="key" select="'Authors'"/>
        </xsl:call-template>
       </xsl:otherwise>
     </xsl:choose>
    </td>
    <xsl:if test="not(@role='translators' and /d:book/@lang='de')">
     <td><xsl:apply-templates mode="titlepage.mode"/></td>
   </xsl:if>
    </tr>
   </tbody>
  </table>
</xsl:template>


<xsl:template match="d:author|d:editor|d:othercredit" mode="titlepage.mode">
   <span>
      <xsl:apply-templates select="." mode="class.attribute"/>
      <xsl:call-template name="person.name"/>
      <xsl:apply-templates mode="titlepage.mode" select="d:contrib"/>
      <xsl:apply-templates mode="titlepage.mode" select="d:affiliation"/>
        <xsl:if test="count(following-sibling::*[
                       self::d:author or
                       self::d:editor or 
                       self::d:othercredit]) &gt;0">
         <xsl:text>, </xsl:text>
      </xsl:if>
   </span>
</xsl:template>

<xsl:template match="d:contrib|d:authorblurb|d:personblurb"
  mode="titlepage.mode">
  <span>
    <xsl:apply-templates select="." mode="common.html.attributes"/>
    <xsl:text> (</xsl:text>
    <xsl:call-template name="id.attribute"/>
    <xsl:apply-templates mode="titlepage.mode"/>
    <xsl:text>)</xsl:text>
  </span>
</xsl:template>
  
<xsl:template match="d:authorgroup[@role='translators']/d:author" mode="titlepage.mode">
   <span class="{name(.)}">
      <xsl:call-template name="person.name"/>
      <xsl:if test="count(following-sibling::d:author)&gt;0">
            <xsl:if test="string-length(following-sibling::d:author/d:firstname)&gt;0">
            <xsl:text>, </xsl:text>
         </xsl:if>
      </xsl:if>
   </span>
</xsl:template>

<!-- productname is now the title of the book -->

<!--
Display product name & version number for the book.titlepage.recto.auto.mode
(this mode is used by default, see suse-titlepage.xsl)
-->
 
<xsl:template match="d:bookinfo/d:productname" mode="book.titlepage.recto.auto.mode">
   <div>
      <h1 class="productname">
         <xsl:apply-templates/>
         <xsl:text> </xsl:text>
         <xsl:apply-templates select="../d:productnumber"/> 
      </h1>
   </div>
</xsl:template>
 
<!-- fallback -->

 <xsl:template match="d:bookinfo/d:productname" mode="titlepage.mode">
   <div>
      <h1 class="productname">
         <xsl:apply-templates/>
      </h1>
   </div>
</xsl:template>


<!-- titleabbrev is now the subtitle of the book -->
<xsl:template match="d:bookinfo/d:titleabbrev" mode="titlepage.mode">
   <div>
      <h2 class="subtitle">
         <xsl:apply-templates/>
      </h2>
   </div>
</xsl:template>


<xsl:template match="d:bookinfo/d:title/d:emphasis">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template name="xml.base.dirs">
   <!-- Empty, because we don't want that our graphics
        path are influenced by xml:base attributes
    -->
</xsl:template>

<!--<xsl:template match="*" mode="admon.graphic.width">
  <xsl:param name="node" select="."/>
  <xsl:text>0</xsl:text>
</xsl:template>-->

</xsl:stylesheet>
