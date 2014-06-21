rm(list=ls(all=TRUE)) #Clear the memory of variables from previous run. This is not called by knitr, because it's above the first chunk.
#####################################
## @knitr LoadPackages
require(knitr)
require(RSQLite)
require(RSQLite.extfuns)
#####################################
## @knitr DeclareGlobals

pathChinook <- "./Data/Chinook/Chinook.sqlite"

#####################################
## @knitr LoadData
# Set up handles to database tables on app start
# db <- src_sqlite(pathChinook)
# db
# tblAlbum <- tbl(db, "Album")
# str(tblAlbum)
# tomatoes <- tbl(db, "genre")


# drv    <- dbDriver("SQLite")
# 
# con <- dbConnect(drv, dbname=":memory:")
exampledb <- dbConnect(SQLite(), pathChinook)

# str(drv)
str(exampledb)


dbListTables(exampledb)
dbListFields(exampledb, "Album")
# dbColumnInfo(exampledb, "Album")


rs <- dbSendQuery(exampledb, "select * from Album")
info <- dbGetInfo(rs)
info$fields
dbClearResult(rs)

names(dbGetInfo(exampledb))  

dbGetQuery(exampledb, "select * from sqlite_master")

j <- dbGetQuery(exampledb, "select * from sqlite_master where tbl_name = 'Album'") 
# dbDisconnect(con)
dbDisconnect(exampledb)

str(j)
s <- strsplit(j$sql[1], split="\n")[[1]]

pattern <- "\\s+\\[(.*)\\]\\s([A-Z0-9\\(\\)]+)\\s+(NOT NULL|NULL)"
gsub(pattern=pattern, replacement="\\1-\\2-\\3", x=s, perl=TRUE)
gsub(pattern=pattern, replacement="\\3", x=s, perl=TRUE)
grep(pattern=pattern, s, perl=TRUE)

regexpr(pattern=pattern, s, perl=TRUE)
gregexpr(pattern=pattern, s, perl=TRUE)
regexec(pattern=pattern, s)
grep(pattern=pattern, s, perl=TRUE, value=TRUE)

m <- regexpr(pattern=pattern, s, perl=TRUE)
regmatches(s, m)
regmatches(s, m, invert = TRUE)

#####################################
## @knitr TweakData

#####################################
## @knitr TPValue

# create a SQLite instance and create one connection.
m <- dbDriver("SQLite")

drv <- dbDriver("SQLite")
# after working awhile...
for(con in dbListConnections(drv)){
  dbGetStatement(dbListResults(con))
}


