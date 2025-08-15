<?php

namespace Tests\Unit;

use Tests\TestCase;

class FollowerDifferenceTest extends TestCase
{
    public function test_difference_between_followers_before_and_after()
    {
        $followersBefore = 100;
        $followersAfter  = 150;

        $difference = $followersAfter - $followersBefore;

        $this->assertEquals(50, $difference);
    }
}
