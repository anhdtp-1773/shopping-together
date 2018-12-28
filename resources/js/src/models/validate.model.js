export function isNumeric(number){
    return  /^\d+$/.test(number);
}
export function require(text){
    console.log(text);
    return text.length;
}