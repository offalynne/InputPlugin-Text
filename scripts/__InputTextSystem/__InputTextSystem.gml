// Feather disable all
__InputTextSystem();
function __InputTextSystem()
{
    static _system = undefined;
    if (_system != undefined) return _system;
        
    _system = {};
    with(_system)
    {
        __callback  = undefined;
        __asyncId   = undefined;
        __textSet   = undefined;
        __textAsync = undefined;
        
        __repeatCount = 0; 
        __removeCount = 0;
        __textRequest = "";
        __textDelta   = "";        
        
        __newStatus     = undefined;
        __keyboardType  = kbv_type_default;
        __requestStatus = INPUT_TEXT_STATUS.NONE;
        __maxLength     = __INPUT_TEXT_MAX_LENGTH;
        
        __enabled            = false;
        __steamAsyncRequest  = false;
        __useSteamKeyboard   = false;
        __useProfanityFilter = false;
        
        __asyncProfanityFilterInput = "";
        
        if (InputGetSteamInfo(INPUT_STEAM_INFO.STEAMWORKS)
        &&  InputGetSteamInfo(INPUT_STEAM_INFO.STEAM_DECK))
        {
            __useSteamKeyboard = true;
            steam_utils_enable_callbacks();
        }
        
        __keyboardString = "";   
        __keyboardStringPrevious = __keyboardString;

        InputPlugInDefine("Alynne.Text", "alynne", "1.0", "10.0", function()
        {
            InputPlugInRegisterCallback(INPUT_PLUG_IN_CALLBACK.UPDATE, undefined, function()
            {            
                __InputTextHandleController();
            
                if (__enabled)
                {
                    __keyboardStringPrevious = __keyboardString;
                    __keyboardString = keyboard_string;

                    __InputTextHandleKeyboard();
                    __InputTextLintKeyboardString();
                    __InputTextFindKeyboardDelta();
                }
            
                __InputTextHandleChanges();
                __InputTextHandleStatus();
            });
            
            InputPlugInRegisterCallback(INPUT_PLUG_IN_CALLBACK.GAME_RESTART, undefined, function()
            {
                if (!instance_exists(__InputTextAsyncController) && (__steamAsyncRequest || (__asyncId != undefined)))
                {
                    instance_create_depth(0, -__INPUT_CONTROLLER_OBJECT_DEPTH, __INPUT_CONTROLLER_OBJECT_DEPTH + 1, __InputTextAsyncController);
                    
                    __steamAsyncRequest = false;
                    __asyncId = undefined;
                }
            });
        });
    }
}
