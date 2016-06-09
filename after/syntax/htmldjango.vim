" Highlight tag and variable blocks inside of scripts, styles, and attributes
syntax region djangoNestedTagBlock start="{%" end="%}" contained contains=djangoStatement,djangoFilter,djangoArgument,djangoTagError display containedin=htmlString,javaScript,javaScriptStringD,javaScriptStringN,jsStringS,jsStringD,cssStyle,cssDefinition
syntax region djangoNestedVarBlock start="{{" end="}}" contained contains=djangoFilter,djangoArgument,djangoVarError display containedin=htmlString,javaScript,javaScriptStringD,javaScriptStringN,jsStringS,jsStringD,cssStyle,cssDefinition
syntax cluster djangoBlocks add=djangoNestedTagBlock,djangoNestedVarBlock

highlight default link djangoNestedVarBlock djangoVarBlock
highlight default link djangoNestedTagBlock djangoTagBlock
