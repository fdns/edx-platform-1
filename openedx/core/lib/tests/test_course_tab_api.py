"""
Tests for the plugin API
"""

from django.test import TestCase

from openedx.core.lib.plugins import PluginError
from openedx.core.lib.course_tabs import CourseTabPluginManager


class TestCourseTabApi(TestCase):
    """
    Unit tests for the course tab plugin API
    """
    shard = 2

    def test_get_plugin(self):
        """
        Verify that get_plugin works as expected.
        """
        tab_type = CourseTabPluginManager.get_plugin("instructor")
        self.assertEqual(tab_type.title, "Instructor")

        with self.assertRaises(PluginError):
            CourseTabPluginManager.get_plugin("no_such_type")
