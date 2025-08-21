stenography_map = {
    # Initial Consonants
    "PW": "b",
    "K": "c",
    "KH": "ch",
    "KWH": "d",
    "TK": "đ",
    "TKPW": "g",
    "SKWR": "gi",
    "H": "h",
    "KHR": "kh",
    "HR": "l",
    "PH": "m",
    "TPH": "n",
    "TPR": "nh",
    "TPW": "ng/ngh",
    "P": "p",
    "TP": "ph",
    "R": "r",
    "KW": "q",
    "S": "s",
    "T": "t",
    "TH": "th",
    "TR": "tr",
    "SR": "v",
    "KP": "x",
}

vowel_map = {
    "AOEU": "iê/ia",
    "AU": "ua/uô",
    "OEU": "ưa/ươ",
    "AOU": "ư",
    "OU": "ơ",
    "OE": "ô",
    "O": "o",
    "AEU": "ê",
    "E": "e",
    "EU": "i",
    "A": "a",
    "AE": "ă",
    "AO": "â",
    "U": "u",
    "AOE": "y",
}

final_map = {
    "G": "j",
    "L": "w",
    "P": "p",
    "T": "t",
    "BG": "c",
    "PBLG": "ch",
    "PBL": "nh",
    "PB": "n",
    "PL": "m",
    "PBG": "ng",
}

tone_map = {
    "S": "sắc",
    "F": "huyền",
    "R": "hỏi",
    "FR": "ngã",
    "RS": "nặng",
}

tone_accents = {
    "a": {"": "a", "sắc": "á", "huyền": "à", "hỏi": "ả", "ngã": "ã", "nặng": "ạ"},
    "ă": {"": "ă", "sắc": "ắ", "huyền": "ằ", "hỏi": "ẳ", "ngã": "ẵ", "nặng": "ặ"},
    "â": {"": "â", "sắc": "ấ", "huyền": "ầ", "hỏi": "ẩ", "ngã": "ẫ", "nặng": "ậ"},
    "e": {"": "e", "sắc": "é", "huyền": "è", "hỏi": "ẻ", "ngã": "ẽ", "nặng": "ẹ"},
    "ê": {"": "ê", "sắc": "ế", "huyền": "ề", "hỏi": "ể", "ngã": "ễ", "nặng": "ệ"},
    "i": {"": "i", "sắc": "í", "huyền": "ì", "hỏi": "ỉ", "ngã": "ĩ", "nặng": "ị"},
    "o": {"": "o", "sắc": "ó", "huyền": "ò", "hỏi": "ỏ", "ngã": "õ", "nặng": "ọ"},
    "ô": {"": "ô", "sắc": "ố", "huyền": "ồ", "hỏi": "ổ", "ngã": "ỗ", "nặng": "ộ"},
    "ơ": {"": "ơ", "sắc": "ớ", "huyền": "ờ", "hỏi": "ở", "ngã": "ỡ", "nặng": "ợ"},
    "u": {"": "u", "sắc": "ú", "huyền": "ù", "hỏi": "ủ", "ngã": "ũ", "nặng": "ụ"},
    "ư": {"": "ư", "sắc": "ứ", "huyền": "ừ", "hỏi": "ử", "ngã": "ữ", "nặng": "ự"},
    "y": {"": "y", "sắc": "ý", "huyền": "ỳ", "hỏi": "ỷ", "ngã": "ỹ", "nặng": "ỵ"},
}

LONGEST_KEY = 1

class Parsed:
    def __init__(self, on_glide, initial_consonant, vowel, final_consonant, tone):
        self.on_glide = on_glide
        self.initial_consonant = initial_consonant
        self.vowel = vowel
        self.final_consonant = final_consonant
        self.tone = tone


def parse(stroke):
    on_glide = "*" in stroke
    stroke = stroke.replace("*", "")  # Remove glide marker for parsing

    initial_consonant = ""
    vowel = ""
    final_consonant = ""
    tone = ""

    # Match Initial Consonant (4 -> 3 -> 2 -> 1 letter)
    for length in range(4, 0, -1):
        candidate = stroke[:length]
        if candidate in stenography_map:
            initial_consonant = stenography_map[candidate]
            stroke = stroke[length:]
            survived = True
            break

    survived = False
    # Match Vowel (4 -> 3 -> 2 -> 1 letter)
    for length in range(4, 0, -1):
        candidate = stroke[:length]
        if candidate in vowel_map:
            vowel = vowel_map[candidate]
            stroke = stroke[length:]
            survived = True
            break
    if not survived:
        raise KeyError("")
   
    if stroke.startswith("R") and stroke.endswith("S") and len(stroke) >= 2:
        tone = tone_map["RS"]
        stroke = stroke[1:-1]  # Remove R from start and S from end
    elif stroke.endswith("S"):
        tone = tone_map["S"]
        stroke = stroke[:-1]  # Remove S from end
    else:
        for length in range(2, 0, -1):
            candidate = stroke[:length]
            if candidate in tone_map:
                tone = tone_map[candidate]
                stroke = stroke[length:]
                break

    # Match Final Consonant (4 -> 3 -> 2 -> 1 letter)
    survived = stroke == ""
    for length in range(4, 0, -1):
        candidate = stroke[:length]
        if candidate in final_map:
            final_consonant = final_map[candidate]
            stroke = stroke[length:]
            survived = True
            break
    
    if final_consonant in ["c", "ch", "p", "t"] and tone == "":
        tone = "sắc"  # Default tone for these finals

    # Validate that we've consumed the entire stroke
    if not survived:
        raise KeyError("")
    
    print(f"Parsed: on_glide={on_glide}, initial_consonant={initial_consonant}, "
          f"vowel={vowel}, final_consonant={final_consonant}, tone={tone}")

    return Parsed(on_glide, initial_consonant, vowel, final_consonant, tone)


def assemble(parsed):
    def initial():
        f = parsed.vowel in ["a", "ă", "â", "o", "ô", "ơ", "u", "ư", "ua/uô", "ưa/ươ"]
        if parsed.initial_consonant == "ng/ngh":
            return "ng" if parsed.on_glide or f else "ngh"
        if parsed.initial_consonant == "g":
            return "g" if parsed.on_glide or f else "gh"
        if parsed.initial_consonant == "c":
            return "c" if f else "k"
        if parsed.initial_consonant == "gi":
            return "g" if not parsed.on_glide and parsed.vowel == "i" else "gi"
        if parsed.initial_consonant == "q":
            parsed.on_glide = True
        return parsed.initial_consonant

    def middle():
        if parsed.vowel == "iê/ia":
            if parsed.initial_consonant == "":
                return ("uy" if parsed.on_glide else "y") + tone_accents["ê"][
                    parsed.tone
                ]
            if parsed.on_glide:
                if parsed.final_consonant == "":
                    return "uy" + tone_accents["a"][parsed.tone]
                return "uy" + tone_accents["ê"][parsed.tone]
            if parsed.final_consonant == "":
                return tone_accents["i"][parsed.tone] + "a"
            return "i" + tone_accents["ê"][parsed.tone]
        if parsed.vowel == "ua/uô":
            return (
                tone_accents["u"][parsed.tone] + "a"
                if parsed.final_consonant == ""
                else "u" + tone_accents["ô"][parsed.tone]
            )
        if parsed.vowel == "ưa/ươ":
            return (
                tone_accents["ư"][parsed.tone] + "a"
                if parsed.final_consonant == ""
                else "ư" + tone_accents["ơ"][parsed.tone]
            )
        if parsed.vowel == "i":
            if parsed.on_glide:
                return (
                    (
                        tone_accents["u"][parsed.tone] + "y"
                        if parsed.initial_consonant != "c"
                        else "u" + tone_accents["y"][parsed.tone]
                    )
                    if parsed.final_consonant == ""
                    else "u" + tone_accents["y"][parsed.tone]
                )
            return tone_accents["i"][parsed.tone]
        if parsed.vowel == "ă" and parsed.final_consonant in ["w", "j"]:
            return (
                ("u" if parsed.initial_consonant == "c" else "o")
                if parsed.on_glide
                else ""
            ) + tone_accents["a"][parsed.tone]
        if parsed.vowel in ["â", "ê"] and parsed.on_glide:
            return "u" + tone_accents[parsed.vowel][parsed.tone]
        if parsed.initial_consonant == "q" and parsed.on_glide:
            return "u" + tone_accents[parsed.vowel][parsed.tone]
        if parsed.on_glide:
            return (
                tone_accents["o"][parsed.tone] + parsed.vowel
                if parsed.final_consonant == ""
                else "o" + tone_accents[parsed.vowel][parsed.tone]
            )
        return tone_accents[parsed.vowel][parsed.tone]

    def final():
        if parsed.final_consonant == "w":
            if parsed.vowel in ["iê/ia", "ư", "ê", "u", "ă", "â", "i"]:
                return "u"
            return "o"
        if parsed.final_consonant == "j":
            if parsed.vowel in ["ă", "â"]:
                return "y"
            return "i"
        return parsed.final_consonant

    return initial() + middle() + final()

def lookup(stroke):
    return assemble(parse(stroke[0]))