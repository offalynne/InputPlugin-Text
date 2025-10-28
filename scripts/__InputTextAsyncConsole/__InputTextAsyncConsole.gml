// Feather disable all

function __InputTextAsyncConsole()
{
    static _system = __InputTextSystem();
    var _asyncLoad = async_load;

    with (_system)
    {
        if ((_asyncLoad != -1) && (__asyncProfanityFilterInput != ""))
        {
            if ((INPUT_ON_PS4 || INPUT_ON_PS5) && (__asyncProfanityFilterInput == _asyncLoad[? "origstring"]))
            {
                __textAsync = _asyncLoad[? "sanitized_string"] ?? __asyncProfanityFilterInput;
                __newStatus = INPUT_TEXT_STATUS.CONFIRMED;
                __asyncProfanityFilterInput = "";
            }

            if (INPUT_ON_XBOX && (__asyncProfanityFilterInput == _asyncLoad[? "original_string"]))
            {
                __textAsync = (_asyncLoad[? "result_code"] == 1)? "" : __asyncProfanityFilterInput;
                __newStatus = INPUT_TEXT_STATUS.CONFIRMED;
                __asyncProfanityFilterInput = "";
            }
        }
    }
}