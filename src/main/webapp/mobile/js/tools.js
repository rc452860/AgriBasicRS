/**
 * Created by rc452 on 2016/3/31.
 */
function addParam(url,key,value){
    if(url.search(/\?/) == -1)
        url+='?';
    var patternTemp = "var re = /("+key+"=)(.*?)(&)/";
    eval(patternTemp);
    if(re.test(url))
        url.replace(re,"$1"+patternTemp+"&");
    else
        url += (url[url.length-1] == '&' || url[url.length-1] == "?")?key+"="+value+"&":"&"+key+"="+value+"&";

    return url;
}