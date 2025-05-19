// Feather disable all

function InputTextApplyDelta(_string, _maxLength = infinity)
{
   static _system = __InputTextSystem();
   with(_system)
    {
        __enabled = true;
        
        _string = string_copy(_string, 1, string_length(_string) - __removeCount);
        _string += __textDelta;
        
        return string_copy(_string, 1, _maxLength);
    }
    
    return _string;
}