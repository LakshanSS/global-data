# Localized names in English, Sinhala, and Tamil.
# Names are stored with a `name_` prefix, followed
# by the respective ISO 639-1 language code.
#
# This record requires an English name, `name_en`.
#
# + name_en - Name in English
# + name_ta - Name in Tamil, தமிழ்
# + name_si - Name in Sinhala, සිංහල
public type LocalizedName record {
    string name_en;
    string? name_ta;
    string? name_si;
};

type GeospatialInformation record {|
    decimal latitude;
    decimal longitude;
|};

public type Province record {|
    readonly string record_type = "province";
    int id?;
    *LocalizedName;
|};

public type District record {|
    readonly string record_type = "district";
    int id?;
    int province_id?;
    *LocalizedName;
|};

public type City record {|
    readonly string record_type = "city";
    int id?;
    int district_id?;
    *LocalizedName;
    string suburb_name_en;
    string suburb_name_ta;
    string suburb_name_si;
    string postcode;
    *GeospatialInformation;
|};


public type Address record {
    readonly string record_type = "address";
    int id?;
    *LocalizedName;
    string street_address;
    int? phone;
    int city_id;
};


public type Organization record {|
    readonly string record_type = "organization";
    int id?;
    *LocalizedName;
    int[] child_organizations?;
    int[] parent_organizations?;
    int? address_id;
    int? phone;
|};

type ParentChildOrganization record {|
    int child_org_id;
    int parent_org_id;
|};
