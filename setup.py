import os

from setuptools import setup, find_packages

here = os.path.abspath(os.path.dirname(__file__))
with open(os.path.join(here, 'README.txt')) as f:
    README = f.read()
with open(os.path.join(here, 'CHANGES.txt')) as f:
    CHANGES = f.read()

requires = [
    'plaster_pastedeploy',
    'pyramid >= 1.9a',
    'pyramid_debugtoolbar',
    'pyramid_mako',
    'pyramid_retry',
    'pyramid_tm',
    'pyramid_simpleform >= 0.7.dev0',
    'pyramid_mailer',
    'SQLAlchemy',
    'transaction',
    'zope.sqlalchemy',
    'waitress',
    'bcrypt',
    'alembic',
]

tests_require = [
    'WebTest >= 1.3.1',  # py3 compat
    'pytest',
    'pytest-cov',
]

setup(
    name='eschool',
    version='0.0',
    description='eschool',
    long_description=README + '\n\n' + CHANGES,
    classifiers=[
        'Programming Language :: Python',
        'Framework :: Pyramid',
        'Topic :: Internet :: WWW/HTTP',
        'Topic :: Internet :: WWW/HTTP :: WSGI :: Application',
    ],
    author='',
    author_email='',
    url='',
    keywords='web pyramid pylons',
    packages=find_packages(),
    include_package_data=True,
    zip_safe=False,
    extras_require={
        'testing': tests_require,
    },
    install_requires=requires,
    entry_points={
        'paste.app_factory': [
            'main = eschool:main',
        ],
        'console_scripts': [
            'initialize_eschool_db = eschool.scripts.initializedb:main',
            'create_user = eschool.scripts.create_user:main',
            'delete_all_users = eschool.scripts.delete_all_users:main',
            'create_admin = eschool.scripts.create_admin:main',
        ],
    },
)
