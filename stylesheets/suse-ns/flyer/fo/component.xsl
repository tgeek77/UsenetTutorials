<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:d="http://docbook.org/ns/docbook"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                xmlns:date="http://exslt.org/dates-and-times"
                xmlns:axf="http://www.antennahouse.com/names/XSL/Extensions"
                exclude-result-prefixes="date d"
                extension-element-prefixes="date"
                version='1.0'>

<xsl:attribute-set name="page.attributes">
 <xsl:attribute name="language">
  <xsl:call-template name="l10n.language"/>
 </xsl:attribute>
 <xsl:attribute name="hyphenation-character">
  <xsl:call-template name="gentext">
   <xsl:with-param name="key" select="'hyphenation-character'"/>
  </xsl:call-template>
 </xsl:attribute>
 <xsl:attribute name="hyphenation-push-character-count">
  <xsl:call-template name="gentext">
   <xsl:with-param name="key" select="'hyphenation-push-character-count'"/>
  </xsl:call-template>
 </xsl:attribute>
 <xsl:attribute name="hyphenation-remain-character-count">
  <xsl:call-template name="gentext">
   <xsl:with-param name="key" select="'hyphenation-remain-character-count'"/>
  </xsl:call-template>
 </xsl:attribute>
</xsl:attribute-set>

<xsl:template match="d:article">
  <xsl:variable name="id">
    <xsl:call-template name="object.id"/>
  </xsl:variable>
  <xsl:variable name="master-reference">
    <xsl:call-template name="select.pagemaster"/>
  </xsl:variable>  
  <xsl:variable name="toc.params">
    <xsl:call-template name="find.path.params">
       <xsl:with-param name="table" select="normalize-space($generate.toc)"/>
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
  <xsl:variable name="format">
    <xsl:variable name="pi-format">
      <xsl:call-template name="pi-attribute">
        <xsl:with-param name="pis" select="d:articleinfo/d:date/processing-instruction('dbtimestamp')"/>
        <xsl:with-param name="attribute">format</xsl:with-param>
      </xsl:call-template>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$pi-format != ''">
        <xsl:value-of select="$pi-format"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="gentext.template">
          <xsl:with-param name="context" select="'datetime'"/>
          <xsl:with-param name="name" select="'format'"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="pi" select="d:articleinfo/d:date/processing-instruction('dbtimestamp')"/>
  
  <fo:page-sequence xsl:use-attribute-sets="page.attributes"
                    hyphenate="{$hyphenate}"
                    master-reference="{$master-reference}">
   <xsl:attribute name="format">
    <xsl:call-template name="page.number.format">
     <xsl:with-param name="master-reference" select="$master-reference"/>
    </xsl:call-template>
   </xsl:attribute>
   <xsl:attribute name="initial-page-number">
    <xsl:call-template name="initial.page.number">
     <xsl:with-param name="master-reference" select="$master-reference"/>
    </xsl:call-template>
   </xsl:attribute>
   <xsl:attribute name="force-page-count">
    <xsl:call-template name="force.page.count">
     <xsl:with-param name="master-reference" select="$master-reference"/>
    </xsl:call-template>
   </xsl:attribute>
    
    <xsl:apply-templates select="." mode="running.head.mode">
      <xsl:with-param name="master-reference" select="$master-reference"/>
    </xsl:apply-templates>

    <xsl:apply-templates select="." mode="running.foot.mode">
      <xsl:with-param name="master-reference" select="$master-reference"/>
    </xsl:apply-templates>

    <fo:flow flow-name="xsl-region-body">
      <xsl:call-template name="set.flow.properties">
        <xsl:with-param name="element" select="local-name(.)"/>
        <xsl:with-param name="master-reference" select="$master-reference"/>
      </xsl:call-template>

      <fo:block span="all" id="{$id}">
        <xsl:apply-templates select="d:articleinfo/d:author|
                                     d:articleinfo/d:authorgroup"
                             mode="article.titlepage.recto.auto.mode"/>
        
        <xsl:apply-templates select="d:title"
                             mode="article.titlepage.recto.auto.mode"/>
        <xsl:apply-templates select="d:subtitle"
                             mode="article.titlepage.recto.auto.mode"/>
                
       </fo:block>
       <fo:table span="all" width="100%" space-before="3em"
         space-after="2em">
          <fo:table-column
            column-width="proportional-column-width(2.25)"/>
          <fo:table-column column-width="3mm"/>
          <fo:table-column column-width="proportional-column-width(1.00)"/>
          <fo:table-body>
            <fo:table-row>
              <fo:table-cell background-color="darkgray" text-depth="4mm">
              <fo:block font-size="4pt">&#xa0;</fo:block>
            </fo:table-cell>
            <fo:table-cell>
               <fo:block/>
            </fo:table-cell>
            <fo:table-cell background-color="{$flyer.color}"
              text-depth="4mm">
              <fo:block font-size="4pt">&#xa0;</fo:block>
            </fo:table-cell>
            </fo:table-row>
            <fo:table-row>
              <fo:table-cell>
                <fo:block margin-top=".5em" font-size="8pt">
                  <xsl:choose>
                    <xsl:when test="normalize-space(d:articleinfo/d:date/text()) = '' 
                                    and not($pi)">
                      <xsl:call-template name="datetime.format">
                     <xsl:with-param name="date" select="$date"/>
                     <xsl:with-param name="format">
                        <xsl:choose>
                          <xsl:when test="$pi">
                            <xsl:value-of select="$format"/>
                          </xsl:when>
                          <xsl:otherwise>B d, Y</xsl:otherwise>
                        </xsl:choose>
                     </xsl:with-param>
                     <xsl:with-param name="padding" select="1"/>
                   </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:apply-templates select="d:articleinfo/d:date"/>
                    </xsl:otherwise>
                  </xsl:choose>
                  
                </fo:block>
              </fo:table-cell>
              <fo:table-cell>
                 <fo:block/>
              </fo:table-cell>
              <fo:table-cell>
                <fo:block margin-top=".5em" font-size="8pt"> <xsl:value-of select="$flyer.url"/></fo:block>
              </fo:table-cell>
            </fo:table-row>
          </fo:table-body>
        </fo:table>

        <fo:block span="all" margin-left="2em" margin-right="2em"
          space-after="3em">
          <xsl:apply-templates select="d:abstract"
                             mode="article.titlepage.recto.auto.mode"/>
        </fo:block>
        

      <xsl:if test="contains($toc.params, 'toc')">
        <xsl:call-template name="component.toc"/>
        <xsl:call-template name="component.toc.separator"/>
      </xsl:if>

      <!-- Everything without a legal, process it: -->
      <xsl:apply-templates select="*[not(@role='legal')]"/>
      
      <!-- Column adjustment -->
      <xsl:if test="$fop1.extensions = 0">
        <fo:block span="all"><fo:leader/></fo:block>
      </xsl:if>
    </fo:flow>
  </fo:page-sequence>
  
  <!-- This page-sequence is just for the column adjustment before and after. -->
  <xsl:choose>
    <xsl:when test="$fop1.extensions = 0">
      <fo:page-sequence xsl:use-attribute-sets="page.attributs"
       hyphenate="{$hyphenate}"
        master-reference="{$master-reference}">
     <xsl:attribute name="format">
      <xsl:call-template name="page.number.format">
       <xsl:with-param name="master-reference"
        select="$master-reference"/>
      </xsl:call-template>
     </xsl:attribute>
     <xsl:attribute name="initial-page-number">
      <xsl:call-template name="initial.page.number">
       <xsl:with-param name="master-reference"
        select="$master-reference"/>
      </xsl:call-template>
     </xsl:attribute>
     <xsl:attribute name="force-page-count">
      <xsl:call-template name="force.page.count">
       <xsl:with-param name="master-reference"
        select="$master-reference"/>
      </xsl:call-template>
     </xsl:attribute>
        
        <xsl:apply-templates select="." mode="running.head.mode">
          <xsl:with-param name="master-reference" select="$master-reference"/>
        </xsl:apply-templates>
        
        <xsl:apply-templates select="." mode="running.foot.mode">
          <xsl:with-param name="master-reference" select="$master-reference"/>
        </xsl:apply-templates>
        
        <fo:flow flow-name="xsl-region-body">
          <xsl:call-template name="set.flow.properties">
            <xsl:with-param name="element" select="local-name(.)"/>
            <xsl:with-param name="master-reference" select="$master-reference"/>
          </xsl:call-template>
          <xsl:apply-templates select="*[@role='legal']"/>
            <fo:block span="all">
              <fo:footnote>
                <fo:inline/>
                <fo:footnote-body text-align="right" margin-left="0pt"
                  margin-right="0pt">
                  <fo:block padding="0pt">
                    <fo:external-graphic width="3.5cm"
                      content-width="scale-to-fit"
                      content-height="scale-to-fit">
                      <xsl:attribute name="src">
                        <xsl:call-template name="fo-external-image">
                          <xsl:with-param name="filename"
                            select="$booktitlepage.color.logo"/>
                        </xsl:call-template>
                      </xsl:attribute>
                    </fo:external-graphic>
                  </fo:block>
                  <fo:block
                    xsl:use-attribute-sets="copyright.flyer.properties">
                    <fo:block space-before="0.75em">
                      <xsl:call-template name="gentext">
                        <xsl:with-param name="key"
                          select="'FlyerMadeby'"/>
                      </xsl:call-template>
                    </fo:block>
                  </fo:block>
                </fo:footnote-body>
              </fo:footnote>
            </fo:block>
        </fo:flow>
      </fo:page-sequence>
    </xsl:when>
    <xsl:otherwise>
     <fo:page-sequence xsl:use-attribute-sets="page.attributs"
        hyphenate="{$hyphenate}"
        master-reference="{$master-reference}">
     <xsl:attribute name="format">
      <xsl:call-template name="page.number.format">
       <xsl:with-param name="master-reference"
        select="$master-reference"/>
      </xsl:call-template>
     </xsl:attribute>
     <xsl:attribute name="initial-page-number">
      <xsl:call-template name="initial.page.number">
       <xsl:with-param name="master-reference"
        select="$master-reference"/>
      </xsl:call-template>
     </xsl:attribute>
     <xsl:attribute name="force-page-count">
      <xsl:call-template name="force.page.count">
       <xsl:with-param name="master-reference"
        select="$master-reference"/>
      </xsl:call-template>
     </xsl:attribute>
       
        <xsl:apply-templates select="." mode="running.head.mode">
          <xsl:with-param name="master-reference" select="$master-reference"/>
        </xsl:apply-templates>
        
        <xsl:apply-templates select="." mode="running.foot.mode">
          <xsl:with-param name="master-reference" select="$master-reference"/>
        </xsl:apply-templates>
        
        <fo:flow flow-name="xsl-region-body">
          <xsl:call-template name="set.flow.properties">
            <xsl:with-param name="element" select="local-name(.)"/>
            <xsl:with-param name="master-reference" select="$master-reference"/>
          </xsl:call-template>
          <xsl:apply-templates select="*[@role='legal']"/>
            <fo:block span="all" text-align="right"
                margin-top="2em"
                margin-left="0pt"
                margin-right="0pt">
                  <fo:block padding="0pt">
                    <!-- Original size: width=190pt, height=45pt -->
                    <fo:external-graphic width="2.5cm"
                      content-width="scale-to-fit"
                      content-height="scale-to-fit">
                      <xsl:attribute name="src">
                        <xsl:call-template name="fo-external-image">
                          <xsl:with-param name="filename"
                            select="$booktitlepage.color.logo"/>
                        </xsl:call-template>
                      </xsl:attribute>
                    </fo:external-graphic>
                  </fo:block>
                  <fo:block
                    xsl:use-attribute-sets="copyright.flyer.properties">
                    <fo:block space-before="0.75em">
                      <xsl:call-template name="gentext">
                        <xsl:with-param name="key"
                          select="'FlyerMadeby'"/>
                      </xsl:call-template>
                    </fo:block>
                  </fo:block>
            </fo:block>
        </fo:flow>
      </fo:page-sequence>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="d:article/d:articleinfo"></xsl:template>
<xsl:template match="d:article/d:title"></xsl:template>
<xsl:template match="d:article/d:titleabbrev"></xsl:template>
<xsl:template match="d:article/d:subtitle"></xsl:template>
<xsl:template match="d:article/d:abstract"></xsl:template>


<xsl:template match="d:title" mode="article.titlepage.recto.auto.mode">
   <fo:block space-before="1cm" space-before.precedence="1"
     space-before.conditionality="retain"
     xsl:use-attribute-sets="article.titlepage.recto.style"
          font-size="20pt">
       <xsl:apply-templates mode="article.titlepage.recto.auto.mode"/>
   </fo:block>
</xsl:template>

<xsl:template match="d:subtitle" mode="article.titlepage.recto.auto.mode">
   <fo:block space-before=".25em" font-size="14pt" xsl:use-attribute-sets="article.subtitlepage.recto.style">
     <xsl:apply-templates mode="article.titlepage.recto.auto.mode"/>
   </fo:block>
</xsl:template>

<xsl:template match="d:subtitle/d:productname" mode="article.titlepage.recto.auto.mode">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="d:author" mode="article.titlepage.recto.auto.mode">
  <!-- Single authors displayed as block -->
   <fo:block color="black"
          xsl:use-attribute-sets="article.titlepage.recto.style"
          font-size="10pt">
    <xsl:apply-templates select="."  mode="article.titlepage.recto.mode"/>
   </fo:block>
</xsl:template>

<xsl:template match="d:authorgroup" mode="article.titlepage.recto.auto.mode">
  <fo:block>
    <!-- We want the authors to be displayed inline -->
    <xsl:for-each select="d:author">
      <xsl:call-template name="person.name">
        <xsl:with-param name="node" select="current()"/>
      </xsl:call-template>
      <xsl:if test="position() != last()"><xsl:text>, </xsl:text></xsl:if>
    </xsl:for-each>
  </fo:block>
</xsl:template>

<xsl:template match="d:subtitle[d:productname]/text()" mode="article.titlepage.recto.auto.mode">
</xsl:template>
 
  <!-- if an element isn't found in this mode, -->
  <!-- try the generic titlepage.mode -->
<xsl:template match="d:article/d:abstract|d:article/d:articleinfo/d:abstract" mode="article.titlepage.recto.auto.mode">
  <xsl:apply-templates select="." mode="abstract"/>
</xsl:template>


<xsl:template match="d:emphasis" mode="article.titlepage.recto.auto.mode">
   <xsl:apply-templates mode="article.titlepage.recto.auto.mode"/>
</xsl:template>

<xsl:template match="d:productname" mode="article.titlepage.recto.auto.mode">
   <fo:block space-after="0.25em">
     <xsl:apply-templates mode="article.titlepage.recto.auto.mode"/>
   </fo:block>
</xsl:template>

<xsl:template match="processing-instruction('suse')" 
  mode="article.titlepage.recto.auto.mode">
  <xsl:call-template name="suse-pi"/>
</xsl:template>


<xsl:template match="d:abstract" mode="abstract">
  <fo:block space-before="3em"><xsl:apply-templates mode="abstract"/></fo:block>
</xsl:template>

<xsl:template match="d:para" mode="abstract">
   <fo:block xsl:use-attribute-sets="normal.para.spacing">
     <xsl:apply-templates />
   </fo:block>
</xsl:template>

<xsl:template match="*" mode="abstract">
   <xsl:apply-templates/>
</xsl:template>



<xsl:template match="d:abstract/d:title" mode="titlepage.abstract.title.mode"/>
<xsl:template match="d:abstract/d:title" mode="titlepage.mode"/>
<xsl:template match="d:chapter/d:abstract"/>


<xsl:template match="d:note|d:important|d:warning|d:caution|d:tip" mode="object.title.template">
  
  <xsl:text>[</xsl:text>
  <xsl:call-template name="gentext">
        <xsl:with-param name="key">
          <xsl:choose>
            <xsl:when test="local-name(.) = 'caution'">Caution</xsl:when>
            <xsl:when test="local-name(.) = 'note'">Note</xsl:when>
            <xsl:when test="local-name(.) = 'important'">Important</xsl:when>
            <xsl:when test="local-name(.) = 'tip'">Tip</xsl:when>
            <xsl:when test="local-name(.) = 'warning'">Warning</xsl:when>
            <xsl:otherwise>
              <xsl:message>Unknown element <xsl:value-of
                select="name()"/>.</xsl:message>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:with-param>
  </xsl:call-template>
  <xsl:text>] </xsl:text>
  
  <xsl:apply-templates select="." mode="title.markup"/>
</xsl:template>

</xsl:stylesheet>

