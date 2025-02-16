

import 'dart:convert';

Country countryFromJson(String str) => Country.fromJson(json.decode(str));

String countryToJson(Country data) => json.encode(data.toJson());

class Country {
    Name? name;
    List<String>? tld;
    String? cca2;
    String? ccn3;
    String? cca3;
    bool? independent;
    String? status;
    bool? unMember;
    Currencies? currencies;
    Idd? idd;
    List<String>? capital;
    List<String>? altSpellings;
    String? region;
    Languages? languages;
    Map<String, Translation>? translations;
    List<double>? latlng;
    bool? landlocked;
    double? area;
    Demonyms? demonyms;
    String? flag;
    Maps? maps;
    int? population;
    Car? car;
    List<String>? timezones;
    List<String>? continents;
    Flags? flags;
    CoatOfArms? coatOfArms;
    String? startOfWeek;
    CapitalInfo? capitalInfo;

    Country({
        this.name,
        this.tld,
        this.cca2,
        this.ccn3,
        this.cca3,
        this.independent,
        this.status,
        this.unMember,
        this.currencies,
        this.idd,
        this.capital,
        this.altSpellings,
        this.region,
        this.languages,
        this.translations,
        this.latlng,
        this.landlocked,
        this.area,
        this.demonyms,
        this.flag,
        this.maps,
        this.population,
        this.car,
        this.timezones,
        this.continents,
        this.flags,
        this.coatOfArms,
        this.startOfWeek,
        this.capitalInfo,
    });

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["name"] == null ? null : Name.fromJson(json["name"]),
        tld: json["tld"] == null ? [] : List<String>.from(json["tld"]!.map((x) => x)),
        cca2: json["cca2"],
        ccn3: json["ccn3"],
        cca3: json["cca3"],
        independent: json["independent"],
        status: json["status"],
        unMember: json["unMember"],
        currencies: json["currencies"] == null ? null : Currencies.fromJson(json["currencies"]),
        idd: json["idd"] == null ? null : Idd.fromJson(json["idd"]),
        capital: json["capital"] == null ? [] : List<String>.from(json["capital"]!.map((x) => x)),
        altSpellings: json["altSpellings"] == null ? [] : List<String>.from(json["altSpellings"]!.map((x) => x)),
        region: json["region"],
        languages: json["languages"] == null ? null : Languages.fromJson(json["languages"]),
        translations: Map.from(json["translations"]!).map((k, v) => MapEntry<String, Translation>(k, Translation.fromJson(v))),
        latlng: json["latlng"] == null ? [] : List<double>.from(json["latlng"]!.map((x) => x?.toDouble())),
        landlocked: json["landlocked"],
        area: json["area"],
        demonyms: json["demonyms"] == null ? null : Demonyms.fromJson(json["demonyms"]),
        flag: json["flag"],
        maps: json["maps"] == null ? null : Maps.fromJson(json["maps"]),
        population: json["population"],
        car: json["car"] == null ? null : Car.fromJson(json["car"]),
        timezones: json["timezones"] == null ? [] : List<String>.from(json["timezones"]!.map((x) => x)),
        continents: json["continents"] == null ? [] : List<String>.from(json["continents"]!.map((x) => x)),
        flags: json["flags"] == null ? null : Flags.fromJson(json["flags"]),
        coatOfArms: json["coatOfArms"] == null ? null : CoatOfArms.fromJson(json["coatOfArms"]),
        startOfWeek: json["startOfWeek"],
        capitalInfo: json["capitalInfo"] == null ? null : CapitalInfo.fromJson(json["capitalInfo"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name?.toJson(),
        "tld": tld == null ? [] : List<dynamic>.from(tld!.map((x) => x)),
        "cca2": cca2,
        "ccn3": ccn3,
        "cca3": cca3,
        "independent": independent,
        "status": status,
        "unMember": unMember,
        "currencies": currencies?.toJson(),
        "idd": idd?.toJson(),
        "capital": capital == null ? [] : List<dynamic>.from(capital!.map((x) => x)),
        "altSpellings": altSpellings == null ? [] : List<dynamic>.from(altSpellings!.map((x) => x)),
        "region": region,
        "languages": languages?.toJson(),
        "translations": Map.from(translations!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "latlng": latlng == null ? [] : List<dynamic>.from(latlng!.map((x) => x)),
        "landlocked": landlocked,
        "area": area,
        "demonyms": demonyms?.toJson(),
        "flag": flag,
        "maps": maps?.toJson(),
        "population": population,
        "car": car?.toJson(),
        "timezones": timezones == null ? [] : List<dynamic>.from(timezones!.map((x) => x)),
        "continents": continents == null ? [] : List<dynamic>.from(continents!.map((x) => x)),
        "flags": flags?.toJson(),
        "coatOfArms": coatOfArms?.toJson(),
        "startOfWeek": startOfWeek,
        "capitalInfo": capitalInfo?.toJson(),
    };
}

class CapitalInfo {
    List<double>? latlng;

    CapitalInfo({
        this.latlng,
    });

    factory CapitalInfo.fromJson(Map<String, dynamic> json) => CapitalInfo(
        latlng: json["latlng"] == null ? [] : List<double>.from(json["latlng"]!.map((x) => x?.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "latlng": latlng == null ? [] : List<dynamic>.from(latlng!.map((x) => x)),
    };
}

class Car {
    List<String>? signs;
    String? side;

    Car({
        this.signs,
        this.side,
    });

    factory Car.fromJson(Map<String, dynamic> json) => Car(
        signs: json["signs"] == null ? [] : List<String>.from(json["signs"]!.map((x) => x)),
        side: json["side"],
    );

    Map<String, dynamic> toJson() => {
        "signs": signs == null ? [] : List<dynamic>.from(signs!.map((x) => x)),
        "side": side,
    };
}

class CoatOfArms {
    CoatOfArms();

    factory CoatOfArms.fromJson(Map<String, dynamic> json) => CoatOfArms(
    );

    Map<String, dynamic> toJson() => {
    };
}

class Currencies {
    Shp? shp;

    Currencies({
        this.shp,
    });

    factory Currencies.fromJson(Map<String, dynamic> json) => Currencies(
        shp: json["SHP"] == null ? null : Shp.fromJson(json["SHP"]),
    );

    Map<String, dynamic> toJson() => {
        "SHP": shp?.toJson(),
    };
}

class Shp {
    String? name;
    String? symbol;

    Shp({
        this.name,
        this.symbol,
    });

    factory Shp.fromJson(Map<String, dynamic> json) => Shp(
        name: json["name"],
        symbol: json["symbol"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "symbol": symbol,
    };
}

class Demonyms {
    Eng? eng;

    Demonyms({
        this.eng,
    });

    factory Demonyms.fromJson(Map<String, dynamic> json) => Demonyms(
        eng: json["eng"] == null ? null : Eng.fromJson(json["eng"]),
    );

    Map<String, dynamic> toJson() => {
        "eng": eng?.toJson(),
    };
}

class Eng {
    String? f;
    String? m;

    Eng({
        this.f,
        this.m,
    });

    factory Eng.fromJson(Map<String, dynamic> json) => Eng(
        f: json["f"],
        m: json["m"],
    );

    Map<String, dynamic> toJson() => {
        "f": f,
        "m": m,
    };
}

class Flags {
    String? png;
    String? svg;

    Flags({
        this.png,
        this.svg,
    });

    factory Flags.fromJson(Map<String, dynamic> json) => Flags(
        png: json["png"],
        svg: json["svg"],
    );

    Map<String, dynamic> toJson() => {
        "png": png,
        "svg": svg,
    };
}

class Idd {
    String? root;
    List<String>? suffixes;

    Idd({
        this.root,
        this.suffixes,
    });

    factory Idd.fromJson(Map<String, dynamic> json) => Idd(
        root: json["root"],
        suffixes: json["suffixes"] == null ? [] : List<String>.from(json["suffixes"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "root": root,
        "suffixes": suffixes == null ? [] : List<dynamic>.from(suffixes!.map((x) => x)),
    };
}

class Languages {
    String? eng;

    Languages({
        this.eng,
    });

    factory Languages.fromJson(Map<String, dynamic> json) => Languages(
        eng: json["eng"],
    );

    Map<String, dynamic> toJson() => {
        "eng": eng,
    };
}

class Maps {
    String? googleMaps;
    String? openStreetMaps;

    Maps({
        this.googleMaps,
        this.openStreetMaps,
    });

    factory Maps.fromJson(Map<String, dynamic> json) => Maps(
        googleMaps: json["googleMaps"],
        openStreetMaps: json["openStreetMaps"],
    );

    Map<String, dynamic> toJson() => {
        "googleMaps": googleMaps,
        "openStreetMaps": openStreetMaps,
    };
}

class Name {
    String? common;
    String? official;
    NativeName? nativeName;

    Name({
        this.common,
        this.official,
        this.nativeName,
    });

    factory Name.fromJson(Map<String, dynamic> json) => Name(
        common: json["common"],
        official: json["official"],
        nativeName: json["nativeName"] == null ? null : NativeName.fromJson(json["nativeName"]),
    );

    Map<String, dynamic> toJson() => {
        "common": common,
        "official": official,
        "nativeName": nativeName?.toJson(),
    };
}

class NativeName {
    Translation? eng;

    NativeName({
        this.eng,
    });

    factory NativeName.fromJson(Map<String, dynamic> json) => NativeName(
        eng: json["eng"] == null ? null : Translation.fromJson(json["eng"]),
    );

    Map<String, dynamic> toJson() => {
        "eng": eng?.toJson(),
    };
}

class Translation {
    String? official;
    String? common;

    Translation({
        this.official,
        this.common,
    });

    factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        official: json["official"],
        common: json["common"],
    );

    Map<String, dynamic> toJson() => {
        "official": official,
        "common": common,
    };
}
