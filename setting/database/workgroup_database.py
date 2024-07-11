from sqlalchemy import create_engine


class WorkgroupDatabase:
    def __init__(self, workgroup_database_url: str, is_echo):
        self.WORKGROUP_DATABASE_URL = workgroup_database_url
        self.workgroup_engine = create_engine(
            self.WORKGROUP_DATABASE_URL,
            pool_size=20,
            max_overflow=10,
            pool_timeout=30,
            pool_recycle=100,
            echo=is_echo,
        )
