<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" />

  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>

    <html lang="en">
      <head>
        <title>niceindex</title>

        <meta name="version" conent="1.1.0" />
        <meta name="viewport" conent="initial-scale=1, minimum-scale=1, shrink-to-fit=no, width=device-width" />

        <link rel="stylesheet" href=".niceindex/css/main.css" />
      </head>
      <body>
        <div class="container">
          <h1>Directory index</h1>
          <hr />
          <pre>
            <p>   name                          date        time           size</p>
            <xsl:variable name="months" select="'  JanFebMarAprMayJunJulAugSepOctNovDec'" />
            <xsl:for-each select="list/*">
              <a>
              <xsl:attribute name="href">
              <xsl:value-of select="." />
              <xsl:if test="name() = 'directory'">/</xsl:if>
              </xsl:attribute>
              <xsl:value-of select="." />
              <xsl:value-of select="substring('                              ', 1, 30-string-length())"/>
              <xsl:value-of select="substring(./@mtime, 9, 2)"/>
              <xsl:text>-</xsl:text>
              <xsl:value-of select="substring($months, substring(./@mtime, 6, 2) * 3, 3)"/>
              <xsl:text>-</xsl:text>
              <xsl:value-of select="substring(./@mtime, 1, 4)"/>
              <xsl:text> </xsl:text>
              <xsl:value-of select="substring(./@mtime, 12, 5)"/>
              <xsl:value-of select="substring('               ', 1, 15-string-length(./@size))"/>
              <xsl:value-of select="./@size" />
              </a>
              <xsl:text>&#xd;</xsl:text>
            </xsl:for-each>

          </pre>
          <hr />
          <footer>
            <a href="https://github.com/reven/ngx-niceindex" target="_blank">https://github.com/reven/ngx-niceindex</a>
          </footer>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>