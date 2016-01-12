<?php


if ($_SERVER['HTTP_HOST'] == 'localhost') {
    $dbName = 'resume';
    $dbUser = 'root';
    $dbPass = '';
} else {
    $dbName = 'pine_resume';
    $dbUser = 'pine_user';
    $dbPass = ']GC.h^[TP=,+';
}
if (!defined('_DBName_')) {
    define('_DBName_', $dbName);
    define('_DBUser_', $dbUser);
    define('_DBPass_', $dbPass);
}

if (!class_exists('Constants')) {
    class Constants
    {
        // private static $ass = array( 3=>1, 80=>3287, 81=>3288, 82=>3289, 83=>3290,
        //                              84=>3291, 85=>3292, 86=>3293, 87=>3294, 88=>3295,
        //                              89=>3296, 90=>3297, 91=>3298, 92=>3299, 93=>3300,
        //                              94=>3301, 95=>3302, 96=>3303, 97=>3304, 98=>3305,
        //                              99=>3306, 100=>3307, 101=>3308, 102=>3309, 103=>3310 ) ;
        private static $ass = [3          => 1, 3287 => 80, 3288 => 81, 3289 => 82, 3290 => 83,
                                     3291 => 84, 3292 => 85, 3293 => 86, 3294 => 87, 3295 => 88,
                                     3296 => 89, 3297 => 90, 3298 => 91, 3299 => 92, 3300 => 93,
                                     3301 => 94, 3302 => 95, 3303 => 96, 3304 => 97, 3305 => 98,
                                     3306 => 99, 3307 => 100, 3308 => 101, 3309 => 102, 3310 => 103, ];

        public static function ass()
        {
            return array_keys(self::$ass);
        }

        public static function assMems()
        {
            return array_values(self::$ass);
        }

        public static function getArray()
        {
            return self::$ass;
        }
    }
}
