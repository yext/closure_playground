#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
TEMPLATE_NAME=$1
FULL_PATH=$DIR/templates/$TEMPLATE_NAME

mkdir -p $FULL_PATH
cat > $FULL_PATH/$TEMPLATE_NAME.soy << EndOfMessage
{namespace $TEMPLATE_NAME}

/**
 * @param data
 */
{template .default}
<style>
    {literal}
    table
    {
        border-collapse:collapse;
    }

    table, th, td
    {
        border: 1px solid #555;
    }

    th
    {
        background-color:#EEE;
        font-weight:700;
    }

    th, td
    {
        padding:5px 10px;
    }
    {/literal}
</style>
<table>
    <thead>
        <tr>
            <th>
                Keys
            </th>
        </tr>
    </thead>
    <tbody>
{foreach \$key in keys(\$data)}
    <tr>
        <td>
            {\$key}
        </td>
    </tr>
{/foreach}
    </tbody>
</table>
// Either implement your main template, or invoke it here
{/template}
EndOfMessage

cat > $FULL_PATH/data.json << EndOfMessage
{
    "data": {
    }
}
EndOfMessage

echo Created new project in $FULL_PATH