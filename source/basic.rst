================
基本的な操作
================

--------
準備
--------

今回使用するスキーマはこちらです。

.. literalinclude:: schema.sql
   :language: sql

ドライバを設定します。

.. literalinclude:: lib/Neko/Driver.pm
   :language: perl

テーブルクラスを設定します。

.. literalinclude:: lib/Neko/Table/User.pm
   :language: perl

-------------
操作してみる
-------------

スキーマのセットアップ

.. literalinclude:: pl/setup.pl
   :language: perl

INSERT

.. literalinclude:: pl/insert.pl
   :language: perl

UPDATE

.. literalinclude:: pl/update.pl
   :language: perl

DELETE

.. literalinclude:: pl/remove.pl
   :language: perl

