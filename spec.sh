#!/bin/bash

echo '请输入需要WyhNavigationBar.podspec需要push的spec名称'

read spec

pod repo push $spec WyhNavigationBar.podspec --allow-warnings --verbose --use-libraries
pod repo update $spec
