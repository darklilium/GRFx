package widgets.BusquedaMedidores.utilidad
{
	import com.esri.ags.FeatureSet;
	import com.esri.ags.Graphic;
	import com.esri.ags.tasks.QueryTask;
	import com.esri.ags.tasks.supportClasses.Query;
	import com.esri.viewer.BaseWidget;
	
	import mx.collections.ArrayCollection;
	import mx.collections.ArrayList;
	import mx.controls.Alert;
	import mx.rpc.AsyncResponder;
	
	import widgets.BusquedaMedidores.utilidad.urls;
	

	public class cargarGrids
	{
		public var arrayAlimentador:ArrayCollection = new ArrayCollection;
		public var arrayTipoEquipo:ArrayCollection = new ArrayCollection;
		
		
		[Bindable]public var coleccion:ArrayCollection = new ArrayCollection; 
		[Bindable]public var coleccionAux:ArrayCollection = new ArrayCollection; 
		public var arrayMedidores:ArrayCollection = new ArrayCollection;

		public var arrayDatosMedidores:ArrayList = new ArrayList;
		
		public var fset:FeatureSet;
		public var id_equipo_seleccionado:int;
		
		public static var token:Object;
		
		public function cargarGrids()
		{
			
		}
		
		public function cargarListaAlimentador():ArrayCollection {
			arrayAlimentador.removeAll();
			// TODO Auto-generated method stub
			var queryTask:QueryTask = new QueryTask();
			queryTask.url = widgets.BusquedaMedidores.utilidad.urls.URL_ALIMENTADOR;
			queryTask.useAMF = false;
			var query:Query = new Query();
			query.outFields = ["*"];
			query.returnGeometry = false;
			query.where = "1=1";
			queryTask.token = token as String;
			query.returnDistinctValues = true;
			query.orderByFields=["nombre"];
			
			queryTask.execute(query, new AsyncResponder(onResult, onFault));
			
			// add the graphic on the map
			function onResult(featureSet:FeatureSet, token:Object = null):void
			{
				for each (var myGraphic:Graphic in featureSet.features)
				{
					
					arrayAlimentador.addItem({OBJECTID:myGraphic.attributes["OBJECTID"],
						id_alimentador:myGraphic.attributes["id_alimentador"], 
						nombre:myGraphic.attributes["nombre"],
						gra:myGraphic});
					
				}
				
				
			}
			function onFault(info:Object, token:Object = null):void
			{
				Alert.show("No se pueden obtener los alimentadores.  Contáctese con el administrador de GISRED."+ info.toString());
			}
			
			return arrayAlimentador;
			
		}
		
				
		public function cargarFiltroMedidores():ArrayCollection{
			
			//se cargan todos los equipos
			coleccion.removeAll();
			coleccionAux.removeAll();
			// TODO Auto-generated method stub
			var queryTask:QueryTask = new QueryTask();
			queryTask.url = widgets.BusquedaMedidores.utilidad.urls.URL_EQUIPOS_LINEA;
			queryTask.useAMF = false;
			var query:Query = new Query();
			query.outFields = ["id_equipo", "tipo","alimentador"];
			query.returnGeometry = false;
			query.where = "1=1";
			queryTask.token = token as String;
			
			
			query.returnDistinctValues = true;
			queryTask.execute(query, new AsyncResponder(onResult, onFault));
			
			// add the graphic on the map
			function onResult(featureSet:FeatureSet, token:Object = null):void
			{
				coleccion.addAll(new ArrayCollection(featureSet.attributes));	
				coleccionAux.addAll(new ArrayCollection(featureSet.attributes));
				
			}
			function onFault(info:Object, token:Object = null):void
			{
				Alert.show("No se pueden obtener los equipos.  Contáctese con el administrador de GISRED."+ info.toString());
			}
			
			return coleccion;
		}
		
		
	}
}