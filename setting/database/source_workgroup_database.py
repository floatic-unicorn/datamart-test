from sqlalchemy import create_engine


class SourceWorkgroupDatabase:
    def __init__(self, source_workgroup_database_url: str, is_echo):
        self.SOURCE_WORKGROUP_DATABASE_URL = source_workgroup_database_url
        self.source_workgroup_engine = create_engine(
            self.SOURCE_WORKGROUP_DATABASE_URL,
            pool_size=20,
            max_overflow=10,
            pool_timeout=30,
            pool_recycle=100,
            echo=is_echo,
        )
