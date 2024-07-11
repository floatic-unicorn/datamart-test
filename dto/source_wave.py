from sqlalchemy import Column, Integer, DateTime, String
from sqlalchemy.orm import declarative_base

Base = declarative_base()


class SourceWave(Base):
    __tablename__ = 'wave'

    wave_id = Column(Integer, primary_key=True, autoincrement=True, nullable=False)
    created_at = Column(DateTime(timezone=True), nullable=False)
    updated_at = Column(DateTime(timezone=True), nullable=False)
    picking_completed_at = Column(DateTime(timezone=True))
    picking_departed_at = Column(DateTime(timezone=True))
    unloading_completed_at = Column(DateTime(timezone=True))
    unloading_departed_at = Column(DateTime(timezone=True))
    warehouse_id = Column(Integer, nullable=False)
    wms_wave_id = Column(String(255), nullable=False)
    wms_wave_name = Column(String(255), nullable=False)
