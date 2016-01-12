<?php

   class DocxConversion
   {
       private $filename;

       public function __construct($filePath)
       {
           $this->filename = $filePath;
       }

       private function read_doc()
       {
           if (file_exists($this->filename)) {
               if (($fh = fopen($this->filename, 'r')) !== false) {
                   $headers = fread($fh, 0xA00);
                   $n1 = (ord($headers[0x21C]) - 1); // 1 = (ord(n)*1) ; Document has from 0 to 255 characters
            $n2 = ((ord($headers[0x21D]) - 8) * 256); // 1 = ((ord(n)-8)*256) ; Document has from 256 to 63743 characters
            $n3 = ((ord($headers[0x21E]) * 256) * 256); // 1 = ((ord(n)*256)*256) ; Document has from 63744 to 16775423 characters
            $n4 = (((ord($headers[0x21F]) * 256) * 256) * 256); // 1 = (((ord(n)*256)*256)*256) ; Document has from 16775424 to 4294965504 characters
            $textLength = ($n1 + $n2 + $n3 + $n4); // Total length of text in the document
            $extracted_plaintext = fread($fh, $textLength);
                   $extracted_plaintext = mb_convert_encoding($extracted_plaintext, 'UTF-8');
             // if you want to see your paragraphs in a new line, do this
             // return nl2br($extracted_plaintext);
              return $extracted_plaintext;
               } else {
                   return false;
               }
           } else {
               return false;
           }
       }

       private function read_docx()
       {
           $striped_content = '';
           $content = '';

           $zip = zip_open($this->filename);

           if (!$zip || is_numeric($zip)) {
               return false;
           }

           while ($zip_entry = zip_read($zip)) {
               if (zip_entry_open($zip, $zip_entry) == false) {
                   continue;
               }

               if (zip_entry_name($zip_entry) != 'word/document.xml') {
                   continue;
               }

               $content .= zip_entry_read($zip_entry, zip_entry_filesize($zip_entry));

               zip_entry_close($zip_entry);
           }// end while

        zip_close($zip);

           $content = str_replace('</w:r></w:p></w:tc><w:tc>', ' ', $content);
           $content = str_replace('</w:r></w:p>', "\r\n", $content);
           $striped_content = strip_tags($content);

           return $striped_content;
       }

 /************************excel sheet************************************/

public function xlsx_to_text($input_file)
{
    $xml_filename = 'xl/sharedStrings.xml'; //content file name
    $zip_handle = new ZipArchive();
    $output_text = '';
    if (true === $zip_handle->open($input_file)) {
        if (($xml_index = $zip_handle->locateName($xml_filename)) !== false) {
            $xml_datas = $zip_handle->getFromIndex($xml_index);
            $xml_handle = DOMDocument::loadXML($xml_datas, LIBXML_NOENT | LIBXML_XINCLUDE | LIBXML_NOERROR | LIBXML_NOWARNING);
            $output_text = strip_tags($xml_handle->saveXML());
        } else {
            $output_text .= '';
        }
        $zip_handle->close();
    } else {
        $output_text .= '';
    }

    return $output_text;
}

/*************************power point files*****************************/

public function pptx_to_text($input_file)
{
    $zip_handle = new ZipArchive();
    $output_text = '';
    if (true === $zip_handle->open($input_file)) {
        $slide_number = 1; //loop through slide files
        while (($xml_index = $zip_handle->locateName('ppt/slides/slide'.$slide_number.'.xml')) !== false) {
            $xml_datas = $zip_handle->getFromIndex($xml_index);
            $xml_handle = DOMDocument::loadXML($xml_datas, LIBXML_NOENT | LIBXML_XINCLUDE | LIBXML_NOERROR | LIBXML_NOWARNING);
            $output_text .= strip_tags($xml_handle->saveXML());
            $slide_number++;
        }
        if ($slide_number == 1) {
            $output_text .= '';
        }
        $zip_handle->close();
    } else {
        $output_text .= '';
    }

    return $output_text;
}

       public function convertToText()
       {
           if (isset($this->filename) && !file_exists($this->filename)) {
               return 'File Not exists';
           }

           $fileArray = pathinfo($this->filename);
           $file_ext = $fileArray['extension'];
           if ($file_ext == 'doc' || $file_ext == 'docx' || $file_ext == 'xlsx' || $file_ext == 'pptx' || $file_ext == 'pdf') {
               if ($file_ext == 'doc') {
                   return $this->read_doc();
               } elseif ($file_ext == 'docx') {
                   return $this->read_docx();
               } elseif ($file_ext == 'xlsx') {
                   return $this->xlsx_to_text();
               } elseif ($file_ext == 'pptx') {
                   return $this->pptx_to_text();
               } elseif ($file_ext == 'pdf') {
                   return $this->pdf2string();
               }
           } else {
               return 'Invalid File Type';
           }
       }

       public function pdf2string()
       {
           $sourcefile = $this->filename;

           $fp = fopen($sourcefile, 'rb');
           $content = fread($fp, filesize($sourcefile));
           fclose($fp);

           $searchstart = 'stream';
           $searchend = 'endstream';
           $pdfText = '';
           $pos = 0;
           $pos2 = 0;
           $startpos = 0;

           while ($pos !== false && $pos2 !== false) {
               $pos = strpos($content, $searchstart, $startpos);
               $pos2 = strpos($content, $searchend, $startpos + 1);

               if ($pos !== false && $pos2 !== false) {
                   if ($content[$pos] == 0x0d && $content[$pos + 1] == 0x0a) {
                       $pos += 2;
                   } elseif ($content[$pos] == 0x0a) {
                       $pos++;
                   }

                   if ($content[$pos2 - 2] == 0x0d && $content[$pos2 - 1] == 0x0a) {
                       $pos2 -= 2;
                   } elseif ($content[$pos2 - 1] == 0x0a) {
                       $pos2--;
                   }

                   $textsection = substr(
                $content,
                $pos + strlen($searchstart) + 2,
                $pos2 - $pos - strlen($searchstart) - 1
            );
                   $data = @gzuncompress($textsection);
                   $pdfText .= $this->pdfExtractText($data);
                   $startpos = $pos2 + strlen($searchend) - 1;
               }
           }

           return preg_replace('/(\s)+/', ' ', $pdfText);
       }

       public function pdfExtractText($psData)
       {
           if (!is_string($psData)) {
               return '';
           }

           $text = '';

    // Handle brackets in the text stream that could be mistaken for
    // the end of a text field. I'm sure you can do this as part of the
    // regular expression, but my skills aren't good enough yet.
    $psData = str_replace('\)', '##ENDBRACKET##', $psData);
           $psData = str_replace('\]', '##ENDSBRACKET##', $psData);

           preg_match_all(
        '/(T[wdcm*])[\s]*(\[([^\]]*)\]|\(([^\)]*)\))[\s]*Tj/si',
        $psData,
        $matches
    );
           for ($i = 0; $i < count($matches[0]); $i++) {
               if ($matches[3][$i] != '') {
                   // Run another match over the contents.
            preg_match_all('/\(([^)]*)\)/si', $matches[3][$i], $subMatches);
                   foreach ($subMatches[1] as $subMatch) {
                       $text .= $subMatch;
                   }
               } elseif ($matches[4][$i] != '') {
                   $text .= ($matches[1][$i] == 'Tc' ? ' ' : '').$matches[4][$i];
               }
           }

    // Translate special characters and put back brackets.
    $trans = [
        '...'                 => '…',
        '\205'                => '…',
        '\221'                => chr(145),
        '\222'                => chr(146),
        '\223'                => chr(147),
        '\224'                => chr(148),
        '\226'                => '-',
        '\267'                => '•',
        '\('                  => '(',
        '\['                  => '[',
        '##ENDBRACKET##'      => ')',
        '##ENDSBRACKET##'     => ']',
        chr(133)              => '-',
        chr(141)              => chr(147),
        chr(142)              => chr(148),
        chr(143)              => chr(145),
        chr(144)              => chr(146),
    ];
           $text = strtr($text, $trans);

           return $text;
       }
   }
