<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="d"
                 version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:d="http://docbook.org/ns/docbook"
    xmlns:fo="http://www.w3.org/1999/XSL/Format">

<xsl:import href="http://docbook.sourceforge.net/release/xsl-ns/current/fo/docbook.xsl"/>
<xsl:import href="param.xsl"/>
<xsl:include href="titlepage.xsl"/>

<xsl:output method="xml" indent="yes" encoding="UTF-8"/>


<!-- Use extensions -->
<xsl:param name="xep.extensions">0</xsl:param>
<xsl:param name="fop.extensions">0</xsl:param>
<xsl:param name="fop1.extensions">1</xsl:param>


</xsl:stylesheet>
