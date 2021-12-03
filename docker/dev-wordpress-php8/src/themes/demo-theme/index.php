<!doctype html>
<html <?php language_attributes();?>>
<head>
	<meta charset="<?php bloginfo( 'charset' ); ?>" />
 	<title><?php wp_title(); ?></title>
 	<meta name="viewport" content="width=device-width, initial-scale=1">
 	<?php wp_head(); ?>
</head>
<body <?php body_class(); ?>>

    <?php if ( have_posts() ) : ?>
        <?php while ( have_posts() ) : the_post(); ?>

            <?php the_title(); ?>

            <?php $src = get_the_post_thumbnail_url(get_the_ID(), 'large' ); ?>
            <?php if (!empty($src) ): ?>
                <img src="<?php echo $src; ?>" alt="" />
            <?php endif; ?>

            <?php the_content(); ?>

            <?php the_permalink() ?>

        <?php endwhile; ?>
    <?php endif; ?>

    <?php wp_footer(); ?>
</body>
</html>
