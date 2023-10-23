<?php

namespace App\Http\Requests;


use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use App\Http\Helper\Helper;


class MovieRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
           'title' => 'required',
           'post_path' => 'required',
           'backdrop_path' => 'required',
           'release' => 'required',
           'overview' => 'string',
           'vote_count' => 'integer',
           'vote_average' => 'float',
           'status' => 'required',
           'cast_id' => 'integer|',
        ];
    }

    public function failedValidation(Validator $validator){
        Helper::sendError('validation error', $validator->errors(), 401);
    }
}
