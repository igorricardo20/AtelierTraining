Class TRE.TREProduction Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="TRE.TREProduction" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="TRE.BSAtelier" Category="" ClassName="TRE.BSAtelier" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="EnableStandardRequests">1</Setting>
  </Item>
</Production>
}

}
