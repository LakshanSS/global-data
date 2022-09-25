USE avinya_db;

-- Address
CREATE TABLE IF NOT EXISTS address (
    id INT NOT NULL PRIMARY KEY,
    name_en VARCHAR(255) NOT NULL,
    name_ta VARCHAR(255),
    name_si VARCHAR(255),
    street_address VARCHAR(255) NOT NULL,
    phone INT,
    city_id INT NOT NULL,
    FOREIGN KEY (city_id) REFERENCES city(id)
);

-- Organization
CREATE TABLE IF NOT EXISTS organization (
    id INT NOT NULL PRIMARY KEY,
    name_en VARCHAR(255) NOT NULL,
    name_ta VARCHAR(255),
    name_si VARCHAR(255),
    phone int,
    address_id INT NOT NULL,
    FOREIGN KEY (address_id) REFERENCES address(id)
);

-- Parent/Child Organization relationship
CREATE TABLE IF NOT EXISTS parent_child_organization (
    child_org_id INT NOT NULL,
    parent_org_id INT NOT NULL,
    FOREIGN KEY (child_org_id) REFERENCES organization(id),
    FOREIGN KEY (parent_org_id) REFERENCES organization(id),
    CONSTRAINT pk_parent_child_organization PRIMARY KEY (child_org_id, parent_org_id)
);
