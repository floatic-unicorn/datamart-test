import os

from dotenv import load_dotenv


class Settings:
    def __init__(self):
        self.SOURCE_WAVE_DATABASE_URL = ''
        self.SOURCE_WORKGROUP_DATABASE_URL = ''
        self.SOURCE_WORK_DATABASE_URL = ''

        self.WAVE_DATABASE_URL = ''
        self.WORKGROUP_DATABASE_URL = ''
        self.WORK_DATABASE_URL = ''

    def configure(self):
        load_dotenv(dotenv_path='config/.env')

        self.SOURCE_WAVE_DATABASE_URL = os.getenv('SOURCE_WAVE_DATABASE_URL')
        self.SOURCE_WORKGROUP_DATABASE_URL = os.getenv('SOURCE_WORKGROUP_DATABASE_URL')
        self.SOURCE_WORK_DATABASE_URL = os.getenv('SOURCE_WORK_DATABASE_URL')

        self.WAVE_DATABASE_URL = os.getenv('WAVE_DATABASE_URL')
        self.WORKGROUP_DATABASE_URL = os.getenv('WORKGROUP_DATABASE_URL')
        self.WORK_DATABASE_URL = os.getenv('WORK_DATABASE_URL')
