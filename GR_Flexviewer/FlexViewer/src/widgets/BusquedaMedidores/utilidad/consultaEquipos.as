package widgets.BusquedaMedidores.utilidad
{
	import com.esri.ags.FeatureSet;
	import com.esri.ags.tasks.QueryTask;
	import com.esri.ags.tasks.supportClasses.Query;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.AsyncResponder;
	import mx.utils.StringUtil;
	
	import widgets.BusquedaMedidores.utilidad.cargarGrids;

	public class consultaEquipos
	{
		public var alimentadorSelected:String;
		public var tipoEquipoSelected:String;
		public var cGrid:cargarGrids;
		
		//arreglos
		public var equipos_alimentador:ArrayCollection = new ArrayCollection;
		public var equipos_tipo:ArrayCollection = new ArrayCollection;
		public function consultaEquipos()
		{
		}
		
		
		public function listadoEquiposAlimentador():void{
			
			
			
			
		}
		
		public function listadoTipoSeleccionado(tipoSelected:String):void{
			
			//obtener token
			
			equipos_tipo.removeAll();
			// TODO Auto-generated method stub
			var queryTask:QueryTask = new QueryTask();
			queryTask.url = widgets.BusquedaMedidores.utilidad.urls.URL_EQUIPOS_LINEA;
			queryTask.useAMF = false;
			var query:Query = new Query();
			query.outFields = ["id_equipo", "tipo","alimentador"];
			query.returnGeometry = false;
			query.where = "tipo = '" + tipoSelected + "'";
			queryTask.token = cargarGrids.token as String;
			
			queryTask.execute(query, new AsyncResponder(onResult, onFault));
			
			// add the graphic on the map
			function onResult(featureSet:FeatureSet, token:Object = null):void
			{
				equipos_tipo.addAll(new ArrayCollection(featureSet.attributes));	
				
				
			}
			function onFault(info:Object, token:Object = null):void
			{
				Alert.show("No se pueden obtener los equipos del alimentador.  Contáctese con el administrador de GISRED."+ info.toString());
			}
			
			
			
		}
	}
}