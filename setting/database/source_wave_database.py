from sqlalchemy import create_engine


class SourceWaveDatabase:
    def __init__(self, source_wave_database_url: str, is_echo):
        self.SOURCE_WAVE_DATABASE_URL = source_wave_database_url
        self.source_wave_engine = create_engine(
            self.SOURCE_WAVE_DATABASE_URL,
            pool_size=20,
            max_overflow=10,
            pool_timeout=30,
            pool_recycle=100,
            echo=is_echo,
        )
