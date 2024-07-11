from sqlalchemy import Column, Integer, DateTime, String
from sqlalchemy.orm import declarative_base

Base = declarative_base()


class LocalWorkGroup(Base):
    __tablename__ = 'work_group'

    work_group_id = Column(Integer, primary_key=True, nullable=False)
    created_at = Column(DateTime(timezone=True), nullable=False)
    updated_at = Column(DateTime(timezone=True), nullable=False)
    affinity = Column(String(255), nullable=False)
    picking_completed_at = Column(DateTime(timezone=True))
    picking_departed_at = Column(DateTime(timezone=True))
    unloading_completed_at = Column(DateTime(timezone=True))
    unloading_departed_at = Column(DateTime(timezone=True))
    warehouse_id = Column(Integer, nullable=False)
    wave_id = Column(Integer, nullable=False)
    wms_work_group_id = Column(String(255), nullable=False)
