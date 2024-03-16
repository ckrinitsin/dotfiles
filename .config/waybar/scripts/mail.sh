#!/bin/bash

echo $(find $HOME/.cache/mail/*/INBOX/new/ -type f | wc -l)
