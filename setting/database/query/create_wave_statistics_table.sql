CREATE TABLE wave_dashboard.total_wave_statistics_story (
    total_wave_statistics_story_id BIGINT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    average_unit DOUBLE,
    average_work_count DOUBLE,
    total_unit_sum INT,
    total_work_count INT,
    total_work_group_count INT,
    total_progres_ratio DOUBLE NOT NULL,
    total_shortfall_count INT,
    total_shortfall_ratio DOUBLE,
    warehouse_id BIGINT NOT NULL
);

CREATE TABLE wave_dashboard.total_wave_affinity_story (
    id BIGINT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    affinity VARCHAR(255) NOT NULL,
    unit_ratio DOUBLE NOT NULL,
    unit_sum DOUBLE NOT NULL,
    warehouse_id BIGINT NOT NULL
);

CREATE TABLE wave_dashboard.total_shortfall_statistics (
    total_wave_statistics_story_id BIGINT NOT NULL,
    count INT NOT NULL,
    ratio INT NOT NULL,
    shortfall_reason TINYINT NOT NULL
);

CREATE TABLE wave_dashboard.single_wave_statistics_story (
    wave_statistics_story_id BIGINT NOT NULL PRIMARY KEY,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    average_unit DOUBLE,
    average_work_count DOUBLE,
    unit_sum INT,
    work_count INT,
    work_group_count INT,
    progress_ratio DOUBLE NOT NULL,
    shortfall_count INT,
    shortfall_ratio DOUBLE,
    status TINYINT,
    warehouse_id BIGINT NOT NULL,
    wms_wave_name VARCHAR(255) NOT NULL
);

CREATE TABLE wave_dashboard.single_wave_affinity_story (
    id BIGINT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    affinity VARCHAR(255),
    unit_ratio DOUBLE NOT NULL,
    unit_sum DOUBLE NOT NULL,
    warehouse_id BIGINT NOT NULL,
    wave_id BIGINT NOT NULL
);

CREATE TABLE wave_dashboard.single_shortfall_statistics (
    wave_statistics_story_id BIGINT NOT NULL,
    count INT NOT NULL,
    ratio DOUBLE NOT NULL,
    shortfall_reason TINYINT
);