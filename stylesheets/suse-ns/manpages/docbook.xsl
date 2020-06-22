<?xml version="1.0" encoding="UTF-8"?>
<!-- $Id: docbook.xsl 18664 2007-03-19 12:32:29Z jjaeger $ -->
<xsl:stylesheet exclude-result-prefixes="d"
                 version="1.0"
    xmlns:exsl="http://exslt.org/common"
    xmlns:saxon="http://icl.com/saxon"
    xmlns:lxslt="http://xml.apache.org/xslt"
    xmlns:redirect="http://xml.apache.org/xalan/redirect"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:d="http://docbook.org/ns/docbook"
    extension-element-prefixes="saxon redirect lxslt exsl">

<xsl:import href="http://docbook.sourceforge.net/release/xsl-ns/current/manpages/docbook.xsl"/>

  <xsl:key   name="id" match="*" use="@id|@xml:id"/>
  
  
  <xsl:param name="show.comments">0</xsl:param>
  <xsl:param name="rootid"/>
  
  <!-- omit copyright section -->  
  <xsl:template name="copyright.section"/>
  
  <!--  don't print the product name and version -->
  <!-- FIXME toms: we might need to put SOMETHING in there -->
  <xsl:param name="refentry.source.name.profile.enabled">1</xsl:param>  
  <xsl:param name="refentry.version.profile.enabled">1</xsl:param>
  

  <!-- put first step of a procedure on its own line -->
  <xsl:template match="d:itemizedlist[ancestor::d:listitem or ancestor::d:step  or ancestor::d:glossdef]|
    d:orderedlist[ancestor::d:listitem or ancestor::d:step or ancestor::d:glossdef]|
    d:procedure[ancestor::d:listitem or ancestor::d:step or ancestor::d:glossdef]|d:procedure">
    <xsl:text>.RS</xsl:text> 
    <xsl:if test="not($list-indent = '')">
      <xsl:text> </xsl:text>
      <xsl:value-of select="$list-indent"/>
    </xsl:if>
    <xsl:text>&#10;</xsl:text>
    <xsl:if test="d:title">
      <xsl:text>.PP&#10;</xsl:text>
      <xsl:apply-templates mode="bold" select="d:title"/>
      <xsl:text>&#10;</xsl:text>
    </xsl:if>
    <xsl:text>.TP</xsl:text> 
    <xsl:if test="not($list-indent = '')">
      <xsl:text> </xsl:text>
      <xsl:value-of select="$list-indent"/>
    </xsl:if>
    <xsl:text>&#10;</xsl:text>
    <xsl:apply-templates/>
    <xsl:text>.RE&#10;</xsl:text>
    <xsl:if test="following-sibling::node() or
      parent::d:para[following-sibling::node()] or
      parent::d:simpara[following-sibling::node()] or
      parent::d:remark[following-sibling::node()]">
      <xsl:text>.IP ""</xsl:text> 
      <xsl:if test="not($list-indent = '')">
        <xsl:text> </xsl:text>
        <xsl:value-of select="$list-indent"/>
      </xsl:if>
      <xsl:text>&#10;</xsl:text>
    </xsl:if>
  </xsl:template>
 
</xsl:stylesheet>
