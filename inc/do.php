<?php

// session_start();

if (isset($_POST['Do'])) {
    $msg = ['id' => 0, 'msg' => 'Try Again'];

    include 'class.php';

    $data = $_POST['data'];

    $newClass = new functions();

    // session_write_close();

    if ($_POST['Do'] == 'AddResumeDetails') {
        $sql = 'select userID from rms_user where email = "'.$data['email'].'" ';
        $res = $newClass->query($sql);

        if ($res && mysqli_num_rows($res) >= 1) {
            $msg['msg'] = 'Email ID already exists';
            die(json_encode($msg));
        } elseif (!$res) {
            $msg['msg'] = 'Something went wrong';
            $msg['error'] = $newClass->error();
            $msg['sql'] = $sql;
            die(json_encode($msg));
        }

        $sql = 'insert into rms_user(firstName,email,dob,mobile,city,status) values( "'.$data['name'].'", "'.$data['email'].'", "'.$data['dob'].'", "'.$data['mobile'].'", "'.$data['place'].'",1 )';
        $res = $newClass->query($sql);
        if (!$res) {
            $msg['msg'] = 'Something went wrong';
            $msg['error'] = $newClass->error();
            $msg['sql'] = $sql;
            die(json_encode($msg));
        }
        $uid = $newClass->lastID();

        $sql = 'insert into rms_resume_details(userID,fileName,resumeText,status) values ( "'.$uid.'", "'.$data['filename'].'", "'.$data['resumeText'].'", 1 )';
        $res = $newClass->query($sql);

        if ($res) {
            $msg['id'] = 1;
            $msg['msg'] = 'Inserted successfully';
        } else {
            $msg['msg'] = 'Something went wrong';
            $msg['error'] = $newClass->error();
            $msg['sql'] = $sql;
        }
        die(json_encode($msg));
    }
}
