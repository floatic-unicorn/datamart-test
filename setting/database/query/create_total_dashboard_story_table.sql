CREATE TABLE total_dashboard_story.operation_progres_info (
    id BIGINT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    created_at DATETIME NOT NULL,
    assigned_unit_ratio DOUBLE,
    completed_unit_ratio DOUBLE,
    in_progress_unit_ratio DOUBLE,
    total_unit_sum INT,
    warehouse_id BIGINT NOT NULL,
    assigned_wave_ratio DOUBLE,
    completed_wave_count INT,
    completed_wave_Ratio DOUBLE,
    in_progress_wave_ratio DOUBLE,
    total_wave_count INT,
    assigned_work_group_ratio DOUBLE,
    completed_work_group_count INT,
    completed_work_group_ratio DOUBLE,
    in_progress_work_group_ratio DOUBLE,
    total_work_group_count INT,
    assigned_work_ratio DOUBLE,
    completed_work_count INT,
    completed_work_ratio DOUBLE,
    in_progress_work_ratio DOUBLE,
    total_work_count INT,
    completed_unit_sum INT
);

CREATE TABLE total_dashboard_story.picking_progress_by_affinity (
    id BIGINT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    affinity VARCHAR(255),
    created_at DATETIME NOT NULL,
    completed_unit_sum INT,
    remaining_unit_sum INT,
    warehouse_id BIGINT NOT NULL,
    completed_work_count INT,
    remaining_work_count INT
);

CREATE TABLE total_dashboard_story.productivity_summary (
    id BIGINT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    created_at DATETIME NOT NULL,
    operation_elapsed_time TIME,
    operation_remaining_time TIME,
    operation_start_time DATETIME,
    unit_max_capacity DOUBLE,
    unit_productivity DOUBLE,
    warehouse_id BIGINT NOT NULL,
    work_max_capacity DOUBLE,
    work_productivity DOUBLE,
);

CREATE TABLE total_dashboard_story.productivity_time_line (
    id BIGINT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    created_at DATETIME NOT NULL,
    time_slot INT,
    unit_sum INT,
    unit_productivity DOUBLE,
    warehouse_id BIGINT NOT NULL,
    work_count INT,
    work_productivity DOUBLE
);

CREATE TABLE total_dashboard_story.robot_info (
    id BIGINT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    error_robot_count INT,
    idle_robot_count INT,
    offline_robot_count INT,
    running_robot_count INT,
    total_robot_count INT,
    warehouse_id BIGINT NOT NULL
);

CREATE TABLE total_dashboard_story.top_picking_sku (
    id BIGINT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    created_at DATETIME NOT NULL,
    location_code VARCHAR(255),
    picked_unit_sum INT,
    rank_number INT,
    sku_name VARCHAR(255),
    warehouse_id BIGINT NOT NULL
);

CREATE TABLE total_dashboard_story.unloading_station_info (
    id BIGINT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    close_work_station_count INT,
    open_work_station_count INT,
    total_work_station_count INT,
    warehouse_id BIGINT NOT NULL,
    work_station_utilization_ratio DOUBLE
);