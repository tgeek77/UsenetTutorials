<?xml version="1.0" encoding="UTF-8"?>
<!--
  Purpose:
    Logo SVG, chooses between color/grayscale mode itself.

  Author(s):  Stefan Knorr <sknorr@suse.de>,
              Thomas Schraitle <toms@opensuse.org>

  Copyright:  2013, Stefan Knorr, Thomas Schraitle

-->
<!DOCTYPE xsl:stylesheet
[
  <!ENTITY % fonts SYSTEM "fonts.ent">
  <!ENTITY % colors SYSTEM "colors.ent">
  <!ENTITY % metrics SYSTEM "metrics.ent">
  %fonts;
  %colors;
  %metrics;
]>
<xsl:stylesheet exclude-result-prefixes="d"
                 version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:d="http://docbook.org/ns/docbook"
  xmlns:fo="http://www.w3.org/1999/XSL/Format">

  <xsl:template name="logo-image">
    <xsl:param name="geeko-color">
      <xsl:choose>
        <xsl:when test="$format.print != 1">&chamaeleon-green;</xsl:when>
        <xsl:otherwise>&darker-gray;</xsl:otherwise>
      </xsl:choose>
    </xsl:param>
    <xsl:param name="logo-text-color">
      <xsl:choose>
        <xsl:when test="$format.print != 1">&black;</xsl:when>
        <xsl:otherwise>&darker-gray;</xsl:otherwise>
      </xsl:choose>
    </xsl:param>

    <svg:svg
      xmlns:dc="http://purl.org/dc/elements/1.1/"
      xmlns:cc="http://creativecommons.org/ns#"
      xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
      xmlns:svg="http://www.w3.org/2000/svg"
      xmlns="http://www.w3.org/2000/svg"
      xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
      xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
      inkscape:version="1.0 (4035a4fb49, 2020-05-01)"
      sodipodi:docname="big8.svg"
      id="svg911"
      preserveAspectRatio="xMidYMid meet"
      viewBox="0 0 1350 1350"
      height="135px"
      width="135px"
      version="1.0">
     <metadata
        id="metadata917">
       <rdf:RDF>
         <cc:Work
            rdf:about="">
           <dc:format>image/svg+xml</dc:format>
           <dc:type
              rdf:resource="http://purl.org/dc/dcmitype/StillImage" />
         </cc:Work>
       </rdf:RDF>
     </metadata>
     <defs
        id="defs915" />
     <sodipodi:namedview
        inkscape:current-layer="layer2"
        inkscape:window-maximized="1"
        inkscape:window-y="25"
        inkscape:window-x="0"
        inkscape:cy="68.394052"
        inkscape:cx="67.5"
        inkscape:zoom="6.1333333"
        showgrid="false"
        id="namedview913"
        inkscape:window-height="1031"
        inkscape:window-width="1920"
        inkscape:pageshadow="2"
        inkscape:pageopacity="0"
        guidetolerance="10"
        gridtolerance="10"
        objecttolerance="10"
        borderopacity="1"
        bordercolor="#666666"
        pagecolor="#ffffff" />
     <g
        stroke="none"
        fill="#ffffff"
        id="layer102">
       <path
          id="path902"
          d="M510 1266 c-100 -29 -184 -98 -214 -177 -13 -35 -27 -50 -62 -69 -61 -32 -128 -109 -156 -178 -18 -47 -22 -77 -23 -172 0 -97 4 -125 24 -177 29 -78 90 -149 154 -178 39 -18 52 -32 73 -73 31 -63 89 -116 163 -151 52 -24 66 -26 186 -26 111 1 138 4 187 23 75 30 152 100 174 157 14 37 25 49 60 64 54 24 127 99 159 161 52 103 53 292 1 405 -31 68 -107 143 -160 157 -36 10 -45 17 -60 54 -22 54 -103 128 -176 163 -48 22 -70 26 -170 28 -72 1 -132 -3 -160 -11z m331 -30 c61 -29 118 -80 158 -140 22 -34 26 -50 26 -120 0 -64 -5 -89 -22 -121 -27 -51 -92 -113 -166 -160 l-59 -37 75 -49 c123 -81 168 -151 168 -263 0 -78 -16 -119 -68 -171 -75 -78 -180 -110 -332 -103 -117 6 -188 36 -257 110 -57 61 -76 107 -77 183 -1 107 51 189 168 265 36 23 65 46 65 50 0 3 -25 24 -55 45 -75 51 -148 134 -163 182 -17 56 -15 136 3 181 20 47 78 108 130 134 78 41 115 48 235 45 100 -3 122 -7 171 -31z m-516 -394 c17 -26 62 -71 100 -100 39 -30 71 -57 73 -62 1 -4 -20 -22 -47 -40 -56 -35 -151 -134 -151 -156 0 -46 -111 25 -141 89 -23 52 -25 144 -3 195 24 58 90 120 129 121 6 0 24 -21 40 -47z m772 5 c115 -77 122 -269 13 -361 -47 -39 -80 -44 -99 -15 -32 48 -95 110 -152 148 l-59 39 69 46 c76 51 121 96 142 145 16 35 31 34 86 -2z" />
       <path
          id="path904"
          d="M598 1196 c-91 -25 -143 -80 -160 -172 -18 -100 25 -197 118 -264 l47 -33 71 36 c158 80 221 156 214 259 -3 45 -11 66 -34 95 -34 43 -105 84 -144 82 -23 -1 -23 -2 5 -8 70 -17 133 -67 156 -123 12 -29 11 -32 -12 -47 -46 -30 -107 -92 -145 -146 -20 -30 -39 -55 -40 -55 -2 0 -21 26 -43 58 -43 64 -103 122 -150 147 -37 19 -37 20 -8 67 32 53 72 80 146 99 36 10 57 17 46 17 -11 1 -41 -5 -67 -12z" />
       <path
          id="path906"
          d="M627 573 c-77 -41 -160 -111 -182 -153 -8 -15 -17 -46 -21 -69 -6 -36 -4 -41 13 -41 41 0 139 92 188 178 11 17 22 32 26 32 4 0 18 -19 32 -42 36 -62 100 -131 141 -153 20 -11 36 -23 36 -28 0 -4 -9 -26 -20 -47 -25 -49 -80 -87 -143 -99 -61 -11 -72 -21 -15 -14 182 24 258 226 142 379 -30 39 -99 94 -118 94 -6 0 -42 -17 -79 -37z" />
       <path
          id="path908"
          d="M431 286 c-3 -54 108 -147 174 -145 29 1 29 1 -5 8 -73 15 -144 74 -162 133 -5 19 -6 20 -7 4z" />
     </g>
     <g
        style="display:inline"
        inkscape:label="Layer 2"
        id="layer2"
        inkscape:groupmode="layer">
       <g
          style="fill:#ffff00;fill-opacity:1"
          transform="rotate(90,674.11582,687.9237)"
          id="layer101-6"
          fill="#000000"
          stroke="none">
         <path
            style="fill:#ffff00;fill-opacity:1"
            d="m 515,1257 c -101,-34 -180,-97 -210,-169 -18,-45 -20,-125 -3,-181 15,-48 88,-131 163,-182 30,-21 55,-42 55,-45 0,-4 -29,-27 -65,-50 C 338,554 286,472 287,365 288,289 307,243 364,182 433,108 504,78 621,72 c 152,-7 257,25 332,103 52,52 68,93 68,171 0,112 -45,182 -168,263 l -75,49 59,37 c 74,47 139,109 166,160 17,32 22,57 22,121 0,70 -4,86 -26,120 -40,60 -97,111 -158,140 -49,24 -71,28 -171,31 -77,2 -128,-2 -155,-10 z m 264,-80 c 68,-33 104,-85 109,-155 7,-103 -56,-179 -214,-259 l -71,-36 -47,33 c -93,67 -136,164 -118,264 29,154 190,226 341,153 z M 756,582 C 885,488 919,317 828,214 780,160 729,138 649,138 497,138 396,251 430,382 c 15,57 102,141 195,190 39,21 75,38 81,38 6,0 29,-13 50,-28 z"
            id="path899-0" />
       </g>
     </g>
     <g
        style="display:inline"
        inkscape:label="Layer 1"
        id="layer1"
        inkscape:groupmode="layer">
       <g
          style="fill:#0000ff"
          stroke="none"
          fill="#000000"
          id="layer101">
         <path
            style="fill:#0000ff"
            id="path899"
            d="m 515,1257 c -101,-34 -180,-97 -210,-169 -18,-45 -20,-125 -3,-181 15,-48 88,-131 163,-182 30,-21 55,-42 55,-45 0,-4 -29,-27 -65,-50 C 338,554 286,472 287,365 288,289 307,243 364,182 433,108 504,78 621,72 c 152,-7 257,25 332,103 52,52 68,93 68,171 0,112 -45,182 -168,263 l -75,49 59,37 c 74,47 139,109 166,160 17,32 22,57 22,121 0,70 -4,86 -26,120 -40,60 -97,111 -158,140 -49,24 -71,28 -171,31 -77,2 -128,-2 -155,-10 z m 264,-80 c 68,-33 104,-85 109,-155 7,-103 -56,-179 -214,-259 l -71,-36 -47,33 c -93,67 -136,164 -118,264 29,154 190,226 341,153 z M 756,582 C 885,488 919,317 828,214 780,160 729,138 649,138 497,138 396,251 430,382 c 15,57 102,141 195,190 39,21 75,38 81,38 6,0 29,-13 50,-28 z" />
       </g>
     </g>
    </svg:svg>

  </xsl:template>

  <xsl:template name="secondary-branding">
    <xsl:param name="color">
      <xsl:choose>
        <xsl:when test="$format.print != 1">&mid-green;</xsl:when>
        <xsl:otherwise>&light-gray;</xsl:otherwise>
      </xsl:choose>
    </xsl:param>
    <xsl:param name="opacity">0.18</xsl:param>

    <svg:svg
      xmlns:dc="http://purl.org/dc/elements/1.1/"
      xmlns:cc="http://creativecommons.org/ns#"
      xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
      xmlns:svg="http://www.w3.org/2000/svg"
      xmlns="http://www.w3.org/2000/svg"
      xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
      xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
      inkscape:version="1.0 (4035a4fb49, 2020-05-01)"
      sodipodi:docname="big8.svg"
      id="svg911"
      preserveAspectRatio="xMidYMid meet"
      viewBox="0 0 1350 1350"
      height="135px"
      width="135px"
      version="1.0">
     <metadata
        id="metadata917">
       <rdf:RDF>
         <cc:Work
            rdf:about="">
           <dc:format>image/svg+xml</dc:format>
           <dc:type
              rdf:resource="http://purl.org/dc/dcmitype/StillImage" />
         </cc:Work>
       </rdf:RDF>
     </metadata>
     <defs
        id="defs915" />
     <sodipodi:namedview
        inkscape:current-layer="layer2"
        inkscape:window-maximized="1"
        inkscape:window-y="25"
        inkscape:window-x="0"
        inkscape:cy="68.394052"
        inkscape:cx="67.5"
        inkscape:zoom="6.1333333"
        showgrid="false"
        id="namedview913"
        inkscape:window-height="1031"
        inkscape:window-width="1920"
        inkscape:pageshadow="2"
        inkscape:pageopacity="0"
        guidetolerance="10"
        gridtolerance="10"
        objecttolerance="10"
        borderopacity="1"
        bordercolor="#666666"
        pagecolor="#ffffff" />
     <g
        stroke="none"
        fill="#ffffff"
        id="layer102">
       <path
          id="path902"
          d="M510 1266 c-100 -29 -184 -98 -214 -177 -13 -35 -27 -50 -62 -69 -61 -32 -128 -109 -156 -178 -18 -47 -22 -77 -23 -172 0 -97 4 -125 24 -177 29 -78 90 -149 154 -178 39 -18 52 -32 73 -73 31 -63 89 -116 163 -151 52 -24 66 -26 186 -26 111 1 138 4 187 23 75 30 152 100 174 157 14 37 25 49 60 64 54 24 127 99 159 161 52 103 53 292 1 405 -31 68 -107 143 -160 157 -36 10 -45 17 -60 54 -22 54 -103 128 -176 163 -48 22 -70 26 -170 28 -72 1 -132 -3 -160 -11z m331 -30 c61 -29 118 -80 158 -140 22 -34 26 -50 26 -120 0 -64 -5 -89 -22 -121 -27 -51 -92 -113 -166 -160 l-59 -37 75 -49 c123 -81 168 -151 168 -263 0 -78 -16 -119 -68 -171 -75 -78 -180 -110 -332 -103 -117 6 -188 36 -257 110 -57 61 -76 107 -77 183 -1 107 51 189 168 265 36 23 65 46 65 50 0 3 -25 24 -55 45 -75 51 -148 134 -163 182 -17 56 -15 136 3 181 20 47 78 108 130 134 78 41 115 48 235 45 100 -3 122 -7 171 -31z m-516 -394 c17 -26 62 -71 100 -100 39 -30 71 -57 73 -62 1 -4 -20 -22 -47 -40 -56 -35 -151 -134 -151 -156 0 -46 -111 25 -141 89 -23 52 -25 144 -3 195 24 58 90 120 129 121 6 0 24 -21 40 -47z m772 5 c115 -77 122 -269 13 -361 -47 -39 -80 -44 -99 -15 -32 48 -95 110 -152 148 l-59 39 69 46 c76 51 121 96 142 145 16 35 31 34 86 -2z" />
       <path
          id="path904"
          d="M598 1196 c-91 -25 -143 -80 -160 -172 -18 -100 25 -197 118 -264 l47 -33 71 36 c158 80 221 156 214 259 -3 45 -11 66 -34 95 -34 43 -105 84 -144 82 -23 -1 -23 -2 5 -8 70 -17 133 -67 156 -123 12 -29 11 -32 -12 -47 -46 -30 -107 -92 -145 -146 -20 -30 -39 -55 -40 -55 -2 0 -21 26 -43 58 -43 64 -103 122 -150 147 -37 19 -37 20 -8 67 32 53 72 80 146 99 36 10 57 17 46 17 -11 1 -41 -5 -67 -12z" />
       <path
          id="path906"
          d="M627 573 c-77 -41 -160 -111 -182 -153 -8 -15 -17 -46 -21 -69 -6 -36 -4 -41 13 -41 41 0 139 92 188 178 11 17 22 32 26 32 4 0 18 -19 32 -42 36 -62 100 -131 141 -153 20 -11 36 -23 36 -28 0 -4 -9 -26 -20 -47 -25 -49 -80 -87 -143 -99 -61 -11 -72 -21 -15 -14 182 24 258 226 142 379 -30 39 -99 94 -118 94 -6 0 -42 -17 -79 -37z" />
       <path
          id="path908"
          d="M431 286 c-3 -54 108 -147 174 -145 29 1 29 1 -5 8 -73 15 -144 74 -162 133 -5 19 -6 20 -7 4z" />
     </g>
     <g
        style="display:inline"
        inkscape:label="Layer 2"
        id="layer2"
        inkscape:groupmode="layer">
       <g
          style="fill:#ffff00;fill-opacity:1"
          transform="rotate(90,674.11582,687.9237)"
          id="layer101-6"
          fill="#000000"
          stroke="none">
         <path
            style="fill:#ffff00;fill-opacity:1"
            d="m 515,1257 c -101,-34 -180,-97 -210,-169 -18,-45 -20,-125 -3,-181 15,-48 88,-131 163,-182 30,-21 55,-42 55,-45 0,-4 -29,-27 -65,-50 C 338,554 286,472 287,365 288,289 307,243 364,182 433,108 504,78 621,72 c 152,-7 257,25 332,103 52,52 68,93 68,171 0,112 -45,182 -168,263 l -75,49 59,37 c 74,47 139,109 166,160 17,32 22,57 22,121 0,70 -4,86 -26,120 -40,60 -97,111 -158,140 -49,24 -71,28 -171,31 -77,2 -128,-2 -155,-10 z m 264,-80 c 68,-33 104,-85 109,-155 7,-103 -56,-179 -214,-259 l -71,-36 -47,33 c -93,67 -136,164 -118,264 29,154 190,226 341,153 z M 756,582 C 885,488 919,317 828,214 780,160 729,138 649,138 497,138 396,251 430,382 c 15,57 102,141 195,190 39,21 75,38 81,38 6,0 29,-13 50,-28 z"
            id="path899-0" />
       </g>
     </g>
     <g
        style="display:inline"
        inkscape:label="Layer 1"
        id="layer1"
        inkscape:groupmode="layer">
       <g
          style="fill:#0000ff"
          stroke="none"
          fill="#000000"
          id="layer101">
         <path
            style="fill:#0000ff"
            id="path899"
            d="m 515,1257 c -101,-34 -180,-97 -210,-169 -18,-45 -20,-125 -3,-181 15,-48 88,-131 163,-182 30,-21 55,-42 55,-45 0,-4 -29,-27 -65,-50 C 338,554 286,472 287,365 288,289 307,243 364,182 433,108 504,78 621,72 c 152,-7 257,25 332,103 52,52 68,93 68,171 0,112 -45,182 -168,263 l -75,49 59,37 c 74,47 139,109 166,160 17,32 22,57 22,121 0,70 -4,86 -26,120 -40,60 -97,111 -158,140 -49,24 -71,28 -171,31 -77,2 -128,-2 -155,-10 z m 264,-80 c 68,-33 104,-85 109,-155 7,-103 -56,-179 -214,-259 l -71,-36 -47,33 c -93,67 -136,164 -118,264 29,154 190,226 341,153 z M 756,582 C 885,488 919,317 828,214 780,160 729,138 649,138 497,138 396,251 430,382 c 15,57 102,141 195,190 39,21 75,38 81,38 6,0 29,-13 50,-28 z" />
       </g>
     </g>
    </svg:svg>

  </xsl:template>

</xsl:stylesheet>
