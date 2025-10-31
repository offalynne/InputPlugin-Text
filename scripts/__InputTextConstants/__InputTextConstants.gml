// Feather disable all

enum INPUT_TEXT_STATUS
{
    NONE,
    WAITING,
    STOPPED,
    CANCELLED,
    CONFIRMED,
}

#macro __INPUT_TEXT_RETURN_KEY       kbv_returnkey_default
#macro __INPUT_TEXT_CAPITALIZATION   kbv_autocapitalize_none
#macro __INPUT_TEXT_PREDICTION       false
#macro __INPUT_TEXT_PROFANITY_CHAR   "*"
#macro __INPUT_TEXT_MAX_LENGTH       256
#macro __INPUT_TEXT_REPEAT_DELAY     500
#macro __INPUT_TEXT_REPEAT_INTERVAL   33
