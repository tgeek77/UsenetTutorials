<?xml version="1.0" encoding="ASCII"?>
<!-- 
   Purpose:  Contains templates for inline elements like remark
-->

<xsl:stylesheet version="1.0"
  xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:d="http://docbook.org/ns/docbook"
  xmlns="http://www.w3.org/1999/xhtml"
  exclude-result-prefixes="l d">


<xsl:template name="inline.sansseq">
  <xsl:param name="content">
    <xsl:call-template name="anchor"/>
    <xsl:call-template name="simple.xlink">
      <xsl:with-param name="content">
        <xsl:apply-templates/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:param>
  <span class="{local-name(.)}">
    <xsl:call-template name="generate.html.title"/>
    <xsl:if test="@dir">
      <xsl:attribute name="dir">
        <xsl:value-of select="@dir"/>
      </xsl:attribute>
    </xsl:if>
    <xsl:copy-of select="$content"/>
    <xsl:call-template name="apply-annotations"/>
  </span>
</xsl:template>


<xsl:template match="d:keycap">
  <!-- See also Ticket#84 -->
   <xsl:choose>
       <xsl:when test="@function">
         <xsl:call-template name="inline.sansseq">
            <xsl:with-param name="content">
               <xsl:call-template name="gentext.template">
                  <xsl:with-param name="context" select="'msgset'"/>
                  <xsl:with-param name="name" select="@function"/>
               </xsl:call-template>
            </xsl:with-param>
         </xsl:call-template>
       </xsl:when>
       <xsl:otherwise>
         <xsl:call-template name="inline.sansseq"/>
       </xsl:otherwise>
   </xsl:choose>
</xsl:template>


<xsl:template match="d:para[parent::d:abstract | parent::d:answer | parent::d:appendix | parent::d:article | parent::d:authorblurb |                         parent::d:bibliodiv | parent::d:bibliography | parent::d:blockquote |                         parent::d:callout | parent::d:caption | parent::d:caution | parent::d:chapter | parent::d:colophon | parent::d:constraintdef |                         parent::d:dedication |                         parent::d:entry | parent::d:epigraph | parent::d:example |                         parent::d:footnote | parent::d:formalpara |                         parent::d:glossary | parent::d:glossdef | parent::d:glossdiv |                         parent::d:highlights |                         parent::d:important | parent::d:index | parent::d:indexdiv | parent::d:informalexample | parent::d:itemizedlist |                         parent::d:legalnotice | parent::d:listitem |                         parent::d:msgexplan | parent::d:msgtext |                         parent::d:note |                         parent::d:orderedlist |                         parent::d:partintro | parent::d:personblurb | parent::d:preface | parent::d:printhistory | parent::d:procedure |                         parent::d:qandadiv | parent::d:qandaset | parent::d:question |                         parent::d:refsect1 | parent::d:refsect2 | parent::d:refsect3 | parent::d:refsection | parent::d:refsynopsisdiv | parent::d:revdescription |                         parent::d:sect1 | parent::d:sect2 | parent::d:sect3 | parent::d:sect4 |  parent::d:sect5 |                         parent::d:section | parent::d:setindex | parent::d:sidebar | parent::d:simplesect | parent::d:step |                         parent::d:taskprerequisites | parent::d:taskrelated | parent::d:tasksummary | parent::d:td | parent::d:textobject | parent::d:th | parent::d:tip |                         parent::d:variablelist |                         parent::d:warning]">

   <xsl:choose>
     <xsl:when test="not(@arch)">
       <xsl:apply-imports/>
     </xsl:when>
     <xsl:when test="$para.use.arch='1'">
       <xsl:call-template name="paragraph">
          <xsl:with-param name="class" select="'profarch'"/>
          <xsl:with-param name="content">
            <xsl:variable name="arch">
               <!-- Change here the appearance of your attributes
                    TODO: Move it into common
               -->
               <xsl:choose>
                 <xsl:when test="@arch = 'zseries'">System&#160;z</xsl:when>
                 <xsl:otherwise><xsl:value-of select="@arch"/></xsl:otherwise>
               </xsl:choose>
             </xsl:variable>
             <xsl:if test="position() = 1 and parent::d:listitem">
             <xsl:call-template name="anchor">
                <xsl:with-param name="node" select="parent::d:listitem"/>
             </xsl:call-template>
             </xsl:if>

             <xsl:call-template name="anchor"/>
             
             <span class="profarch"><xsl:value-of select="concat('&#9658;',                        translate($arch, $profile.separator, ' '), ': ')"/></span>
             <xsl:apply-templates/>
             <span class="profarch">&#9668;</span>
          </xsl:with-param>
       </xsl:call-template>
     </xsl:when>
     <xsl:otherwise>
       <xsl:apply-imports/>
     </xsl:otherwise>
   </xsl:choose>
</xsl:template>


<xsl:template match="d:remark">
    <xsl:if test="$show.comments != 0">
      <xsl:variable name="num">
        <xsl:number format=".1" level="any" from="d:chapter"/>
      </xsl:variable>
      <xsl:variable name="id">
        <xsl:value-of select="ancestor-or-self::d:chapter/@id"/>
        <xsl:value-of select="$num"/>
      </xsl:variable>
      
      <!--<xsl:message>comment: <xsl:value-of select="$id"/> 
      <xsl:number level="any" format=" #1"/>
      <xsl:number format=" #1" level="any" from="d:chapter"/>
      </xsl:message>-->
      
      <em id="{$id}" class="remark">
        <span class="identifier">
          <xsl:text>#</xsl:text>
          <xsl:value-of select="$id"/>
          <xsl:text>: </xsl:text>
        </span>
        <xsl:call-template name="inline.charseq"/>
      </em>
    </xsl:if>
</xsl:template>
  
  <xsl:template match="d:productname">
    <xsl:call-template name="inline.charseq"/>
    <!-- We don't want to process @class attribute here -->
  </xsl:template>
  
</xsl:stylesheet>
