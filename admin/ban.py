import os
import yaml
from utils.db import sql_exec, sql_exec_values
from utils.logger import log_msg

sql = "INSERT INTO domain_blocks (created_at, updated_at, severity, reject_media, reject_reports, obfuscate, private_comment, public_comment, domain) VALUES (NOW(), NOW(), 1, True, True, False, %s, %s, %s)"

with open(os.environ['CONFIG_FILE'], "r") as stream:
    config = yaml.safe_load(stream)
    sql_exec("DELETE FROM domain_blocks")
    for ban in config['ban']:
        log_msg("INFO", "Inserting this blocked domain: {}".format(ban['domain']))
        sql_exec_values(sql, (ban['comment'], ban['comment'], ban['domain'],))
