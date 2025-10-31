// Feather disable all

function __InputTextBulidProfanityMaskedString(_unfilteredString, _filteredString, _maskAfterFirstOffense)
{
    var _maskedString = "";
    var _offendingSubstringFound = false;

    var _unfilteredArray  = string_split(_unfilteredString, " ");
    var _filteredArray    = string_split(_filteredString,   " ");
    var _unfilteredLength = array_length(_unfilteredArray);
    var _filteredLength   = array_length(_filteredArray);
    
    var _wordIndex = 0;
    repeat(_unfilteredLength)
    {
        var _string = _unfilteredArray[_wordIndex];
        var _word = string_repeat(__INPUT_TEXT_PROFANITY_CHAR, _unfilteredLength);
        
        if not (_maskAfterFirstOffense && _offendingSubstringFound)
        {
            if (_wordIndex >= _filteredLength)
            {
                _offendingSubstringFound = true;
            }
            else
            {
                if (_string != _filteredArray[_wordIndex])
                {
                    _offendingSubstringFound = true;
                }
                else
                {
                    _word = _string;
                }
            }
        }

        _maskedString += _word;

        if (_wordIndex < _unfilteredLength - 1)
        {
            _maskedString += " ";
        }
        
        ++_wordIndex;
    }

    return _maskedString;
}
