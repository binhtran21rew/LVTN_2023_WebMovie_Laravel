<?php
namespace App\Traits;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;

trait StoreImg{
    public function imgUpload($request, $filename, $folder){
        if($request->hasFile($filename)){
            $file = $request->$filename;
            $fileDB = Str::random(20). '.' . $file->getClientOriginalExtension();
            $path = $request->$filename->storeAs('public/' . $folder. '/'. auth()->id(),$fileDB);

            return Storage::url($path);
        }
        return null;
    }
}

    