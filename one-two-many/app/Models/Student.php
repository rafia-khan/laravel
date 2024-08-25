<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Phone;

class Student extends Model
{
    use HasFactory;

    public function phone(){ 
        return $this->hasMany(Phone::class, 'user_id');
    }
}
