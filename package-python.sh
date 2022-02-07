
rm -rf quickfix-python/C++
rm -rf quickfix-python/spec
rm -rf quickfix-python/quickfix*.py
rm -rf quickfix-python/doc
rm -rf quickfix-python/LICENSE

mkdir quickfix-python/C++
mkdir quickfix-python/spec

cp LICENSE quickfix-python

cp src/python3/*.py quickfix-python
cp src/C++/*.h quickfix-python/C++
cp src/C++/*.hpp quickfix-python/C++
cp src/C++/*.cpp quickfix-python/C++
cp -R src/C++/double-conversion quickfix-python/C++
cp src/python3/QuickfixPython.cpp quickfix-python/C++
cp src/python3/QuickfixPython.h quickfix-python/C++
cp setup.py quickfix-python/setup.py
cp test_* quickfix-python 
cp spec/FIX*.xml quickfix-python/spec

touch quickfix-python/C++/config.h
touch quickfix-python/C++/config_windows.h
touch quickfix-python/C++/Allocator.h
rm -f quickfix-python/C++/stdafx.*

#pushd quickfix-python
#Do the build for the active python
pushd quickfix-python setup.py install
python3 setup.py sdist
# PYTHONWARNINGS="ignore" twine upload --repository-url https://test.pypi.org/legacy/ dist/*
# PYTHONWARNINGS="ignore" twine upload --repository-url https://upload.pypi.org/legacy/ dist/*
