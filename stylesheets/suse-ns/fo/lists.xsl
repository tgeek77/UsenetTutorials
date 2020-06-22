<?xml version="1.0" encoding="UTF-8"?>
<!-- $Id: lists.xsl 17656 2007-02-22 14:43:34Z toms $ -->
<!DOCTYPE xsl:stylesheet>
<xsl:stylesheet exclude-result-prefixes="d"
                 version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:d="http://docbook.org/ns/docbook"
    xmlns:fo="http://www.w3.org/1999/XSL/Format">

<xsl:include href="mode-object.title.markup.xsl"/>

<xsl:template match="d:itemizedlist">
  <xsl:variable name="id">
    <xsl:call-template name="object.id"/>
  </xsl:variable>

  <xsl:variable name="label-width">
    <xsl:call-template name="dbfo-attribute">
      <xsl:with-param name="pis"
                      select="processing-instruction('dbfo')"/>
      <xsl:with-param name="attribute" select="'label-width'"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:if test="d:title">
    <xsl:apply-templates select="d:title" mode="list.title.mode"/>
  </xsl:if>

  <!-- Preserve order of PIs and comments -->
 <xsl:apply-templates
      select="*[not(self::d:listitem
                or self::d:title
                or self::d:titleabbrev)]
              |comment()[not(preceding-sibling::d:listitem)]
              |processing-instruction()[not(preceding-sibling::d:listitem)]"/>

  <xsl:variable name="content">
    <xsl:apply-templates
          select="d:listitem
                  |comment()[preceding-sibling::d:listitem]
                  |processing-instruction()[preceding-sibling::d:listitem]"/>
  </xsl:variable>

  <!-- nested lists don't add extra list-block spacing -->
  <xsl:choose>
    <xsl:when test="ancestor::d:listitem">
      <fo:list-block id="{$id}"
                     provisional-label-separation="6pt">
        <xsl:attribute name="provisional-distance-between-starts">
          <xsl:choose>
            <xsl:when test="$label-width != ''">
              <xsl:value-of select="$label-width"/>
            </xsl:when>
            <xsl:otherwise>10pt</xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="margin-left">
          <xsl:choose>
            <xsl:when test="parent::d:procedure or
                            parent::d:listitem or
                            parent::d:calloutlist or
                            parent::d:simplelist">
              <xsl:text>2em</xsl:text><!-- 15pt -->
            </xsl:when>
            <xsl:otherwise>inherit</xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>
        <xsl:copy-of select="$content"/>
      </fo:list-block>
    </xsl:when>
    <xsl:otherwise>
      <fo:list-block id="{$id}"
                     xsl:use-attribute-sets="list.block.spacing"
                     provisional-label-separation="6pt">
        <xsl:attribute name="provisional-distance-between-starts">
          <xsl:choose>
            <xsl:when test="$label-width != ''">
              <xsl:value-of select="$label-width"/>
            </xsl:when>
            <xsl:otherwise>10pt</xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>
        <xsl:copy-of select="$content"/>
      </fo:list-block>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>


<!-- ==================================================================== -->
<xsl:template match="d:variablelist" mode="vl.as.blocks">
  <xsl:variable name="id">
    <xsl:call-template name="object.id"/>
  </xsl:variable>
  <xsl:variable name="lines">
    <xsl:call-template name="dbfo-attribute">
      <xsl:with-param name="pis"
        select="processing-instruction('dbsuse-fo')"/>
      <xsl:with-param name="attribute" select="'lines'"/>
    </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="border">
    <xsl:call-template name="dbfo-attribute">
      <xsl:with-param name="pis"
        select="processing-instruction('dbsuse-fo')"/>
      <xsl:with-param name="attribute" select="'border'"/>
    </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="default.border">0.5pt solid black</xsl:variable>

  <!-- termlength is irrelevant -->

  <xsl:if test="d:title">
    <xsl:apply-templates select="d:title" mode="list.title.mode"/>
  </xsl:if>


  <!-- Preserve order of PIs and comments -->
  <xsl:apply-templates
    select="*[not(self::d:varlistentry
              or self::d:title
              or self::d:titleabbrev)]
            |comment()[not(preceding-sibling::d:varlistentry)]
            |processing-instruction()[not(preceding-sibling::d:varlistentry)]"/>

  <xsl:variable name="content">
    <xsl:apply-templates mode="vl.as.blocks"
      select="d:varlistentry
              |comment()[preceding-sibling::d:varlistentry]
              |processing-instruction()[preceding-sibling::d:varlistentry]"/>
  </xsl:variable>

  <!-- nested lists don't add extra list-block spacing -->
  <fo:block id="{$id}">
    
    <xsl:if test="$lines != ''">
      <xsl:choose>
        <xsl:when test="$border != ''">
          <xsl:attribute name="border-top">
            <xsl:value-of select="$border"/>
          </xsl:attribute>
          <xsl:attribute name="border-bottom">
            <xsl:value-of select="$border"/>
          </xsl:attribute>
        </xsl:when>
        <xsl:otherwise>
          <xsl:attribute name="border-top">
            <xsl:value-of select="$default.border"/>
          </xsl:attribute>
          <xsl:attribute name="border-bottom">
            <xsl:value-of select="$default.border"/>
          </xsl:attribute>
        </xsl:otherwise>
      </xsl:choose>
      
    </xsl:if>
    <xsl:copy-of select="$content"/>
  </fo:block>
</xsl:template>


<!--<xsl:template match="d:varlistentry/d:term[position()=last()]" >
  <fo:inline><xsl:apply-templates/>
    <xsl:if test="../d:listitem/d:indexterm">
      <xsl:message> ******** indexterm <xsl:value-of select="../d:listitem/d:indexterm/@class"/>/<xsl:value-of select="../d:listitem/d:indexterm/@startref"/></xsl:message>
      <xsl:apply-templates select="../d:listitem/d:indexterm" />
    </xsl:if>
  </fo:inline>
</xsl:template>-->



<!-- ==================================================================== -->
<xsl:template match="d:procedure">
  <xsl:variable name="id">
    <xsl:call-template name="object.id"/>
  </xsl:variable>
  <xsl:variable name="dotafter">
    <xsl:call-template name="gentext.template">
     <xsl:with-param name="name" select="'dot.after.step'"/>
     <xsl:with-param name="context" select="'parameters'"/>
    </xsl:call-template>
  </xsl:variable>
 
  <xsl:variable name="param.placement"
                select="substring-after(normalize-space($formal.title.placement),
                                        concat(local-name(.), ' '))"/>
  <xsl:variable name="count.steps"
                select="count(d:step)"/>

  <xsl:variable name="placement">
    <xsl:choose>
      <xsl:when test="contains($param.placement, ' ')">
        <xsl:value-of select="substring-before($param.placement, ' ')"/>
      </xsl:when>
      <xsl:when test="$param.placement = ''">before</xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$param.placement"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <!-- Preserve order of PIs and comments -->
  <xsl:variable name="preamble"
        select="*[not(self::d:step
                  or self::d:title
                  or self::d:titleabbrev)]
                |comment()[not(preceding-sibling::d:step)]
                |processing-instruction()[not(preceding-sibling::d:step)]"/>

  <xsl:variable name="steps"
                select="d:step
                        |comment()[preceding-sibling::d:step]
                        |processing-instruction()[preceding-sibling::d:step]"/>


  <fo:block id="{$id}" xsl:use-attribute-sets="list.block.spacing">
    <xsl:if test="./d:title and $placement = 'before'">
      <!-- n.b. gentext code tests for $formal.procedures and may make an "informal" -->
      <!-- heading even though we called formal.object.heading. odd but true. -->
      <xsl:call-template name="formal.object.heading"/>
    </xsl:if>

    <xsl:apply-templates select="$preamble"/>

    <fo:list-block xsl:use-attribute-sets="list.block.spacing">
     <xsl:attribute name="provisional-label-separation">6pt</xsl:attribute>
     <xsl:choose>
          <xsl:when test="$count.steps &lt; 10">
           <xsl:choose>
            <xsl:when test="$dotafter != ''">
             <xsl:attribute
              name="provisional-distance-between-starts">12pt + 4pt</xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
             <xsl:attribute name="provisional-distance-between-starts">12pt</xsl:attribute>
            </xsl:otherwise>
           </xsl:choose>
          </xsl:when>
          <xsl:otherwise>
           <xsl:choose>
            <xsl:when test="$dotafter != ''">
             <xsl:attribute
              name="provisional-distance-between-starts">24pt + 4pt</xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
             <xsl:attribute name="provisional-distance-between-starts">24pt</xsl:attribute>
            </xsl:otherwise>
           </xsl:choose>
          </xsl:otherwise>
       </xsl:choose>
      <xsl:apply-templates select="$steps">
       <xsl:with-param name="dotafter" select="$dotafter"/>
      </xsl:apply-templates>
    </fo:list-block>

    <xsl:if test="./d:title and $placement != 'before'">
      <!-- n.b. gentext code tests for $formal.procedures and may make an "informal" -->
      <!-- heading even though we called formal.object.heading. odd but true. -->
      <xsl:call-template name="formal.object.heading"/>
    </xsl:if>
  </fo:block>
</xsl:template>


<xsl:template match="d:procedure/d:step|d:substeps/d:step">
  <xsl:param name="dotafter" select="''"/>
  <xsl:variable name="id">
    <xsl:call-template name="object.id"/>
  </xsl:variable>
 
<!-- <xsl:message><xsl:value-of 
  select="local-name(.)"/>: dotafter = "<xsl:value-of select="$dotafter"/>"</xsl:message>
-->
 
  <fo:list-item xsl:use-attribute-sets="list.item.spacing">
    <xsl:if test="ancestor::d:procedure or ancestor::d:step">
       <xsl:attribute name="space-before">0em</xsl:attribute>
    </xsl:if>
    <fo:list-item-label end-indent="label-end()">
      <fo:block id="{$id}" xsl:use-attribute-sets="procedure.label.properties">
        <xsl:choose>
          <xsl:when test="count(../d:step) = 1">
            <xsl:text>&#x2022;</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:apply-templates select="." mode="number">
              <xsl:with-param name="recursive" 
                              select="$procedure.number.recursive"/>
            </xsl:apply-templates>
           <xsl:copy-of select="$dotafter"/>
          </xsl:otherwise>
        </xsl:choose>
      </fo:block>
    </fo:list-item-label>
    <fo:list-item-body start-indent="body-start()">
      <fo:block>
        <xsl:apply-templates/>
      </fo:block>
    </fo:list-item-body>
  </fo:list-item>
</xsl:template>

<xsl:template match="d:substeps">
  <fo:list-block xsl:use-attribute-sets="list.block.spacing"
                 provisional-label-separation="6pt">
   <!--provisional-distance-between-starts="24pt"-->
   <xsl:choose>
    <xsl:when test="$procedure.number.recursive">
     <xsl:attribute
       name="provisional-distance-between-starts">30pt</xsl:attribute><!-- 24pt -->
     <xsl:attribute name="start-indent">inherit</xsl:attribute><!--15pt + 6pt -->
    </xsl:when>
    <xsl:otherwise>
     <xsl:attribute name="provisional-distance-between-starts">12pt</xsl:attribute>
     <xsl:attribute name="start-indent">inherit</xsl:attribute><!-- 15pt + 6pt + 15pt -->
    </xsl:otherwise>
   </xsl:choose>   
   <xsl:apply-templates/>
  </fo:list-block>
</xsl:template>


<!-- **************************************** -->

<xsl:template match="d:procedure|d:table|d:figure|d:example" mode="object.title.markup_safe">
  <xsl:param name="allow-anchors" select="0"/>

  <xsl:variable name="label.label">
     <xsl:call-template name="substitute-markup">
        <xsl:with-param name="allow-anchors" select="$allow-anchors"/>
        <xsl:with-param name="template">
           <xsl:call-template name="gentext.template">
              <xsl:with-param name="context" select="'styles'"/>
              <xsl:with-param name="name"
                 select="concat(name(.), '-label')"/>
           </xsl:call-template>
        </xsl:with-param>
     </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="label.title">
    <xsl:call-template name="substitute-markup">
      <xsl:with-param name="allow-anchors" select="$allow-anchors"/>
      <xsl:with-param name="template">
         <xsl:call-template name="gentext.template">
            <xsl:with-param name="context" select="'styles'"/>
            <xsl:with-param name="name"
                 select="concat(name(.), '-title')"/>
         </xsl:call-template>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:variable>

   <fo:block><fo:inline  xsl:use-attribute-sets="formal.inline.number.properties">
           <xsl:value-of select="$label.label"/>
      </fo:inline><!-- <xsl:text>&#x2003;&#x2003;</xsl:text>EM SPACE
      --><fo:inline space-start.minimum="0.5em"
                    space-start.optimum="1em"
                    space-start.maximum="1.1em"
                    xsl:use-attribute-sets="formal.inline.title.properties">
            <xsl:value-of select="normalize-space($label.title)"/>
      </fo:inline>
   </fo:block>

</xsl:template>



</xsl:stylesheet>
