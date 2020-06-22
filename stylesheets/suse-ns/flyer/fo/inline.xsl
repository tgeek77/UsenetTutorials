<?xml version="1.0" encoding="UTF-8"?>
<!-- $Id: $ -->
<!DOCTYPE xsl:stylesheet
[
  <!ENTITY comment.block.parents
       "parent::d:answer|parent::d:appendix|parent::d:article|parent::d:bibliodiv|
        parent::d:bibliography|parent::d:blockquote|parent::d:caution|parent::d:chapter|
        parent::d:glossary|parent::d:glossdiv|parent::d:important|parent::d:index|
        parent::d:indexdiv|parent::d:listitem|parent::d:note|parent::d:orderedlist|
        parent::d:partintro|parent::d:preface|parent::d:procedure|parent::d:qandadiv|
        parent::d:qandaset|parent::d:question|parent::d:refentry|parent::d:refnamediv|
        parent::d:refsect1|parent::d:refsect2|parent::d:refsect3|parent::d:refsection|
        parent::d:refsynopsisdiv|parent::d:sect1|parent::d:sect2|parent::d:sect3|parent::d:sect4|
        parent::d:sect5|parent::d:section|parent::d:setindex|parent::d:sidebar|
        parent::d:simplesect|parent::d:taskprerequisites|parent::d:taskrelated|
        parent::d:tasksummary|parent::d:warning">

  <!ENTITY para.parent "parent::d:abstract | parent::d:answer | parent::d:appendix | parent::d:article | parent::d:authorblurb |  
                        parent::d:bibliodiv | parent::d:bibliography | parent::d:blockquote | 
                        parent::d:callout | parent::d:caption | parent::d:caution | parent::d:chapter | parent::d:colophon | parent::d:constraintdef |  
                        parent::d:dedication | 
                        parent::d:entry | parent::d:epigraph | parent::d:example | 
                        parent::d:footnote | parent::d:formalpara | 
                        parent::d:glossary | parent::d:glossdef | parent::d:glossdiv | 
                        parent::d:highlights |
                        parent::d:important | parent::d:index | parent::d:indexdiv | parent::d:informalexample | parent::d:itemizedlist |  
                        parent::d:legalnotice | parent::d:listitem | 
                        parent::d:msgexplan | parent::d:msgtext | 
                        parent::d:note | 
                        parent::d:orderedlist | 
                        parent::d:partintro | parent::d:personblurb | parent::d:preface | parent::d:printhistory | parent::d:procedure | 
                        parent::d:qandadiv | parent::d:qandaset | parent::d:question | 
                        parent::d:refsect1 | parent::d:refsect2 | parent::d:refsect3 | parent::d:refsection | parent::d:refsynopsisdiv | parent::d:revdescription | 
                        parent::d:sect1 | parent::d:sect2 | parent::d:sect3 | parent::d:sect4 |  parent::d:sect5 | 
                          parent::d:section | parent::d:setindex | parent::d:sidebar | parent::d:simplesect | parent::d:step |  
                        parent::d:taskprerequisites | parent::d:taskrelated | parent::d:tasksummary | parent::d:td | parent::d:textobject | parent::d:th | parent::d:tip |
                        parent::d:variablelist | 
                        parent::d:warning">

  <!ENTITY ltrif "&#x25c4;">
  <!ENTITY rtrif "&#x25ba;">
]>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:d="http://docbook.org/ns/docbook"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:svg="http://www.w3.org/2000/svg"
    xmlns:exslt="http://exslt.org/common"
    xmlns:rx="http://www.renderx.com/XSL/Extensions"
    exclude-result-prefixes="exslt d"
>

<!-- ==================================================================== -->
<xsl:template name="inline.sansseq">
  <xsl:param name="content">
    <xsl:apply-templates/>
  </xsl:param>
  <fo:inline font-family="{$sans.font.family}">
    <xsl:if test="@id">
      <xsl:attribute name="id">
        <xsl:value-of select="@id"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:if test="@dir">
      <xsl:attribute name="direction">
        <xsl:choose>
          <xsl:when test="@dir = 'ltr' or @dir = 'lro'">ltr</xsl:when>
          <xsl:otherwise>rtl</xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
    </xsl:if>
    <xsl:copy-of select="$content"/>
  </fo:inline>
</xsl:template>

<xsl:template name="inline.sansboldseq">
  <xsl:param name="content">
    <xsl:apply-templates/>
  </xsl:param>
  <fo:inline font-family="{$sans.font.family}" font-weight="bold">
    <xsl:if test="@id">
      <xsl:attribute name="id">
        <xsl:value-of select="@id"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:if test="@dir">
      <xsl:attribute name="direction">
        <xsl:choose>
          <xsl:when test="@dir = 'ltr' or @dir = 'lro'">ltr</xsl:when>
          <xsl:otherwise>rtl</xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
    </xsl:if>
    <xsl:copy-of select="$content"/>
  </fo:inline>
</xsl:template>


<xsl:template name="inline.italicseq">
  <xsl:param name="content">
    <xsl:apply-templates/>
  </xsl:param>
  <fo:inline font-style="italic">
    <xsl:if test="@id">
      <xsl:attribute name="id">
        <xsl:value-of select="@id"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:if test="@dir">
      <xsl:attribute name="direction">
        <xsl:choose>
          <xsl:when test="@dir = 'ltr' or @dir = 'lro'">ltr</xsl:when>
          <xsl:otherwise>rtl</xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
    </xsl:if>
    <xsl:copy-of select="$content"/>
  </fo:inline>
</xsl:template>


<!-- ==================================================================== -->
<!-- As discussed in our conf call from 9 Jun 2005 -->
<xsl:template match="d:guimenu">
  <xsl:call-template name="inline.italicseq"/>
</xsl:template>


<xsl:template match="d:keycap">
   <xsl:param name="key.contents" select="."/>
   <xsl:variable name="key.length" select="string-length($key.contents)"/>

   <fo:inline xsl:use-attribute-sets="keycap.properties">
     <xsl:choose>
       <xsl:when test="@function">
         <xsl:call-template name="inline.sansseq">
            <xsl:with-param name="content">
               <xsl:call-template name="gentext.template">
                  <xsl:with-param name="context" select="'msgset'"/>
                  <xsl:with-param name="name">
                     <xsl:value-of select="@function"/>
                  </xsl:with-param>
               </xsl:call-template>
            </xsl:with-param>
         </xsl:call-template>
       </xsl:when>
       <xsl:otherwise>
          <xsl:call-template name="inline.sansseq"/>
       </xsl:otherwise>
     </xsl:choose>
   </fo:inline>
</xsl:template>


<xsl:template match="d:command">
   <xsl:call-template name="inline.monoseq"/>
</xsl:template>


<xsl:template match="d:keycombo">
  <xsl:variable name="action" select="@action"/>
  <xsl:variable name="joinchar">
    <xsl:choose>
      <xsl:when test="$action='seq'"> &#x2013; </xsl:when>
      <xsl:when test="$action='press'"> + </xsl:when>
      <xsl:when test="$action='other'"></xsl:when>
      <xsl:otherwise> + </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:for-each select="*">
    <xsl:if test="position()>1"><xsl:value-of select="$joinchar"/></xsl:if>
    <xsl:apply-templates select="."/>
  </xsl:for-each>
</xsl:template>


<xsl:template match="d:filename">
  <!--<xsl:variable name="rtf">
     <xsl:apply-templates select="self::d:filename" mode="copy-node-normal"/>
  </xsl:variable>

  <fo:inline xsl:use-attribute-sets="filename.properties">
     <xsl:apply-templates select="exslt:node-set($rtf)/*" mode="hyphenate-url"/>
  </fo:inline>-->

  <xsl:choose>
     <xsl:when test="count(*) = 0">
        <fo:inline xsl:use-attribute-sets="filename.properties">
           <xsl:apply-templates select="." mode="hyphenate-url"/>
        </fo:inline>
     </xsl:when>
     <xsl:otherwise>
        <!--<xsl:message> FILENAME </xsl:message>-->
        <fo:inline xsl:use-attribute-sets="filename.properties">
          <xsl:apply-templates select="." mode="hyphenate-url"/>
        </fo:inline>
     </xsl:otherwise>
  </xsl:choose>

</xsl:template>

<xsl:template match="d:filename" mode="hyphenate-url">
    <xsl:apply-templates mode="hyphenate-url"/>
</xsl:template>

<xsl:template match="d:replaceable"  mode="hyphenate-url">
   <fo:inline font-style="italic"><xsl:apply-templates mode="hyphenate-url"/></fo:inline>
</xsl:template>


<xsl:template match="*"  mode="hyphenate-url">
   <xsl:message> WARNING: Unknown element <xsl:value-of select="name()"/> in hyphenate-url mode.</xsl:message>
   <xsl:apply-templates mode="hyphenate-url"/>
</xsl:template>


<xsl:template match="text()" mode="hyphenate-url">
  <xsl:call-template name="hyphenate-url">
     <xsl:with-param name="url" select="."/>
  </xsl:call-template> 
</xsl:template>

<xsl:template match="d:ulink" name="ulink">

  <xsl:choose>
    <xsl:when test="$ulink.show != 0">
      <!-- Yes, show the URI -->
      <xsl:choose>
       <xsl:when test="count(child::node())=0">
         <fo:basic-link>
           <xsl:attribute name="external-destination">
             <xsl:call-template name="fo-external-image">
               <xsl:with-param name="filename" select="@url"/>
             </xsl:call-template>
           </xsl:attribute>
           <fo:inline xsl:use-attribute-sets="ulink.properties">
             <xsl:call-template name="hyphenate-url">
               <xsl:with-param name="url" select="@url"/>
             </xsl:call-template>
           </fo:inline>
         </fo:basic-link>
       </xsl:when>
       <xsl:when test="string(.) = @url">
         <fo:basic-link>
           <xsl:attribute name="external-destination">
             <xsl:call-template name="fo-external-image">
               <xsl:with-param name="filename" select="@url"/>
             </xsl:call-template>
           </xsl:attribute>
           <fo:inline xsl:use-attribute-sets="ulink.properties">
             <xsl:call-template name="hyphenate-url">
               <xsl:with-param name="url" select="@url"/>
             </xsl:call-template>
           </fo:inline>
         </fo:basic-link>
       </xsl:when>
       <xsl:when test="$ulink.footnotes != 0 and not(ancestor::d:footnote)">
        <fo:footnote>
          <xsl:call-template name="ulink.footnote.number"/>
          <fo:footnote-body xsl:use-attribute-sets="footnote.properties">
            <fo:block>
              <xsl:call-template name="ulink.footnote.number"/>
              <xsl:text> </xsl:text>
              <fo:inline>
                <xsl:value-of select="@url"/>
              </fo:inline>
            </fo:block>
          </fo:footnote-body>
        </fo:footnote>
       </xsl:when>
       <xsl:otherwise>
         <fo:inline>
           <xsl:apply-templates/>
         </fo:inline>
        <fo:inline> [</fo:inline>
        <fo:basic-link>
           <xsl:attribute name="external-destination">
             <xsl:call-template name="fo-external-image">
               <xsl:with-param name="filename" select="@url"/>
             </xsl:call-template>
           </xsl:attribute>
           <fo:inline xsl:use-attribute-sets="ulink.properties">
             <xsl:call-template name="hyphenate-url">
               <xsl:with-param name="url" select="@url"/>
             </xsl:call-template>
           </fo:inline>
         </fo:basic-link>
         <fo:inline>]</fo:inline>
       </xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:otherwise>
      <!-- No, don't show the URI -->
        <fo:basic-link>
           <xsl:attribute name="external-destination">
             <xsl:call-template name="fo-external-image">
               <xsl:with-param name="filename" select="@url"/>
             </xsl:call-template>
           </xsl:attribute>
           <xsl:choose>
             <xsl:when test="count(child::node())=0 or string(.) = @url">
               <fo:inline xsl:use-attribute-sets="ulink.properties">
                  <xsl:call-template name="hyphenate-url">
                     <xsl:with-param name="url" select="@url"/>
                  </xsl:call-template>
               </fo:inline>
             </xsl:when>
             <xsl:otherwise>
               <fo:inline>
                  <xsl:apply-templates/>
               </fo:inline>
             </xsl:otherwise>
           </xsl:choose>
       </fo:basic-link>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="d:remark">
    <xsl:if test="$show.comments != 0">
      <xsl:choose>
        <xsl:when test="$xep.extensions != 0 and $use.xep.annotate.pdf != 0">
          <!-- See http://www.renderx.com/reference.html#PDF%20Note%20Annotations -->
          <fo:inline>
            <rx:pdf-comment content="{string(.)}" title="Comment">
              <!-- Attribute color, opacity -->
              <rx:pdf-sticky-note icon-type="comment"/>
            </rx:pdf-comment>
          </fo:inline>
        </xsl:when>
        <xsl:otherwise>
          <fo:inline xsl:use-attribute-sets="remark.properties">
            <xsl:call-template name="inline.charseq"/>
          </fo:inline>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>
</xsl:template>

<xsl:template match="d:remark[&comment.block.parents;]">
  <xsl:if test="$show.comments != 0">
    <xsl:choose>
      <xsl:when test="$xep.extensions != 0 and $use.xep.annotate.pdf != 0">
        <!-- See http://www.renderx.com/reference.html#PDF%20Note%20Annotations -->
        <fo:block>
          <fo:inline>
          <rx:pdf-comment content="{string(.)}" title="Comment">
            <!-- Attribute color, opacity -->
            <rx:pdf-sticky-note icon-type="comment"/>
          </rx:pdf-comment>
          </fo:inline>
        </fo:block>
      </xsl:when>
      <xsl:otherwise>
        <fo:block xsl:use-attribute-sets="remark.properties">
          <xsl:call-template name="inline.charseq"/>
        </fo:block>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:if>
</xsl:template>

<xsl:template match="d:productname" priority="10">
  <xsl:call-template name="inline.charseq"/> 
  <!-- <xsl:if test="@class">
    <xsl:call-template name="dingbat">
      <xsl:with-param name="dingbat" select="@class"/>
    </xsl:call-template>
  </xsl:if> -->
</xsl:template>

</xsl:stylesheet>
