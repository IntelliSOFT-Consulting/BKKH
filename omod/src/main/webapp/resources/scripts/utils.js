function getFloatValue(source) {
    return isNaN(parseFloat(source)) ? 0 : parseFloat(source);
}