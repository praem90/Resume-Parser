<?php 
session_start();

include_once 'inc/function.find_date.php';
include_once 'inc/docx.php';
include_once 'inc/PdfParser.php';
// include_once 'inc/PdfParser/Parser.php';
include_once 'inc/class.php';
$functions = new functions();

$sql = 'select firstname,email,dob,mobile,city as place,filename,lastLoginDate from rms_user as u, rms_resume_details as d where u.userid = d.userid';
$res = $functions->query($sql);
    $skills_arr = [];
if ($res) {
    while ($row = mysqli_fetch_assoc($res)) {
        $resume_details[$row['filename']] = $row;
    }
} else {
    echo $functions->error();
}

function reArrayFiles(&$file_post)
{
    $file_ary = [];
    $file_count = count($file_post['name']);
    $file_keys = array_keys($file_post);

    for ($i = 0; $i < $file_count; $i++) {
        foreach ($file_keys as $key) {
            $file_ary[$i][$key] = $file_post[$key][$i];
        }
    }

    return $file_ary;
}

if (isset($_POST) && isset($_POST['Do'])) {
    $target_dir = 'resumes/';
    if (!is_dir($target_dir)) {
        mkdir('resumes');
    }
    $glob = glob('resumes/*.*');
    $glob = sprintf('%02d', count($glob) + 1);
    $files = reArrayFiles($_FILES['offer-main']);
    $details = [];
    foreach ($files as $fileToUpload) {
        // $fileToUpload = $_FILES['offer-main'];
        $do = 'offer-main-form';

        $uploadOk = 1;
        $imageFileType = pathinfo($fileToUpload['name'], PATHINFO_EXTENSION);
        $target_file = $target_dir.$glob.'-'.$fileToUpload['name'];

        $check = getimagesize($fileToUpload['tmp_name']);
        if ($fileToUpload['size'] > 500000) {
            $msg = 'Sorry, your file is too large.';
            $uploadOk = 0;
        }
        // Allow certain file formats
        if ($imageFileType != 'docx' && $imageFileType != 'doc' && $imageFileType != 'xlsx' && $imageFileType != 'pptx' && $imageFileType != 'pdf') {
            $msg = 'Sorry, invalid file type.';
            $uploadOk = 0;
        }
        // Check if $uploadOk is set to 0 by an error
        if ($uploadOk == 0) {
            // $msg = "Sorry, your file was not uploaded.";
        // if everything is ok, try to upload file
        } else {
            if (move_uploaded_file($fileToUpload['tmp_name'], $target_file)) {
                $msg = 'The Resume has been uploaded.';

                if ($imageFileType == 'pdf') {
                    $pdfObj = new PdfParser();
                    $resumeText = $pdfObj->parseFile($target_file);
                    // $resumeText = $pdfObj->getText();
                } else {
                    $docObj = new DocxConversion($target_file);
                    $resumeText = $docObj->convertToText();
                }

                $sql = 'select city from rms_cities';
                $res = $functions->query($sql);
                $places = [];
                if ($res) {
                    while ($row = mysqli_fetch_assoc($res)) {
                        $places[] = $row['city'];
                    }
                } else {
                    die($functions->error());
                }
                $places_regx = strtolower('/'.implode('|', $places).'/');

                $fileInfo = explode(PHP_EOL, $resumeText);
                $records = [];
                foreach ($fileInfo as $row) {
                    // if($row == '') continue;
                    // $parts = explode(',12', $row);
                    $parts = preg_split('/(?<=[.?!])\s+(?=[a-z])/i', $row);
                    foreach ($parts as $part) {
                        if ($part == '') {
                            continue;
                        }
                    // echo $part.'<br><br>';
                        $part = strtolower($part);

                        //  ***************  EMAIL  **************

                        if (strpos($part, '@') || strpos($part, 'mail')) {
                            $pattern = '/[a-z0-9_\-\+]+@[a-z0-9\-]+\.([a-z]{2,3})(?:\.[a-z]{2})?/i';
                            preg_match_all($pattern, $part, $matches);
                            foreach ($matches[0] as $match) {
                                $records['email'][] = $match;
                            }
                        }

                        //  ***************  DOB  **************

                        if (preg_match('/dob|d.o.b|date of birth/', $part)) {
                            $dob = preg_split('/:|-/', $part);
                            foreach ($dob as $db) {
                                $date = date_parse($db);
                                if ($date['error_count'] == 0) {
                                    $records['dob'][] = $date['year'].'-'.$date['month'].'-'.$date['day'];
                                }
                            }
                        }

                        $date = @find_date($part);
                        if ($date) {
                            $records['dob'][] = $date['year'].'-'.$date['month'].'-'.$date['day'];
                        }
                        // }

                        $p = '{.*?(\d\d?)[\\/\.\-]([\d]{2})[\\/\.\-]([\d]{4}).*}';
                        if (preg_match($p, $part)) {
                            $date = preg_replace($p, '$3-$2-$1', $part);
                            $dd = new \DateTime($date);
                            $records['dob'][] = $dd->format('Y-m-d');
                        }

                        //  ***************  MOBILE  **************

                        preg_match_all('/\d{10}/', $part, $matches);
                        if (count($matches[0])) {
                            foreach ($matches[0] as $mob) {
                                $records['mobile'][] = $mob;
                            }
                        }

                        preg_match_all('/\d{12}/', $part, $matches);
                        if (count($matches[0])) {
                            foreach ($matches[0] as $mob) {
                                $records['mobile'][] = $mob;
                            }
                        }

                        preg_match_all('/(\d{5}) (\d{5})/', $part, $matches);
                        if (count($matches[0])) {
                            foreach ($matches[0] as $mob) {
                                $records['mobile'][] = $mob;
                            }
                        }

                        //  ***************  SKILLS  **************

                        preg_match_all('/production|sales|call center|Accounts|marketting|tele communication|engineer|software engineering|software engineer|manufacturing|office administration|human resource|admin|secretarial|customer service|call center|finance account/', $part, $matches);
                        if (count($matches[0])) {
                            foreach ($matches[0] as $skill) {
                                $records['skills'][] = $skill;
                            }
                        }

                        //  ***************  PLACE  **************

                        preg_match_all($places_regx, $part, $matches);
                        if (count($matches[0])) {
                            foreach ($matches[0] as $skill) {
                                $records['place'][] = ucwords($skill);
                            }
                        }

                        //  ***************  NAME  **fe************

                        if (isset($records['email'])) {
                            foreach ($records['email'] as $email) {
                                $e = explode('@', $email);
                                $records['name'][] = $e[0];
                            // code...
                            }
                        }
                    }
                }

                foreach ($records as $key => $value) {
                    $records[$key] = array_unique($value);
                }
                $records['text'] = $resumeText;
                $records['filename'] = $target_file;

                $details[] = $records;
            } else {
                $msg = 'Sorry, there was an error uploading your file.';
                break;
            }
        }
    }
}

?>
<!DOCTYPE html>
<html lang="en">

<head>

 <?php include_once 'inc/head.php'; ?>

</head>

<body>

    <div id="wrapper">
        <?php include_once 'inc/nav.php'; ?>
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h2 class="page-header">Resume Parser</h2>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-md-12 ">

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Upload your resume </h3>
                    </div>
                    <div class="panel-body">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#mainOffer" data-toggle="tab">Upload</a></li>
                            <li><a href="#Resumes" data-toggle="tab">Resumes</a></li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane fade in active" id="mainOffer">
                                <h3></h3>
                                <?php if (!isset($resumeText)) {
    ?>
                                <div class="col-md-6 col-sm-offset-3">
                                    <form id="offer-main-form" enctype="multipart/form-data" method="post">
                                        <div class="alert alert-info alert-dismissable ">
                                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                            <p></p>
                                        </div>
                                        <div class="progress hidden">
                                            <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                                                <span class="sr-only">45% Complete</span>
                                            </div>
                                        </div>
                                        <div class="form-group text-center">
                                            <input type="file" class="hidden" name="offer-main[]" multiple id="offer-main">
                                            <input type="hidden" name="Do" value="ChangeOfferMain">
                                            <input type="hidden" name="table" value="offer">
                                            <div class="btn btn-primary" onclick="$('#offer-main').click()" id="btn-offer-main">Upload Resume</div>&nbsp;&nbsp;&nbsp;
                                            <span id="info-offer-main"></span>
                                        </div>
                                    </form>
                                </div>
                                <?php 
} else {
    ?>
                            	<div class="col-sm-6 col-sm-offset-3">
	                                <?php foreach ($details as $key => $records) {
    ?>
	                                <h1></h1>
                                    <h3>
                                        <?php $fname = explode('/', $records['filename']);
    echo end($fname) ?>
                                    </h3>
                                    <form action="inc/do.php" id="Records<?php echo $key ?>" name="Records<?php echo $key ?>" method="post">
                                        <div class="alert alert-info alert-dismissable ">
                                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                            <p></p>
                                        </div>
                                        <div class="form-group">
                                            <label for="name">Name</label>
                                            <select id="name" class="form-control">
                                            <?php 
                                                if (isset($records['name'])) {
                                                    foreach ($records['name'] as $value) {
                                                        ?><option value="<?php echo $value ?>"><?php echo $value ?></option><?php

                                                    }
                                                }
    ?>
                                            <option value="0">Enter name</option>
                                            </select>
                                            <input class="form-control hidden" name="name" id="name" type="text" value="" >
                                            <input type="hidden" name="filename" id="filename" value="<?php echo end($fname) ?>" >
                                        </div>

                                        <div class="form-group">
                                            <label for="email">Email</label>
                                            <select id="email" class="form-control">
                                            <?php 
                                                if (isset($records['email'])) {
                                                    foreach ($records['email'] as $value) {
                                                        ?><option value="<?php echo $value ?>"><?php echo $value ?></option><?php

                                                    }
                                                }
    ?>
                                            <option value="0">Enter Email</option>
                                            </select>
                                            <input class="form-control hidden" name="email" id="email" type="text" value="" >
                                        </div>

                                        <div class="form-group">
                                            <label for="mobile">Mobile No</label>
                                            <select id="mobile" class="form-control">
                                            <?php 
                                                if (isset($records['mobile'])) {
                                                    foreach ($records['mobile'] as $value) {
                                                        ?><option value="<?php echo $value ?>"><?php echo $value ?></option><?php

                                                    }
                                                }
    ?>
                                            <option value="0">Enter mobile no</option>
                                            </select>
                                            <input class="form-control hidden" name="mobile" id="mobile" type="text" value="" >
                                        </div>

                                        <div class="form-group">
                                            <label for="place">Place</label>
                                            <select id="place" class="form-control">
                                            <?php 
                                                if (isset($records['place'])) {
                                                    foreach ($records['place'] as $value) {
                                                        ?><option value="<?php echo $value ?>"><?php echo $value ?></option><?php

                                                    }
                                                }
    ?>
                                            <option value="0">Enter place</option>
                                            </select>
                                            <input class="form-control hidden" name="place" id="place" type="text" value="" >
                                        </div>

                                        <div class="form-group">
                                            <label for="skill">Skills</label>
                                            <select id="skill" class="form-control">
                                            <?php 
                                                if (isset($records['skill'])) {
                                                    foreach ($records['skill'] as $value) {
                                                        ?><option value="<?php echo $value ?>"><?php echo $value ?></option><?php

                                                    }
                                                }
    ?>
                                            <option value="0">Enter skill</option>
                                            </select>
                                            <input class="form-control hidden" name="skill" id="skill" type="text" value="" >
                                        </div>

                                        <div class="form-group">
                                            <label for="dob">DOB</label>
                                            <select id="dob" class="form-control">
                                            <?php 
                                                if (isset($records['dob'])) {
                                                    foreach ($records['dob'] as $value) {
                                                        ?><option value="<?php echo $value ?>"><?php echo $value ?></option><?php

                                                    }
                                                }
    ?>
                                            <option value="0">Enter dob</option>
                                            </select>
                                            <input placeholder="DOB" class="form-control hidden" name="dob" id="dob" type="text" value="" >
                                        </div>

                                        <div class="form-group">
                                            <label for="resumeText">Resume Text</label>
                                            <textarea class="form-control" name="resumeText" id="resumeText">
                                                <?php echo $records['text'];
    ?>
                                            </textarea>
                                        </div>
                                        <button class="btn btn-primary" type="submit">Save</button>
                                    </form>
                                    <h1></h1>
	                                <?php 
}
    ?>
                            	</div>
                                <?php 
} ?>
                            </div>

                            <div class="tab-pane fade in" id="Resumes">
                            	<h1></h1>
		                        <div class="col-sm-12">
		                        	<table class="table table-bordered" id="resumeList">
		                        		<thead>
		                        			<tr>
		                        				<th>S.No</th>
		                        				<th>File Name</th>
                                                <th>Name</th>
                                                <th>Email</th>
                                                <th>Mobile</th>
                                                <th>Place</th>
		                        				<th>DOB</th>
		                        				<th>Date</th>
		                        			</tr>
		                        		</thead>
		                        		<tbody>
		                    			<?php 
                                            $i = 1;
                                            foreach ($resume_details as $resume_detail) {
                                                ?><tr><?php
                                                ?><td><?php echo $i;
                                                $i++;
                                                ?></td><?php
                                                ?><td><a href="<?php echo 'resumes/'.$resume_detail['filename'] ?>" target="_blank"><?php echo $resume_detail['filename'];
                                                ?></a></td><?php
                                                ?><td><?php echo $resume_detail['firstname'];
                                                ?></td><?php
                                                ?><td><?php echo $resume_detail['email'];
                                                ?></td><?php
                                                ?><td><?php echo $resume_detail['mobile'];
                                                ?></td><?php
                                                ?><td><?php echo $resume_detail['place'];
                                                ?></td><?php
                                                ?><td><?php echo $resume_detail['dob'];
                                                ?></td><?php
                                                ?><td><?php echo $resume_detail['lastLoginDate'];
                                                ?></td><?php
                                                ?></tr><?php

                                            }
                                        ?>
		                        		</tbody>
		                        	</table>
		                        </div>
		                    </div>
                        </div>
                    </div>
                </div>

                </div>
            <!-- /.row -->
            </div>
        </div>
        <!-- /#page-wrapper -->
        <?php include_once 'inc/footer.php'; ?>

    </div>
    <!-- /#wrapper -->
    <?php include_once 'inc/foot.php'; ?>
    <script>    
        $(function () {
        	$('#offer-main').on('change',function () {
        		$('#offer-main-form').submit()
        	})
        	$('#resumeList').dataTable()
            <?php if (isset($msg)) {
    ?>
                $('#<?php echo $do ?> .alert').show(300).delay(3000).hide(200).find('p').text("<?php echo $msg ?>")
            <?php 
} ?>
        })
    </script>
</body>

</html>
