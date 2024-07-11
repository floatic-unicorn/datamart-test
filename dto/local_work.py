from sqlalchemy import Column, Integer, DateTime, String, Enum
from sqlalchemy.orm import declarative_base

from utility.enums import ShortfallReasonEnum

Base = declarative_base()


class LocalWork(Base):
    __tablename__ = 'work'

    work_id = Column(Integer, primary_key=True, nullable=False)
    created_at = Column(DateTime(timezone=True), nullable=False)
    updated_at = Column(DateTime(timezone=True), nullable=False)
    affinity = Column(String(255), nullable=False)
    picking_completed_at = Column(DateTime(timezone=True))
    picking_departed_at = Column(DateTime(timezone=True))
    request_quantity = Column(Integer, nullable=False)
    response_quantity = Column(Integer)
    shortfall_reason = Column(Enum(ShortfallReasonEnum))
    depth = Column(Integer)
    height = Column(Integer)
    weight = Column(Integer)
    width = Column(Integer)
    location_code = Column(String(30), nullable=False)
    sku_id = Column(Integer, nullable=False)
    unloading_completed_at = Column(DateTime(timezone=True))
    unloading_departed_at = Column(DateTime(timezone=True))
    warehouse_id = Column(Integer, nullable=False)
    wave_id = Column(Integer, nullable=False)
    wms_work_id = Column(String(255), nullable=False)
    work_group_id = Column(Integer, nullable=False)
