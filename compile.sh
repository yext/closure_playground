#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
TEMPLATE_DIR=$1
FULL_PATH=$DIR/templates/$TEMPLATE_DIR

compile ()
{

echo Compiling changes...
DATA=$(cat $DIR/templates/$TEMPLATE_DIR/data.json)
SOY_FILES=`find $FULL_PATH -type f -name '*.soy' | tr "\n" "," | sed "s/,$//g"`

java -jar $DIR/bin/SoyToJsSrcCompiler.jar \
    --outputPathFormat "out/$TEMPLATE_DIR.js" \
    --srcs $SOY_FILES \

cat > "out/$TEMPLATE_DIR.html" << EndOfMessage
<html>
    <head>
        <script src="../bin/soyutils.js"></script>
        <script src="$TEMPLATE_DIR.js"></script>
    </head>
    <body>
        <div class="content">
        </div>
        <script>
            var yext = {};
            yext.data = $DATA;
            var html = $TEMPLATE_DIR.default(yext.data);
            document.querySelector(".content").innerHTML = html;
        </script>
        <script src="../bin/soyexec.js"></script>
    </body>
</html>
EndOfMessage

echo Finished.
}

daemon ()
{
    chsum1=""

    while [[ true ]]
    do
        chsum2=`find $FULL_PATH -type f -exec md5 {} \;`
        if [[ $chsum1 != $chsum2 ]] ; then
            compile
            chsum1=$chsum2
        fi
        sleep 2
    done
}

daemon

# exit