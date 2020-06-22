<?xml version="1.0" encoding="UTF-8"?>
<!--
   Purpose:
     Transform DocBook document into single XHTML file

   Parameters:
     Too many to list here, see:
     http://docbook.sourceforge.net/release/xsl-ns/current/doc/html/index.html

   Input:
     DocBook 4/5 document

   Output:
     Single XHTML file

   See Also:
     * http://doccookbook.sf.net/html/en/dbc.common.dbcustomize.html
     * http://sagehill.net/docbookxsl/CustomMethods.html#WriteCustomization

   Authors:    Thomas Schraitle <toms@opensuse.org>,
               Stefan Knorr <sknorr@suse.de>,
               Rick Salevsky <rsalevsky@suse.de>
   Copyright:  2012, 2013, 2014, Thomas Schraitle, Stefan Knorr, Rick Salevsky

-->

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:d="http://docbook.org/ns/docbook"
    xmlns:exsl="http://exslt.org/common"
    xmlns:date="http://exslt.org/dates-and-times"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="exsl date d">

 <xsl:import href="https://raw.githubusercontent.com/openSUSE/suse-xsl/master/suse2013-ns/xhtml/docbook.xsl"/>

  <xsl:include href="../VERSION.xsl"/>

  <xsl:template name="user.footer.content">
    <div id="_footer">
      <p>©
        <xsl:if test="function-available('date:year')">
          <xsl:value-of select="date:year()"/>
          <xsl:text> </xsl:text>
        </xsl:if>
        SUSE</p>
    </div>
  </xsl:template>

  <xsl:param name="allow.email.sharelink" select="0"/>
  <xsl:param name="extra.css" select="'static/css/brand.css'"/>

</xsl:stylesheet>
