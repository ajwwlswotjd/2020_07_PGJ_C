<?php

use Gondr\DB;

function user($idx) {
	return DB::fetch("SELECT * FROM users WHERE idx = ?", [$idx]);
}