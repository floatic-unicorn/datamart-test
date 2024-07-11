from actions.ingest_from_source_database import ingest_data_by_wave_id
from config.configuration_settings import ConfigurationSettings

if __name__ == '__main__':
    configuration_settings = ConfigurationSettings()
    parameter = {'warehouse_id': 1006, 'created_at': '2024-07-09', 'wave_id': 345}

    ingest_data_by_wave_id(configuration_settings, parameter)
