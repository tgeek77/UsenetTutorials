<?xml version="1.0" encoding="UTF-8"?>
<!-- $Id: booktitlepage.xsl 36290 2008-10-24 07:53:53Z toms $ -->
<!DOCTYPE xsl:stylesheet >
<xsl:stylesheet exclude-result-prefixes="d"
                 version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:d="http://docbook.org/ns/docbook"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:svg="http://www.w3.org/2000/svg">


<xsl:template name="book.titlepage.recto">
  <fo:block font-family="{$sans.font.family}"
     margin-top="60.75pt - 54pt" height="63mm"
     padding="15.75pt" hyphenate="false">
    <fo:block color="grey" text-align="left"
      font-size="40pt" font-weight="normal">
      <fo:block role="productname">
        <xsl:apply-templates
           mode="book.titlepage.recto"
        select="self::d:book/d:bookinfo/d:productname[not(@role='abbrev')]"/>
      </fo:block>
      <!--<fo:block><xsl:value-of
        select="self::d:book/d:bookinfo/d:titleabbrev"/></fo:block>-->
    </fo:block>
    <fo:block margin-top="2em"><fo:instream-foreign-object>
     <!-- 2011-04-13, jw: 
	  xep: heigh="40pt" is sufficient 
	  fop: heigh="60pt" is needed to avoid clipping 
	  xep: 445px is near the center of the page
	  fop: 445px is at the far right edge of the page. different dpi?
	  xep uses 4.6 px/mm -> change all horizontal coords to mm
	  (wow, mm are the same in both, xep and fop)
       -->
     <svg:svg width="472.5pt" height="60pt" version="1.0">
      <svg:text
            id="novell.address.text"
            font-size="11pt"
            font-family="{$sans.font.family}"
            y="12.5"
            x="102mm">
        <xsl:value-of select="$booktitlepage.url"/>
      </svg:text>
      <svg:text
            id="productnumber.text"
            x="5"
            y="12.5"
            font-size="11pt"
            font-family="{$sans.font.family}">
        <xsl:apply-templates mode="book.titlepage.recto"
            select="self::d:book/d:bookinfo/d:productnumber" /></svg:text>
      <svg:text
            id="date.text"
            x="5"
            y="45"
            font-size="8pt"
            font-family="{$sans.font.family}"
        ><xsl:apply-templates select="self::d:book/d:bookinfo/d:date/node()"/></svg:text>
      <svg:text
            id="titleabbrev.text"
            x="37mm"
            y="45"
            font-size="11pt"
            font-family="{$sans.font.family}">
        <svg:tspan>
         <xsl:choose>
            <!-- FIXME: What about very long titles?
               Use different, possible titles
            -->
            <xsl:when test="d:title">
              <xsl:apply-templates 
                mode="book.titlepage.recto.auto.mode"
                select="d:title"/>
            </xsl:when>
            <xsl:when test="d:bookinfo/d:title">
              <xsl:apply-templates 
                mode="book.titlepage.recto.auto.mode"
                select="d:bookinfo/d:title"/>
            </xsl:when>
            <xsl:when test="d:bookinfo/d:titleabbrev">
               <xsl:apply-templates
                 select="d:bookinfo/d:titleabbrev"/>
            </xsl:when>
            <xsl:when test="d:bookinfo/d:invpartnumber">
               <xsl:apply-templates
                 select="d:bookinfo/d:invpartnumber"/>
            </xsl:when>
            <xsl:otherwise/>
         </xsl:choose>
        </svg:tspan>
      </svg:text>
      <svg:line
            stroke="black"
            y2="20"
            x2="130mm"
            y1="20"
            x1="0.14098030"
            id="horiz.line" />
      <svg:line
            id="vert.line"
            stroke="black"
            y2="50"
            x2="34mm"
            y1="20"
            x1="34mm" />
      <svg:circle
            stroke="black"
            stroke-width="0.3pt"
            r="1.5mm"
            cy="20"
            cx="91mm"
            id="red.circle">
     <xsl:choose>
       <xsl:when test="$format.print = '1'">
        <xsl:attribute name="fill">
          <xsl:text>grey</xsl:text>
        </xsl:attribute>
       </xsl:when>
       <xsl:otherwise>
        <xsl:attribute name="fill">
          <xsl:text>#0D5148</xsl:text>
        </xsl:attribute>
       </xsl:otherwise>
     </xsl:choose>
      </svg:circle>
     </svg:svg></fo:instream-foreign-object>
    </fo:block>
  </fo:block>
  <!-- *HACK* Novell Logos.
              The positioning could be probably designed better, but I don't know how
              Depends highly on the SVG graphics!
   -->
  <!-- top={$page.height} -40.5pt -2.5mm-->
  <fo:block-container top="{$page.height} -94.5pt -5pt"
   left="202pt"
   right="63pt"
   bottom="40.5pt"
   absolute-position="fixed">
   <fo:block><fo:external-graphic
           content-width="94.5pt" width="94.5pt">
     <xsl:choose>
       <xsl:when test="$format.print = '1'">
        <xsl:attribute name="src">
          <xsl:call-template name="fo-external-image">
            <xsl:with-param name="filename"
              select="$booktitlepage.bw.logo"/>
          </xsl:call-template>
        </xsl:attribute>
       </xsl:when>
       <xsl:otherwise>
        <xsl:attribute name="src">
          <xsl:call-template name="fo-external-image">
            <xsl:with-param name="filename"
              select="$booktitlepage.color.logo"/>
          </xsl:call-template>
        </xsl:attribute>
       </xsl:otherwise>
     </xsl:choose>
    </fo:external-graphic>
   </fo:block>
  </fo:block-container>

<!--  <xsl:choose>
    <xsl:when test="d:bookinfo/d:title">
      <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:bookinfo/d:title"/>
    </xsl:when>
    <xsl:when test="d:info/d:title">
      <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:title"/>
    </xsl:when>
    <xsl:when test="d:title">
      <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:title"/>
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
  </xsl:choose>-->

<!--  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:bookinfo/d:corpauthor"/>
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:corpauthor"/>
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:bookinfo/d:authorgroup"/>
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:authorgroup"/>
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:bookinfo/d:author"/>
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:authorgroup"/>
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:bookinfo/d:author"/>
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:author"/>-->

</xsl:template>


<xsl:template match="d:productnumber" mode="book.titlepage.recto">
  <xsl:variable name="text">
    <xsl:apply-templates select="node()"/>
  </xsl:variable>
  
  <xsl:value-of select="string($text)"/>
</xsl:template>

<xsl:template match="d:productname" mode="book.titlepage.recto">
  <!-- Needed to avoid TM, (R), and other symbols -->
  <xsl:apply-templates select="node()"/>
</xsl:template>


<xsl:template match="d:bookinfo/d:authorgroup" mode="book.titlepage.verso.auto.mode">
   <fo:block font-size="9pt" space-before="1.5em">
    <fo:inline font-weight="bold">
      <xsl:call-template name="gentext">
         <xsl:with-param name="key" select="'ListofAuthors'"/>
      </xsl:call-template>
      <xsl:text>: </xsl:text>
    </fo:inline>
    <xsl:for-each select="d:author|d:editor">
      <xsl:apply-templates select="(self::d:author|self::d:editor)[current()]"/>
      <xsl:choose>
         <xsl:when test="position() = last()"/> <!-- do nothing -->
         <xsl:otherwise>
         <xsl:text>, </xsl:text>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:for-each>
   </fo:block>
</xsl:template>

<xsl:template match="d:bookinfo/d:title|d:title" mode="book.titlepage.recto.auto.mode">
  <xsl:variable name="node">
    <xsl:apply-templates select="node()" mode="titlepage.mode"/>
  </xsl:variable>
  
  <xsl:choose>
    <xsl:when test="normalize-space(string($node)) = ''">
      <xsl:message>WARNING: bookinfo/title is empty.</xsl:message>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$node"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

</xsl:stylesheet>
