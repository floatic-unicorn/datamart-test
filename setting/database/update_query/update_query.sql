-- wave_id, w/g_id, w_id 불러오기(날짜, 창고 기준)
SELECT wave.wave_id, work.work_group_id, work.work_id
FROM wave.wave
JOIN work.work
ON wave.wave_id = work.wave_id
WHERE wave.warehouse_id = :warehouse_id AND DATE(wave.created_at) = DATE(:created_at);

-- w/g_id, w_id 불러오기(wave_id 기준)
SELECT work.work_id, work.work_group_id
FROM work.work
WHERE work.wave_id =: wave_id ;

--  w_id 불러오기(wg_id 기준)
SELECT work.work_id
FROM work.work
WHERE work.work_group_id =: work_group_id;

-- picking_departed 추가
UPDATE work.work w
JOIN workgroup.work_group wg ON w.work_group_id = wg.work_group_id
JOIN wave.wave wa ON w.wave_id = wa.wave_id
SET w.picking_departed_at = NOW(),
    wg.picking_departed_at = w.picking_departed_at,
    wa.picking_departed_at = w.picking_departed_at
WHERE w.work_id =:work_id;

-- picking_departed 삭제
UPDATE work.work w
JOIN workgroup.work_group wg ON w.work_group_id = wg.work_group_id
JOIN wave.wave wa ON w.wave_id = wa.wave_id
SET w.picking_departed_at = NULL,
    wg.picking_departed_at = w.picking_departed_at,
    wa.picking_departed_at = w.picking_departed_at,
    w.picking_completed_at = NULL,
    wg.picking_completed_at = w.picking_completed_at,
    wa.picking_completed_at = w.picking_completed_at,
    w.unloading_departed_at = NULL,
    wg.unloading_departed_at = w.unloading_departed_at,
    wa.unloading_departed_at = w.unloading_departed_at,
    w.unloading_completed_at = NULL,
    wg.unloading_completed_at = w.unloading_completed_at,
    wa.unloading_completed_at = w.unloading_completed_at,
    w.response_quantity = NULL
WHERE w.work_id =:work_id;

-- picking_completed 추가
UPDATE work.work w
JOIN workgroup.work_group wg ON w.work_group_id = wg.work_group_id
JOIN wave.wave wa ON w.wave_id = wa.wave_id
SET w.picking_completed_at = NOW(),
    wg.picking_completed_at = w.picking_completed_at,
    wa.picking_completed_at = w.picking_completed_at,
    w.response_quantity = w.request_quantity
WHERE w.work_id =:work_id;

-- picking_completed 삭제
UPDATE work.work w
JOIN workgroup.work_group wg ON w.work_group_id = wg.work_group_id
JOIN wave.wave wa ON w.wave_id = wa.wave_id
SET w.picking_completed_at = NULL,
    wg.picking_completed_at = w.picking_completed_at,
    wa.picking_completed_at = w.picking_completed_at,
    w.unloading_departed_at = NULL,
    wg.unloading_departed_at = w.unloading_departed_at,
    wa.unloading_departed_at = w.unloading_departed_at,
    w.unloading_completed_at = NULL,
    wg.unloading_completed_at = w.unloading_completed_at,
    wa.unloading_completed_at = w.unloading_completed_at,
    w.response_quantity = NULL
WHERE w.work_id =:work_id;

-- unloading_departed 추가
UPDATE work.work w
JOIN workgroup.work_group wg ON w.work_group_id = wg.work_group_id
JOIN wave.wave wa ON w.wave_id = wa.wave_id
SET w.unloading_departed_at = NOW(),
    wg.unloading_departed_at = w.unloading_departed_at,
    wa.unloading_departed_at = w.unloading_departed_at,
    w.response_quantity = w.request_quantity
WHERE w.work_id =:work_id;

-- unloading_departed 삭제
UPDATE work.work w
JOIN workgroup.work_group wg ON w.work_group_id = wg.work_group_id
JOIN wave.wave wa ON w.wave_id = wa.wave_id
SET w.unloading_departed_at = NULL,
    wg.unloading_departed_at = w.unloading_departed_at,
    wa.unloading_departed_at = w.unloading_departed_at,
    w.unloading_completed_at = NULL,
    wg.unloading_completed_at = w.unloading_completed_at,
    wa.unloading_completed_at = w.unloading_completed_at,
    w.response_quantity = NULL
WHERE w.work_id =:work_id;

-- unloading_completed 추가
UPDATE work.work w
JOIN workgroup.work_group wg ON w.work_group_id = wg.work_group_id
JOIN wave.wave wa ON w.wave_id = wa.wave_id
SET w.unloading_completed_at = NOW(),
    wg.unloading_completed_at = w.unloading_completed_at,
    wa.unloading_completed_at = w.unloading_completed_at,
    w.response_quantity = w.request_quantity
WHERE w.work_id =:work_id;

-- unloading_completed 삭제
UPDATE work.work w
JOIN workgroup.work_group wg ON w.work_group_id = wg.work_group_id
JOIN wave.wave wa ON w.wave_id = wa.wave_id
SET w.unloading_completed_at = NULL,
    wg.unloading_completed_at = w.unloading_completed_at,
    wa.unloading_completed_at = w.unloading_completed_at,
    w.response_quantity = NULL
WHERE w.work_id =:work_id;