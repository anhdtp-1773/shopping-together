export function isNumeric(number){
    return  /^\d+$/.test(number);
}
export function require(text){
    return text.length;
}

export function isName(name, ignoreNumber = true){
	let reg = ignoreNumber ? /^[^0-9!<>,;?=+()@#"°{}_$%~:]+$/ : /^[^!<>,;?=+()@#"°{}_$%~:]+$/;
	return (reg.test(name) || name.length == 0);
}