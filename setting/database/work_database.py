from sqlalchemy import create_engine


class WorkDatabase:
    def __init__(self, work_database_url: str, is_echo):
        self.WORK_DATABASE_URL = work_database_url
        self.work_engine = create_engine(
            self.WORK_DATABASE_URL,
            pool_size=20,
            max_overflow=10,
            pool_timeout=30,
            pool_recycle=100,
            echo=is_echo,
        )
