<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="d"
                 version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:d="http://docbook.org/ns/docbook"
    xmlns:fo="http://www.w3.org/1999/XSL/Format">

<xsl:template match="processing-instruction('dbsbr') | 
                     processing-instruction('dblinebreak')">
  <fo:block/>
</xsl:template>

</xsl:stylesheet>
