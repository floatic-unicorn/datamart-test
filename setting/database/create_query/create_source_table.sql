CREATE TABLE wave.wave (
    wave_id BIGINT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    picking_completed_at DATETIME,
    picking_departed_at DATETIME,
    unloading_completed_at DATETIME,
    unloading_departed_at DATETIME,
    warehouse_id BIGINT NOT NULL,
    wms_wave_id VARCHAR(255) NOT NULL,
    wms_wave_name VARCHAR(255) NOT NULL
);

CREATE TABLE workgroup.work_group (
    work_group_id BIGINT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    affinity VARCHAR(255) NOT NULL,
    picking_completed_at DATETIME,
    picking_departed_at DATETIME,
    unloading_completed_at DATETIME,
    unloading_departed_at DATETIME,
    warehouse_id BIGINT NOT NULL,
    wave_id BIGINT NOT NULL,
    wms_work_group_id VARCHAR(255) NOT NULL
);

CREATE TABLE work.work (
    work_id BIGINT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    affinity VARCHAR(255) NOT NULL,
    picking_completed_at DATETIME,
    picking_departed_at DATETIME,
    request_quantity INT NOT NULL,
    response_quantity INT,
    shortfall_reason ENUM('OUT_OF_STOCK', 'SKU_DAMAGE', 'ETC'),
    depth INT,
    height INT,
    weight INT,
    width INT,
    location_code VARCHAR(30) NOT NULL,
    sku_id BIGINT NOT NULL,
    unloading_completed_at DATETIME,
    unloading_departed_at DATETIME,
    warehouse_id BIGINT NOT NULL,
    wave_id BIGINT NOT NULL,
    wms_work_id VARCHAR(255) NOT NULL,
    work_group_id BIGINT NOT NULL
);