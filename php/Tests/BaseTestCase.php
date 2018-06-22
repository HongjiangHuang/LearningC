<?php
namespace Tests;

use Questions\Base;

class BaseTestCase extends \PHPUnit_Framework_TestCase
{
    protected function setUp()
    {
        parent::setUp();
    }

    public function test_base_main()
    {
        $this->assertTrue(
            method_exists(Base::class, 'main')
        );
    }
}
