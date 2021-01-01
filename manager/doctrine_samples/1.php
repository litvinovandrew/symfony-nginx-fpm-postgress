<?php

namespace doctrine_samples;

require_once (__DIR__."./../vendor/autoload.php");

use App\Entity\Post;
use Doctrine\Common\Annotations\AnnotationReader;
use Doctrine\Common\Annotations\AnnotationRegistry;
use Doctrine\ORM\Tools\Setup;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\Mapping\Driver\AnnotationDriver;

$dbParams = [
    // 'driver' => 'pdo_pgsql',
    // 'user' => 'root',
    // 'password' => 'root123',
    // 'dbname' => 'app',
    'url' => 'pgsql://root:root123@172.23.0.2:5432/app'
];

$paths = ["./../src/Entity"]; //paths to enities files
$isDevMode = true;

$config =Setup::createConfiguration($isDevMode);
$driver = new AnnotationDriver(new AnnotationReader(), $paths);


// registering noop annotation autoloader - allow all annotations by default
AnnotationRegistry::registerLoader('class_exists');
$config->setMetadataDriverImpl($driver);

$entityManager = EntityManager::create($dbParams, $config);

$post = new Post;
$post->setTitle('d2');
$post->setText('text2');

$entityManager->persist($post);
$entityManager->flush();
