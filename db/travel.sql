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
  name VARCHAR(255),
  visited BOOLEAN DEFAULT false
);

CREATE TABLE sight_types(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE locations(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  location_type VARCHAR(255),
  country_id INT REFERENCES countries(id) ON DELETE CASCADE,
  visited BOOLEAN DEFAULT false
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

INSERT INTO countries (continent_id, name, visited) VALUES
  (2, 'Afghanistan', FALSE),
  (1, 'Åland Islands', FALSE),
  (1, 'Albania', FALSE),
  (4, 'Algeria', FALSE),
  (3, 'American Samoa', FALSE),
  (1, 'Andorra', FALSE),
  (4, 'Angola', FALSE),
  (5, 'Anguilla', FALSE),
  (6, 'Antarctica', FALSE),
  (5, 'Antigua and Barbuda', FALSE),
  (5, 'Argentina', FALSE),
  (2, 'Armenia', FALSE),
  (5, 'Aruba', FALSE),
  (3, 'Australia', FALSE),
  (1, 'Austria', FALSE),
  (2, 'Azerbaijan', FALSE),
  (5, 'Bahamas', FALSE),
  (2, 'Bahrain', FALSE),
  (2, 'Bangladesh', FALSE),
  (5, 'Barbados', FALSE),
  (1, 'Belarus', FALSE),
  (1, 'Belgium', FALSE),
  (5, 'Belize', FALSE),
  (4, 'Benin', FALSE),
  (5, 'Bermuda', FALSE),
  (2, 'Bhutan', FALSE),
  (5, 'Bolivia', FALSE),
  (5, 'Bonaire, Sint Eustatius and Saba', FALSE),
  (1, 'Bosnia and Herzegovina', FALSE),
  (4, 'Botswana', FALSE),
  (6, 'Bouvet Island (Bouvetøya)', FALSE),
  (5, 'Brazil', FALSE),
  (2, 'British Indian Ocean Territory (Chagos Archipelago)', FALSE),
  (5, 'British Virgin Islands', FALSE),
  (2, 'Brunei Darussalam', FALSE),
  (1, 'Bulgaria', FALSE),
  (4, 'Burkina Faso', FALSE),
  (4, 'Burundi', FALSE),
  (2, 'Cambodia', FALSE),
  (4, 'Cameroon', FALSE),
  (5, 'Canada', FALSE),
  (4, 'Cabo Verde', FALSE),
  (5, 'Cayman Islands', FALSE),
  (4, 'Central African Republic', FALSE),
  (4, 'Chad', FALSE),
  (5, 'Chile', FALSE),
  (2, 'China', FALSE),
  (2, 'Christmas Island', FALSE),
  (2, 'Cocos (Keeling) Islands', FALSE),
  (5, 'Colombia', FALSE),
  (4, 'Comoros', FALSE),
  (4, 'Congo', FALSE),
  (4, 'Congo', FALSE),
  (3, 'Cook Islands', FALSE),
  (5, 'Costa Rica', FALSE),
  (4, 'Cote d''Ivoire', FALSE),
  (1, 'Croatia', FALSE),
  (5, 'Cuba', FALSE),
  (5, 'Curaçao', FALSE),
  (2, 'Cyprus', FALSE),
  (1, 'Czechia', FALSE),
  (1, 'Denmark', FALSE),
  (4, 'Djibouti', FALSE),
  (5, 'Dominica', FALSE),
  (5, 'Dominican Republic', FALSE),
  (5, 'Ecuador', FALSE),
  (4, 'Egypt', FALSE),
  (5, 'El Salvador', FALSE),
  (4, 'Equatorial Guinea', FALSE),
  (4, 'Eritrea', FALSE),
  (1, 'Estonia', FALSE),
  (4, 'Ethiopia', FALSE),
  (1, 'Faroe Islands', FALSE),
  (5, 'Falkland Islands (Malvinas)', FALSE),
  (3, 'Fiji', FALSE),
  (1, 'Finland', FALSE),
  (1, 'France', FALSE),
  (5, 'French Guiana', FALSE),
  (3, 'French Polynesia', FALSE),
  (6, 'French Southern Territories', FALSE),
  (4, 'Gabon', FALSE),
  (4, 'Gambia', FALSE),
  (2, 'Georgia', FALSE),
  (1, 'Germany', FALSE),
  (4, 'Ghana', FALSE),
  (1, 'Gibraltar', FALSE),
  (1, 'Greece', FALSE),
  (5, 'Greenland', FALSE),
  (5, 'Grenada', FALSE),
  (5, 'Guadeloupe', FALSE),
  (3, 'Guam', FALSE),
  (1, 'Guernsey', FALSE),
  (4, 'Guinea', FALSE),
  (4, 'Guinea-Bissau', FALSE),
  (5, 'Guyana', FALSE),
  (5, 'Haiti', FALSE),
  (6, 'Heard Island and McDonald Islands', FALSE),
  (1, 'Holy See (Vatican City State)', FALSE),
  (5, 'Honduras', FALSE),
  (2, 'Hong Kong', FALSE),
  (1, 'Hungary', FALSE),
  (1, 'Iceland', FALSE),
  (2, 'India', FALSE),
  (2, 'Indonesia', FALSE),
  (2, 'Iran', FALSE),
  (2, 'Iraq', FALSE),
  (1, 'Ireland', FALSE),
  (1, 'Isle of Man', FALSE),
  (2, 'Israel', FALSE),
  (1, 'Italy', FALSE),
  (5, 'Jamaica', FALSE),
  (2, 'Japan', FALSE),
  (1, 'Jersey', FALSE),
  (2, 'Jordan', FALSE),
  (2, 'Kazakhstan', FALSE),
  (4, 'Kenya', FALSE),
  (3, 'Kiribati', FALSE),
  (2, 'Kuwait', FALSE),
  (2, 'Kyrgyz Republic', FALSE),
  (2, 'Laos', FALSE),
  (1, 'Latvia', FALSE),
  (2, 'Lebanon', FALSE),
  (4, 'Lesotho', FALSE),
  (4, 'Liberia', FALSE),
  (4, 'Libya', FALSE),
  (1, 'Liechtenstein', FALSE),
  (1, 'Lithuania', FALSE),
  (1, 'Luxembourg', FALSE),
  (2, 'Macao', FALSE),
  (4, 'Madagascar', FALSE),
  (4, 'Malawi', FALSE),
  (2, 'Malaysia', FALSE),
  (2, 'Maldives', FALSE),
  (4, 'Mali', FALSE),
  (1, 'Malta', FALSE),
  (3, 'Marshall Islands', FALSE),
  (5, 'Martinique', FALSE),
  (4, 'Mauritania', FALSE),
  (4, 'Mauritius', FALSE),
  (4, 'Mayotte', FALSE),
  (5, 'Mexico', FALSE),
  (3, 'Micronesia', FALSE),
  (1, 'Moldova', FALSE),
  (1, 'Monaco', FALSE),
  (2, 'Mongolia', FALSE),
  (1, 'Montenegro', FALSE),
  (5, 'Montserrat', FALSE),
  (4, 'Morocco', FALSE),
  (4, 'Mozambique', FALSE),
  (2, 'Myanmar', FALSE),
  (4, 'Namibia', FALSE),
  (3, 'Nauru', FALSE),
  (2, 'Nepal', FALSE),
  (1, 'Netherlands', FALSE),
  (3, 'New Caledonia', FALSE),
  (3, 'New Zealand', FALSE),
  (5, 'Nicaragua', FALSE),
  (4, 'Niger', FALSE),
  (4, 'Nigeria', FALSE),
  (3, 'Niue', FALSE),
  (3, 'Norfolk Island', FALSE),
  (2, 'North Korea', FALSE),
  (1, 'North Macedonia', FALSE),
  (3, 'Northern Mariana Islands', FALSE),
  (1, 'Norway', FALSE),
  (2, 'Oman', FALSE),
  (2, 'Pakistan', FALSE),
  (3, 'Palau', FALSE),
  (2, 'Palestine', FALSE),
  (5, 'Panama', FALSE),
  (3, 'Papua New Guinea', FALSE),
  (5, 'Paraguay', FALSE),
  (5, 'Peru', FALSE),
  (2, 'Philippines', FALSE),
  (3, 'Pitcairn Islands', FALSE),
  (1, 'Poland', FALSE),
  (1, 'Portugal', FALSE),
  (5, 'Puerto Rico', FALSE),
  (2, 'Qatar', FALSE),
  (4, 'Réunion', FALSE),
  (1, 'Romania', FALSE),
  (1, 'Russian Federation', FALSE),
  (4, 'Rwanda', FALSE),
  (5, 'Saint Barthélemy', FALSE),
  (4, 'Saint Helena', FALSE),
  (5, 'Saint Kitts and Nevis', FALSE),
  (5, 'Saint Lucia', FALSE),
  (5, 'Saint Martin', FALSE),
  (5, 'Saint Pierre', FALSE),
  (5, 'Saint Vincent', FALSE),
  (3, 'Samoa', FALSE),
  (1, 'San Marino', FALSE),
  (4, 'Sao Tome and Principe', FALSE),
  (2, 'Saudi Arabia', FALSE),
  (4, 'Senegal', FALSE),
  (1, 'Serbia', FALSE),
  (4, 'Seychelles', FALSE),
  (4, 'Sierra Leone', FALSE),
  (2, 'Singapore', FALSE),
  (5, 'Sint Maarten (Dutch part)', FALSE),
  (1, 'Slovakia (Slovak Republic)', FALSE),
  (1, 'Slovenia', FALSE),
  (3, 'Solomon Islands', FALSE),
  (4, 'Somalia', FALSE),
  (4, 'South Africa', FALSE),
  (2, 'South Korea', FALSE),
  (6, 'South Georgia', FALSE),
  (4, 'South Sudan', FALSE),
  (1, 'Spain', FALSE),
  (2, 'Sri Lanka', FALSE),
  (4, 'Sudan', FALSE),
  (5, 'Suriname', FALSE),
  (1, 'Svalbard & Jan Mayen Islands', FALSE),
  (4, 'Eswatini', FALSE),
  (1, 'Sweden', FALSE),
  (1, 'Switzerland', FALSE),
  (2, 'Syrian Arab Republic', FALSE),
  (2, 'Taiwan', FALSE),
  (2, 'Tajikistan', FALSE),
  (4, 'Tanzania', FALSE),
  (2, 'Thailand', FALSE),
  (2, 'Timor-Leste', FALSE),
  (4, 'Togo', FALSE),
  (3, 'Tokelau', FALSE),
  (3, 'Tonga', FALSE),
  (5, 'Trinidad and Tobago', FALSE),
  (4, 'Tunisia', FALSE),
  (2, 'Turkey', FALSE),
  (2, 'Turkmenistan', FALSE),
  (5, 'Turks and Caicos Islands', FALSE),
  (3, 'Tuvalu', FALSE),
  (4, 'Uganda', FALSE),
  (1, 'Ukraine', FALSE),
  (2, 'United Arab Emirates', FALSE),
  (1, 'United Kingdom', FALSE),
  (5, 'United States of America', FALSE),
  (3, 'United States Minor Outlying Islands', FALSE),
  (5, 'United States Virgin Islands', FALSE),
  (5, 'Uruguay', FALSE),
  (2, 'Uzbekistan', FALSE),
  (3, 'Vanuatu', FALSE),
  (5, 'Venezuela', FALSE),
  (2, 'Vietnam', FALSE),
  (3, 'Wallis and Futuna', FALSE),
  (4, 'Western Sahara', FALSE),
  (2, 'Yemen', FALSE),
  (4, 'Zimbabwe', FALSE);
