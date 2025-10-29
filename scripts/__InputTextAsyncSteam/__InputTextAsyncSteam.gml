// Feather disable all

function __InputTextAsyncSteam()
{
    static _system = __InputTextSystem();
    var _asyncLoad = async_load;

    with(_system)
    {
        if (__steamAsyncRequest && (_asyncLoad[? "event_type"] == "gamepad_text_input_dismissed"))
        {
            if (!_asyncLoad[? "submitted"])
            {
                __newStatus = INPUT_TEXT_STATUS.CANCELLED;
            }
            else if (__requestStatus == INPUT_TEXT_STATUS.WAITING)
            {
                __newStatus = INPUT_TEXT_STATUS.CONFIRMED;
                __textAsync = string_copy(steam_get_entered_gamepad_text_input(), 1, __maxLength);
            }
            
            __steamAsyncRequest = false;
        }
    }
}