from flask import Flask
from access_module import AccessModule
from acc_peo_module import AccPeoModule
from people_module import PeopleModule
from peo_cur_module import PeoCurModule
from curriculum_module import CurriculumModule

# Project Configuration
app = Flask("GradUSP", template_folder = './templates')
app.config['SECRET_KEY'] = b'\xe8\x11\xbcO\xdcHw#\xcbI0c\x0f\x96\x19w'

# Initializing Databases
accessdb = AccessModule()
acc_peodb = AccPeoModule()
peopledb = PeopleModule()
peo_curdb = PeoCurModule()
curriculumdb = CurriculumModule()

# Importing views
from views import *

# Running the app
if __name__ == '__main__':
    app.run()

