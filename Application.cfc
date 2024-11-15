<cfcomponent>
    <cfset this.name = "avghhjjjdfdjthhlkjjhmcsdhjujhkkkkkkkkkkk8hmi">
    <cfset this.sessionManagement  = true>

    <cffunction name="onRequestStart">
        <cfif not isdefined("session.id") && (listlast(cgi.script_name,"/") EQ "home.cfm")  >
            <cflocation url="index.cfm" addtoken="false">
        </cfif>

       
        <cfif isDefined("session.id") && listlast(cgi.script_name,"/") EQ "index.cfm">
            <cflocation url="home.cfm" addtoken="false">
        </cfif>
  <!---          
        <cfif isDefined("session.idd") && listlast(cgi.script_name,"/") EQ "index.cfm">
            <cflocation url="home.cfm" addtoken="false">
        </cfif>

        <cfif not isdefined("session.idd") && (listlast(cgi.script_name,"/") EQ "home.cfm")  >
            <cflocation url="index.cfm" addtoken="false">
        </cfif> --->

    </cffunction>
</cfcomponent>