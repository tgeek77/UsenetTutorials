<?xml version="1.0" encoding="UTF-8"?>
<!-- $Id: xep.xsl 40505 2009-03-31 13:44:10Z toms $ -->
<xsl:stylesheet exclude-result-prefixes="d"
                 version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:d="http://docbook.org/ns/docbook"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:rx="http://www.renderx.com/XSL/Extensions">

    <!-- See also Ticket#55 -->

<xsl:template name="xep-document-information">
  <xsl:variable name="root.element" select="key('id', $rootid)"/>
  
  <rx:meta-info>
    <xsl:variable name="authors" select="(//d:author|//d:editor|//d:authorgroup)[1]"/>
    
      <xsl:variable name="author">
        <xsl:choose>
          <xsl:when test="$authors[self::d:authorgroup]">
            <xsl:call-template name="person.name.list">
              <xsl:with-param name="person.list" 
                        select="$authors/*[self::d:author|self::d:corpauthor|
                               self::d:othercredit|self::d:editor]"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:when test="$authors[self::d:corpauthor]">
            <xsl:value-of select="$authors"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="person.name">
              <xsl:with-param name="node" select="$authors"/>
            </xsl:call-template>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <rx:meta-field name="author">
          <xsl:attribute name="value">
            <xsl:choose>
              <xsl:when test="$authors[self::d:authorgroup]">
                <xsl:call-template name="person.name.list">
                  <xsl:with-param name="person.list"
                    select="$authors/*[self::d:author|self::d:corpauthor|self::d:othercredit|self::d:editor]"
                  />
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:variable name="aut">
                  <xsl:call-template name="person.name">
                    <xsl:with-param name="node" select="$authors"/>
                  </xsl:call-template>
                </xsl:variable>

                <xsl:choose>
                  <xsl:when test="$aut != ''">
                    <xsl:value-of select="$aut"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="$metadata.producer"/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
      </rx:meta-field>

    <xsl:variable name="title">
        <xsl:choose>
          <xsl:when test="key('id', $rootid)">
            <xsl:apply-templates select="key('id', $rootid)" mode="label.markup"/>
            <xsl:apply-templates select="key('id', $rootid)" mode="title.markup"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:apply-templates select="/*[1]" mode="label.markup"/>
            <xsl:apply-templates select="/*[1]" mode="title.markup"/>
          </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>

    <rx:meta-field name="creator">
      <xsl:attribute name="value">
        <xsl:value-of select="$metadata.producer"/>
      </xsl:attribute>
    </rx:meta-field>

    <rx:meta-field name="title">
      <xsl:attribute name="value">
        <xsl:value-of select="normalize-space($title)"/>
      </xsl:attribute>
    </rx:meta-field>

    <xsl:if test="//d:keyword">
      <rx:meta-field name="keywords">
        <xsl:attribute name="value">
          <xsl:for-each select="//d:keyword">
            <xsl:value-of select="normalize-space(.)"/>
            <xsl:if test="position() != last()">
              <xsl:text>, </xsl:text>
            </xsl:if>
          </xsl:for-each>
        </xsl:attribute>
      </rx:meta-field>
    </xsl:if>

    <xsl:if test="//d:subjectterm">
      <rx:meta-field name="subject">
        <xsl:attribute name="value">
          <xsl:for-each select="//d:subjectterm">
            <xsl:value-of select="normalize-space(.)"/>
            <xsl:if test="position() != last()">
              <xsl:text>, </xsl:text>
            </xsl:if>
          </xsl:for-each>
        </xsl:attribute>
      </rx:meta-field>
    </xsl:if>
  </rx:meta-info>
</xsl:template>



<xsl:template match="d:set|d:book|d:part|d:reference|d:preface|d:chapter|d:appendix|d:article
                     |d:glossary|d:bibliography|d:index|d:setindex
                     |d:refentry|d:refsynopsisdiv
                     |d:refsect1|d:refsect2|d:refsect3|d:refsection
                     |d:sect1|d:sect2|d:sect3|d:sect4|d:sect5|d:section"
              mode="xep.outline">
  <xsl:variable name="id">
    <xsl:call-template name="object.id"/>
  </xsl:variable>
  <xsl:variable name="bookmark-label">
    <xsl:apply-templates select="."
                         mode="object.xep.title.markup"/>
  </xsl:variable>

  <!-- Put the root element bookmark at the same level as its children -->
  <!-- If the object is a set or book, generate a bookmark for the toc -->

  <xsl:choose>
    <xsl:when test="parent::*">
      <rx:bookmark internal-destination="{$id}">
        <xsl:choose>
          <xsl:when test="self::d:set|self::d:part|self::d:book">
            <xsl:attribute name="collapse-subtree"
              >false</xsl:attribute>
          </xsl:when>
          <xsl:when test="self::d:chapter|self::d:appendix|self::d:glossary">
            <xsl:attribute name="collapse-subtree"
              >true</xsl:attribute>
          </xsl:when>
        </xsl:choose>
        <rx:bookmark-label>
          <xsl:value-of select="$bookmark-label"/>
        </rx:bookmark-label>
        <xsl:apply-templates select="*" mode="xep.outline"/>
      </rx:bookmark>
    </xsl:when>
    <xsl:otherwise>
      <xsl:if test="$bookmark-label != ''">
        <rx:bookmark internal-destination="{$id}">
          <rx:bookmark-label>
            <xsl:value-of select="$bookmark-label"/>
          </rx:bookmark-label>
        </rx:bookmark>
      </xsl:if>

      <xsl:variable name="toc.params">
        <xsl:call-template name="find.path.params">
          <xsl:with-param name="table" select="normalize-space($generate.toc)"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:if test="contains($toc.params, 'toc')
                    and d:set|d:book|d:part|d:reference|d:section|d:sect1|d:refentry
                        |d:article|d:bibliography|d:glossary|d:chapter
                        |d:appendix">
        <rx:bookmark internal-destination="toc...{$id}">
          <rx:bookmark-label>
            <xsl:call-template name="gentext">
              <xsl:with-param name="key" select="'TableofContents'"/>
            </xsl:call-template>
          </rx:bookmark-label>
        </rx:bookmark>
      </xsl:if>
      <xsl:apply-templates select="*" mode="xep.outline"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="*" mode="object.xep.title.markup">
  <xsl:param name="allow-anchors" select="0"/>
  <xsl:variable name="template">
    <xsl:apply-templates select="." mode="object.xep.title.template"/>
  </xsl:variable>
  
  <xsl:call-template name="substitute-markup">
    <xsl:with-param name="allow-anchors" select="$allow-anchors"/>
    <xsl:with-param name="template" select="$template"/>
  </xsl:call-template> 
</xsl:template>


<xsl:template match="*" mode="object.xep.title.template">
  <xsl:call-template name="gentext.template">
    <xsl:with-param name="context" select="'xep-bookmark-title'"/>
    <xsl:with-param name="name">
      <xsl:call-template name="xpath.location"/>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template match="d:appendix|d:chapter|d:part
                     |d:refsect1
                     |d:section|d:sect1|d:sect2|d:sect3|d:sect4|d:sect5|d:simplesect
                     |d:bridgehead"
              mode="object.xep.title.template">
  <xsl:call-template name="gentext.template">
     <!-- title-unnumbered -->
     <xsl:with-param name="context" select="'xep-bookmark-title'"/>
     <xsl:with-param name="name">
        <xsl:call-template name="xpath.location"/>
     </xsl:with-param>
  </xsl:call-template>
</xsl:template>

</xsl:stylesheet>
