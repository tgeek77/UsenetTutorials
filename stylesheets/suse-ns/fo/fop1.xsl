<?xml version="1.0" encoding="UTF-8"?>
<!-- $Id: fop1.xsl 19215 2007-04-18 07:58:56Z toms $ -->
<xsl:stylesheet exclude-result-prefixes="d"
                 version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:d="http://docbook.org/ns/docbook"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:fox="http://xml.apache.org/fop/extensions"
>

<xsl:template match="*" mode="fop1.outline" priority="200">
</xsl:template>

<xsl:template match="d:indexterm" name="indexterm"/>


</xsl:stylesheet>
