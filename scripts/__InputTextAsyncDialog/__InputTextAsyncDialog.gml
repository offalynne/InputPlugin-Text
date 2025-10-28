// Feather disable all

function __InputTextAsyncDialog()
{
    static _system = __InputTextSystem();

    if ((async_load != -1) && (_system.__asyncId != undefined) && (async_load[? "id"] == _system.__asyncId))
    {
        var _result = async_load[? "result"];
        with(_system)
        {
            if (!async_load[? "status"] || (_result == undefined))
            {
                __newStatus = INPUT_TEXT_STATUS.CANCELLED;
            }
            else if (__requestStatus == INPUT_TEXT_STATUS.WAITING)
            {
                _result = string_copy(_result, 1, __maxLength);
                
                if (__filterProfanity && (__asyncProfanityFilterInput == ""))
                {
                    if (INPUT_ON_SWITCH)
                    {
                        var _maskedString = switch_mask_profanity(_result);
                        _result = (is_string(_maskedString))? _maskedString : _result;
                    }
                    else if (INPUT_ON_XBOX)
                    {
                        var _user = xboxone_get_savedata_user();
                        if (is_numeric(_user) && (_user != 0))
                        {
                            xboxone_verify_string_async(_user, _result);
                            __asyncProfanityFilterInput = _result;
                        }
                    }
                    else if (INPUT_ON_PLAYSTATION)
                    {
                        var _maskResult = psn_mask_profanity(_result);
                        if (is_numeric(_maskResult) && (_maskResult == 0))
                        {
                            __asyncProfanityFilterInput = _result;
                        }
                    }
                }
                
                if (__asyncProfanityFilterInput == "")
                {
                    __textAsync = _result;
                    __newStatus = INPUT_TEXT_STATUS.CONFIRMED;
                }
            }
            
            __asyncId = undefined;
        }
    }
}
