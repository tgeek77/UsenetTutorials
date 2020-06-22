<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="d"
                 version="1.0"
  xmlns:fo="http://www.w3.org/1999/XSL/Format"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:d="http://docbook.org/ns/docbook">

<xsl:template match="d:varlistentry" mode="vl.as.blocks">
  <xsl:variable name="id"><xsl:call-template name="object.id"/></xsl:variable>

  <fo:block id="{$id}" xsl:use-attribute-sets="variablelist.term.properties
                                               list.item.spacing"
      keep-together.within-column="always"
      keep-with-next.within-column="always">
    <xsl:apply-templates select="d:term"/>
  </fo:block>

  <fo:block>
    <xsl:attribute name="margin-{$direction.align.start}">1.5em</xsl:attribute>
    <xsl:apply-templates select="d:listitem"/>
  </fo:block>
</xsl:template>


<xsl:template match="d:calloutlist">
  <xsl:variable name="id">
  <xsl:call-template name="object.id"/>
  </xsl:variable>

  <xsl:variable name="pi-label-width">
    <xsl:call-template name="pi.dbfo_label-width"/>
  </xsl:variable>

  <fo:block id="{$id}"
            text-align="{$alignment}">
    <!-- The above restores alignment altered by image align attribute -->
    <xsl:if test="d:title">
      <xsl:apply-templates select="d:title[1]"
                           mode="list.title.mode"/>
    </xsl:if>

    <!-- Preserve order of PIs and comments -->
    <xsl:apply-templates
         select="*[not(self::d:callout or self::d:title or self::d:titleabbrev)]
                   |comment()[not(preceding-sibling::d:callout)]
                   |processing-instruction()[not(preceding-sibling::d:callout)]"/>

    <!-- toms:  -->
    <fo:list-block space-before.optimum="1em"
                   space-before.minimum="0.8em"
                   space-before.maximum="1.2em"
                   provisional-distance-between-starts="1.5em"
                   provisional-label-separation="0.05em">

      <xsl:if test="$pi-label-width != ''">
        <xsl:attribute name="provisional-distance-between-starts">
          <xsl:value-of select="$pi-label-width"/>
        </xsl:attribute>
      </xsl:if>

      <xsl:apply-templates select="d:callout
                                |comment()[preceding-sibling::d:callout]
                                |processing-instruction()[preceding-sibling::d:callout]"/>
    </fo:list-block>
  </fo:block>
</xsl:template>


</xsl:stylesheet>
