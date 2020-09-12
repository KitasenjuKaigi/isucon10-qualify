DROP DATABASE IF EXISTS isuumo;
CREATE DATABASE isuumo;

DROP TABLE IF EXISTS isuumo.estate;
DROP TABLE IF EXISTS isuumo.chair;

CREATE TABLE isuumo.estate
(
    id          INTEGER             NOT NULL PRIMARY KEY,
    name        VARCHAR(64)         NOT NULL,
    description VARCHAR(4096)       NOT NULL,
    thumbnail   VARCHAR(128)        NOT NULL,
    address     VARCHAR(128)        NOT NULL,
    latitude    DOUBLE PRECISION    NOT NULL,
    longitude   DOUBLE PRECISION    NOT NULL,
    rent        INTEGER             NOT NULL,
    door_height INTEGER             NOT NULL,
    door_width  INTEGER             NOT NULL,
    features    VARCHAR(64)         NOT NULL,
    popularity  INTEGER             NOT NULL,
    INDEX idx_features_popularity (features, popularity),
    INDEX idx_rent_features_popularity (rent, features, popularity),
    INDEX idx_door_width_door_height_popularity (door_width, door_height, popularity),
    INDEX idx_latitude_longitude_popularity (latitude, longitude, popularity)
);

CREATE TABLE isuumo.chair
(
    id          INTEGER         NOT NULL PRIMARY KEY,
    name        VARCHAR(64)     NOT NULL,
    description VARCHAR(4096)   NOT NULL,
    thumbnail   VARCHAR(128)    NOT NULL,
    price       INTEGER         NOT NULL,
    height      INTEGER         NOT NULL,
    width       INTEGER         NOT NULL,
    depth       INTEGER         NOT NULL,
    color       VARCHAR(64)     NOT NULL,
    features    VARCHAR(64)     NOT NULL,
    kind        VARCHAR(64)     NOT NULL,
    popularity  INTEGER         NOT NULL,
    stock       INTEGER         NOT NULL,
    INDEX idx_features_popularity_stock (features, popularity, stock),
    INDEX idx_depth_features_popularity_stock (depth, features, popularity, stock),
    INDEX idx_price_features_popularity_stock (price, features, popularity, stock),
    INDEX idx_kind_popularity_stock(kind, popularity, stock),
    INDEX idx_width_popularity_stock(width, popularity, stock),
    INDEX idx_height_popularity_stock(height, popularity, stock),
    INDEX idx_price_stock(price, stock),
    INDEX idx_height_stock(height, stock)
);
