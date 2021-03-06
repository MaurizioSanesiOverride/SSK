#!/bin/bash

# This script generates HTML documentation and RelaxNG from TEI_SSK_ODD.xml
# To be executed in the 'spec' directory.
# A local installation of Java 1.6+, Saxon and Ant is required
# For more information, check http://www.tei-c.org/release/doc/tei-xsl/#commandline

# Relax NG
# Stylesheets/bin/teitorelaxng --odd TEI_SSK_ODD.xml TEI_SSK_ODD.rng

#HTML
# We don't use the script provided by the TEI consortium in order to set our own parameters to the XLS stylesheets
saxon -s:TEI_SSK_ODD.xml -xsl:Stylesheets/odds/odd2odd.xsl -o:output.tmp1.xml
saxon -s:output.tmp1.xml -xsl:Stylesheets/html/html.xsl -o:../docs/index.html institution=PARTHENOS cssFile=../docs/tei_SSK.css displayMode=rng line-width=60
rm output.tmp1.xml
echo Success
