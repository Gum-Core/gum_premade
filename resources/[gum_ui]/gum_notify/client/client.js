
exports('DisplayLocationNotification', (text, location, duration) => {
    const struct1 = new DataView(new ArrayBuffer(48));
    struct1.setInt32(0, duration, true);
  
    const string1 = CreateVarString(10, "LITERAL_STRING", location);
    const string2 = CreateVarString(10, "LITERAL_STRING", text);
  
    const struct2 = new DataView(new ArrayBuffer(24));
    struct2.setBigInt64(8, BigInt(string1), true);
    struct2.setBigInt64(16, BigInt(string2), true);
  
    Citizen.invokeNative("0xD05590C1AB38F068", struct1, struct2, 1, 1);
  });
exports('DisplayNotification', (text, duration) => { 

    const str = Citizen.invokeNative("0xFA925AC00EB830B9", 10, "LITERAL_STRING", text, Citizen.resultAsLong());
  
    const struct1 = new DataView(new ArrayBuffer(96));    
    struct1.setUint32(0, duration, true);
    //struct1.setInt32(16, duration, true);
    
  
    const struct2 = new DataView(new ArrayBuffer(8 + 8));
    struct2.setBigUint64(8, BigInt(str), true);
  
    Citizen.invokeNative("0x049D5C615BD38BAD", struct1, struct2, 1);
});

exports('ShowAdvancedRightNotification', (text, dict, icon, text_color, duration) => {
	const _text = CreateVarString(10, "LITERAL_STRING", text);
	const _dict = CreateVarString(10, "LITERAL_STRING", dict);
	const sdict = CreateVarString(10, "LITERAL_STRING", "Transaction_Feed_Sounds");
	const sound = CreateVarString(10, "LITERAL_STRING", "Transaction_Positive");

	const struct1 = new DataView(new ArrayBuffer(48));
	struct1.setInt32(0, duration, true);
	struct1.setBigInt64(8, BigInt(sdict), true);
	struct1.setBigInt64(16, BigInt(sound), true);


	const struct2 = new DataView(new ArrayBuffer(76));
	struct2.setBigInt64(8, BigInt(_text), true);
	struct2.setBigInt64(16, BigInt(_dict), true);
	struct2.setBigInt64(24, BigInt(GetHashKey(icon)), true);
	struct2.setBigInt64(40, BigInt(GetHashKey(text_color)), true);
	struct2.setInt32(48, 0, true);

	Citizen.invokeNative("0xB249EBCB30DD88E0", struct1, struct2, 1);
});