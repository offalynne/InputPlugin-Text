// Feather disable all

function __InputTextAsyncConsole()
{
    static _system = __InputTextSystem();
    var _asyncLoad = async_load;

    with(_system)
    {
        if ((_asyncLoad == -1) || (__asyncProfanityFilterInput == "")) return;

        var _filterOutput = __asyncProfanityFilterInput;
        var _maskAfterFirstOffense = false;
        var _asyncStringMatch = false;

        switch (_asyncLoad[? "event_type"])
        {
            case "psn_mask_profanity":
                _asyncStringMatch = (__asyncProfanityFilterInput == _asyncLoad[? "origstring"]);

                var _sanitizedString = _asyncLoad[? "sanitized_string"];
                if (is_string(_sanitizedString))
                {
                    _filterOutput = _sanitizedString;
                }
            break;

            case "verify_string_result":
                _asyncStringMatch = (__asyncProfanityFilterInput == _asyncLoad[? "original_string"]);

                var _offendingSubstring = _asyncLoad[? "first_offending_substring"];
                if (is_string(_offendingSubstring))
                {
                    _maskAfterFirstOffense = true;
                    _filterOutput = string_replace(__asyncProfanityFilterInput, _offendingSubstring, _offendingSubstring + __INPUT_TEXT_PROFANITY_CHAR);
                }
            break;
        }

        if (_asyncStringMatch)
        {
            _filterOutput = __InputTextBulidProfanityMaskedString(__asyncProfanityFilterInput, _filterOutput, _maskAfterFirstOffense);

            __newStatus = INPUT_TEXT_STATUS.CONFIRMED;
            __asyncProfanityFound = (__asyncProfanityFilterInput != _filterOutput);
            __textAsync = string_copy(_filterOutput, 1, __maxLength);
            __asyncProfanityFilterInput = "";
        }
    }
}
