from sqlalchemy import create_engine


class SourceWorkDatabase:
    def __init__(self, source_work_database_url: str, is_echo):
        self.SOURCE_WORK_DATABASE_URL = source_work_database_url
        self.source_work_engine = create_engine(
            self.SOURCE_WORK_DATABASE_URL,
            pool_size=20,
            max_overflow=10,
            pool_timeout=30,
            pool_recycle=100,
            echo=is_echo,
        )
