<?php

    add_action('wp_enqueue_scripts', static function () {

        if (!is_admin()) {
            wp_enqueue_style('theme', get_stylesheet_directory_uri() . '/style.css', [], '', 'all');
        }
    });
