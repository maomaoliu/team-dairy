#!/bin/bash
bin/rails generate scaffold team name:string
bin/rails generate scaffold user name:string email:string like:integer
bin/rails generate scaffold event message:string image:string
bin/rails generate migration AddTeamRefToUsers team:references
bin/rails generate migration AddUserRefToEvents user:references
