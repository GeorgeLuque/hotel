<?php
class PersonaData {
	public static $tablename = "persona";


	public function PersonaData(){
		$this->documento = ""; 
		$this->nombre = "";
		$this->fecha_nac = "";
		$this->razon_social = ""; 
		$this->direccion = "";
		$this->telefono = "";
		$this->fecha_creada = 'NOW()';
	} 

	public function getTipoDocumento(){ return TipoDocumentoData::getById($this->tipo_documento);}

	public function addCliente(){
		$sql = "insert into persona (tipo_documento,documento,giro,nombre,fecha_nac,direccion,tipo,razon_social,fecha_creada,telefono) ";
		$sql .= "value ($this->tipo_documento,\"$this->documento\",\"$this->giro\",\"$this->nombre\",\"$this->fecha_nac\",\"$this->direccion\",1,\"$this->razon_social\",\"$this->fecha_creada\",$this->telefono)";
		try {
			printf($sql);
			Executor::doit($sql);
		} catch (\Throwable $th) {
			$th->getMessage();
		}
	}

       

	public function add(){
		$sql = "insert into persona (tipo_documento,documento,nombre,giro,direccion,tipo,fecha_creada,razon_social,estado_civil,ocupacion,medio_transporte,destino,motivo,telefono) ";
		$sql .= "value ($this->tipo_documento,\"$this->documento\",\"$this->nombre\",\"$this->giro\",\"$this->direccion\",1,$this->fecha_creada,\"$this->razon_social\",\"$this->estado_civil\",\"$this->ocupacion\",\"$this->medio_transporte\",\"$this->destino\",\"$this->motivo\",\"$this->telefono\")";
		return Executor::doit($sql);
	}

	public function add001(){
		$sql = "insert into persona (tipo_documento,documento,nombre,telefono,tipo,fecha_creada) ";
		$sql .= "value ($this->tipo_documento,\"$this->documento\",\"$this->nombre\",\"$this->telefono\",1,$this->fecha_creada)";
		return Executor::doit($sql);
	}

	public function addClienteVenta(){
		$sql = "insert into persona (nombre,tipo,fecha_creada) ";
		$sql .= "value (\"$this->nombre\",3,$this->fecha_creada)";
		return Executor::doit($sql);
	}

	public function addProveedor(){
		$sql = "insert into persona (tipo_documento,documento,nombre,direccion,tipo,fecha_creada) ";
		$sql .= "value ($this->tipo_documento,\"$this->documento\",\"$this->nombre\",\"$this->direccion\",2,$this->fecha_creada)";
		return Executor::doit($sql); 
	}

	public static function delById($id){ 
		$sql = "delete from ".self::$tablename." where id=$id";
		Executor::doit($sql);
	}
	public function del(){
		$sql = "delete from ".self::$tablename." where id=$this->id";
		Executor::doit($sql);
	}

// partiendo de que ya tenemos creado un objecto PersonaData previamente utilizamos el contexto
	public static function updatePersona(){
		$sql = "update ".self::$tablename." set nombre=\"$this->nombre\",descripcion=\"$this->descripcion\",id_categoria=$this->id_categoria where id=$this->id";
		Executor::doit($sql); 
	}
	public function update(){
		$sql = "update ".self::$tablename." set nombre=\"$this->nombre\",descripcion=\"$this->descripcion\",id_categoria=$this->id_categoria where id=$this->id";
		Executor::doit($sql); 
	}

	public function updateVip(){
		$sql = "update ".self::$tablename." set vip=$this->vip,limite=$this->limite where id=$this->id";
		Executor::doit($sql); 
	}

	public function updateContador(){
		$sql = "update ".self::$tablename." set contador=$this->contador where id=$this->id";
		Executor::doit($sql); 
	}

	public function updatecliente($cliente){
		$sql = "update ".self::$tablename." set tipo_documento=$cliente->tipo_documento,documento=\"$cliente->documento\",giro=\"$cliente->giro\",nombre=\"$cliente->nombre\",razon_social=\"$cliente->razon_social\",fecha_nac=\"$cliente->fecha_nac\",direccion=\"$cliente->direccion\",telefono=\"$cliente->telefono\" where id=$cliente->id";
		//print_r($cliente);
		Executor::doit($sql);
	}

	public function updateProveedor(){
		$sql = "update ".self::$tablename." set tipo_documento=$this->tipo_documento,documento=\"$this->documento\",nombre=\"$this->nombre\",razon_social=\"$this->razon_social\",fecha_nac=\"$this->fecha_nac\",direccion=\"$this->direccion\" where id=$this->id";
		Executor::doit($sql);
	}

	

	public static function getById($id){
		$sql = "select * from ".self::$tablename." where id=$id";
		$query = Executor::doit($sql);
		return Model::one($query[0],new PersonaData());

	}


	public static function getAll(){
		$sql = "select * from ".self::$tablename." where tipo=1 ";
		$query = Executor::doit($sql);
		return Model::many($query[0],new PersonaData());
	}
 
	public static function getProveedor(){
		$sql = "select * from ".self::$tablename." where tipo=2 ";
		$query = Executor::doit($sql);
		return Model::many($query[0],new PersonaData());
	}
 

	public static function getLike($q){
		$sql = "select * from ".self::$tablename." where nombre like '%$q%' or documento like '%$q%' order by 1 desc";
		$query = Executor::doit($sql);
		return Model::one($query[0],new PersonaData());

	}

	public static function getLikeDni($documento){
		$sql = "select * from ".self::$tablename." where documento=\"$documento\" ";
		$query = Executor::doit($sql);
		return Model::one($query[0],new PersonaData());

	}
	public static function getbyDni($documento){
		$sql = "select * from ".self::$tablename." where documento=\"$documento\" ";
		$query = Executor::doit($sql);
		return Model::one($query[0],new PersonaData());

	}

}

?>