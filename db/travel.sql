DROP TABLE sights;
DROP TABLE locations;
DROP TABLE sight_types;
DROP TABLE countries;
DROP TABLE continents;

CREATE TABLE continents(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE countries(
  id SERIAL PRIMARY KEY,
  continent_id INT REFERENCES continents(id) ON DELETE CASCADE,
  name VARCHAR(255)
);

CREATE TABLE sight_types(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE locations(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  location_type VARCHAR(255),
  country_id INT REFERENCES countries(id) ON DELETE CASCADE
);

CREATE TABLE sights(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  location_id INT REFERENCES locations(id) ON DELETE CASCADE,
  type_id INT REFERENCES sight_types(id) ON DELETE CASCADE,
  image_url VARCHAR(255) DEFAULT '',
  priority INT DEFAULT 0,
  visited BOOLEAN DEFAULT false
);

INSERT INTO continents (name) VALUES ('Europe'), ('Asia'), ('Oceania'), ('Africa'), ('Americas'), ('Antarctica');

INSERT INTO countries (continent_id, name) VALUES
  (2, 'Afghanistan'),
  (1, 'Åland Islands'),
  (1, 'Albania'),
  (4, 'Algeria'),
  (3, 'American Samoa'),
  (1, 'Andorra'),
  (4, 'Angola'),
  (5, 'Anguilla'),
  (6, 'Antarctica'),
  (5, 'Antigua and Barbuda'),
  (5, 'Argentina'),
  (2, 'Armenia'),
  (5, 'Aruba'),
  (3, 'Australia'),
  (1, 'Austria'),
  (2, 'Azerbaijan'),
  (5, 'Bahamas'),
  (2, 'Bahrain'),
  (2, 'Bangladesh'),
  (5, 'Barbados'),
  (1, 'Belarus'),
  (1, 'Belgium'),
  (5, 'Belize'),
  (4, 'Benin'),
  (5, 'Bermuda'),
  (2, 'Bhutan'),
  (5, 'Bolivia'),
  (5, 'Bonaire, Sint Eustatius and Saba'),
  (1, 'Bosnia and Herzegovina'),
  (4, 'Botswana'),
  (6, 'Bouvet Island (Bouvetøya)'),
  (5, 'Brazil'),
  (2, 'British Indian Ocean Territory (Chagos Archipelago)'),
  (5, 'British Virgin Islands'),
  (2, 'Brunei Darussalam'),
  (1, 'Bulgaria'),
  (4, 'Burkina Faso'),
  (4, 'Burundi'),
  (2, 'Cambodia'),
  (4, 'Cameroon'),
  (5, 'Canada'),
  (4, 'Cabo Verde'),
  (5, 'Cayman Islands'),
  (4, 'Central African Republic'),
  (4, 'Chad'),
  (5, 'Chile'),
  (2, 'China'),
  (2, 'Christmas Island'),
  (2, 'Cocos (Keeling) Islands'),
  (5, 'Colombia'),
  (4, 'Comoros'),
  (4, 'Congo'),
  (4, 'Congo'),
  (3, 'Cook Islands'),
  (5, 'Costa Rica'),
  (4, 'Cote d''Ivoire'),
  (1, 'Croatia'),
  (5, 'Cuba'),
  (5, 'Curaçao'),
  (2, 'Cyprus'),
  (1, 'Czechia'),
  (1, 'Denmark'),
  (4, 'Djibouti'),
  (5, 'Dominica'),
  (5, 'Dominican Republic'),
  (5, 'Ecuador'),
  (4, 'Egypt'),
  (5, 'El Salvador'),
  (4, 'Equatorial Guinea'),
  (4, 'Eritrea'),
  (1, 'Estonia'),
  (4, 'Ethiopia'),
  (1, 'Faroe Islands'),
  (5, 'Falkland Islands (Malvinas)'),
  (3, 'Fiji'),
  (1, 'Finland'),
  (1, 'France'),
  (5, 'French Guiana'),
  (3, 'French Polynesia'),
  (6, 'French Southern Territories'),
  (4, 'Gabon'),
  (4, 'Gambia'),
  (2, 'Georgia'),
  (1, 'Germany'),
  (4, 'Ghana'),
  (1, 'Gibraltar'),
  (1, 'Greece'),
  (5, 'Greenland'),
  (5, 'Grenada'),
  (5, 'Guadeloupe'),
  (3, 'Guam'),
  (1, 'Guernsey'),
  (4, 'Guinea'),
  (4, 'Guinea-Bissau'),
  (5, 'Guyana'),
  (5, 'Haiti'),
  (6, 'Heard Island and McDonald Islands'),
  (1, 'Holy See (Vatican City State)'),
  (5, 'Honduras'),
  (2, 'Hong Kong'),
  (1, 'Hungary'),
  (1, 'Iceland'),
  (2, 'India'),
  (2, 'Indonesia'),
  (2, 'Iran'),
  (2, 'Iraq'),
  (1, 'Ireland'),
  (1, 'Isle of Man'),
  (2, 'Israel'),
  (1, 'Italy'),
  (5, 'Jamaica'),
  (2, 'Japan'),
  (1, 'Jersey'),
  (2, 'Jordan'),
  (2, 'Kazakhstan'),
  (4, 'Kenya'),
  (3, 'Kiribati'),
  (2, 'Kuwait'),
  (2, 'Kyrgyz Republic'),
  (2, 'Laos'),
  (1, 'Latvia'),
  (2, 'Lebanon'),
  (4, 'Lesotho'),
  (4, 'Liberia'),
  (4, 'Libya'),
  (1, 'Liechtenstein'),
  (1, 'Lithuania'),
  (1, 'Luxembourg'),
  (2, 'Macao'),
  (4, 'Madagascar'),
  (4, 'Malawi'),
  (2, 'Malaysia'),
  (2, 'Maldives'),
  (4, 'Mali'),
  (1, 'Malta'),
  (3, 'Marshall Islands'),
  (5, 'Martinique'),
  (4, 'Mauritania'),
  (4, 'Mauritius'),
  (4, 'Mayotte'),
  (5, 'Mexico'),
  (3, 'Micronesia'),
  (1, 'Moldova'),
  (1, 'Monaco'),
  (2, 'Mongolia'),
  (1, 'Montenegro'),
  (5, 'Montserrat'),
  (4, 'Morocco'),
  (4, 'Mozambique'),
  (2, 'Myanmar'),
  (4, 'Namibia'),
  (3, 'Nauru'),
  (2, 'Nepal'),
  (1, 'Netherlands'),
  (3, 'New Caledonia'),
  (3, 'New Zealand'),
  (5, 'Nicaragua'),
  (4, 'Niger'),
  (4, 'Nigeria'),
  (3, 'Niue'),
  (3, 'Norfolk Island'),
  (2, 'North Korea'),
  (1, 'North Macedonia'),
  (3, 'Northern Mariana Islands'),
  (1, 'Norway'),
  (2, 'Oman'),
  (2, 'Pakistan'),
  (3, 'Palau'),
  (2, 'Palestine'),
  (5, 'Panama'),
  (3, 'Papua New Guinea'),
  (5, 'Paraguay'),
  (5, 'Peru'),
  (2, 'Philippines'),
  (3, 'Pitcairn Islands'),
  (1, 'Poland'),
  (1, 'Portugal'),
  (5, 'Puerto Rico'),
  (2, 'Qatar'),
  (4, 'Réunion'),
  (1, 'Romania'),
  (1, 'Russian Federation'),
  (4, 'Rwanda'),
  (5, 'Saint Barthélemy'),
  (4, 'Saint Helena'),
  (5, 'Saint Kitts and Nevis'),
  (5, 'Saint Lucia'),
  (5, 'Saint Martin'),
  (5, 'Saint Pierre'),
  (5, 'Saint Vincent'),
  (3, 'Samoa'),
  (1, 'San Marino'),
  (4, 'Sao Tome and Principe'),
  (2, 'Saudi Arabia'),
  (4, 'Senegal'),
  (1, 'Serbia'),
  (4, 'Seychelles'),
  (4, 'Sierra Leone'),
  (2, 'Singapore'),
  (5, 'Sint Maarten (Dutch part)'),
  (1, 'Slovakia (Slovak Republic)'),
  (1, 'Slovenia'),
  (3, 'Solomon Islands'),
  (4, 'Somalia'),
  (4, 'South Africa'),
  (2, 'South Korea'),
  (6, 'South Georgia'),
  (4, 'South Sudan'),
  (1, 'Spain'),
  (2, 'Sri Lanka'),
  (4, 'Sudan'),
  (5, 'Suriname'),
  (1, 'Svalbard & Jan Mayen Islands'),
  (4, 'Eswatini'),
  (1, 'Sweden'),
  (1, 'Switzerland'),
  (2, 'Syrian Arab Republic'),
  (2, 'Taiwan'),
  (2, 'Tajikistan'),
  (4, 'Tanzania'),
  (2, 'Thailand'),
  (2, 'Timor-Leste'),
  (4, 'Togo'),
  (3, 'Tokelau'),
  (3, 'Tonga'),
  (5, 'Trinidad and Tobago'),
  (4, 'Tunisia'),
  (2, 'Turkey'),
  (2, 'Turkmenistan'),
  (5, 'Turks and Caicos Islands'),
  (3, 'Tuvalu'),
  (4, 'Uganda'),
  (1, 'Ukraine'),
  (2, 'United Arab Emirates'),
  (1, 'United Kingdom'),
  (5, 'United States of America'),
  (3, 'United States Minor Outlying Islands'),
  (5, 'United States Virgin Islands'),
  (5, 'Uruguay'),
  (2, 'Uzbekistan'),
  (3, 'Vanuatu'),
  (5, 'Venezuela'),
  (2, 'Vietnam'),
  (3, 'Wallis and Futuna'),
  (4, 'Western Sahara'),
  (2, 'Yemen'),
  (4, 'Zimbabwe');
