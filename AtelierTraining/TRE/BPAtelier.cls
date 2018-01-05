/// 
Class TRE.BPAtelier Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='Ens.Request' response='Ens.Response' height='2000' width='2000' >
<sequence xend='200' yend='350' >
<assign name="A" property="request" value="response" action="set" xpos='200' ypos='250' />
</sequence>
</process>
}

Storage Default
{
<Type>%Library.CacheStorage</Type>
}

}
