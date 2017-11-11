# Resume Parser

A simple class to parse your resume to obtain fields like name, email, ph, date of birth

1.Just include parser.php
```
include /path/to/parser.php
```

2.Intiate object 
```
$obj = new ParseResume( 'path/to/file' );
```
3.Get matched records 
```
$records = $obj->get_records();
4.print_r($records);
```

Error is handled by ParseResume::error,  
```
if($obj->error) echo $obj->error()
```


Supported resume formats doc, docx, xlxs, pptx, pdf
