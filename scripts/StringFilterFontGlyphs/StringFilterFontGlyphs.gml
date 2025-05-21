function StringFilterFontGlyphs(_string, _font)
{
    static _filterStruct = {__fontDict: {}};
    with(_filterStruct)
    {
        __glyphDict = __fontDict[$ _font];
        if (__glyphDict == undefined)
        {
            __glyphDict = {};
            variable_struct_set(__glyphDict, chr(10), true);

            var _glyphNameList = variable_struct_get_names(font_get_info(_font).glyphs);
            repeat(array_length(_glyphNameList)) __glyphDict[$ array_pop(_glyphNameList)] = true;
            __fontDict[$ _font] = __glyphDict;
        }
        
        _output = "";
    }

    string_foreach(_string, method(_filterStruct, function(_c)
    {
        if (__glyphDict[$ _c]) _output += _c;
    }));

    return _filterStruct._output;
}
