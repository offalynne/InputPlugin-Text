// Feather disable all

function __InputTextAsyncConsole()
{
    static _system = __InputTextSystem();
    var _asyncLoad = async_load;

    with(_system)
    {
        if ((_asyncLoad != -1) && (__asyncProfanityFilterInput != ""))
        {
            var _asyncStringMatch = false;
            var _filterOutput = __asyncProfanityFilterInput;

            if (_asyncLoad[? "event_type"] == "psn_mask_profanity")
            {
                _asyncStringMatch = (__asyncProfanityFilterInput == _asyncLoad[? "origstring"]);
                _filterOutput = _asyncLoad[? "sanitized_string"] ?? "";
            }

            if (_asyncLoad[? "event_type"] == "verify_string_result")
            {
                _asyncStringMatch = (__asyncProfanityFilterInput == _asyncLoad[? "original_string"]);
                _filterOutput = (_asyncLoad[? "result_code"] == 1)? "" : __asyncProfanityFilterInput;
            }

            if (_asyncStringMatch)
            {
                __newStatus = INPUT_TEXT_STATUS.CONFIRMED;
                __textAsync = string_copy(_filterOutput, 1, __maxLength);
                __asyncProfanityFound = (__asyncProfanityFilterInput != _filterOutput);
                __asyncProfanityFilterInput = "";
            }
        }
    }
}
