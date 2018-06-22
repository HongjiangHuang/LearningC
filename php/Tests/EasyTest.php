<?php
namespace Tests;

use Questions\Easy;

class EasyTest extends \PHPUnit_Framework_TestCase
{
    public function test_removeDuplicates()
    {
        $arr = [0,0,1,1,1,2,2,3,3,4];
        $len = (new Easy())->removeDuplicates($arr);
        self::assertTrue($len === 5, $len);
        foreach ($arr as $k => $v) {
            if ($k < $len) {
                self::assertTrue([0,1,2,3,4][$k] === $v);
            }
        }
    }
}