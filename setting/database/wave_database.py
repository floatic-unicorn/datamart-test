from sqlalchemy import create_engine


class WaveDatabase:
    def __init__(self, wave_database_url: str, is_echo):
        self.WAVE_DATABASE_URL = wave_database_url
        self.wave_engine = create_engine(
            self.WAVE_DATABASE_URL,
            pool_size=20,
            max_overflow=10,
            pool_timeout=30,
            pool_recycle=100,
            echo=is_echo,
        )
