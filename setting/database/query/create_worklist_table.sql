CREATE TABLE worklist.raw_wave (
    wave_id INT NOT NULL PRIMARY KEY,
    warehouse_id INT NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    started_at DATETIME,
    picking_completed_at DATETIME,
    unloading_departed_at DATETIME,
    unloading_completed_at DATETIME,
    unloaded_at DATETIME,
    wms_wave_id VARCHAR(255) NOT NULL,
    wms_wave_name VARCHAR(255) NOT NULL,
    picking_departed_at DATETIME
);

CREATE TABLE worklist.raw_work_group (
    work_group_id INT NOT NULL PRIMARY KEY,
    wave_id INT NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    started_at DATETIME,
    picking_completed_at DATETIME,
    unloading_departed_at DATETIME,
    unloading_completed_at DATETIME,
    unloaded_at DATETIME,
    wms_work_group_id VARCHAR(255) NOT NULL,
    picking_departed_at DATETIME,
    affinity VARCHAR(255)
);

CREATE TABLE worklist.raw_work (
    work_id INT NOT NULL PRIMARY KEY,
    work_group_id INT NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    started_at DATETIME,
    picking_completed_at DATETIME,
    unloading_departed_at DATETIME,
    unloading_completed_at DATETIME,
    unloaded_at DATETIME,
    sku_id INT,
    location_code VARCHAR(255),
    request_quantity INT NOT NULL,
    response_quantity INT,
    shortfall_reason ENUM('TOTE_FULL', 'OUT_OF_STOCK', 'SKU_DAMAGE', 'ETC'),
    wms_work_id VARCHAR(255) NOT NULL,
    picking_departed_at DATETIME
);

CREATE TABLE worklist.wave_story (
    wave_id BIGINT NOT NULL PRIMARY KEY,
    warehouse_id BIGINT NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    wms_wave_id VARCHAR(255) NOT NULL,
    wms_wave_name VARCHAR(255) NOT NULL,
    work_group_count INT NOT NULL,
    work_count INT NOT NULL,
    status TINYINT NOT NULL
);

CREATE TABLE worklist.work_group_story (
    work_group_id BIGINT NOT NULL PRIMARY KEY,
    warehouse_id BIGINT NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    wave_id BIGINT NOT NULL,
    wms_wave_id VARCHAR(255),
    wms_wave_name VARCHAR(255),
    wms_work_group_id VARCHAR(255) NOT NULL,
    status TINYINT NOT NULL,
    shortfall_unit_sum INT,
    affinity VARCHAR(255) NOT NULL
);

CREATE TABLE worklist.work_story (
    work_id BIGINT NOT NULL PRIMARY KEY,
    warehouse_id BIGINT NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    wave_id BIGINT NOT NULL,
    work_group_id BIGINT NOT NULL,
    sku_name VARCHAR(255),
    sku_id BIGINT,
    sku_barcode VARCHAR(255),
    location_code VARCHAR(255) NOT NULL,
    response_quantity INT,
    request_quantity INT NOT NULL,
    shortfall_reason TINYINT,
    status TINYINT NOT NULL
);