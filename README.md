# tecnored charts
## tr02.py es la última versión para digestores

```
@expose("/chartDigestores/")
    @has_access
    def chartDigestores(self):
         ruta = '<script>window.open("http://127.0.0.1:8050", "chartsTecnored", "height=640,left=400, titlebar=no, toolbar=no, top=300, width=960,menubar=no,scrollbars=no,location=no,status=no");</script>'
        return ruta
        
appbuilder.add_link("chartDigestores", href="/myview/chartDigestores", category="Charts")
```
