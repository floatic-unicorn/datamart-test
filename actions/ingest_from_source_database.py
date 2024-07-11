from sqlalchemy import func
from sqlalchemy.orm import sessionmaker

from config.configuration_settings import ConfigurationSettings
from dto.local_wave import LocalWave
from dto.local_work import LocalWork
from dto.local_work_group import LocalWorkGroup
from dto.source_wave import SourceWave
from dto.source_work import SourceWork
from dto.source_work_group import SourceWorkGroup


def ingest_data_by_wave_id(configuration_settings: ConfigurationSettings, parameter: {}):
    existing_works = get_existing_works(configuration_settings, parameter)
    if existing_works is not None:
        insert_works(configuration_settings, existing_works, parameter)

    existing_workgroups = get_existing_workgroups(configuration_settings, parameter)
    if existing_workgroups is not None:
        insert_workgroups(configuration_settings, existing_workgroups, parameter)

    existing_wave = get_existing_wave(configuration_settings, parameter)
    if existing_wave is not None:
        insert_wave(configuration_settings, existing_wave, parameter)


def get_existing_wave(configuration_settings: ConfigurationSettings, parameter: {}):
    try:
        source_wave_session_maker = sessionmaker(bind=configuration_settings.source_wave_database.source_wave_engine)
        source_wave_session = source_wave_session_maker()

        existing_wave = source_wave_session.query(SourceWave).filter(
            (SourceWave.warehouse_id == parameter['warehouse_id']) &
            (func.date(SourceWave.created_at) == func.date(parameter['created_at'])) &
            (SourceWave.wave_id == parameter['wave_id'])
        ).first()

        return existing_wave

    except Exception as e:
        print('[get_existing_waves] ', e)

    finally:
        source_wave_session.close()


def insert_wave(configuration_settings: ConfigurationSettings, wave: SourceWave, parameter: {}):
    try:
        local_wave_session_maker = sessionmaker(bind=configuration_settings.local_wave_database.wave_engine)
        local_wave_session = local_wave_session_maker()

        is_existing = local_wave_session.query(LocalWave).filter(
            (LocalWave.warehouse_id == parameter['warehouse_id']) &
            (func.date(LocalWave.created_at) == func.date(parameter['created_at'])) &
            (LocalWave.wave_id == parameter['wave_id'])
        ).first()

        if is_existing is None:
            local_wave = LocalWave(
                wave_id=wave.wave_id,
                created_at=wave.created_at,
                updated_at=wave.updated_at,
                picking_completed_at=None,
                picking_departed_at=None,
                unloading_completed_at=None,
                unloading_departed_at=None,
                warehouse_id=wave.warehouse_id,
                wms_wave_id=wave.wms_wave_id,
                wms_wave_name=wave.wms_wave_name
            )
            local_wave_session.add(local_wave)
            local_wave_session.commit()

    except Exception as e:
        print('[insert_wave] ', e)
        local_wave_session.rollback()

    finally:
        local_wave_session.close()


def get_existing_workgroups(configuration_settings: ConfigurationSettings, parameter: {}):
    try:
        source_workgroup_session_maker = sessionmaker(
            bind=configuration_settings.source_workgroup_database.source_workgroup_engine)
        source_workgroup_session = source_workgroup_session_maker()

        existing_workgroups = source_workgroup_session.query(SourceWorkGroup).filter(
            (SourceWorkGroup.warehouse_id == parameter['warehouse_id']) &
            (SourceWorkGroup.wave_id == parameter['wave_id'])
        ).all()

        return existing_workgroups

    except Exception as e:
        print('[get_existing_workgroups] ', e)

    finally:
        source_workgroup_session.close()


def insert_workgroups(configuration_settings: ConfigurationSettings, workgroups: [SourceWorkGroup], parameter: {}):
    try:
        local_workgroup_session_maker = sessionmaker(
            bind=configuration_settings.local_workgroup_database.workgroup_engine)
        local_workgroup_session = local_workgroup_session_maker()

        is_existing = local_workgroup_session.query(LocalWorkGroup).filter(
            (LocalWorkGroup.warehouse_id == parameter['warehouse_id']) &
            (LocalWorkGroup.wave_id == parameter['wave_id'])
        ).first()

        if is_existing is None:
            local_workgroups = []

            for workgroup in workgroups:
                local_workgroup = LocalWorkGroup(
                    work_group_id=workgroup.work_group_id,
                    created_at=workgroup.created_at,
                    updated_at=workgroup.updated_at,
                    affinity=workgroup.affinity,
                    picking_completed_at=None,
                    picking_departed_at=None,
                    unloading_completed_at=None,
                    unloading_departed_at=None,
                    warehouse_id=workgroup.warehouse_id,
                    wave_id=workgroup.wave_id,
                    wms_work_group_id=workgroup.wms_work_group_id
                )
                local_workgroups.append(local_workgroup)

            local_workgroup_session.bulk_save_objects(local_workgroups)
            local_workgroup_session.commit()

    except Exception as e:
        print('[insert_workgroups] ', e)
        local_workgroup_session.rollback()

    finally:
        local_workgroup_session.close()


def get_existing_works(configuration_settings: ConfigurationSettings, parameter: {}):
    try:
        source_work_session_maker = sessionmaker(bind=configuration_settings.source_work_database.source_work_engine)
        source_work_session = source_work_session_maker()

        existing_works = source_work_session.query(SourceWork).filter(
            (SourceWork.warehouse_id == parameter['warehouse_id']) &
            (SourceWork.wave_id == parameter['wave_id'])
        ).all()

        return existing_works

    except Exception as e:
        print('[get_existing_works] ', e)

    finally:
        source_work_session.close()


def insert_works(configuration_settings: ConfigurationSettings, works: [SourceWork], parameter: {}):
    try:
        local_work_session_maker = sessionmaker(
            bind=configuration_settings.local_work_database.work_engine)
        local_work_session = local_work_session_maker()

        is_existing = local_work_session.query(LocalWork).filter(
            (LocalWork.warehouse_id == parameter['warehouse_id']) &
            (LocalWork.wave_id == parameter['wave_id'])
        ).first()

        if is_existing is None:
            local_works = []

            for work in works:
                local_work = LocalWork(
                    work_id=work.work_id,
                    created_at=work.created_at,
                    updated_at=work.updated_at,
                    affinity=work.affinity,
                    picking_completed_at=None,
                    picking_departed_at=None,
                    request_quantity=work.request_quantity,
                    response_quantity=None,
                    shortfall_reason=None,
                    depth=work.depth,
                    height=work.height,
                    weight=work.weight,
                    width=work.width,
                    location_code=work.location_code,
                    sku_id=work.sku_id,
                    unloading_completed_at=None,
                    unloading_departed_at=None,
                    warehouse_id=work.warehouse_id,
                    wave_id=work.wave_id,
                    wms_work_id=work.wms_work_id,
                    work_group_id=work.work_group_id
                )

                local_works.append(local_work)

            local_work_session.bulk_save_objects(local_works)
            local_work_session.commit()

    except Exception as e:
        print('[insert_works] ', e)
        local_work_session.rollback()

    finally:
        local_work_session.close()
