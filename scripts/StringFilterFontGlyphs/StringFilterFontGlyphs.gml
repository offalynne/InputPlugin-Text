function StringFilterFontGlyphs(_string, _font)
{
    static _filterStruct = {_fontDict: {}};
    with(_filterStruct)
    {
        _glyphDict = _fontDict[$ _font];
        if (_glyphDict == undefined)
        {
            _glyphDict = {};
            variable_struct_set(_glyphDict, chr(10), true);

            var _glyphNameList = variable_struct_get_names(font_get_info(_font).glyphs);
            repeat (array_length(_glyphNameList))
            {
                _glyphDict[$ array_pop(_glyphNameList)] = true;
            }
            
            _fontDict[$ _font] = _glyphDict;
        }
        
        _output = "";
    }

    string_foreach(_string, method(_filterStruct, function(_character)
    {
        if (_glyphDict[$ _character])
        {
            _output += _character;
        }
    }));

    return _filterStruct._output;
}
