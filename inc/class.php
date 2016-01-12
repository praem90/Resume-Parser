<?php

include_once 'config.php';

if (!isset($_SESSION) || strlen(session_id()) == '') {
    session_start();
}

class functions
{
    public $con = null;
    public $res;
    public $db = _DBName_;
    public $dbuname = _DBUser_;
    public $dbpass = _DBPass_;

    public function __construct()
    {
        if (!$this->con) {
            if (!$this->con = mysqli_connect('', $this->dbuname, $this->dbpass, $this->db)) {
                echo $this->error();
                die();
            }
        }
    }

    public function tableExists($table)
    {
        $tablesInDb = @$this->query('SHOW TABLES FROM '.$this->db.' LIKE "'.$table.'"');
        if ($tablesInDb && mysqli_num_rows($tablesInDb) == 1) {
            return true;
        }

        return false;
    }

    public function query($sql)
    {
        $this->res = mysqli_query($this->con, $sql);
        if (!$this->res) {
            $this->error();

            return false;
        } else {
            $this->error();

            return $this->res;
        }
    }

    public function error()
    {
        return mysqli_error($this->con);
    }

    public function lastID()
    {
        return mysqli_insert_id($this->con);
    }

    public function __destruct()
    {
        if ($this->con) {
            mysqli_close($this->con);
        }
    }
}
