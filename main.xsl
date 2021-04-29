<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:tei="http://www.tei-c.org/ns/1.0"
	xmlns="http://www.w3.org/1999/xhtml"
	xmlns:fn="http://www.w3.org/2005/xpath-functions">

	<xsl:output method="html"/>

    <xsl:template match="/tei:teiCorpus">
        <html>
            <head>
                <title>Progetto codifica di testi</title>
                <link href="style.css" rel="stylesheet" type="text/css"/>
                <script src="javascript.js"></script>
            </head>
            <body>
                <header>    
                    <img id="logoUnipi" src="logo.png" alt="logoUnipi"/>   
                </header>
                <div id="aprichiudi">
                    <div id="bar1"></div>
                    <div id="bar2"></div>
                    <div id="bar3"></div>
                </div>
                <nav>
                    <div id="menu" class="menuChiuso">
                        <a href="#c127">Cartolina 127</a>
                        <a href="#c207">Cartolina 207</a>
                        <a href="#c211">Cartolina 211</a>
                        <a href="#crediti1">Crediti</a>
                    </div>
                </nav>

                
                    
                <div id="corpo">
                    <a href="#logoUnipi"><div id="tornasu"><img src="tornaSu.png" width="50px" height="50px"/></div></a>
                    
                    
                    <xsl:for-each select="tei:TEI">
                        <div class="cartolina">
                            <xsl:call-template name="titoli"/>
                                
                            <div class="immagini">
                                <span class="fronte"><xsl:apply-templates select="tei:facsimile/tei:surface[@type='fronte']/tei:graphic"/></span>
                                <span class="retro"><xsl:apply-templates select="tei:facsimile/tei:surface[@type='retro']/tei:graphic"/><p><xsl:text>Clicca sulla cartolina per ingrandirla</xsl:text></p></span>
                                
                            </div>
                            <div class="zoom">
                                <span class="chiudi"><div id="barra1"/><div id="barra2"/></span>
                                <span class="zoomRetro"><xsl:apply-templates select="tei:facsimile/tei:surface[@type='retro']/tei:graphic"/></span>
                            </div>
                            
                                    
                            <table>
                                <caption>
                                    <div class="note">
                                        <h2><xsl:text>Note: </xsl:text></h2><xsl:value-of select="tei:teiHeader//tei:notesStmt/tei:note"/>
                                    </div>   
                                </caption>
                                <tr>
                                    <td>
                                        <div class="descrizioneImmagini">
                                            <h2><xsl:text>Descrizione:</xsl:text></h2><xsl:value-of select="tei:text/tei:body//tei:figDesc"/>
                                            
                                         </div>
                                    </td>
                                        
                                
                                
                                    <td>
                                        <div class="corpoTesto">
                                                
                                            <h2><xsl:text>Testo cartolina:</xsl:text></h2>
                                            <p class="estendi"><i class="clickExpan"><xsl:text>Clicca qui</xsl:text></i><xsl:text> per estendere le forme </xsl:text><u><xsl:text>abbreviate</xsl:text></u></p>
                                            <p class="abbrevia"><i class="clickAbbr"><xsl:text>Clicca qui</xsl:text></i><xsl:text> per ridurre le forme </xsl:text><u><xsl:text>estese</xsl:text></u></p>
                                            <div class="text">
                                                <div class="codiceIdno">
                                                    <xsl:value-of select="tei:text/tei:body//tei:div[@type='codice']"/>
                                                </div>
                                                <xsl:apply-templates select="tei:text/tei:body//tei:div[@type='message']"/>
                                                <div class="linea"/>
                                                <div class="spedizione">
                                                    <xsl:apply-templates select="tei:text/tei:body//tei:div[@type='destination']"/>  
                                                </div>
                                            </div>
                                                
                                        </div>
                                    </td>
    
                                    <td>
                                        <div class="bloccoInfo">
                                            <h2><xsl:text>Codice identificativo: </xsl:text></h2><xsl:value-of select="tei:teiHeader//tei:idno"/><br/>
                                            <h2><xsl:text>Repository: </xsl:text></h2><xsl:value-of select="tei:teiHeader//tei:repository"/><br/>
                                            <h2><xsl:text>Tipologia: </xsl:text></h2><xsl:value-of select="tei:teiHeader//tei:summary"/><br/>
                                            <h2><xsl:text>Condizioni: </xsl:text></h2><xsl:value-of select="tei:teiHeader//tei:condition"/><br/>
                                            <h2><xsl:text>Spedizione: </xsl:text></h2><xsl:text>La cartolina è stata spedita da </xsl:text><xsl:value-of select="tei:teiHeader//tei:profileDesc//tei:correspAction[@type='sent']/tei:persName"/><xsl:text> presso </xsl:text><xsl:value-of select="tei:teiHeader//tei:profileDesc//tei:correspAction[@type='sent']/tei:placeName"/><xsl:text> a </xsl:text><xsl:value-of select="tei:teiHeader//tei:profileDesc//tei:correspAction[@type='received']/tei:persName"/><xsl:text> presso </xsl:text><xsl:value-of select="tei:teiHeader//tei:profileDesc//tei:correspAction[@type='received']/tei:placeName"/>
                                        </div>
                                    </td>
                                </tr>
                                    
                            </table> 
                            <div class="bloccoFacsimile">
                                <xsl:call-template name="originali"/>
                                
                            </div>
                        </div>
                        <div class="divisore"/>
                    </xsl:for-each>
                    <div id="crediti1">
                        <xsl:text>Sito realizzato per l'esame di </xsl:text><strong><xsl:text>Codifica di testi a.a. 2019/2020</xsl:text></strong>
                        <p><xsl:value-of select="tei:teiHeader//tei:respStmt"/></p>
                        <p><xsl:value-of select="tei:teiHeader//tei:edition"/></p>
                    </div>
                    <div id="crediti2">
                        <xsl:for-each select="tei:teiHeader//tei:editionStmt//tei:respStmt">
                            <p><xsl:value-of select="."/></p>
                        </xsl:for-each>
                    </div>
                    <div id="crediti3">
                        <p><xsl:value-of select="tei:teiHeader//tei:publicationStmt/tei:publisher"/><xsl:text> - </xsl:text><xsl:value-of select="tei:teiHeader//tei:publicationStmt/tei:pubPlace"/></p>
                        <p><xsl:value-of select="tei:teiHeader//tei:publicationStmt//tei:availability"/></p>
                    </div>
                    <div class="divisore"/>
                </div>
            </body> 
        </html>
    </xsl:template>

    <xsl:template name="titoli" match="tei:teiCorpus/tei:TEI">
        <div class="titolo" id="{@xml:id}">
            <h1><xsl:value-of select="tei:teiHeader//tei:title"/></h1>
        </div>
    </xsl:template>

    <xsl:template match="tei:graphic">    
        <img src="{@url}" />
    </xsl:template>

    <xsl:template match="tei:opener">
		<xsl:apply-templates select="./tei:dateline"/><br/>
                       
	</xsl:template>

    

    <xsl:template match="tei:lb">
        <xsl:value-of select="."/><br/>
    </xsl:template>

    <xsl:template match="tei:stamp[@type='postmark']">
        
        <xsl:text>Testo presente sul timbro: </xsl:text><xsl:apply-templates select="./tei:mentioned"/><br/>
        <xsl:text> Data spedizione: </xsl:text><xsl:apply-templates select="./tei:date"/><br/>
        <xsl:text> Orario spedizione: </xsl:text><xsl:apply-templates select="./tei:time"/><br/>
        <div class="linea"/>
    </xsl:template>

    <xsl:template match="tei:gap">
        <xsl:text>[...]</xsl:text>
    </xsl:template>

    <xsl:template match="tei:unclear">
        <span class="unclear"><xsl:value-of select="."/></span>
    </xsl:template>

    <xsl:template match="tei:stamp[@type='postage']">
        <xsl:value-of select="."/>
        <div class="linea"/>
    </xsl:template>

    <xsl:template match="tei:address">
        <xsl:for-each select="tei:addrLine">
            <xsl:apply-templates select="."/><br/>
        </xsl:for-each>
            
    </xsl:template>

    <xsl:template match="tei:choice">
        <span class="choice"><span class="abbr"><xsl:value-of select="tei:abbr"/></span><span class="expan"><xsl:value-of select="tei:expan"/></span></span>
    </xsl:template>

    

    <xsl:template name="originali" match="tei:teiCorpus/tei:TEI">
        <a class="pulsante" href="{@xml:id}.html">Risorsa originale</a>
    </xsl:template>

    

    

    
   

       

        
        


       




        

        






       
        




</xsl:stylesheet>