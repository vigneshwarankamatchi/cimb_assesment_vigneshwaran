import random
import string
from random import randint
from datetime import datetime
import time

class generator:

    def generate_ic_number(self):
        d = datetime.now()
        dateString = d.strftime('%d%m%Y%H%M%S')
        return dateString

    def generate_admin_name(self):
        return 'robotadmin'+''.join(random.choice(string.lowercase) for i in range(10))

    def generate_other_name(self):
        return 'robotother'+''.join(random.choice(string.lowercase) for i in range(10))

    def generate_smoke_site_name(self):
        return 'RobotFrameworkSmokeTest-'+''.join(random.choice(string.lowercase) for i in range(10))

    def generate_site_name(self, prefix='NEWSite', num=10):
        return str(prefix) + '-RobotFramework-'+''.join(random.choice(string.ascii_lowercase) for i in range(int(num)))

    def generate_site_name_by_date(self, prefix='NEWSite'):
        return str(prefix) + '-RobotFramework-' + str(time.strftime("%Y-%m-%d"))

    def generate_group_name_by_time(self, prefix='group'):
        return str(prefix) + str(time.strftime("%Y-%m-%d-%H-%M-%S"))
