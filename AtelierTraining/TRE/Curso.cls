Class TRE.Curso Extends (%Persistent, %XML.Adaptor)
{

Property Nome As %String;

Property Preco As %Integer;

Property Duracao As %String;

ClassMethod RecuperaCursoPorNome(pNome As %String) As TRE.Curso
{
	Set tSC = $$$OK
	Hang 10 Break
	Try
	{
		Set tRS = ##Class(%ResultSet).%New()
		Set tSQL = "Select ID From TRE.Curso Where Nome=?"
		Set tSC = tRS.Prepare(tSQL)
		Set tSC = tRS.Execute(pNome)
		If tRS.%Next()
		{
			Set tCurso = ##Class(TRE.Curso).%OpenId(tRS.GetData(1))
		}
	}
	Catch(e)
	{
		Set tError = $System.Error.FromException(e)
		SET A=1
		Set tSC = $System.Status.Error(-1,tErro.Message)
	}
	Quit tCurso
}

Storage Default
{
<Data name="CursoDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Nome</Value>
</Value>
<Value name="4">
<Value>Duracao</Value>
</Value>
<Value name="5">
<Value>Preco</Value>
</Value>
</Data>
<DataLocation>^TRE.CursoD</DataLocation>
<DefaultData>CursoDefaultData</DefaultData>
<IdLocation>^TRE.CursoD</IdLocation>
<IndexLocation>^TRE.CursoI</IndexLocation>
<StreamLocation>^TRE.CursoS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
