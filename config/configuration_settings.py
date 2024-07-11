from config.settings import Settings
from setting.database.source_wave_database import SourceWaveDatabase
from setting.database.source_work_database import SourceWorkDatabase
from setting.database.source_workgroup_database import SourceWorkgroupDatabase
from setting.database.wave_database import WaveDatabase
from setting.database.work_database import WorkDatabase
from setting.database.workgroup_database import WorkgroupDatabase


class ConfigurationSettings:
    def __init__(self):
        self.settings = Settings()
        self.settings.configure()

        self.source_wave_database = SourceWaveDatabase(
            self.settings.SOURCE_WAVE_DATABASE_URL,
            True
        )

        self.source_workgroup_database = SourceWorkgroupDatabase(
            self.settings.SOURCE_WORKGROUP_DATABASE_URL,
            True
        )

        self.source_work_database = SourceWorkDatabase(
            self.settings.SOURCE_WORK_DATABASE_URL,
            True
        )

        self.local_wave_database = WaveDatabase(
            self.settings.WAVE_DATABASE_URL,
            True
        )

        self.local_workgroup_database = WorkgroupDatabase(
            self.settings.WORKGROUP_DATABASE_URL,
            True
        )

        self.local_work_database = WorkDatabase(
            self.settings.WORK_DATABASE_URL,
            True
        )