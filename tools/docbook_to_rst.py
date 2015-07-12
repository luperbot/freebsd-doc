#!/usr/bin/env python
"""Script is to enable converting .html docs from DocBook format into reStructuredText format.
This script should be run on all the old version of docs as to enable readthedocs building
each version.
"""
import sys
import os

from subprocess import call

def html_to_rst(file, root, single=False, encoding='UTF-8', html=True):
    original_format= 'html' if html else 'docbook'
    if not file.endswith('.html'):
        return
    new_file = file[:-5] + '.rst'
    file_path = "%s/%s" % (root, file)
    if single:
        new_file_path = "%s.rst" % (root)
    else:
        new_file_path = "%s/%s" % (root, new_file)
    print "%s to %s" % (file_path, new_file_path)
    if encoding == 'UTF-8':
        call(['pandoc', '-f', original_format, '-t', 'rst', '-s', file_path, '-o', new_file_path])
    else:
        command = "iconv -f %s %s | pandoc -f %s -t rst -s -o %s | iconv -f utf-8" % (
            encoding, file_path, original_format, new_file_path)
        call(command, shell=True)
    #TODO: Only delete file if the new file is not empty.
    #delete_html(file_path)

def add_file_name(file_name):
    if all_file_names.get(file_name):
        all_file_names[file_name] += 1
    else:
        all_file_names[file_name] = 1

def delete_html(file_path):
    """Delete .html file once converted to .rst as part of cleanup."""
    call(['rm', file_path])

def is_single(files):
    count = 0
    for file in files:
        if file.endswith('.html'):
            count += 1
    if count == 1:
        return True
    return False

def convert_dir(dir_path):
    """dir_path is the path name of all the files to convert (ex en_US.ISO8859-1)"""
    print "Converting .html files to .rst for %s" % dir_path
    encoding = dir_path.split('/')[-2].split('.')[1]
    print "Original encoding is: %s" % encoding
    for root, dirs, files in os.walk(dir_path):
        single = is_single(files)
        for file in files:
            html_to_rst(file, root, single=single, encoding=encoding, html=True)

def create_htdocs(dir_path):
    htdocs_path = "%s%s" % (dir_path, 'htdocs/')
    print "Making htdocs."
    call(['cd', htdocs_path, '&&', 'make all'])
    print "Done making htdocs."

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print "Include directory path you wish to convert:"
        print "\tex. python tools/docbook_to_rst.py docs/en_US.ISO8859-1/"
    else:
        dir_path = sys.argv[1]
        create_htdocs(dir_path)
        convert_dir(dir_path)
