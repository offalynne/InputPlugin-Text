// Feather disable all

function __InputTextBulidProfanityMaskedString(_unfilteredString, _filteredString, _maskAfterFirstOffense)
{
    var _maskedString = "";
    var _unfilteredArray  = string_split(_unfilteredString, " ");
    var _filteredArray    = string_split(_filteredString,   " ");
    var _unfilteredLength = array_length(_unfilteredArray);
    var _filteredLength   = array_length(_filteredArray);
    var _offendingSubstringFound = false;
    
    var _index = 0;
    repeat(_unfilteredLength)
    {
        var _string = _unfilteredArray[_index];
        var _word = string_repeat(__INPUT_TEXT_PROFANITY_CHAR, string_length(_string));
        
        if not (_maskAfterFirstOffense && _offendingSubstringFound)
        {
            if (_index >= _filteredLength)
            {
                _offendingSubstringFound = true;
            }
            else
            {
                if (_string != _filteredArray[_index])
                {
                    _offendingSubstringFound = true;
                }
                else
                {
                    _word = _string;
                }
            }
        }

        _maskedString += _word + (_index < _unfilteredLength - 1)? " " : "";
        
        ++_index;
    }

    return _maskedString;
}